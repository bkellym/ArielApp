import 'dart:io';

import 'package:ariel_app/core/shared/mensagem_erro.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/app.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const EdgeInsetsGeometry paddingPadrao =
    EdgeInsets.only(right: 32, left: 32, bottom: 16);

class CampoTexto extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscureText;
  final int maxLines;
  final Color? color;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CampoTexto({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.color,
    this.inputPadding,
    this.labelPadding,
  }) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class CampoDropdown extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscureText;
  final int maxLines;
  final Color? color;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<String> items;

  const CampoDropdown({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.color,
    this.inputPadding,
    this.labelPadding,
    required this.items,
  }) : super(key: key);

  @override
  State<CampoDropdown> createState() => _CampoDropdownState();
}

class CampoData extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final TextEditingController? controller;
  final Color? color;
  final String? mascara;

  const CampoData({
    Key? key,
    required this.label,
    this.controller,
    this.color = ArielColors.secundary,
    this.inputPadding,
    this.labelPadding,
    this.mascara,
  }) : super(key: key);

  @override
  State<CampoData> createState() => _CampoDataState();
}

class CampoHora extends StatefulWidget {
  final Color? color;
  final String label;
  final double? height;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;

  final TextEditingController? controller;

  const CampoHora(
    this.label, {
    Key? key,
    this.onSaved,
    this.color,
    this.controller,
    this.height,
    this.inputPadding,
    this.labelPadding,
  }) : super(key: key);

  @override
  State<CampoHora> createState() => _CampoHoraState();
}

class CampoImagem extends StatefulWidget {
  final FirebaseStorage storage = FirebaseStorage.instance;

  File? photo;
  final String? imagemAtual;
  final File? imagemNova;
  final Function onChange;
  final ImagePicker picker = ImagePicker();

  CampoImagem({
    Key? key,
    this.imagemAtual,
    required this.onChange,
    this.imagemNova,
  }) : super(key: key);

  @override
  State<CampoImagem> createState() => _CampoImagemState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ?? paddingPadrao,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Texto(
          widget.label,
          color: widget.color ?? ArielColors.secundary,
          fontWeight: Weight.bold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: widget.labelPadding ??
              EdgeInsets.only(
                bottom: SizeConfig.of(context).dynamicScaleSize(
                  size: 4,
                ),
              ),
        ),
        TextFormField(
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.obscureText,
          style: TextStyle(
            color: ArielColors.textPrimary,
            fontWeight: FontWeight.normal,
            fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(
                SizeConfig.of(context).dynamicScaleSize(size: 10)),
            hintStyle: const TextStyle(
              color: ArielColors.baseDark,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
            fillColor: ArielColors.baseLight,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: ArielColors.baseDark),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.color ?? ArielColors.secundary)),
          ),
        ),
      ]),
    );
  }
}

class _CampoDropdownState extends State<CampoDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ?? paddingPadrao,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Texto(
          widget.label,
          color: widget.color ?? ArielColors.secundary,
          fontWeight: Weight.bold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: widget.labelPadding ??
              EdgeInsets.only(
                bottom: SizeConfig.of(context).dynamicScaleSize(
                  size: 4,
                ),
              ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: Weight.regular,
                          color: item == widget.controller?.text
                              ? ArielColors.textPrimary
                              : ArielColors.secundary,
                        ),
                      ),
                    ))
                .toList(),
            value: widget.controller?.text,
            onChanged: (value) {
              setState(() {
                widget.controller?.text = value as String;
              });
            },
            buttonPadding: const EdgeInsets.only(left: 8, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: ArielColors.baseDark,
                width: 1.5,
              ),
              color: ArielColors.baseLight,
            ),
            itemPadding: const EdgeInsets.only(left: 8),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ArielColors.baseLight,
            ),
          ),
        ),
      ]),
    );
  }
}

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ?? paddingPadrao,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Texto(
          widget.label,
          color: widget.color ?? ArielColors.secundary,
          fontWeight: Weight.bold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: widget.labelPadding ??
              EdgeInsets.only(
                bottom: SizeConfig.of(context).dynamicScaleSize(
                  size: 4,
                ),
              ),
        ),
        SizedBox(
          height: 36,
          child: DateTimePicker(
            locale: myLocale,
            dateMask: "d 'de' MMMM 'de' yyyy",
            controller: widget.controller,
            firstDate: DateTime(1900),
            lastDate: DateTime(5000),
            style: const TextStyle(
              color: ArielColors.textPrimary,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              fillColor: ArielColors.baseLight,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: ArielColors.baseDark),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.color ?? ArielColors.secundary)),
            ),
          ),
        )
      ]),
    );
  }
}

class _CampoHoraState extends State<CampoHora> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ?? paddingPadrao,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Texto(
          widget.label,
          color: widget.color ?? ArielColors.secundary,
          fontWeight: Weight.bold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: widget.labelPadding ??
              EdgeInsets.only(
                bottom: SizeConfig.of(context).dynamicScaleSize(
                  size: 4,
                ),
              ),
        ),
        Container(
          height: widget.height ?? 36,
          padding: const EdgeInsets.all(0),
          child: DateTimePicker(
            type: DateTimePickerType.time,
            locale: myLocale,
            dateMask: "Hm",
            controller: widget.controller,
            firstDate: DateTime(1900),
            lastDate: DateTime(5000),
            style: const TextStyle(
              color: ArielColors.textPrimary,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              isDense: false,
              contentPadding: const EdgeInsets.all(10),
              fillColor: ArielColors.transparent,
              border: const OutlineInputBorder(borderSide: BorderSide()),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.color ?? ArielColors.secundary)),
            ),
            onSaved: widget.onSaved,
          ),
        ),
      ]),
    );
  }
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
                            fit: BoxFit.cover,
                            opacity: 0.6,
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
