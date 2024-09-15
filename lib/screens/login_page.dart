// Pub Packages
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => LoginPageDartModel());
  //
  //   _model.emailTextFieldTextController ??= TextEditingController();
  //   _model.emailTextFieldFocusNode ??= FocusNode();
  //
  //   _model.passwordTextFieldTextController ??= TextEditingController();
  //   _model.passwordTextFieldFocusNode ??= FocusNode();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  // }
  //
  // @override
  // void dispose() {
  //   _model.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 90,
              decoration: const BoxDecoration(),
            ),
            Image.asset(
                "assets/images/logo/branding600px.png",
                width: 250,
                height: 100,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Text(
                'Xin Chào!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
              child: Text(
                'Đăng nhập để trải nghiệm ứng dụng cùng mình nhé!',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: TextFormField(
                        // controller: _model.emailTextFieldTextController,
                        // focusNode: _model.emailTextFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Email',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          alignLabelWithHint: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).indicatorColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.8,
                            ),
                        cursorColor: Theme.of(context).indicatorColor,
                        // validator: _model
                        //     .emailTextFieldTextControllerValidator
                        //     .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: TextFormField(
                        // controller: _model.passwordTextFieldTextController,
                        // focusNode: _model.passwordTextFieldFocusNode,
                        autofocus: false,
                        //obscureText: !_model.passwordTextFieldVisibility,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Mật khẩu',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          alignLabelWithHint: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).indicatorColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF0000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          suffixIcon: InkWell(
                            // onTap: () => safeSetState(
                            //       () => _model.passwordTextFieldVisibility =
                            //   !_model.passwordTextFieldVisibility,
                            // ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: const Icon(
                              // _model.passwordTextFieldVisibility
                              //     ? Icons.visibility_outlined
                              //     : Icons.visibility_off_outlined,
                              Icons.visibility_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.8,
                            ),
                        cursorColor: Theme.of(context).indicatorColor,
                        // validator: _model
                        //     .passwordTextFieldTextControllerValidator
                        //     .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            print('CantLoginText pressed ...');
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              backgroundColor: const Color(0x00FFFFFF),
                              // Transparent color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              )),
                          child: Text(
                            'Quên mật khẩu?',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
              child: ElevatedButton(
                onPressed: () {
                  print('LoginButton pressed ...');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 40),
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bo góc của button
                  ),
                ),
                child: Text('Đăng Nhập',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Theme.of(context).cardColor)),
              ),
            ),
            Text(
              'Bạn chưa có tài khoản?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 40),
              child: ElevatedButton(
                onPressed: () {
                  print('RegiterButton pressed ...');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 40),
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  backgroundColor: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bo góc của button
                  ),
                ),
                child: Text('Đăng Kí',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Theme.of(context).primaryColor)),
              ),
            ),
            Text(
              'Hoặc tiếp tục với',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset("assets/images/icons/facebook50px.png"),
                    iconSize: 40,
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/icons/google48px.png'),
                    iconSize: 40,
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  IconButton(
                    icon: (Theme.of(context).scaffoldBackgroundColor ==
                            const Color.fromRGBO(245, 245, 245, 1))
                        ? Image.asset("assets/images/icons/dapple50px.png")
                        : Image.asset("assets/images/icons/wapple50px.png"),
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
    );
  }
}
