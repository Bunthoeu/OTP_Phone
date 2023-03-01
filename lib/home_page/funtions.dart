import 'package:flutter/material.dart';


final TextEditingController _controller = TextEditingController();

textFieldStyle() {
  return InputDecoration(
    errorText: _errorText,
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
  );
}

String? get _errorText {
  final text = _controller.value.text;
  if (text.isEmpty) {
    return 'Can\'t be empty';
  }
  if (text.length < 4) {
    return 'Too short';
  }
  return null;
}

actionButton({required VoidCallback onClicked,required String text}) {
  return Align(
      alignment: Alignment.center,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            onClicked.call();
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ));
}
