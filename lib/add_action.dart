import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddActionPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddAction;

  const AddActionPage({Key? key, required this.onAddAction}) : super(key: key);

  @override
  _AddActionPageState createState() => _AddActionPageState();
}

class _AddActionPageState extends State<AddActionPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _assignedToController = TextEditingController();
  final TextEditingController _updateTimeController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _priorityColorController = TextEditingController();
  final TextEditingController _statusColorController = TextEditingController();

  List<String> _attachedDocuments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Action'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(_titleController, 'Title'),
            _buildTextField(_priorityController, 'Priority'),
            _buildTextField(_deadlineController, 'Deadline'),
            _buildTextField(_assignedToController, 'Assigned To'),
            _buildTextField(_updateTimeController, 'Update Time'),
            _buildTextField(_statusController, 'Status'),
            _buildTextField(_priorityColorController, 'Priority Color (Hex Code)'),
            _buildTextField(_statusColorController, 'Status Color (Hex Code)'),
            SizedBox(height: 20),
            _buildAttachDocumentButton(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAction,
              child: Text('Submit'),
            ),
            SizedBox(height: 10),
            _buildAttachedDocumentsCount(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  Widget _buildAttachDocumentButton() {
    return ElevatedButton(
      onPressed: _attachDocument,
      child: Text('Add New Document'),
    );
  }

  void _attachDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _attachedDocuments.add(result.files.single.name);
      });
    } else {
      // User canceled the picker
    }
  }

  Widget _buildAttachedDocumentsCount() {
    return Text(
      'Attached Documents: ${_attachedDocuments.length}',
      style: TextStyle(fontSize: 16),
    );
  }

  void _addAction() {
    if (_titleController.text.isEmpty ||
        _priorityController.text.isEmpty ||
        _deadlineController.text.isEmpty ||
        _assignedToController.text.isEmpty ||
        _updateTimeController.text.isEmpty ||
        _statusController.text.isEmpty ||
        _priorityColorController.text.isEmpty ||
        _statusColorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Create the new action as a map
    final newAction = {
      'title': _titleController.text,
      'priority': _priorityController.text,
      'deadline': _deadlineController.text,
      'assignedTo': _assignedToController.text,
      'updateTime': _updateTimeController.text,
      'status': _statusController.text,
      'priorityColor': _priorityColorController.text,
      'statusColor': _statusColorController.text,
      'documents': _attachedDocuments, // Add the attached documents
    };

    // Pass the new action to the callback function
    widget.onAddAction(newAction);

    // Go back to the previous page
    Navigator.pop(context);
  }
}
