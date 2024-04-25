import 'package:flutter/material.dart';

class ViewattendancePage extends StatefulWidget {
  const ViewattendancePage({super.key});

  @override
  State<ViewattendancePage> createState() => _ViewattendancePageState();
}

class _ViewattendancePageState extends State<ViewattendancePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('View Attendance'),
      ),
    );
  }
}
