import 'package:ariel_app/components/botoes/botao_texto.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../components/botoes/botao_texto_icon.dart';

class _TitleStyle extends TextStyle {
  final FontWeight weight;

  const _TitleStyle({
    required this.weight,
  }) : super(
          fontFamily: 'OpenSans',
          color: ArielColors.secundary,
          fontWeight: weight,
          fontSize: 18.0,
        );
}

class BaseAuth extends StatelessWidget {
  final bool login;
  final String titleBold;
  final String titleRegular;
  final Widget child;

  const BaseAuth(
      {Key? key,
      required this.login,
      required this.child,
      required this.titleBold,
      required this.titleRegular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String textCadastro = 'Já tem uma conta?';
    const String labelCadastro = 'Conecte-se';
    functionCadastro() {
      Navigator.pushNamed(context, '/login');
    }

    const String textLogin = 'Não tem uma conta?';
    const String labelLogin = 'Registre-se';
    functionLogin() {
      Navigator.pushNamed(context, '/cadastro');
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF1CE8B4),
            Color(0xFF1CC2EB),
          ],
        ),
        image: DecorationImage(
          image: Image.asset('assets/images/fundo.png').image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: ArielColors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: Border.all(
                  color: const Color(0xFFFFFFFF),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: BotaoTextoIcon(
                          icon: Icons.arrow_back_ios_new_rounded,
                          label: "VOLTAR",
                          onPressed: () => {
                            Navigator.pushNamed(context, '/'),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              titleBold,
                              style: const _TitleStyle(
                                weight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              titleRegular,
                              style: const _TitleStyle(
                                weight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(120, 40),
                                  primary: ArielColors.googleRed,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.logo_dev,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                label: const Text(
                                  "Google",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(120, 40),
                                  primary: ArielColors.facebookBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.logo_dev,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                label: const Text(
                                  "Facebook",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "ou",
                          style: TextStyle(
                              color: ArielColors.textPrimary,
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      child,
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              login ? textLogin : textCadastro,
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.normal,
                                color: ArielColors.textPrimary,
                                fontSize: 14,
                              ),
                            ),
                            BotaoTexto(
                              onPressed:
                                  login ? functionLogin : functionCadastro,
                              label: login ? labelLogin : labelCadastro,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
