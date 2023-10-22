import 'package:dio/models/card_details.dart';
import 'package:dio/service/app_storage.dart';
import 'package:dio/utils/storage_key.dart';
import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../repository/card_detail_repository.dart';
import '../utils/routes.dart';

class HomePage extends StatefulWidget {
  static const routeName = Routes.home;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardDetailsModel cardDetails = listCard[0];
  bool loading = false;

  bool? theme;
  AppStorage storage = AppStorage();

  _loadData() async {
    theme = await storage.getStorage(StorageKey.themeKey);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme == true ? Colors.black : Colors.white,
        drawer: const Drawercomp(),
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SizedBox(
            width: double.infinity,
            child: loading
                ? ListView.builder(
                    itemCount: listCard.length,
                    itemBuilder: (contex, index) {
                      return Hero(
                        tag: listCard[index].id,
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        listCard[index].url,
                                        height: 35,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        listCard[index].title,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    listCard[index].content,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.cardDetails,
                                          arguments:
                                              CardParams(listCard[index]),
                                        );
                                      },
                                      child: const Text(
                                        'Ler mais',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.all(20),
                    child: LinearProgressIndicator(),
                  )),
      ),
    );
  }
}
