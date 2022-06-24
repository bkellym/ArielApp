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
        final currentuser = FirebaseAuth.instance.currentUser;
        Navigator.pushNamed(context, '/inicio');
      }
      print("Login com sucesso! Uid: ${user.user?.uid}, Nome: user.");
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
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16
            ),
            child: TextFormField(
              controller: _email,
              style: const TextStyle(
                color: ArielColors.textPrimary,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                decoration: TextDecoration.none,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: ArielColors.baseDark,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                fillColor: ArielColors.baseLight,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ArielColors.baseDark),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ArielColors.secundary)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 16
            ),
            child: TextFormField(
              controller: _senha,
              obscureText: true,
              style: const TextStyle(
                color: ArielColors.textPrimary,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                decoration: TextDecoration.none,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                hintText: "Senha",
                hintStyle: TextStyle(
                  color: ArielColors.baseDark,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                fillColor: ArielColors.baseLight,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ArielColors.baseDark),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ArielColors.secundary)),
              ),
            ),
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
