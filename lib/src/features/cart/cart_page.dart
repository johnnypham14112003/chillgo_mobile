import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/cart/cart_provider.dart';
import 'package:chillgo_mobile/src/features/cart/widgets/item_package.dart';
import 'package:chillgo_mobile/src/features/payment_method/payment_method_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/wrapper_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      titleAppBar: 'Giỏ Hàng',
      bottomNavigationBar: _btnPay(),
      child: Consumer<CartProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Gap.m),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (provider.chatAiPackage != null)
                Padding(
                  padding: const EdgeInsets.all(Gap.m),
                  child: ItemPackage(package: provider.chatAiPackage!),
                ),
              _wrapperBox(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mã ưu đãi',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        'Voucher giảm 5% giá vé di tích lịch sử',
                        style: TextStyle(
                            fontSize: 10, color: context.theme.primaryColor),
                      )
                    ]),
              ),
              const SizedBox(height: Gap.m),
              _wrapperBox(
                height: 40,
                gap: Gap.s,
                child: Row(children: [
                  Icon(
                    Icons.payments,
                    color: context.theme.primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Gap.s),
                    child: Text('Dùng 200 Chillcoin',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const Spacer(),
                  Switch(
                    value: provider.isUseDiscount,
                    onChanged: provider.applyDiscount,
                  )
                ]),
              ),
              const Divider(
                height: Gap.xxl,
                thickness: Gap.s,
              ),
              _wrapperBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phương thức thanh toán',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                    GestureDetector(
                      onTap: () {
                        context.push(const PaymentMethodPage());
                      },
                      child: Text(
                        provider.paymentMethod?.title ?? 'Lựa chọn',
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: Gap.s,
                height: Gap.xxl,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Gap.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chi tiết thanh toán',
                      style: context.textTheme.titleMedium,
                    ),
                    _inforPayment('Tổng tiền hàng',
                        '${(provider.cart?.totalAmount ?? 0).round()}đ'),
                    _inforPayment('Giảm giá ưu đãi', '0đ'),
                    _inforPayment(
                        'Giảm giá Chillcoin',
                        !provider.isUseDiscount
                            ? '0đ'
                            : '-${provider.cart!.discount.round()}đ'),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng tiền thanh toán',
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          '${((provider.cart?.totalPay ?? 0)).round()}đ',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: context.theme.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _btnPay() => Padding(
        padding: const EdgeInsets.all(Gap.m),
        child: FilledButton(
          onPressed: () => context.read<CartProvider>().order(context),
          child: Text(
            "Tạo đơn thanh toán",
            style: TextStyle(color: context.theme.cardColor, fontSize: 20.0),
          ),
        ),
      );
  Widget _inforPayment(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value, style: context.textTheme.bodySmall),
      ],
    );
  }

  Widget _wrapperBox(
          {required Widget child, double? height, double gap = Gap.m}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Gap.m),
        child: Container(
            height: height,
            padding: EdgeInsets.all(gap),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Gap.m),
                color: const Color.fromRGBO(247, 239, 231, 100)),
            child: child),
      );
}
