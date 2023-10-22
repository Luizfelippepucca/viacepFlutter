import 'package:dio/models/cep_models.dart';
import 'package:flutter/material.dart';

class ShowInfos extends StatelessWidget {
  CepModel data;
  ShowInfos({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text('Rua:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.logradouro,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text('Bairro:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.bairro,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text('Cidade:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.localidade,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text('Estado:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.uf,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
    ]);
  }
}
