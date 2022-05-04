import 'package:flutter/material.dart';
import 'package:freedu_frontend/presentation/widgets/labeled_input_field.dart';
import 'package:freedu_frontend/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(_onFocusNodeEvent);
    _emailFocusNode.addListener(_onFocusNodeEvent);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  _onFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  // Обработчик нажатия на кнопку авторизации
  Future<void> onLoginButtonClick() async {
    String email = _emailController.text;
    String password = _passwordController.text;
  }

  // Переключить значение видимости пароля
  void switchPasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    final passwordEyeIcon = IconButton(
        padding: const EdgeInsets.only(right: 15),
        icon: Icon(
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorLight),
        onPressed: switchPasswordVisible
    );

    final emailField = LabeledInputField(label: "Email", controller: _emailController, focus: _emailFocusNode);

    final passwordField = LabeledInputField(label: "Password", controller: _passwordController, focus: _passwordFocusNode,
        isTextVisible: _passwordVisible, endIcon: passwordEyeIcon);

    final loginButton = ElevatedButton(
      onPressed: onLoginButtonClick,
      child: Text("Войти",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(fontSize: 16.0, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0)),
          primary: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          minimumSize: Size.fromWidth(MediaQuery.of(context).size.width/6),
          elevation: 5.0,
        ),
    );

    final signUpLink = InkWell(
      child: Text('Зарегистрироваться',
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            color: primaryColor,
          ),
      ),
      onTap: null,
    );

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(image: Style.loginBackgroundImage),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Image.asset("assets/images/main_logo.jpg", height: 115, width: 800),
                        margin: const EdgeInsets.only(bottom: 25)),
                    Container(
                        child: emailField,
                        margin: const EdgeInsets.only(bottom: 25)),
                    Container(
                        child: passwordField,
                        margin: const EdgeInsets.only(bottom: 30)),
                    Container(
                        child: loginButton,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 20)),
                    Container(
                      child: signUpLink,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}