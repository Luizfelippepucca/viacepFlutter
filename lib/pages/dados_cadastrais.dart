import 'package:dio/repository/linguagens_repository.dart';
import 'package:dio/repository/nivel_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/input.dart';
import '../utils/routes.dart';

class DadosCadastrais extends StatefulWidget {
  static const routeName = Routes.register;

  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _nascimento = TextEditingController();
  final List<String> niveis = NivelRepository.retornaNivels();
  final List<String> linguagens = LinguagensRepository.retornaLinguagens();
  double _salario = 0;
  String _nivelSelected = "";
  int? _experiencia;
  final List<String> _linguagemSelected = [];
  bool _loading = false;

  _showDatePicker(DateTime initialDate, DateTime firstDate, DateTime lastDate) {
    showDatePicker(
            context: context,
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                          primary: Colors.purple,
                          onPrimary: Colors.black,
                          onSurface: Colors.purple),
                      textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black))),
                  child: child!);
            },
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate)
        .then((value) => {
              if (value != null)
                {
                  _nascimento.text = DateFormat('dd/MM/yyyy').format(value),
                }
            });
  }

  List<Widget> _renderRadioButton() {
    return niveis.map((e) {
      return RadioListTile(
          controlAffinity: ListTileControlAffinity.leading,
          selected: _nivelSelected == e,
          activeColor: Colors.purple,
          title: Text(
            e,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          value: e,
          groupValue: _nivelSelected,
          onChanged: (value) {
            setState(() {
              _nivelSelected = value.toString();
            });
          });
    }).toList();
  }

  List<Widget> _renderCheBox() {
    return linguagens.map((e) {
      return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.purple,
        title: Text(
          e,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        value: _linguagemSelected.contains(e),
        onChanged: (value) {
          setState(() {
            if (value!) {
              _linguagemSelected.add(e);
              return;
            }
            _linguagemSelected.remove(e);
          });
        },
      );
    }).toList();
  }

  List<DropdownMenuItem<int>> _renderDropMenuItem() {
    return List<DropdownMenuItem<int>>.generate(15, (index) {
      return DropdownMenuItem(
        value: index + 1,
        child: Text(
          index + 1 > 1 ? '${index + 1} anos' : '${index + 1} ano',
          style: const TextStyle(color: Colors.purple, fontSize: 16),
        ),
      );
    });
  }

  SnackBar _returnSnackBar(String text, {Color? color}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.red),
      ),
    );
    return snackBar;
  }

  _submitForm() {
    if (_nome.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('insira um nome'),
      );
      return;
    }
    if (_nascimento.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('insira uma data de nascimento'),
      );
      return;
    }

    if (_nivelSelected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('selecione nivel de conhecimento'),
      );
      return;
    }

    if (_linguagemSelected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('selecione pelo menos 1 conhecimento'),
      );
      return;
    }

    if (_salario <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('Escolha sua pretensão salarial'),
      );
      return;
    }

    if (_experiencia == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('Escolha tempo de experiencia'),
      );
      return;
    }
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      ScaffoldMessenger.of(context).showSnackBar(
        _returnSnackBar('Dados salvos com sucesso', color: Colors.green),
      );
      Navigator.of(context).popAndPushNamed(Routes.home);

      // Prints after 1 second.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Meus dados', style: TextStyle(fontSize: 25)),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Input(
                      placeholder: 'Digite seu nome',
                      iconInput: const Icon(Icons.person),
                      change: (value) => debugPrint(value),
                      controllerField: _nome,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        _showDatePicker(DateTime(2000, 1, 1),
                            DateTime(1950, 5, 20), DateTime(2023, 10, 23));
                      },
                      child: const Text(
                        'Escolher data de nascimento',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Input(
                      placeholder: 'Data de nascimento',
                      iconInput: const Icon(Icons.cake),
                      change: (value) {},
                      redonly: true,
                      controllerField: _nascimento,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Nivel de experiencia',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Column(
                      children: _renderRadioButton(),
                    ),
                    const Text(
                      'Conhecimentos',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Column(
                      children: _renderCheBox(),
                    ),
                    const Text(
                      'Tempo de experiência',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                        menuMaxHeight: 300,
                        value: _experiencia,
                        isDense: true,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        items: _renderDropMenuItem(),
                        onChanged: (value) {
                          setState(() {
                            _experiencia = value;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Pretensão salarial  R\$ ${_salario.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: _salario,
                        activeColor: Colors.purple,
                        onChanged: (double value) {
                          setState(() {
                            _salario = value;
                          });
                        }),
                    TextButton(
                      onPressed: _submitForm,
                      child: const Text(
                        'Salvar',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
