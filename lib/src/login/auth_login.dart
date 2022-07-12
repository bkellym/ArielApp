import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/botoes/botao_texto.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/components/mensagem_erro.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/src/ariel_app/ariel_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'base_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToCadastro() {
      Navigator.pushNamed(context, '/cadastro');
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: BaseAuth(
          titleBold: "ENTRE ",
          titleRegular: "NA SUA CONTA",
          bottomText: "Não tem uma conta?",
          bottomLabel: "Registre-se",
          function: goToCadastro,
          child: const Material(
            color: ArielColors.baseLight,
            child: _FormAuthLogin(),
          ),
        ),
      ),
    );
  }
}

class _FormAuthLogin extends StatefulWidget {
  const _FormAuthLogin({Key? key}) : super(key: key);

  @override
  State<_FormAuthLogin> createState() => _FormAuthLoginState();
}

class _FormAuthLoginState extends State<_FormAuthLogin> {
  final _formKey = GlobalKey<FormState>();

  static final TextEditingController _email = TextEditingController();
  static final TextEditingController _senha = TextEditingController();

  String get email => _email.text;

  String get senha => _senha.text;

  void doLogin(BuildContext context) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha)
          .then((value) {
        _senha.text = "";
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ArielApp()),
            (Route<dynamic> route) => false);

        return value;
      });
    } catch (e) {
      final snackBar =
          MensagemErro(mensagem: 'Não foi possível realizar login');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CampoTexto(
            controller: _email,
            label: 'Email',
            leftPadding: 24,
            rightPadding: 24,
          ),
          CampoTexto(
            controller: _senha,
            obscureText: true,
            label: 'Senha',
            leftPadding: 24,
            rightPadding: 24,
          ),
          BotaoPadrao(
            onPressed: () {
              doLogin(context);
            },
            label: "ENTRAR",
          ),
          BotaoTexto(
            onPressed: () {},
            label: "Esqueceu a senha?",
          )
        ],
      ),
    );
  }
}
