import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final _vaildForm = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  bool isValidForm = true;
  String _enteredText = '';

  callback(String value) {
    setState(() {
      _enteredText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: const Text(
          'Experience',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
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
              //buildTextFormField('Title/Position'),
              buildTextFormField('Title/Position', _enteredText, textController,
                  callback, storageService1),
              const SizedBox(
                height: 16.0,
              ),
              //buildTextField('Organization/Company Title'),
              buildTextFormField('Organization/Company Title', _enteredText,
                  textController, callback, storageService1),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Description', _enteredText, textController,
                  callback, storageService1),
              //buildTextField('Description'),
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
                        });
                      } else {
                        setState(() {
                          isValidForm = false;
                        });
                      }
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    )),
              ),
              Center(
                child: Text(
                  isValidForm
                      ? textController.text
                      : "Please Fix error and Submit ",
                  style: const TextStyle(
                    fontSize: 18.0,
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
