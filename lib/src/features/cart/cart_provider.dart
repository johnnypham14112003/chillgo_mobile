import 'package:chillgo_mobile/src/app.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/repositories/cart_repository.dart';
import 'package:chillgo_mobile/src/data/repositories/payment.dart';
import 'package:chillgo_mobile/src/features/cart/cart_page.dart';
import 'package:chillgo_mobile/src/features/payment_method/payment_with_qrcode.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/main_page.dart';
import 'package:chillgo_mobile/src/models/cart.dart';
import 'package:chillgo_mobile/src/models/chat_ai_package.dart';
import 'package:chillgo_mobile/src/models/create_order_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final EventChannel eventChannel =
      const EventChannel('flutter.native/eventPayOrder');
  static const MethodChannel platform =
      MethodChannel('flutter.native/channelPayOrder');

  final _repository = CartRepository();

  PaymentMethod? get paymentMethod => _paymentMethod;
  PaymentMethod? _paymentMethod;

  ChatAiPackage? get chatAiPackage => _chatAiPackage;
  ChatAiPackage? _chatAiPackage;

  Cart? get cart => _cart;
  Cart? _cart;

  bool get isUseDiscount => _isUseDiscount;
  bool _isUseDiscount = false;

  CartProvider() {
    // if (Platform.isIOS) {
    //   eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    // }
  }
  order(BuildContext context) async {
    if (_cart == null) {
      return;
    }

    if (_paymentMethod == null) {
      context.showSnackBar('Vui lòng chọn phương thức thanh toán!');
      return;
    }

    final amount = _cart!.totalPay;
    if (amount < 1000 || amount > 1000000) {
      context.showSnackBar('Vui lý đặt số tien (1000-1000000)!');
    } else {
      if (_paymentMethod == PaymentMethod.qrcode) {
        final success = await context.push(const PaymentWithQrcode());
        if (success == true) {
          await _createPackageTransaction(
              context.read<AccountProvider>().account!.id);
          DialogCustom().showDialogConfirm(
              'Thanh toán', 'Thanh toán thành công',
              barrierDismissible: false,
              textButton: 'Tiếp tục trải nghiệm', onConfirm: () async {
            if (_chatAiPackage != null) {
              await context.read<AccountProvider>().getMyPackageChatAI();
            }
            _cart = null;
            _isUseDiscount = false;
            _chatAiPackage = null;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false);
          });
        }
        return;
      }

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
          final account = context.read<AccountProvider>().account;
          await _createPackageTransaction(account!.id);
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
    DialogCustom().showDialogConfirm('Thanh toán', response,
        barrierDismissible: false,
        textButton: status == PayStatus.success
            ? 'Tiếp tục trải nghiệm'
            : 'Thử lại', onConfirm: () async {
      if (status == PayStatus.success) {
        if (_chatAiPackage != null) {
          await context.read<AccountProvider>().getMyPackageChatAI();
        }
        _cart = null;
        _isUseDiscount = false;
        _chatAiPackage = null;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
      } else {
        context.pop();
      }
    });
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

  selectChatAiPackage(ChatAiPackage value) {
    _chatAiPackage = value;
    _cart = Cart(totalAmount: value.price, totalPay: value.price, items: []);
    navigaterKey.currentContext!.push(const CartPage());
    notifyListeners();
  }

  void applyDiscount(bool value) {
    if (_cart == null) return;

    _isUseDiscount = value;
    if (value) {
      _cart!.totalPay = _cart!.totalAmount - _cart!.discount;
    } else {
      _cart!.totalPay = _cart!.totalAmount;
    }
    notifyListeners();
  }

  Future _createPackageTransaction(String accountId) async {
    final response = await _repository.createPackageTransaction(
      accountId: accountId,
      packageId: _chatAiPackage!.id,
      chillCoinApplied: 0,
      payMethod: _paymentMethod!.title,
      totalPrice: _cart!.totalPay,
      status: _paymentMethod == PaymentMethod.qrcode ? 'unpaid' : 'paid',
    );
    print(response);
  }
}

enum PayStatus { failed, success, cancelled }

enum PaymentMethod {
  momo('Momo'),
  zaloPay('ZaloPay'),
  qrcode('QRCode');

  const PaymentMethod(this.title);
  final String title;
}
