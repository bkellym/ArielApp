import 'package:ariel_app/components/botoes/botao_texto.dart';
import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../components/botoes/botao_padrao.dart';
import '../../components/input/campo_texto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'base_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToCadastro() {
      Navigator.pushNamed(context, '/cadastro');
    }

    return
      Scaffold(body: SizedBox(
        width: double.infinity,
        child:
      BaseAuth(
      titleBold: "ENTRE ",
      titleRegular: "NA SUA CONTA",
      bottomText: "Não tem uma conta?",
      bottomLabel: "Registre-se",
      function: goToCadastro,
      child: const Material(
        color: ArielColors.baseLight,
        child: _FormAuthLogin(),
      ),),),);
  }
}

class _FormAuthLogin extends StatefulWidget {
  const _FormAuthLogin({Key? key}) : super(key: key);

  @override
  State<_FormAuthLogin> createState() => _FormAuthLoginState();
}

class _FormAuthLoginState extends State<_FormAuthLogin> {
  final _formKey = GlobalKey<FormState>();

  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _senha = new TextEditingController();

  String get email => _email.text;
  String get senha => _senha.text;

  void doLogin(BuildContext context) async{
    try{
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      if(user != null){
        _senha.text = "";
        Navigator.pushNamed(context, '/inicio');
      }
      print("Login com sucesso! Uid: ${user.user?.uid}, Nome: ${user.user?.displayName}");
    } catch (e) {
      print('Error: ${e.toString()}');
      final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent.withOpacity(0),
          elevation: 0,
          content: Container(
            decoration: BoxDecoration(
                color: ArielColors.arielRed.withOpacity(0.95),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: EdgeInsets.all(16),
            child: Text('Não foi possível realizar login'),)
      );
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
