import 'package:flutter/material.dart';
import 'package:photo_call/dataBase/contacts.dart';
import 'package:photo_call/functions/app_image_picker.dart';
import 'package:photo_call/provider/helper_provider.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final bool isNew;

  const EditScreen({super.key, required this.isNew});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? image = "";
  double? condSize = 0;
  Contact? newContact;
  final textController = TextEditingController();
  final numberController = TextEditingController();

  pickImage() {
    AppImagePicker().pick(onPick: (image) {
      this.image = image;
      setState(() {
        if (image != null) {
          condSize = null;
        }
      });
    });
  }

  @override
  void dispose() {
    textController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String titulo = widget.isNew ? 'Nuevo' : 'Editar';
    final db = Provider.of<HelperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormEditado(
                label: 'Nombre',
                keyboard: TextInputType.text,
                controller: textController,
              ),
              const SizedBox(height: 10),
              TextFormEditado(
                label: 'Numero Telefonico',
                keyboard: TextInputType.number,
                controller: numberController,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                      onPressed: () async {
                        pickImage();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text(
                        'Imagen',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(width: 10),
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: condSize,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: condSize,
                      ))
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: TextButton(
                  onPressed: () async {
                    Contact newContact = Contact(
                        name: textController.text,
                        number: numberController.text,
                        image: image!.toString());
                    db.saveContact(newContact);
                    print(newContact.name);
                    print(newContact.number);
                    print(newContact.image);
                    print(db.contactos.length);
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      Text('Guardar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormEditado extends StatelessWidget {
  final String label;
  final TextInputType keyboard;
  final TextEditingController controller;

  const TextFormEditado({
    super.key,
    required this.label,
    required this.keyboard,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration:
          InputDecoration(labelText: label, hintText: 'Ingresa el $label'),
    );
  }
}
