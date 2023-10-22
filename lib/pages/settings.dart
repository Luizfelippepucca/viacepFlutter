import 'package:dio/service/app_storage.dart';
import 'package:dio/utils/storage_key.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class Settings extends StatefulWidget {
  static const routeName = Routes.settings;
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valueTheme = false;
  bool notification = false;
  bool loading = true;

  AppStorage storage = AppStorage();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    valueTheme = await storage.getStorage(StorageKey.themeKey);
    notification = await storage.getStorage(StorageKey.keyNotification);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loading = !loading;
      });
    });
  }

  void resetConfig() async {
    await storage.removeKey(StorageKey.themeKey);
    await storage.removeKey(StorageKey.keyNotification);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, Routes.home,
        arguments: Arguments('123@hotmail.com'));
    setState(() {
      valueTheme = false;
      notification = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(fontSize: 25)),
      ),
      body: loading
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: const [
                  Text(
                    'Carregando configurações do app',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LinearProgressIndicator()
                ],
              ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                    title: Text('Tema: ${valueTheme ? 'Dark' : 'Light'}'),
                    onChanged: (value) {
                      setState(
                        () {
                          valueTheme = value;
                        },
                      );
                    },
                    value: valueTheme),
                const Divider(
                  color: Colors.grey,
                ),
                SwitchListTile(
                    title: Text(
                        'Notificações: ${notification ? 'Ativada' : 'Desativada'}'),
                    onChanged: (value) {
                      setState(
                        () {
                          notification = value;
                        },
                      );
                    },
                    value: notification),
                const Divider(
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: resetConfig,
                  child: const Text('Resetar configurações'),
                ),
                TextButton(
                  onPressed: () async {
                    await storage.setTheme(valueTheme);
                    await storage.setNotification(notification);

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, Routes.home,
                        arguments: Arguments('123@hotmail.com'));
                  },
                  child: const Text('Salvar configurações'),
                ),
              ],
            ),
    ));
  }
}
