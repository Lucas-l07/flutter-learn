import 'package:flutter/material.dart';
import 'package:flutter_learn/controller/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final telas = [
      {'titulo': 'Strean', 'rota': Routes.stream},
      {'titulo': 'Notifier', 'rota': Routes.notifier},
      {'titulo': 'ListView', 'rota': Routes.listView},
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: telas.length,
        itemBuilder: (context, index) {
          final tela = telas[index];

          return ListTile(
            title: Text(tela['titulo']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, tela['rota']!);
            },
          );
        },
      ),
    );
  }
}
