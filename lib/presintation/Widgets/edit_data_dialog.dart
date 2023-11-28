import 'package:cv_builder/data/Models/storage_item.dart';
import 'package:cv_builder/presintation/Widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';

class EditDataDialog extends StatefulWidget {
  final StorageItem item;

  const EditDataDialog({Key? key, required this.item}) : super(key: key);

  @override
  State<EditDataDialog> createState() => _EditDataDialogState();
}

class _EditDataDialogState extends State<EditDataDialog> {
  late final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //TODO: Add the default text to the _valueController using the StorageItem
    _valueController.text = widget.item.value;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _valueController,
              decoration: textFieldDecoration(hintText: "Enter Value"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_valueController.text);
                    },
                    child: const Text('Update')))
          ],
        ),
      ),
    );
  }
}
