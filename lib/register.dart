import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  get controle => TextEditingController();
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
          padding: const EdgeInsets.all(10),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomForm(
                  label: "Nome",
                  iconeform: Icons.person,
                  textoindicativo: "Digite o nome",
                ),
                const SizedBox(height: 20),
                const CustomForm(
                  label: "Celular",
                  iconeform: Icons.phone_android,
                  textoindicativo: "Digite o celular (48999999999)",
                ),
                const SizedBox(height: 20),
                const CustomForm(
                  label: "Endereço",
                  iconeform: Icons.home,
                  textoindicativo: "Digite o endereço completo",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomForm(
                  label: "Data de Nascimento",
                  iconeform: Icons.date_range,
                  textoindicativo: "Digite a data de nascimento",
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                      }
                    },
                    child: const Text(
                      "Salvar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      formkey.currentState?.reset();
                    },
                    child: const Text(
                      "Limpar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ]),
        ),
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
  const CustomForm(
      {super.key, required this.label, this.iconeform, this.textoindicativo});

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
