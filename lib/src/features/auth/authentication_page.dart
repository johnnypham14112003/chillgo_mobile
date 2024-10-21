// Pub Packages
import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/validator.dart';
import 'package:chillgo_mobile/src/features/auth/auth_provider.dart';
import 'package:chillgo_mobile/src/features/auth/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:provider/provider.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  //----------------------[ Declare ]----------------------
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final PageController _pageController = PageController(initialPage: 0);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRetypeController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //----------------------[ States ]----------------------
  bool _isLoading = false, _passwordVisible = false;

  //----------------------[ Functions ]----------------------
  void _navigateToRegister() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: defaultDuration),
        curve: Curves.easeInOut);
  }

  void _navigateToLogin() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: defaultDuration),
        curve: Curves.easeInOut);
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    context
        .read<AuthProvider>()
        .register(
            context: context,
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text)
        .whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    context
        .read<AuthProvider>()
        .login(
            context: context,
            email: _emailController.text,
            password: _passwordController.text)
        .whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

//----------------------[ UI ]----------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Form(
          //new
          key: _formKey, //new
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.querySize.width,
                height: context.querySize.height * 0.78,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          ImageFactory.branding600px,
                          width: 250,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Xin Chào!',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context).highlightColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              40, 0, 40, 0),
                          child: Text(
                            'Đăng nhập để trải nghiệm ứng dụng cùng mình nhé!',
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: context.querySize.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: context.querySize.width,
                                  child: TextFormField(
                                    controller: _emailController,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Email',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      alignLabelWithHint: true,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          height: 1.8,
                                        ),
                                    cursorColor:
                                        Theme.of(context).indicatorColor,
                                    validator: Validator.validateEmail,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: PasswordField(
                                      controller: _passwordController),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                    child: TextButton(
                                      onPressed: () {
                                        print('CantLoginText pressed ...');
                                      },
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 0),
                                          backgroundColor:
                                              const Color(0x00FFFFFF),
                                          // Transparent color
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          )),
                                      child: Text(
                                        'Quên mật khẩu?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 40),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _login,
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(context.querySize.width * 0.6, 40),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Bo góc của button
                              ),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : Text('Đăng Nhập',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).cardColor)),
                          ),
                        ),
                        Text(
                          'Bạn chưa có tài khoản?',
                          style: context.textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 40),
                          child: ElevatedButton(
                            onPressed: () {
                              _navigateToRegister();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(context.querySize.width * 0.6, 40),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              backgroundColor: Theme.of(context).cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Bo góc của button
                              ),
                            ),
                            child: Text("Đi Tới Đăng Ký",
                                style: context.textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context).primaryColor)),
                          ),
                        ),
                      ],
                    ),
                    //=========================================================================================================
                    //========================================[ Column Signin ]==============================================
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          ImageFactory.branding600px,
                          width: 250,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Đăng Ký Tài Khoản Mới',
                            style: context.textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).highlightColor),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: context.querySize.width * 0.8,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: context.querySize.width,
                                  child: TextFormField(
                                    controller: _nameController,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Họ và tên',
                                      labelStyle: context.textTheme.bodyMedium,
                                      alignLabelWithHint: true,
                                    ),
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      height: 1.8,
                                    ),
                                    cursorColor:
                                        Theme.of(context).indicatorColor,
                                    validator: Validator.validateName,
                                  ),
                                ),
                                SizedBox(
                                  width: context.querySize.width,
                                  child: TextFormField(
                                    controller: _emailController,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Email',
                                      labelStyle: context.textTheme.bodyMedium,
                                      alignLabelWithHint: true,
                                    ),
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      height: 1.8,
                                    ),
                                    cursorColor:
                                        Theme.of(context).indicatorColor,
                                    validator: Validator.validateEmail,
                                  ),
                                ),
                                SizedBox(
                                  width: context.querySize.width,
                                  child: PasswordField(
                                    controller: _passwordController,
                                  ),
                                ),
                                SizedBox(
                                  width: context.querySize.width,
                                  child: TextFormField(
                                    controller: _passwordRetypeController,
                                    obscureText: !_passwordVisible,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Nhập Lại Mật khẩu',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      alignLabelWithHint: true,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        // focusNode:
                                        //     FocusNode(skipTraversal: true),
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color:
                                              Theme.of(context).indicatorColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          height: 1.8,
                                        ),
                                    cursorColor:
                                        Theme.of(context).indicatorColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập lại mật khẩu';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Mật khẩu không khớp';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 0, 40),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _register,
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(context.querySize.width * 0.6, 40),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Bo góc của button
                              ),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : Text("Đăng Kí",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).cardColor)),
                          ),
                        ),
                        Text(
                          'Bạn đã có tài khoản?',
                          style: context.textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 40),
                          child: ElevatedButton(
                            onPressed: () {
                              _navigateToLogin();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(context.querySize.width * 0.6, 40),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              backgroundColor: Theme.of(context).cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Bo góc của button
                              ),
                            ),
                            child: Text("Quay Lại Đăng Nhập",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Hoặc tiếp tục với',
                style: context.textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset(ImageFactory.facebook),
                      iconSize: 40,
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    IconButton(
                      icon: Image.asset(ImageFactory.google),
                      iconSize: 40,
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    IconButton(
                      icon: (Theme.of(context).scaffoldBackgroundColor ==
                              const Color.fromRGBO(245, 245, 245, 1))
                          ? Image.asset(ImageFactory.dapple)
                          : Image.asset(ImageFactory.wapple),
                      iconSize: 40,
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
