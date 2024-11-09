import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class PaymentWithQrcode extends StatelessWidget {
  const PaymentWithQrcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: context.querySize.width, height: context.querySize.height),
          Positioned.fill(
              top: Gap.s,
              child: Image.asset(
                ImageFactory.qrcode,
                fit: BoxFit.fill,
              )),
          Stack(
            children: [
              SizedBox(
                  width: context.querySize.width,
                  height: context.querySize.height * 0.13),
              Container(
                width: context.querySize.width,
                height: context.querySize.height * 0.13,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Gap.m),
                    bottomRight: Radius.circular(Gap.m),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: Gap.s,
                right: Gap.s,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: BackButton(color: context.theme.cardColor),
                  title: Center(
                    child: Text(
                      'Quét QR Code',
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.theme.cardColor),
                    ),
                  ),
                  trailing: IconButton(
                      color: context.theme.cardColor,
                      onPressed: () {
                        context.pop(true);
                      },
                      icon: const Icon(
                        Icons.check_rounded,
                      )),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: Gap.m,
            left: Gap.m,
            right: Gap.m,
            child: Container(
              decoration: BoxDecoration(
                  color: context.theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(Gap.m)),
              padding: const EdgeInsets.all(Gap.s),
              child: Text(
                'Lưu ý: Sau khi chuyển khoản, ChillGo sẽ xác nhận và cập nhật trạng thái đơn hàng của quý khách!',
                style: context.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.theme.cardColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
