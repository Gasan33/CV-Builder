import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _vaildForm = GlobalKey<FormState>();
  //TextEditingController textController = TextEditingController();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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
        title: const Text('Personal Details'),
        centerTitle: true,
      ),
      body: Form(
        key: _vaildForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                height: 150,
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      width: 150,
                      height: 150,
                      //placeholder: 'assets/images/loading.gif',
                      "assets/images/gas.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              // buildTextField('First Name'),
              buildTextFormField('First Name', '', textController[0], callback,
                  storageService1),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Last Name', '', textController[1], callback,
                  storageService1),
              //buildTextField('Last Name'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Profession', '', textController[2], callback,
                  storageService1),
              //buildTextField('Profession'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Email', '', textController[3], callback, storageService1),
              //buildTextField('Email'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Phone Number', '', textController[4],
                  callback, storageService1),
              //buildTextField('Phone Number'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Country', '', textController[5], callback, storageService1),
              //buildTextField('Country'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'City', '', textController[6], callback, storageService1),
              //buildTextField('City'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Address', '', textController[7], callback, storageService1),
              //buildTextField('Address'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Portfolio', '', textController[8], callback,
                  storageService1),
              //buildTextField('Portfolio'),
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
                    ? textController[0].text
                    : "Please Fix error and Submit "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
