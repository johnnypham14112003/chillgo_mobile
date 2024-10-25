// Pub Packages
import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/features/auth/auth_provider.dart';
import 'package:chillgo_mobile/src/features/auth/widgets/register_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:provider/provider.dart';

import 'widgets/login_form.dart';

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
  final TextEditingController _emailController =
      TextEditingController(text: kDebugMode ? 'hieu2@gmail.com' : null);
  final TextEditingController _passwordController =
      TextEditingController(text: kDebugMode ? 'Admin123@' : null);
  final TextEditingController _passwordRetypeController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //----------------------[ States ]----------------------
  bool _isLoading = false;

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

    context.read<AuthProvider>().register(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text)
      ..then((value) {
        if (value) {
          _navigateToLogin();
        }
      })
      ..whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
  }

  void _login() {
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
        resizeToAvoidBottomInset: false,
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
                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      isLoading: _isLoading,
                      onLogin: _login,
                      onNavigateToRegister: _navigateToRegister,
                    ),
                    RegisterForm(
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        passwordRetypeController: _passwordRetypeController,
                        isLoading: _isLoading,
                        onRegister: _register,
                        onNavigateToLogin: _navigateToLogin)
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
