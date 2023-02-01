import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //get controle => TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Cliente"),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(

                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CustomForm(
                    label: "Nome",
                    iconeform: Icons.person,
                    textoindicativo: "Digite o nome",
                    //qtdecaracteres: 50,
                  ),
                  SizedBox(height: 20),
                  CustomForm(
                    label: "Celular",
                    iconeform: Icons.phone_android,
                    textoindicativo: "Digite o celular 48999999999",
                    tipoteclado: TextInputType.number,
                    //qtdecaracteres: 11,
                  ),
                  SizedBox(height: 20),
                  CustomForm(
                    label: "Endereço",
                    iconeform: Icons.home,
                    textoindicativo: "Digite o endereço completo",
                    //qtdecaracteres: 50,
                  ),
                  SizedBox(height: 20),
                  CustomForm(
                    label: "Data de Nascimento",
                    iconeform: Icons.date_range,
                    textoindicativo: "Digite a data de nascimento",
                    //qtdecaracteres: 10,
                  ),
                  SizedBox(height: 20),
                  CustomForm(
                    label: "Notas sobre o cliente",
                    iconeform: Icons.notes_sharp,
                    textoindicativo: "Notas sobre o cliente",
                    qtdelinhas: 4,
                    qtdecaracteres: 250,
                  ),
                ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.save),
      ),
    );
  }
}
//
//
//
// ? componetizando o TextFormField.

class CustomForm extends StatelessWidget {
  final String label;
  final IconData? iconeform;
  final String? textoindicativo;
  final int? qtdelinhas;
  final int? qtdecaracteres;
  final TextInputType? tipoteclado;
  const CustomForm({
    super.key,
    required this.label,
    this.iconeform,
    this.textoindicativo,
    this.qtdelinhas,
    this.qtdecaracteres,
    this.tipoteclado,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Esse campo não pode ser vazio !";
        }
        return null;
      },
      onSaved: (text) {},
      autofocus: true,
      maxLines: qtdelinhas,
      maxLength: qtdecaracteres,
      keyboardType: tipoteclado,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: iconeform == null ? null : Icon(iconeform),
        hintText: textoindicativo,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
