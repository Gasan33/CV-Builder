import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/data/Models/storage_item.dart';
import 'package:cv_builder/presintation/Theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileService extends StatefulWidget {
  final String widgetTitle;
  final List<String> title;

  final Function callingBack;
  final List<String> details;
  const ProfileService(
      {super.key,
      required this.title,
      required this.callingBack,
      required this.widgetTitle,
      required this.details});

  @override
  State<ProfileService> createState() => _ProfileServiceState();
}

class _ProfileServiceState extends State<ProfileService> {
  late List<TextEditingController> textController;
  final _vaildForm = GlobalKey<FormState>();
  TextEditingController fromDateinput = TextEditingController();
  TextEditingController toDateinput = TextEditingController();
  late String? fromDateinputString;
  late String? toDateinputString;
  bool isValidForm = true;
  bool checkBoxValue = false;
  late List<StorageItem> items = [];
  bool loading = true;
  int radioGroup = 0;
  String enteredText = '';

  radioCallback(int value) {
    setState(() {
      radioGroup = value;
      print(radioGroup);
    });
  }

  callback(String value) {
    setState(() {
      enteredText = value;
      // widget.callingBack;
    });
  }

  void initList() async {
    items = await storageService1.readListSecureData(
        widget.details, widget.widgetTitle);

    if (items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        if (items[i].value.isNotEmpty) {
          setState(() {
            textController[i].text = items[i].value;
          });
          if (items[i].key == '${widget.widgetTitle} Description' ||
              items[i].key == 'Objective') {
            print(items[i].key);
            setState(() {
              enteredText = items[i].value;
            });
          }
        } else {
          setState(() {
            textController[i].text = '';
          });
        }
      }
    }
    if (widget.widgetTitle == 'Experiences' ||
        widget.widgetTitle == 'Qualifications' ||
        widget.widgetTitle == 'Organizations' ||
        widget.widgetTitle == 'Certificates' ||
        widget.widgetTitle == 'Projects') {
      fromDateinputString = (await storageService1
          .readSecureData('${widget.widgetTitle} From Date'));
      toDateinputString = (await storageService1
          .readSecureData('${widget.widgetTitle} To Date'));
      if (fromDateinputString != null && toDateinputString != null) {
        setState(() {
          fromDateinput.text = fromDateinputString.toString();
          toDateinput.text = toDateinputString.toString();
        });
      } else {
        setState(() {
          fromDateinput.text = '';
          toDateinput.text = '';
        });
      }
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    textController = List.generate(
        widget.title.length, (index) => TextEditingController(),
        growable: true);
    initList();
    super.initState();
  }

  void onChangedCheckBoxValue(bool? value) {
    setState(() {
      checkBoxValue = value!;
      if (checkBoxValue) {
        toDateinput.text = 'present';
      } else {
        toDateinput.clear();
      }
    });
  }

  Widget buildSkillsRadio() {
    return Column(
      children: [
        buildRadioList('Basic', 0, radioGroup, radioCallback),
        buildRadioList('Intermediate', 1, radioGroup, radioCallback),
        buildRadioList('Expert', 2, radioGroup, radioCallback),
      ],
    );
  }

  Widget buildLanguageRadio() {
    return Column(
      children: [
        buildRadioList(
            '1/3 Elementary Proficiency', 0, radioGroup, radioCallback),
        buildRadioList(
            '2/3 Professionaol Proficiency', 1, radioGroup, radioCallback),
        buildRadioList('3/3 Native Proficiency', 2, radioGroup, radioCallback),
      ],
    );
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
                    fromDateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else if (lable == 'To Date') {
                  setState(() {
                    toDateinput.text =
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

  Widget dateInput() {
    return Column(
      children: [
        buildDateTextField('From Date', fromDateinput),
        const SizedBox(
          height: 16.0,
        ),
        buildDateTextField('To Date', toDateinput),
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
      ],
    );
  }

  Widget buildContent() {
    return ListView.builder(
        itemCount: widget.title.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            widget.widgetTitle == 'Personal Details' && index == 0
                ? Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    height: 150,
                    child: CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.asset(
                          width: 150,
                          height: 150,
                          //placeholder: 'assets/images/loading.gif',
                          "assets/images/gas.jpeg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : Container(),
            items.isEmpty && items.length == widget.title.length
                ? buildTextFormField2(
                    widget.widgetTitle,
                    widget.title[index],
                    enteredText,
                    textController[index],
                    callback,
                    storageService1,
                    //items[index]
                  )
                : buildTextFormField2(
                    widget.widgetTitle,
                    widget.title[index],
                    enteredText,
                    textController[index],
                    callback,
                    storageService1,
                    //StorageItem('', '')
                  ),
            const SizedBox(
              height: 16.0,
            ),
            index == widget.title.length - 1
                ? widget.widgetTitle == 'Personal Details' ||
                        widget.widgetTitle == 'Objective'
                    ? widget.widgetTitle == 'Skills'
                        ? buildSkillsRadio()
                        : widget.widgetTitle == 'Languages'
                            ? buildLanguageRadio()
                            : widget.widgetTitle == 'Reference' ||
                                    widget.widgetTitle == 'Hobbies/Interests'
                                ? Container()
                                : Container()
                    : dateInput()
                : Container(
                    color: Colors.red,
                    //child: Text('ddddddddddddd'),
                  ),
            index == widget.title.length - 1
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    onPressed: () {
                      if (_vaildForm.currentState!.validate()) {
                        if (widget.widgetTitle == 'Experiences' ||
                            widget.widgetTitle == 'Qualifications' ||
                            widget.widgetTitle == 'Organizations' ||
                            widget.widgetTitle == 'Certificates' ||
                            widget.widgetTitle == 'Awards/Scholarships') {
                          storageService1.writeSecureData(StorageItem(
                              '${widget.widgetTitle} From Date',
                              fromDateinput.text));
                          storageService1.writeSecureData(StorageItem(
                              '${widget.widgetTitle} To Date',
                              toDateinput.text));
                        }
                        setState(() {
                          isValidForm = true;
                        });
                      } else {
                        setState(() {
                          isValidForm = false;
                        });
                      }
                    },
                    child: const SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(child: Text("Update"))))
                : Container()
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor1,
        title: Text(
          widget.widgetTitle,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      body: Form(
        key: _vaildForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Expanded(child: buildContent()),
            ],
          ),
        ),
      ),
    );
  }
}
