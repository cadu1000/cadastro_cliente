import 'package:atendimento_domiciliar/register.dart';
import 'package:flutter/material.dart';

class ClientView extends StatefulWidget {
  const ClientView({super.key});

  @override
  State<ClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Clientes"),
      ),
      body: const Center(
        child: Text(""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Register()),
          );
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.group_add_sharp),
      ),
    );
  }
}
