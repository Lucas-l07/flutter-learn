import 'package:flutter/material.dart';
import 'package:flutter_learn/examples/notifier/notifier_home_controller.dart';

class NotifierHomePage extends StatefulWidget {
  const NotifierHomePage({super.key});

  @override
  State<NotifierHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<NotifierHomePage> {
  final TextEditingController _namecontroller = TextEditingController();
  final NotifierHomeController _notifierhomeController =
      NotifierHomeController();

  @override
  void initState() {
    super.initState();

    // Adiciona um ouvinte para atualizar a interface quando a lista de nomes mudar
    _notifierhomeController.addListener(() {
      // Chama setState para atualizar a interface quando a lista de nomes for atualizada
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifier Example')),
      body: Stack(
        children: [
          _notifierhomeController.names.isEmpty
              ? const Center(child: Text('Nenhum nome adicionado'))
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 145),
                  itemCount: _notifierhomeController.names.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(_notifierhomeController.names[index]),
                    leading: CircleAvatar(
                      child: Center(
                        child: Text(_notifierhomeController.names[index][0]),
                      ),
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Digite um nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // Adiciona o nome digitado à lista e limpa o campo de texto
                        _notifierhomeController.addName(
                          name: _namecontroller.text,
                        );
                        // Limpa o campo de texto após adicionar o nome
                        _namecontroller.clear();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Center(
                          child: const Icon(Icons.send, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
