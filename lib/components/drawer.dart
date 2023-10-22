import 'package:flutter/material.dart';

import '../utils/routes.dart';
import 'item_menu.dart';

class Drawercomp extends StatelessWidget {
  const Drawercomp({super.key});

  _showModalBottomShit(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (ctx) {
        return Wrap(
          children: [
            ListTile(
              title: const Text('Camera'),
              subtitle: const Text('Abrir camera'),
              leading: const Icon(Icons.camera),
              iconColor: Colors.purple.withOpacity(0.9),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Galeria'),
              subtitle: const Text('Abrir galeria'),
              leading: const Icon(Icons.photo),
              iconColor: Colors.purple.withOpacity(0.9),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Arguments;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.8),
              ),
              currentAccountPicture: InkWell(
                onTap: () => _showModalBottomShit(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png',
                  ),
                ),
              ),
              accountName: const Text(
                'Luiz pucca',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              accountEmail: Text(
                args.email,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ItemMenu(
                items: [
                  'Dados cadastrais',
                  'Endereço',
                  'Lista de tarefas',
                  'Configurações',
                  'Termos e privacidade',
                  'Sair',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
