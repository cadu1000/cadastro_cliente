import 'package:atendimento_domiciliar/models/clients_model.dart';
import 'package:atendimento_domiciliar/models/db.dart';
import 'package:atendimento_domiciliar/register.dart';
import 'package:flutter/material.dart';

class ClientView extends StatefulWidget {
  const ClientView({super.key});

  @override
  State<ClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  //
  DB db = DB(); // banco de dados instanciado
  List<Clientes> cli = <Clientes>[]; // criado uma  lista vazia

  @override
  void initState() {
    super.initState();

    // Clientes a = Clientes(
    //     id: 1,
    //     nome: "Felipe Zamperlini",
    //     celular: "4897584555",
    //     endereco: "Rua Joao da Gloria, 1588",
    //     dtnasc: "23/08/1975",
    //     notas: "Teste de anotacoes !!");
    // db.adcionaCliente(a);
    // Clientes b = Clientes(
    //     id: 2,
    //     nome: "Frodo Zamperlini",
    //     celular: "4897563887",
    //     endereco: "Rua Getulio Vargas, 722",
    //     dtnasc: "17/04/1978",
    //     notas: "Mais uma anotacao !!");
    // db.adcionaCliente(b);

    // db.todosClientes().then((lista) {
    //   // ignore: avoid_print
    //   print(lista);
    // });
    db.todosClientes().then((lista) {
      setState(() => lista);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Clientes"),
      ),
      // body: ListView.builder(
      //   padding: const EdgeInsets.all(10),
      //   itemCount: cli.length,
      //   itemBuilder: (context, index) {
      //     return _listaClientes(context, index);
      //   },
      // ),
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
