import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freedu_frontend/presentation/widgets/labeled_input_field.dart';
import 'package:freedu_frontend/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _firstNameController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordRepeatFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordRepeatFocusNode.addListener(_onFocusNodeEvent);
    _emailFocusNode.addListener(_onFocusNodeEvent);
    _passwordFocusNode.addListener(_onFocusNodeEvent);
    _firstNameFocusNode.addListener(_onFocusNodeEvent);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    _firstNameController.dispose();

    _passwordRepeatFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _firstNameFocusNode.dispose();

    super.dispose();
  }

  _onFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  // Обработчик нажатия на кнопку регистрации
  Future<void> onRegistrationBtnClick() async {
    String username = _firstNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordRepeat = _passwordRepeatController.text;
  }

  // Обработчик нажатия на ссылку авторизации
  void onSignInLinkClick() { }

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;
    
    final nameTextField = LabeledInputField(label: "Имя", controller: _firstNameController, focus: _firstNameFocusNode);

    final emailTextField = LabeledInputField(label: "Почта", controller: _emailController, focus: _emailFocusNode);

    final passwordTextField = LabeledInputField(label: "Пароль", controller: _passwordController,
        focus: _passwordFocusNode, isTextVisible: false);
    
    final repeatPasswordTextField = LabeledInputField(label: "Повторите пароль", controller: _passwordRepeatController,
        focus: _passwordRepeatFocusNode, isTextVisible: false);

    final registrationButton = ElevatedButton(
      onPressed: onRegistrationBtnClick,
      child: Text("Зарегистрироваться",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 16.0, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0)),
        primary: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        minimumSize: Size.fromWidth(MediaQuery.of(context).size.width/6),
      ),
    );

    final signInLink = InkWell(
      child: Text('У меня уже есть аккаунт',
        style: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          color: primaryColor,
        ),
      ),
      onTap: () => AutoRouter.of(context).pushNamed("/login"),
    );


    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
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
                            margin: const EdgeInsets.only(bottom: 10)),
                        Container(
                            child: nameTextField,
                            margin: const EdgeInsets.only(bottom: 20)),
                        Container(
                            child: emailTextField,
                            margin: const EdgeInsets.only(bottom: 20)),
                        Container(
                            child: passwordTextField,
                            margin: const EdgeInsets.only(bottom: 20)),
                        Container(
                            child: repeatPasswordTextField,
                            margin: const EdgeInsets.only(bottom: 40)),
                        Container(
                          child: registrationButton,
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 40,
                        ),
                        Container(
                            child: signInLink
                        )
                      ],
                    ),
                  ),
              ),
            )
        )
    );
  }
}