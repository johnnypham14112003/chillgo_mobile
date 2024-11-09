import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/cart/cart_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
        titleAppBar: 'Phuong thức thanh toán',
        child: Consumer<CartProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              _item(
                context,
                icon: SvgPicture.asset(
                  ImageFactory.momo,
                  fit: BoxFit.cover,
                ),
                title: 'Thanh toán bằng ví Momo',
                onTap: () {
                  // provider.selectPaymentMethod(PaymentMethod.momo);
                  // context.pop();
                  context.showSnackBar(
                      'Phương thức thanh toán bằng Momo sẽ sớm ra mắt!');
                },
                isSelected: provider.paymentMethod == PaymentMethod.momo,
              ),
              _item(
                context,
                icon: Image.asset(
                  ImageFactory.zalopay,
                  fit: BoxFit.cover,
                ),
                title: 'Thanh toán bằng ví Zalopay',
                onTap: () {
                  provider.selectPaymentMethod(PaymentMethod.zaloPay);
                  context.pop();
                },
                isSelected: provider.paymentMethod == PaymentMethod.zaloPay,
              ),
              _item(
                context,
                icon: Image.asset(
                  ImageFactory.scan,
                  fit: BoxFit.cover,
                ),
                title: 'Quét mã QRCode ngân hàng',
                onTap: () {
                  provider.selectPaymentMethod(PaymentMethod.qrcode);
                  context.pop();
                },
                isSelected: provider.paymentMethod == PaymentMethod.qrcode,
              ),
            ],
          );
        }));
  }

  Widget _item(BuildContext context,
          {required Widget icon,
          required String title,
          VoidCallback? onTap,
          bool isSelected = false}) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(Gap.m, Gap.m, Gap.m, 0.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(Gap.s),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Gap.s),
              color: context.theme.cardColor,
              boxShadow: [boxShadow],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Gap.s),
                  child: SizedBox(width: Gap.xxl, height: Gap.xxl, child: icon),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gap.s),
                  child: Text(
                    title,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                const Spacer(),
                Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: context.theme.primaryColor,
                )
              ],
            ),
          ),
        ),
      );
}
