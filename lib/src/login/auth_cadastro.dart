import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/src/login/base_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  static TextEditingController _nome = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _senha = new TextEditingController();

  String get nome => _nome.text;

  String get email => _email.text;

  String get senha => _senha.text;

  void doCadastro(BuildContext context) async {
    try {
      var user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      if (user != null) {
        _senha.text = "";
        await user.user?.updateDisplayName(nome);
        Navigator.pushNamed(context, '/CadastroCompleto');
      }
      print(
          "Cadastro com sucesso! Uid: ${user.user?.uid}, Nome: ${user.user?.displayName}");
    } catch (e) {
      print('Error: ${e.toString()}');
      final snackBar =
          MensagemErro(mensagem: 'Não foi possível realizar o cadastro');
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
            controller: _nome,
            label: 'Nome',
            inputPadding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              right: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              bottom: SizeConfig.of(context).dynamicScaleSize(
                size: 12,
              ),
            ),
          ),
          CampoTexto(
            controller: _email,
            label: 'Email',
            inputPadding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              right: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              bottom: SizeConfig.of(context).dynamicScaleSize(
                size: 12,
              ),
            ),
          ),
          CampoTexto(
            controller: _senha,
            obscureText: true,
            label: 'Senha',
            inputPadding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              right: SizeConfig.of(context).dynamicScaleSize(
                size: 24,
              ),
              bottom: SizeConfig.of(context).dynamicScaleSize(
                size: 12,
              ),
            ),
          ),
          BotaoPadrao(
            onPressed: () {
              doCadastro(context);
            },
            label: "CRIAR CONTA",
          ),
        ],
      ),
    );
  }
}
