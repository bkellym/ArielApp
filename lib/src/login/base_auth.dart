import 'package:ariel_app/components/botoes/botaoFacebook.dart';
import 'package:ariel_app/components/botoes/botaoGoogle.dart';
import 'package:ariel_app/components/botoes/botao_texto.dart';
import 'package:ariel_app/components/botoes/botao_texto_icon.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';

class _TitleStyle extends TextStyle {
  final FontWeight weight;

  const _TitleStyle({
    required this.weight,
  }) : super(
          color: ArielColors.secundary,
          fontWeight: weight,
          fontSize: 18.0,
        );
}

class BaseAuth extends StatelessWidget {
  final String titleBold;
  final String titleRegular;
  final Widget child;
  final String bottomText;
  final String bottomLabel;
  final Function()? function;

  const BaseAuth({
    Key? key,
    required this.child,
    required this.titleBold,
    required this.titleRegular,
    required this.bottomText,
    required this.bottomLabel,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: ArielColors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: ArielColors.baseLight,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ArielColors.baseLight,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  BotaoGoogle(),
                                  BotaoFacebook()
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
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              ),
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
                                  bottomText,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: ArielColors.textPrimary,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                BotaoTexto(
                                  onPressed: function,
                                  label: bottomLabel,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
