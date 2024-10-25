import 'dart:io';

import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/repositories/payment.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/main_page.dart';
import 'package:chillgo_mobile/src/models/create_order_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartProvider extends ChangeNotifier {
  final EventChannel eventChannel =
      const EventChannel('flutter.native/eventPayOrder');
  static const MethodChannel platform =
      MethodChannel('flutter.native/channelPayOrder');

  PaymentMethod? get paymentMethod => _paymentMethod;
  PaymentMethod? _paymentMethod;

  CartProvider() {
    if (Platform.isIOS) {
      eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    }
  }
  order(BuildContext context, String value) async {
    int amount = int.parse(value);
    if (amount < 1000 || amount > 1000000) {
      context.showSnackBar('Vui lý đặt số tien (1000-1000000)!');
    } else {
      var result = await DialogCustom().showLoading<CreateOrderResponse?>(
          context, () => createOrder(amount));
      if (result != null) {
        final zpTransToken = result.zptranstoken;
        await _pay(context, zpTransToken);
      }
    }
  }

  Future<void> _pay(BuildContext context, String zpTransToken) async {
    String response = "";
    PayStatus? status;
    try {
      status = await _callPayOrderFromNative(zpTransToken);
      switch (status) {
        case PayStatus.cancelled:
          response = "User Huỷ Thanh Toán";
          break;
        case PayStatus.success:
          response = "Thanh toán thành công";
          break;
        case PayStatus.failed:
          response = "Thanh toán thất bại, vui lòng thử lại";
          break;
        default:
          response = "Thanh toán thất bại, vui lòng thử lại";
          break;
      }
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
      response = "Thanh toán thất bại";
      status = PayStatus.failed;
    }
    context.showPopupNotifi('Thanh toán', response).whenComplete(() {
      if (status == PayStatus.success) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
      }
    });
  }

  void _onEvent(dynamic event) {
    print("_onEvent: '$event'.");
    // var res = Map<String, dynamic>.from(event);
    // if (res["errorCode"] == 1) {
    //   payResult = "Thanh toán thành công";
    // } else if (res["errorCode"] == 4) {
    //   payResult = "User hủy thanh toán";
    // } else {
    //   payResult = "Giao dịch thất bại";
    // }
  }

  void _onError(Object error) {
    print("_onError: '$error'.");
    // payResult = "Giao dịch thất bại";
  }

  Future<PayStatus> _callPayOrderFromNative(String zpTransToken) async {
    final result =
        await platform.invokeMethod('payOrder', {"zptoken": zpTransToken});
    switch (result['errorCode']) {
      case 4:
        return PayStatus.cancelled;
      case 1:
        return PayStatus.success;
      case -1:
        return PayStatus.failed;
      default:
        return PayStatus.failed;
    }
  }

  selectPaymentMethod(PaymentMethod value) {
    _paymentMethod = value;
    notifyListeners();
  }
}

enum PayStatus { failed, success, cancelled }

enum PaymentMethod {
  momo('Momo'),
  zaloPay('ZaloPay');

  const PaymentMethod(this.title);
  final String title;
}
