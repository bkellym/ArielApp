// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrossel extends StatefulWidget {
  Carrossel({Key? key}) : super(key: key);

  final List<String> titlesList = [
    'OLÁ, CONHEÇA O ARIEL!',
    'TUDO DO SEU JEITO',
    'MANTENHA-SE INFORMADO',
    'COMECE AGORA',
  ];

  final List<String> descList = [
    'Acompanhe a sua terapia hormonal e os seus efeitos.',
    'Programe sua rotina médica, seu humor, acompanhe sua evolução e muito mais.',
    'Nossa equipe disponibiliza conteúdo que é devidamente verificado.',
    'Personalize o seu perfil privado no Ariel. Veja como é fácil!',
  ];

  @override
  _CarrosselState createState() => _CarrosselState();
}

class _CarrosselState extends State<Carrossel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 130.0,
            enableInfiniteScroll: false,
            autoPlay: false,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: widget.titlesList
              .map(
                (item) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 32.0,
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: ArielColors.secundary,
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Text(
                        widget.descList[_currentIndex],
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: ArielColors.textPrimary,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.titlesList.map((urlOfItem) {
            int index = widget.titlesList.indexOf(urlOfItem);
            return Container(
              width: _currentIndex == index ? 20.0 : 13.0,
              height: _currentIndex == index ? 20.0 : 13.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? ArielColors.secundary
                    : ArielColors.baseDark,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
