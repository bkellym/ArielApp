import 'package:ariel_app/colors.dart';
import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/main.dart';
import 'package:flutter/material.dart';
import 'package:ariel_app/screens/autenticacao/base_auth.dart';

import '../../components/input/campo_texto.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToLogin() {
      Navigator.pushNamed(context, '/login');
    }

    return BaseAuth(
      titleBold: "CRIE ",
      titleRegular: "SUA CONTA",
      bottomText: "Já tem uma conta?",
      bottomLabel: "Conecte-se",
      function: goToLogin,
      child: const Material(
        color: ArielColors.baseLight,
        child: _FormAuthCadastro(),
      ),
    );
  }
}

class _FormAuthCadastro extends StatefulWidget {
  const _FormAuthCadastro({Key? key}) : super(key: key);

  @override
  State<_FormAuthCadastro> createState() => _FormAuthCadastroState();
}

class _FormAuthCadastroState extends State<_FormAuthCadastro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const CampoTexto(
            label: 'Nome',
            leftPadding: 24,
            rightPadding: 24,
          ),
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
            label: "CRIAR CONTA",
          ),
        ],
      ),
    );
  }
}
