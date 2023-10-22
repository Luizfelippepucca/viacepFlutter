import 'package:flutter/material.dart';

import '../utils/routes.dart';

class CardDetail extends StatefulWidget {
  static const routeName = Routes.cardDetails;
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CardParams;
    return Hero(
      tag: args.cardDetails.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.purple.withOpacity(0.9),
                  icon: Icon(
                    Icons.close,
                    color: Colors.purple.withOpacity(0.9),
                  ),
                ),
                Image.network(
                  args.cardDetails.url,
                  height: 100,
                ),
                const SizedBox(height: 15),
                Text(
                  args.cardDetails.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Text(
                    args.cardDetails.content,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
