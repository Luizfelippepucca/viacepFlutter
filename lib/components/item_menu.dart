import 'package:dio/utils/routes.dart';
import 'package:flutter/material.dart';

import '../utils/helpes_menu.dart';

class ItemMenu extends StatelessWidget {
  final List<String> items;

  const ItemMenu({super.key, required this.items});

  void _navigationPage(BuildContext context, String page) {
    if (page == "Dados cadastrais") {
      Navigator.popAndPushNamed(context, Routes.register);
      return;
    }

    if (page == "Endereço") {
      Navigator.popAndPushNamed(context, Routes.adress);
      return;
    }
    if (page == "Lista de tarefas") {
      Navigator.popAndPushNamed(context, Routes.todoList);
      return;
    }

    if (page == "Configurações") {
      Navigator.popAndPushNamed(context, Routes.settings);
      return;
    }

    if (page == "Termos e privacidade") {
      ShowAlert(context).showModalBottom();
    }

    if (page == "Sair") {
      ShowAlert(context).showAlert();
      return;
    }
  }

  Icon _returnIcon(String item) {
    if (item == "Dados cadastrais") {
      return Icon(
        Icons.person,
        color: Colors.purple.withOpacity(0.9),
      );
    }
    if (item == "Endereço") {
      return Icon(
        Icons.house,
        color: Colors.purple.withOpacity(0.9),
      );
    }

    if (item == "Lista de tarefas") {
      return Icon(
        Icons.library_add,
        color: Colors.purple.withOpacity(0.9),
      );
    }

    if (item == "Configurações") {
      return Icon(Icons.settings, color: Colors.purple.withOpacity(0.9));
    }

    if (item == "Sair") {
      return Icon(
        Icons.logout,
        color: Colors.purple.withOpacity(0.9),
      );
    }

    return Icon(Icons.info, color: Colors.purple.withOpacity(0.9));
  }

  List<Widget> _renderItems(BuildContext context) {
    return items.map((e) {
      return InkWell(
        onTap: () => _navigationPage(context, e),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(top: 10),
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  _returnIcon(e),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    e,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _renderItems(context),
    );
  }
}
