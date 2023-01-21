import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  get controle => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomForm(
                label: "Nome",
                iconeform: Icons.person,
                textoindicativo: "Digite o nome",
              ),
              SizedBox(height: 20),
              CustomForm(
                label: "Celular",
                iconeform: Icons.phone_android,
                textoindicativo: "Digite o celular (48999999999)",
              ),
              SizedBox(height: 20),
              CustomForm(
                label: "Endereço",
                iconeform: Icons.home,
                textoindicativo: "Digite o endereço completo",
              ),
              SizedBox(
                height: 20,
              ),
              CustomForm(
                label: "Data de Nascimento",
                iconeform: Icons.date_range,
                textoindicativo: "Digite a data de nascimento",
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Limpar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]),
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
