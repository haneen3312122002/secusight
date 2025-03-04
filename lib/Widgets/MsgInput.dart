import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:secusight/Functions/ScreenSize.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSend;

  MessageInput({required this.onSend});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  TextEditingController _messageController = TextEditingController();

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      widget.onSend("File Uploaded: ${result.files.single.name}");
    }
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      widget.onSend(_messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.all(40),
      width: ScreenSize.getWidth(context) * 0.7,
      height: 80, //padding for the things in the container
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Colors.cyanAccent, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(color: Colors.cyanAccent),
              decoration: InputDecoration(
                hintText: 'Write Message',
                hintStyle: TextStyle(color: Colors.cyanAccent.withOpacity(0.7)),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file,
                color: const Color.fromARGB(255, 24, 186, 255)),
            onPressed: _pickFile,
          ),
          IconButton(
            icon:
                Icon(Icons.send, color: const Color.fromARGB(255, 0, 255, 140)),
            onPressed: _sendMessage,
          ),
        ],
      ),
    ));
  }
}
