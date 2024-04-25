import 'package:flutter/material.dart';

class ViewReportsPage extends StatelessWidget {
  const ViewReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Reports',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Report ${index + 1}'),
            subtitle: Text(reports[index]),
          );
        },
      ),
    );
  }
}

// Assuming reports are stored in a list for demonstration purposes
List<String> reports = [
  "This is report 1. It contains important information.",
  "Report 2: Some more details here.",
  "Another report for viewing purposes.",
];
