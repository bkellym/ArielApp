import 'package:ariel_app/components/botoes/botao_texto.dart';
import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../components/botoes/botao_padrao.dart';
import '../../components/input/campo_texto.dart';
import 'base_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToCadastro() {
      Navigator.pushNamed(context, '/cadastro');
    }

    return BaseAuth(
      titleBold: "ENTRE ",
      titleRegular: "NA SUA CONTA",
      bottomText: "Não tem uma conta?",
      bottomLabel: "Registre-se",
      function: goToCadastro,
      child: const Material(
        color: ArielColors.baseLight,
        child: _FormAuthLogin(),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const CampoTexto(
            label: 'Email',
            leftPadding: 24,
            rightPadding: 24,
          ),
          const CampoTexto(
            label: 'Senha',
            leftPadding: 24,
            rightPadding: 24,
          ),
          BotaoPadrao(
            onPressed: () {},
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
