import 'package:cv_builder/data/Models/storage_item.dart';
import 'package:cv_builder/data/services/storage_service.dart';
import 'package:flutter/material.dart';

InputDecoration textFormFieldDecoration(
    {required String hintText, required String enteredText}) {
  return InputDecoration(
    counterText: hintText == 'Description'
        ? '${500 - enteredText.length}/500'
        : hintText == 'Objective'
            ? '${500 - enteredText.length}/500'
            : null,
    hintText: hintText == 'Portfolio'
        ? 'Weblink,LinkedIn,Twitter etc...'
        : hintText == 'Grade/GBA'
            ? '3.50/4.00 or 1000/1100'
            : hintText,
    hintStyle: TextStyle(color: Colors.grey.shade300),
    errorStyle: const TextStyle(color: Colors.red),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.black38,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.black38,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

Widget buildTextFormField(
    String lable,
    String enteredText,
    TextEditingController textController,
    Function state,
    StorageService storageService) {
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
          maxLines: lable == 'Description'
              ? 5
              : lable == 'Objective'
                  ? 10
                  : 1,
          maxLength: lable == 'Description'
              ? 500
              : lable == 'Objective'
                  ? 500
                  : null,
          onChanged: (value) {
            final StorageItem newItems =
                StorageItem(lable, textController.text);
            storageService.writeSecureData(newItems);
            state(value);
          },
          controller: textController,
          validator: (inputValue) {
            if (inputValue!.isEmpty) {
              return "Please Enter $lable";
            }
            return null;
          },
          keyboardType: lable == 'Phone Number'
              ? TextInputType.number
              : lable == 'Email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          textAlign: TextAlign.start,
          cursorColor: Colors.deepPurple,
          cursorHeight: 24,
          decoration: textFormFieldDecoration(
              hintText: lable, enteredText: enteredText)),
      const SizedBox(
        height: 16.0,
      ),
      lable == 'Language Name'
          ? const SizedBox(
              width: double.infinity,
              child: Text(
                'Language Proficiency',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          : Container()
    ],
  );
}

Widget buildTextFormField2(
  String widgetTitle,
  String lable,
  String enteredText,
  TextEditingController textController,
  Function state,
  StorageService storageService,
  // StorageItem item
) {
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
          maxLines: lable == 'Description'
              ? 5
              : lable == 'Objective'
                  ? 10
                  : 1,
          maxLength: lable == 'Description'
              ? 500
              : lable == 'Objective'
                  ? 500
                  : null,
          onChanged: (value) {
            state(value);
            if (lable == 'Description') {
              final StorageItem newItems =
                  StorageItem('$widgetTitle $lable', textController.text);
              storageService.writeSecureData(newItems);
            } else {
              final StorageItem newItems =
                  StorageItem(lable, textController.text);
              storageService.writeSecureData(newItems);
            }
          },
          controller: textController,
          validator: (inputValue) {
            if (inputValue!.isEmpty) {
              return "Please Enter $lable";
            }
            // } else {
            //   state(lable, textController);
            // }
            return null;
          },
          keyboardType: lable == 'Phone Number'
              ? TextInputType.number
              : lable == 'Email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          textAlign: TextAlign.start,
          cursorColor: Colors.deepPurple,
          cursorHeight: 24,
          decoration: textFormFieldDecoration(
              hintText: lable, enteredText: enteredText)),
      const SizedBox(
        height: 16.0,
      ),
      lable == 'Language Name'
          ? const SizedBox(
              width: double.infinity,
              child: Text(
                'Language Proficiency',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          : Container()
    ],
  );
}

Widget buildRadioList(
    String title, int value, int groupValue, Function onChanged) {
  return RadioListTile.adaptive(
      value: value,
      groupValue: groupValue,
      title: Text(title),
      onChanged: (value) {
        onChanged(value);
      });
}
