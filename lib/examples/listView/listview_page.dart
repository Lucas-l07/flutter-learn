import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Examples')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('ListView'),

            // ListView por padrão já possui scrollable
            ListView(
              // Força a ListView a ficar com o tamanho disponível da column
              shrinkWrap: true,

              children: [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
              ],
            ),

            Text('ListView.builder'),

            // Não possui scrollable, necessário usar o shrinkWrap
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('Item $index')),
            ),

            Text('ListView.separated'),

            ListView.separated(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('Separated $index')),
              separatorBuilder: (_, _) =>
                  const Divider(thickness: 1, height: 1, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
