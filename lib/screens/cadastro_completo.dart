import 'dart:io';

import 'package:ariel_app/components/botoes/botao_padrao.dart';
import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/components/input/campo_data.dart';
import 'package:ariel_app/components/input/campo_imagem.dart';
import 'package:ariel_app/components/input/campo_radio.dart';
import 'package:ariel_app/components/input/campo_texto.dart';
import 'package:ariel_app/components/mensagem_erro.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CadastroCompleto extends StatefulWidget {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final user = FirebaseAuth.instance.currentUser;
  File? photo;

  CadastroCompleto({Key? key}) : super(key: key);
  DateTime selectedDate = DateTime.now();

  @override
  State<CadastroCompleto> createState() => _FormCadastroCompleto();
}

class _FormCadastroCompleto extends State<CadastroCompleto> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();
  final TextEditingController _genero = TextEditingController();

  String date = "Not set";
  DateTime selectedDate = DateTime.now();

  Future<String?> uploadFile() async {
    if (widget.photo == null) return null;
    final fileName = basename(widget.photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(widget.photo!);
      return await ref.getDownloadURL();
    } catch (e) {
      MensagemErro(mensagem: 'Não foi possível carregar a imagem');
    }
  }

  @override
  Widget build(BuildContext context) {
    _nome.text = widget.user?.displayName ?? "";
    _email.text = widget.user?.email ?? "";
    _dataNascimento.text = selectedDate.toString();

    List<Map> generos = [
      {'id': 'M', 'titulo': 'Masculino'},
      {'id': 'F', 'titulo': 'Feminino'},
      {'id': 'N', 'titulo': 'Não-Binário'},
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
                      CampoImagem(
                        photo: widget.photo,
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
                          CampoData(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            onSaved: (val) {
                              _dataNascimento.text = val!;
                            },
                          ),
                          CampoRadio(
                            valores: generos,
                            onChange: (val) {
                              _genero.text = val!;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              bottom: 8,
                            ),
                            child: Texto(
                              "SUA HISTÓRIA",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.semibold,
                            ),
                          ),
                          const CampoTexto(
                            maxLines: 8,
                            leftPadding: 24,
                            rightPadding: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 12,
                            ),
                            child: Texto(
                              "SEU PRIMEIRO CICLO",
                              size: 12,
                              color: ArielColors.secundary,
                              fontWeight: Weight.bold,
                            ),
                          ),
                          const DivisoriaDecorada(cor: ArielColors.secundary),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
      });
  }
}
