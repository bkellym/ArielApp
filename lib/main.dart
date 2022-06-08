import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:ariel_app/screens/homepage.dart';
import 'package:ariel_app/screens/calendar.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ArielApp());
}

class ArielApp extends StatelessWidget {
  const ArielApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ariel',
      home: TesteApp(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final List<String> descList = [
  'Acompanhe a sua terapia hormonal e os seus efeitos.',
  'Programe sua rotina médica, seu humor, acompanhe sua evolução e muito mais.',
  'Nossa equipe disponibiliza conteúdo que é devidamente verificado.',
  'Personalize o seu perfil privado no Ariel. Veja como é fácil!',
];

final List<String> titlesList = [
  ' OLÁ, CONHEÇA O ARIEL! ',
  ' TUDO DO SEU JEITO ',
  ' MANTENHA-SE INFORMADO ',
  ' COMECE AGORA ',
];

class TesteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/introduction.png'),
          Carrossel(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16,
            ),
            child: Column(children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        ArielColors.primary,
                        ArielColors.primaryLight,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      onPressed: () {
                        print("You pressed Elevated Button");
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 64,
                          right: 64,
                        ),
                        child: Text("REGISTRE-SE"),
                      )))
            ]),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xFF666666)),
            ),
            onPressed: () {},
            child: const Text('Já tenho uma conta'),
          ),
        ],
      ),
    );
  }
}

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

class Carrossel extends StatefulWidget {
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
          items: titlesList
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
                          color: Color(0xFF905CED),
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
                        '${descList[_currentIndex]}',
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: Color(0xFF666666),
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
          children: imagesList.map((urlOfItem) {
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: _currentIndex == index ? 20.0 : 13.0,
              height: _currentIndex == index ? 20.0 : 13.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color(0xff905CED)
                    : const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
