import 'package:ariel_app/core/inputs.dart';
import 'package:ariel_app/core/models/user_model.dart';
import 'package:ariel_app/core/shared/botoes/botao_padrao.dart';
import 'package:ariel_app/core/shared/detalhe/detalhe_widget.dart';
import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/perfil/editar_perfil/editar_perfil_bloc.dart';
import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  final UserModel user;

  const EditarPerfilPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  late var _dadosCarregados;
  final EditarPerfilBloc _bloc = EditarPerfilBloc();
  final double leftPadding = 32;

  @override
  void initState() {
    _dadosCarregados = _bloc.init(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dadosCarregados,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return DetalheWidget(
              titulo: "PERFIL",
              subTitulo: const ['Editar', ' perifl'],
              color: ArielColors.secundary,
              imgFundo: Image.asset('assets/images/ciclos.png').image,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoImagem(
                      imagemAtual: widget.user.foto,
                      imagemNova: _bloc.controller.foto,
                      onChange: (foto) {
                        _bloc.controller.foto = foto;
                      },
                    ),
                    CampoTexto(
                        label: "NOME",
                        controller: _bloc.controller.nome,
                        color: ArielColors.secundary),
                    CampoData(
                        label: "DATA DE NASCIMENTO",
                        controller: _bloc.controller.dtNascimento),
                    CampoDropdown(
                        label: "GÊNERO",
                        items: _bloc.listaGeneros,
                        controller: _bloc.controller.genero),
                    CampoTexto(
                        label: "HISTORIA",
                        maxLines: 4,
                        color: ArielColors.secundary,
                        controller: _bloc.controller.historia),
                    DivisoriaDecorada(
                      titulo: "SUA CONTA",
                      cor: ArielColors.secundary,
                      padding: EdgeInsets.symmetric(
                        vertical:
                            SizeConfig.of(context).dynamicScaleSize(size: 16),
                      ),
                    ),
                    CampoTexto(
                        label: "LOGIN",
                        controller: _bloc.controller.email,
                        color: ArielColors.secundary),
                    CampoTexto(
                        label: "SENHA ATUAL",
                        obscureText: true,
                        color: ArielColors.secundary,
                        controller: _bloc.controller.senhaAtual),
                    CampoTexto(
                        label: "NOVA SENHA",
                        obscureText: true,
                        color: ArielColors.secundary,
                        controller: _bloc.controller.senhaNova),
                    const Divisoria(),
                    BotaoPadrao(
                        label: "SALVAR ALTERAÇÕES",
                        height:
                        SizeConfig.of(context).dynamicScaleSize(size: 40),
                        padding: const EdgeInsets.all(0),
                        textStyle: TextStyle(
                            fontSize: SizeConfig.of(context)
                                .dynamicScaleSize(size: 12),
                            fontWeight: Weight.bold),
                        internalPadding:
                        SizeConfig.of(context).dynamicScaleSize(size: 8),
                        onPressed: () {
                          _bloc.controller.alterar();
                          Navigator.pop(context);
                        }),
                  ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ArielColors.cicloColor,
              ),
            );
          }
        });
  }
}
