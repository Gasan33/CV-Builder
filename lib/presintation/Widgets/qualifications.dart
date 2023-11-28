import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Qualifications extends StatefulWidget {
  const Qualifications({super.key});

  @override
  State<Qualifications> createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  final _vaildForm = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  bool isValidForm = true;
  bool checkBoxValue = false;
  void onChangedCheckBoxValue(bool? value) {
    setState(() {
      checkBoxValue = value!;
      if (checkBoxValue) {
        dateinput2.text = 'present';
      } else {
        dateinput2.clear();
      }
    });
  }

  Widget buildDateTextField(String lable, TextEditingController date) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            lable,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
            controller: date,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement
                if (lable == 'From Date') {
                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else if (lable == 'To Date') {
                  setState(() {
                    dateinput2.text =
                        formattedDate; //set output date to TextField value.
                  });
                }
              } else {
                print("Date is not selected");
              }
            },
            validator: (inputValue) {
              if (inputValue!.isEmpty) {
                return "Please Enter $lable";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            cursorColor: Colors.deepPurple,
            cursorHeight: 24,
            decoration:
                textFormFieldDecoration(hintText: lable, enteredText: '')),
      ],
    );
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  void callBack(String val) {
    setState(() {
      //dateinput.text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: const Text('Qualifications'),
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
              buildTextFormField('Study Program/Degree Title', '',
                  textController, callBack, storageService1),
              // buildTextField('Study Program/Degree Title'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField('Institute/Place of Education', '',
                  textController, callBack, storageService1),
              //buildTextField('Institute/Place of Education'),
              const SizedBox(
                height: 16.0,
              ),
              buildTextFormField(
                  'Grade/GBA', '', textController, callBack, storageService1),
              //buildTextField('Grade/GBA'),
              const SizedBox(
                height: 16.0,
              ),
              buildDateTextField('From Date', dateinput),
              const SizedBox(
                height: 16.0,
              ),
              buildDateTextField('To Date', dateinput2),
              const SizedBox(
                height: 16.0,
              ),
              CheckboxListTile.adaptive(
                value: checkBoxValue,
                onChanged: onChangedCheckBoxValue,
                title: const Text('present'),
              ),
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
