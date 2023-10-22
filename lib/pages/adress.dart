import 'dart:convert';

import 'package:dio/models/cep_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/infosAdress.dart';
import '../components/input.dart';
import '../utils/routes.dart';

class Adress extends StatefulWidget {
  static const routename = Routes.adress;
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  final TextEditingController _cep = TextEditingController(text: "");
  CepModel cepModel =
      CepModel(bairro: '', logradouro: '', localidade: '', uf: '');
  bool loading = false;
  String textLoading = "";

  Future<void> handleSearchCep() async {
    setState(() {
      loading = true;
      textLoading = "Enviando dados...";
    });

    Uri url = Uri.parse('https://viacep.com.br/ws/09580020/json/');
    http.Response response = await http.get(url);

    setState(() {
      textLoading = 'Buscando informações';
    });

    String data = response.body;
    Map<String, dynamic> json = jsonDecode(data);
    cepModel = CepModel(
        bairro: json['bairro'],
        logradouro: json['logradouro'],
        localidade: json['localidade'],
        uf: json['uf']);

    Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                loading = false;
                textLoading = "";
              })
            });
  }

  Widget loadingWidget() {
    return Center(
      child: Text(textLoading),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Endereço',
              style: TextStyle(fontSize: 25),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: handleSearchCep,
            child: const Icon(Icons.search),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CEP',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Input(
                  maxCaracter: 8,
                  typeKeyboard: TextInputType.number,
                  placeholder: 'Digite seu cep',
                  iconInput: const Icon(Icons.location_on),
                  change: (value) => {},
                  controllerField: _cep,
                ),
                const SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible: !loading,
                  child: ShowInfos(data: cepModel),
                ),
                Visibility(
                  visible: loading,
                  child: loadingWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
