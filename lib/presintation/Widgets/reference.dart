import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';

class Reference extends StatefulWidget {
  const Reference({super.key});

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
  final _vaildForm = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  bool isValidForm = true;

  callback(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: const Text('Reference'),
        centerTitle: true,
      ),
      body: Form(
        key: _vaildForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              // buildTextField('First Name'),
              buildTextFormField(
                  'Name', '', textController, callback, storageService1),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Designation', '', textController, callback, storageService1),
              //buildTextField('Last Name'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Organization', '', textController, callback,
                  storageService1),
              //buildTextField('Profession'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Phone Number', '', textController, callback,
                  storageService1),
              //buildTextField('Email'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Email', '', textController, callback, storageService1),
              //buildTextField('Phone Number'),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4),
                height: 48.0,
                width: 48.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    onPressed: () {
                      if (_vaildForm.currentState!.validate()) {
                        setState(() {
                          isValidForm = true;
                          // SecureStorage()
                          //     .writeSecureData('name', textController.text);
                        });
                      } else {
                        setState(() {
                          isValidForm = false;
                        });
                      }
                    },
                    child: const Text("Update")),
              ),
              Center(
                child: Text(isValidForm
                    ? textController.text
                    : "Please Fix error and Submit "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
