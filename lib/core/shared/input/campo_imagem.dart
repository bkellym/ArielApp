import 'dart:io';

import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CampoImagem extends StatefulWidget {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? photo;
  final String? imagemAtual;
  final File? imagemNova;
  final Function onChange;
  final ImagePicker picker = ImagePicker();

  CampoImagem({
    Key? key,
    this.imagemAtual,
    required this.onChange, this.imagemNova,
  }) : super(key: key);

  @override
  State<CampoImagem> createState() => _CampoImagemState();
}

class _CampoImagemState extends State<CampoImagem> {
  Future imgFromCamera() async {
    final pickedFile =
        await widget.picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        widget.photo = File(pickedFile.path);
        widget.onChange(widget.photo);
      } else {
        print('Não foi possível carregar a imagem');
        MensagemErro(mensagem: 'Não foi possível carregar a imagem');
      }
    });
  }

  Future imgFromGallery() async {
    final pickedFile =
        await widget.picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        widget.photo = File(pickedFile.path);
        widget.onChange(widget.photo);
      } else {
        print('Não foi possível carregar a imagem');
        MensagemErro(mensagem: 'Não foi possível carregar a imagem');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            child: widget.photo != null || widget.imagemNova != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      widget.photo ?? widget.imagemNova!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.imagemAtual != null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(widget.imagemAtual!).image,
                          ),
                          border: Border.all(
                              color: ArielColors.secundary, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          color: ArielColors.secundary,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: ArielColors.baseLight,
                          border: Border.all(
                              color: ArielColors.secundary, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          color: ArielColors.secundary,
                        ),
                      ),
          ),
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
                  imgFromCamera();
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
}
