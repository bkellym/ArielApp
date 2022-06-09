import 'package:flutter/material.dart';

import '../components/botoes/botao_padrao.dart';
import '../components/botoes/botao_texto.dart';
import '../components/panels/carrossel_inicial.dart';

class Introducao extends StatelessWidget {
  const Introducao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/introduction.png'),
          Carrossel(),
          BotaoPadrao(
            onPressed: () {
              Navigator.pushNamed(context, '/cadastro');
            },
            label: "REGISTRE",
          ),
          BotaoTexto(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            label: "Já tenho uma conta",
          )
        ],
      ),
    );
  }
}
