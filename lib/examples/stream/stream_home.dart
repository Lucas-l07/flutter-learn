import 'dart:async';

import 'package:flutter/material.dart';

class StreamHome extends StatefulWidget {
  const StreamHome({super.key});

  @override
  State<StreamHome> createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {
  // Cria um StreamController para gerenciar o stream de dados
  final StreamController<int> streamController = StreamController<int>();
  int firstcounter = 0;

  void firstCounter() {
    // Adiciona um novo valor ao stream
    streamController.sink.add(firstcounter++);
  }

  Stream<int> secondCounter() async* {
    for (int i = 0; i < 10; i++) {
      // Simula um atraso para demonstrar a emissão de valores ao longo do tempo
      await Future.delayed(const Duration(seconds: 1));

      // Emite o próximo valor do contador
      yield i;
    }
  }

  @override
  void dispose() {
    // Fecha o StreamController para liberar recursos
    // Evita memory leaks = vazamento de memória
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Counter:'),

            // StreamBuilder reconstrói apenas esse bloco de código, no caso o Text...
            StreamBuilder<int>(
              // Escuta a stream e reconstrói a UI quando um novo valor é emitido
              stream: streamController.stream,

              // Define um valor inicial para o snapshot
              initialData: firstcounter,

              // O novo valor é passado para o snapshot
              builder: ((context, snapshot) {
                return Text(
                  'Counter: ${snapshot.data}',
                  style: TextStyle(fontSize: 24),
                );
              }),
            ),

            const SizedBox(height: 50),

            Text('Second Counter:'),

            StreamBuilder<int>(
              stream: secondCounter(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Text(
                  'Counter: ${snapshot.data}',
                  style: TextStyle(fontSize: 24),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: firstCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
