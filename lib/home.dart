import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atendimento domicilar"),
        // ignore: todo
        backgroundColor:
            Colors.purpleAccent, // TODO: a cor tem que vir de uma funçao !!
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Atendimento Domiciliar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
