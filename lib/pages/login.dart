import 'package:flutter/material.dart';

import '../components/input.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  static const routeName = Routes.login;
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _enableBtn = false;
  bool _isVisible = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  void _changeEmail(String value) {
    _enableBtnFunc();
  }

  void _changePassword(String value) {
    _enableBtnFunc();
  }

  void _enableBtnFunc() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        _enableBtn = true;
      });
      return;
    }
    setState(() {
      _enableBtn = false;
    });
  }

  void _showPassword() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _onSubmit(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.home,
        arguments: Arguments(_email.text));
    _closeKeyboard(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black.withOpacity(0.1),
      body: GestureDetector(
        onTap: () => _closeKeyboard(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  'https://hermes.digitalinnovation.one/assets/diome/logo.png',
                  height: 125,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Já tem cadastro?',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Faça seu login e make the change_',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Input(
                          placeholder: 'E-mail',
                          iconInput: const Icon(Icons.email_outlined),
                          change: _changeEmail,
                          controllerField: _email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          placeholder: 'Senha',
                          iconInput: const Icon(Icons.lock_outline),
                          change: _changePassword,
                          onPress: _showPassword,
                          controllerField: _password,
                          isVisible: _isVisible,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              enableFeedback: _enableBtn ? true : false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: _enableBtn
                                  ? Colors.purple.shade500
                                  : Colors.purple.shade200,
                            ),
                            onPressed:
                                _enableBtn ? () => _onSubmit(context) : () {},
                            child: Text(
                              _enableBtn
                                  ? 'ENTRAR'
                                  : 'Preencha os campos'.toUpperCase(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Criar conta',
                                style: TextStyle(
                                  color: Colors.purple[700],
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
