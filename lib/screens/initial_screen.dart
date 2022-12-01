import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(),
        title: const Text(
          "Tarefas",
        ),
      ),
      body: ListView(children: const [
        Task("Aprender Flutter", "assets/images/dash.png", 3),
        Task("Andar de biclicleta", "assets/images/bike.webp", 2),
        Task("Meditar", "assets/images/meditar.jpeg", 5),
        Task("Ler", "assets/images/livro.png", 4),
        Task("Jogar", "assets/images/jogar.jpg", 1),
        SizedBox(
          height: 80,
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
