// import 'package:flutter/material.dart';

// class ReportPage extends StatefulWidget {
//   const ReportPage({Key? key}) : super(key: key);

//   @override
//   State<ReportPage> createState() => _ReportPageState();
// }

// class _ReportPageState extends State<ReportPage> {
//   final TextEditingController _reportController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isReportValid = false;
//   bool _isSubmitted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Report',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Please provide your report',
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _reportController,
//                 onChanged: (value) {
//                   setState(() {
//                     _isReportValid = value.trim().isNotEmpty;
//                   });
//                 },
//                 maxLines: 8,
//                 maxLength: 2000,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your report here...',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _isReportValid && !_isSubmitted ? _submitReport : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red.shade900,
//                 ),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _submitReport() {
//     String report = _reportController.text;
//     print('Report submitted: $report');
//     _isSubmitted = true;
//     _reportController.clear();
//     setState(() {
//       _isReportValid = false; // Reset validation status
//     });
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Report Submitted'),
//           content: const Text('Thank you for your report!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<File> _selectedFiles = [];
  final TextEditingController _reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Submission'),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please provide your report',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _reportController,
              onChanged: (_) {
                setState(() {});
              },
              maxLines: 5,
              maxLength: 2000,
              decoration: const InputDecoration(
                hintText: 'Enter your report here...',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your report';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickFile,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Upload the files'),
                  Icon(Icons.attach_file),
                  SizedBox(
                      width: 8), // Add some spacing between the icon and text
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedFiles.isNotEmpty) Expanded(child: _buildFileList()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isFormValid() ? _submit : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _reportController.text.trim().isNotEmpty;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.files.map((file) => File(file.path!)));
      });
    }
  }

  Widget _buildFileList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _selectedFiles.length,
      itemBuilder: (context, index) {
        final file = _selectedFiles[index];
        return ListTile(
          title: Text(file.path.split('/').last),
          leading: const Icon(Icons.insert_drive_file),
          onTap: () {
            openFile(file);
          },
        );
      },
    );
  }

  Future<void> saveFileToDatabase(File file) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://192.168.237.153:4040/qp/EmployeeSignUp'), // Replace with your server address
      );

      var stream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'file', // Make sure this matches the name expected by your server
        stream,
        length,
        filename: basename(file.path),
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var parsedData = json.decode(responseData);

      if (parsedData.containsKey('message')) {
        print('Response message: ${parsedData["message"]}');
      } else {
        print('Response does not contain a message field');
      }
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  Future<void> _submit() async {
    if (_isFormValid()) {
      String report = _reportController.text;
      _uploadReport(report);
      _reportController.clear();
      for (var file in _selectedFiles) {
        await saveFileToDatabase(file);
      }
      setState(() {
        _selectedFiles.clear(); // Clear the selected files list
      });
    }
  }

  Future<void> _uploadReport(String report) async {
    try {
      print('Report submitted: $report');
      // Your report upload logic here
    } catch (e) {
      print('Error uploading report: $e');
    }
  }

  Future<void> openFile(File file) async {
    final filePath = file.path;
    if (await File(filePath).exists()) {
      OpenFile.open(filePath);
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(
          content: Text('File does not exist!'),
        ),
      );
    }
  }
}
