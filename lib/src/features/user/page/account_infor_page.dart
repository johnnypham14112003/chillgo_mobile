import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/format.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/user/widgets/social_infor_widget.dart';
import 'package:chillgo_mobile/src/features/user/widgets/wrapper_box.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountInforPage extends StatefulWidget {
  const AccountInforPage({super.key});

  @override
  State<AccountInforPage> createState() => _AccountInforPageState();
}

class _AccountInforPageState extends State<AccountInforPage> {
  final _nameController = TextEditingController();

  String? _gender;

  DateTime? _birthday;

  final _phoneController = TextEditingController();

  bool _hasChange = false;
  final _keyForm = GlobalKey<FormState>();

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final account = context.read<AccountProvider>().account!;
      _nameController.text = account.fullName;
      _phoneController.text = account.phoneNumber ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(builder: (context, provider, child) {
      final account = provider.account!;

      return WrapperPage(
        titleAppBar: 'Thông tin tài khoản',
        action: const SizedBox.shrink(),
        bottomNavigationBar: _hasChange
            ? Padding(
                padding: const EdgeInsets.all(Gap.m),
                child: FilledButton(
                    onPressed: _updateAccount,
                    child: const Text('Cập nhật thông tin')),
              )
            : null,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Gap.m),
            child: Form(
              key: _keyForm,
              child: ListView(
                children: [
                  WrapperBox(
                    title: Text(
                      'Dữ liệu cá nhân',
                      style: context.textTheme.titleSmall,
                    ),
                    trailing: _hasChange
                        ? Icon(Icons.check_rounded,
                            color: context.theme.primaryColor)
                        : null,
                    onTap: _hasChange ? _updateAccount : null,
                  ),
                  _customField(
                    context,
                    labelText: 'Tên đầy đủ',
                    controller: _nameController,
                    onChanged: (value) {
                      _hasChange = true;
                      _nameController.text = value;
                      setState(() {});
                    },
                  ),
                  Builder(builder: (ctx) {
                    return WrapperBox(
                      title: const Text('Giới tính'),
                      value: _gender ?? account.gender,
                      onTap: () => _showGenderMenu(ctx),
                    );
                  }),
                  WrapperBox(
                    title: const Text('Ngày sinh'),
                    value: Formatter.dateTime(_birthday ?? account.dateOfBirth),
                    onTap: () => _showDatePicker(context),
                  ),
                  WrapperBox(
                    title: const Text(
                      'Email',
                    ),
                    value: account.email,
                    onTap: () => context.showSnackBar('Email là duy nhất!'),
                  ),
                  _customField(
                    context,
                    labelText: 'Số điện thoại',
                    controller: _phoneController,
                    onChanged: (value) {
                      _hasChange = true;
                      _phoneController.text = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: Gap.m),
                  WrapperBox(
                    title: Text(
                      'Tài khoản liên kết',
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(Gap.s),
                    child: Text(
                      'Liên kết tài khoản Chillgo với Facebook để đăng nhập nhanh hơn',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  const SocialInforWidget(),
                  const SizedBox(height: Gap.m),
                  WrapperBox(
                    title: Text(
                      'Xóa tài khoản',
                      style: context.textTheme.titleSmall,
                    ),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: context.theme.primaryColor,
                    ),
                    onTap: () {
                      context.showSnackBar(
                          'Tính năng đang trong quá trình phát triển');
                    },
                  ),
                  const SizedBox(height: kBottomNavigationBarHeight + Gap.xl),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _updateAccount() {
    if (_keyForm.currentState!.validate()) {
      if (_hasChange) {
        DialogCustom()
            .showLoading(
                context,
                () => context.read<AccountProvider>().updateAccount(
                      _nameController.text,
                      _gender,
                      _birthday,
                      _phoneController.text,
                    ))
            .whenComplete(() => setState(() => _hasChange = false));
      }
    }
  }

  _showDatePicker(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      setState(() {
        _birthday = result;
        _hasChange = true;
      });
    }
  }

  _showGenderMenu(BuildContext context) async {
    final parentRender = context.findRenderObject() as RenderBox;
    final offset = parentRender.localToGlobal(Offset.zero);
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + Gap.xxl, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Gap.s)),
      ),
      items: ['Nam', 'Nữ']
          .map((item) => PopupMenuItem(
                value: item,
                child: Text(item),
                onTap: () => setState(() {
                  _gender = item;
                  _hasChange = true;
                }),
              ))
          .toList(),
    );
  }

  Widget _customField(BuildContext context,
          {required String labelText,
          required TextEditingController controller,
          Function(String)? onChanged}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: Gap.s),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: context.textTheme.bodySmall,
          textAlign: TextAlign.end,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập $labelText';
            }
            return null;
          },
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: context.theme.cardColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(Gap.s)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(Gap.s)),
              prefixText: labelText,
              prefixStyle: context.textTheme.bodyMedium),
        ),
      );
}
