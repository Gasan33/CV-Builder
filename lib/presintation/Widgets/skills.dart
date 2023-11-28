import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final _vaildForm = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  bool isValidForm = true;

  int radioGroup = 0;

  callback(int value) {
    setState(() {
      radioGroup = value;
      print(radioGroup);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: const Text('Skills'),
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
                  'Skill Name', '', textController, callback, storageService1),
              const SizedBox(
                height: 16.0,
              ),
              buildRadioList('Basic', 0, radioGroup, callback),

              buildRadioList('Intermediate', 1, radioGroup, callback),

              buildRadioList('Expert', 2, radioGroup, callback),

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
