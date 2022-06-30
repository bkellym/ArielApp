import 'dart:io';

import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:path/path.dart';

class CadastroCompleto extends StatefulWidget {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final user = FirebaseAuth.instance.currentUser;
  GenderID? _genderID = GenderID.M;

  CadastroCompleto({Key? key}) : super(key: key);

  @override
  State<CadastroCompleto> createState() => _FormCadastroCompleto();
}

enum GenderID { M, F, N }

class _FormCadastroCompleto extends State<CadastroCompleto> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();
  final TextEditingController _value = TextEditingController();

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String _date = "Not set";

  DateTime selectedDate = DateTime.now();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<String?> uploadFile() async {
    if (_photo == null) return null;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
      return await ref.getDownloadURL();
    } catch (e) {
      print('error occured');
    }
  }



  @override
  Widget build(BuildContext context) {

    _nome.text = widget.user?.displayName ?? "";
    _email.text = widget.user?.email ?? "";
    _dataNascimento.text = selectedDate.toString();


    List<Map> generos = [
      {'id': GenderID.M, 'nome': 'Masculino'},
      {'id': GenderID.F, 'nome': 'Feminino'},
      {'id': GenderID.N, 'nome': 'Não-Binário'},
    ];

    return Expanded(
      child: Material(
        color: ArielColors.baseLight,
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ArielColors.baseLight,
              ),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xFF1CE8B4),
                          Color(0xFF1CC2EB),
                        ],
                      ),
                    ),
                    child: SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texto(
                                  "Olá ${widget.user?.displayName ?? ""}!",
                                  size: 22,
                                  color: ArielColors.baseLight,
                                ),
                                Texto(
                                  "Vamos Completar seu perfil?".toUpperCase(),
                                  size: 12,
                                  color: ArielColors.baseLight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 12,
                        ),
                        child: Texto(
                          "SOBRE VOCÊ",
                          size: 12,
                          color: ArielColors.secundary,
                          fontWeight: Weight.bold,
                        ),
                      ),
                      const DivisoriaDecorada(cor: ArielColors.secundary),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: SizedBox(
                              width: 128,
                              height: 128,
                              child: _photo != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        _photo!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: ArielColors.baseLight,
                                        border: Border.all(
                                            color: ArielColors.baseDark,
                                            width: 1.5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      height: 100,
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: ArielColors.secundary,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "NOME",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _nome,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "E-MAIL",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          CampoTexto(
                            controller: _email,
                            label: '',
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "DATA DE NASCIMENTO",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            child: DateTimePicker(
                              locale: myLocale,
                              dateMask: "d 'de' MMMM 'de' yyyy",
                              initialValue: DateTime.now().toString(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(5000),
                              style: const TextStyle(
                                color: ArielColors.textPrimary,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              ),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ArielColors.secundary,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                fillColor: ArielColors.baseLight,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ArielColors.baseDark),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ArielColors.secundary)),
                              ),
                              onChanged: (val) => print(val),
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              for (Map gen in generos)
                                ListTile(
                                  title: Text(
                                    "${gen['nome']}",
                                    style: const TextStyle(
                                      color: ArielColors.textPrimary,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  leading: Radio<GenderID>(
                                    activeColor: ArielColors.secundary,
                                    value: gen['id'],
                                    groupValue: widget._genderID,
                                    onChanged: (GenderID? value) {
                                      setState(() {
                                        widget._genderID = value;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                          BotaoPadrao(
                            label: "Salvar Perfil",
                            onPressed: () async {
                              var urlImage = await uploadFile();
                              widget.user?.updatePhotoURL(urlImage);
                              widget.user?.updateDisplayName(_nome.text);
                              Navigator.pushNamed(context, '/inicio');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: ArielColors.secundary,
                ),
                title: const Text(
                  'Abrir câmera',
                  style: TextStyle(color: ArielColors.secundary),
                ),
                onTap: () {
                  imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: ArielColors.secundary,
                ),
                title: const Text(
                  'Escolher da Galeria',
                  style: TextStyle(color: ArielColors.secundary),
                ),
                onTap: () {
                  imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
