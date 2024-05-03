import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; 


class ReportSubmissionScreen extends StatefulWidget {
  @override
  _ReportSubmissionScreenState createState() => _ReportSubmissionScreenState();
}

class _ReportSubmissionScreenState extends State<ReportSubmissionScreen> {
  final TextEditingController _reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Submission',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 64, 144, 209),
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
              maxLines: 7,
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
              onPressed: _isFormValid() ? _submit : null,
              child: const Text('Submit',
              style: TextStyle(color: Color.fromARGB(255, 64, 144, 209),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _reportController.text.trim().isNotEmpty;
  }

Future<void> _submit() async {
  if (_isFormValid()) {
    String report = _reportController.text;
    DateTime now = DateTime.now();
    String date = '${now.day}-${now.month}-${now.year}';
    
    // Format the time with AM/PM using DateFormat
    String time = DateFormat('hh:mm a').format(now); // 'hh:mm a' for 12-hour time format with AM/PM
    
    print('Report content: $report'); // Print the report content
    print('Time: $time'); // Print the submission time
    print('Date: $date'); // Print the submission date

    await _uploadReport(report, date, time);
    _reportController.clear();
  }
}

Future<void> _uploadReport(String report, String date, String time) async {
  try {
    // Define your server URL
    const String url = 'http://13.201.213.5:4040/emp/dailyemployeereport'; // Replace with your actual URL

    // Send a POST request with the report data
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'report': report,
        'date': date,
        'time': time,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    // Parse the response JSON
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    
    // Check if the response contains the expected fields
    if (jsonResponse.containsKey('status')) {
      bool status = jsonResponse['status'];
      print(status);
      if (status) {
        // Report submitted successfully
        print('Report submitted successfully');
      } else {
        // Report submission failed
        print('Failed to submit report');
      }
    } else {
      // Handle unexpected response format
      print('Unexpected response format');
    }
  } catch (e) {
    print('Error uploading report: $e');
  }
}
}
