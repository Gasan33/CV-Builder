import 'package:cv_builder/data/services/storage_service.dart';
import 'package:cv_builder/presintation/Widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';

class SearchKeyValueDialog extends StatefulWidget {
  const SearchKeyValueDialog({Key? key}) : super(key: key);

  @override
  State<SearchKeyValueDialog> createState() => _SearchKeyValueDialogState();
}

class _SearchKeyValueDialogState extends State<SearchKeyValueDialog> {
  final TextEditingController _keyController = TextEditingController();
  final StorageService _storageService = StorageService();
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _keyController,
              decoration: textFieldDecoration(hintText: "Enter Key"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      _value = await _storageService
                          .readSecureData(_keyController.text);
                      setState(() {});
                    },
                    child: const Text('Search'))),
            _value == null
                ? const SizedBox()
                : Text(
                    'Value: $_value',
                  )
          ],
        ),
      ),
    );
  }
}
