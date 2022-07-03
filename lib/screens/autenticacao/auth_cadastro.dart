import 'package:ariel_app/components/mensagem_erro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/screens/autenticacao/base_auth.dart';

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

  static  TextEditingController _nome = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _senha = new TextEditingController();

  String get nome => _nome.text;
  String get email => _email.text;
  String get senha => _senha.text;

  void doCadastro(BuildContext context) async{
    try{
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
      if(user != null) {
        _senha.text = "";
        await user.user?.updateDisplayName(nome);
        Navigator.pushNamed(context, '/CadastroCompleto');
      }
      print("Cadastro com sucesso! Uid: ${user.user?.uid}, Nome: ${user.user?.displayName}");
    } catch (e) {
      print('Error: ${e.toString()}');
      final snackBar = MensagemErro(mensagem: 'Não foi possível realizar o cadastro');
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
            leftPadding: 24,
            rightPadding: 24,
          ),
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
              doCadastro(context);
            },
            label: "CRIAR CONTA",
          ),
        ],
      ),
    );
  }
}