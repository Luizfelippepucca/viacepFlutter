import 'package:flutter/material.dart';

import '../data/data.dart';
import 'routes.dart';

class ShowAlert {
  final BuildContext context;
  ShowAlert(this.context);

  dynamic _showAlert() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text(
            'Fazer Logout',
            style: TextStyle(fontSize: 22),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          content: const Text(
            'Tem certeza que deseja sair?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Não',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w700),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: const Text('Sim',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w700)),
            ),
          ],
        );
      },
    );
  }

  dynamic _showModalBottom() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (ctx) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(Terms.terms,
                  style: Theme.of(context).textTheme.titleMedium),
            )
          ],
        );
      },
    );
  }

  Function get showAlert {
    return _showAlert;
  }

  Function get showModalBottom {
    return _showModalBottom;
  }
}
