import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewAttendancePage extends StatefulWidget {
  @override
  _ViewAttendancePageState createState() => _ViewAttendancePageState();
}

class _ViewAttendancePageState extends State<ViewAttendancePage> {
  List<dynamic> userList = [];
  List<dynamic> filteredList = [];
  TextEditingController _searchController = TextEditingController();

  // Define a list of colors for avatars
  List<Color> avatarColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
    Colors.deepOrange,
    Colors.cyan
  ];

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchEmployeeAttendance();
    _searchController.addListener(() {
      filterAttendanceByDate(_searchController.text);
    });
  }

  Future<void> fetchEmployeeAttendance() async {
    try {
      final Uri url = Uri.parse('http://13.201.213.5:4040/admin/fetchallemployeeattendance');
      final response = await http.post(url);
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final String responseBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> data = jsonDecode(responseBody);
        print('Decoded JSON: $data');
        if (data['status'] == true && data['statusCode'] == 'FOUND') {
          setState(() {
            userList = data['userList'];
            filteredList = userList;
          });
        } else {
          // Handle error response
          throw Exception('Error: ${data['statusMessage']}');
        }
      } else {
        // Handle HTTP error
        throw Exception('HTTP Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle other errors
      print('Error fetching data: $e');
    }
  }

  void filterAttendanceByDate(String date) {
    setState(() {
      filteredList = userList.where((user) => user['date'] == date).toList();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _searchController.text = formatDate(picked);
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Attendance',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 144, 209),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Date',
                prefixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    filterAttendanceByDate('');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredList.isEmpty
                ? const Center(child: Text(''))
                : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = filteredList[index];
                      final Color avatarColor =
                          avatarColors[index % avatarColors.length]; // Get color from list based on index

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: avatarColor, // Set avatar background color
                          radius: 30, // Increase the radius of the avatar
                          child: const Icon(Icons.person),
                        ),
                        title: Text('ID: ${user['id']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: ${user['date']}'),
                            Text('Time: ${user['time']}'),
                            Text('Location: ${user['latitude']}, ${user['longitude']}'),
                            Text('Address: ${user['address']}'),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}