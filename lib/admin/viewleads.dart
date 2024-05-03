// import 'package:flutter/material.dart';

// class ViewLeadsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> leadsData;

//   const ViewLeadsPage({Key? key, required this.leadsData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'View Leads',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 64, 144, 209),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: leadsData.map<Widget>((lead) {
//             return Card(
//               margin: const EdgeInsets.only(bottom: 20),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Lead Name: ${lead['leadName']}',
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     Text('Lead Phone: ${lead['leadPhone']}'),
//                     const SizedBox(height: 10),
//                     Text('Lead Email: ${lead['leadEmail']}'),
//                     const SizedBox(height: 10),
//                     Text('Lead Short Description: ${lead['leadShortDescription']}'),
//                     const SizedBox(height: 10),
//                     Text('Lead Long Description: ${lead['leadLongDescription']}'),
//                     const SizedBox(height: 10),
//                     Text('Lead Meeting Date: ${lead['leadMeetingDate']}'),
//                     const SizedBox(height: 10),
//                     Text('Lead Meeting Time: ${lead['leadMeetingTime']}'),
//                     const SizedBox(height: 10),
//                     Text('Possible Lead: ${lead['possibleLead']}'),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ViewLeadsPage extends StatefulWidget {
//   @override
//   _ViewLeadsPageState createState() => _ViewLeadsPageState();
// }

// class _ViewLeadsPageState extends State<ViewLeadsPage> {
//   List<Map<String, dynamic>> _userList = [];
//   List<Map<String, dynamic>> _filteredUserList = [];
//   List<Color> _avatarColors = [
//     Colors.blue,
//     Colors.red,
//     Colors.green,
//     Colors.orange,
//     Colors.purple,
//     Colors.pink,
//     Colors.teal,
//     Colors.indigo,
//     Colors.blueGrey,
//     Colors.brown,
//   ];
//   int _colorIndex = 0;
//   TextEditingController _emailFilterController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://13.201.213.5:4040/admin/fetchallemployeeleadregister'),
//       );
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           _userList = List<Map<String, dynamic>>.from(jsonData['userList']);
//           _filteredUserList = List<Map<String, dynamic>>.from(jsonData['userList']);
//         });
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

//   void filterByEmail(String email) {
//     setState(() {
//       if (email.isEmpty) {
//         _filteredUserList = List.from(_userList);
//       } else {
//         _filteredUserList = _userList
//             .where((user) => user['leadEmail'].toLowerCase().contains(email.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee List'),
//         backgroundColor: Colors.blue.shade900,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _emailFilterController,
//               onChanged: (value) {
//                 filterByEmail(value);
//               },
//               decoration: InputDecoration(
//                 labelText: 'Filter by Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: _filteredUserList.isEmpty
//                 ? Center(
//                     child: Text(''),
//                   )
//                 : ListView.builder(
//                     itemCount: _filteredUserList.length,
//                     itemBuilder: (context, index) {
//                       final user = _filteredUserList[index];
//                       Color color = _avatarColors[_colorIndex % _avatarColors.length];
//                       _colorIndex++;
//                       return ListTile(
//                         title: 
//                         Text(user['leadName']),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           // children: [
//                           //   Text('Email: ${user['leadEmail']}'),
//                           //   Text('Phone: ${user['leadPhone']}'),
//                           //   Text('Short Description: ${user['leadShortDescription']}'),
//                           //   Text('Brief Description: ${user['leadBriefDescription'] ?? 'N/A'}'),
//                           //   Text('Meeting Time: ${user['leadMeetingTime'] ?? 'N/A'}'),
//                           //   Text('Meeting Date: ${user['leadMeetingDate'] ?? 'N/A'}'),
//                           //   Text('Possible Lead: ${user['possibleLead']}'),
//                           // ],
//                         ),
//                         leading: Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: color,
//                           ),
//                           child: Center(
//                             child: Text(
//                               user['leadName'][0].toUpperCase(),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 24,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }









import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewLeadsPage extends StatefulWidget {
  const ViewLeadsPage({super.key});

  @override
  _ViewLeadsPageState createState() => _ViewLeadsPageState();
}

class _ViewLeadsPageState extends State<ViewLeadsPage> {
  List<Map<String, dynamic>> _userList = [];
  List<Map<String, dynamic>> _filteredUserList = [];
  List<Color> _avatarColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.blueGrey,
    Colors.brown,
  ];
  int _colorIndex = 0;
  TextEditingController _emailFilterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse('http://13.201.213.5:4040/admin/fetchallemployeeleadregister'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _userList = List<Map<String, dynamic>>.from(jsonData['userList']);
          _filteredUserList = List<Map<String, dynamic>>.from(jsonData['userList']);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void filterByEmail(String email) {
    setState(() {
      if (email.isEmpty) {
        _filteredUserList = List.from(_userList);
      } else {
        _filteredUserList = _userList
            .where((user) => user['leadEmail'].toLowerCase().contains(email.toLowerCase()))
            .toList();
      }
    });
  }

  void _showUserDetails(Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee List',
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
              controller: _emailFilterController,
              onChanged: (value) {
                filterByEmail(value);
              },
              decoration: const InputDecoration(
                labelText: 'Filter by Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filteredUserList.isEmpty
                ? const Center(
                    child: Text(''),
                  )
                : ListView.builder(
                    itemCount: _filteredUserList.length,
                    itemBuilder: (context, index) {
                      final user = _filteredUserList[index];
                      Color color = _avatarColors[_colorIndex % _avatarColors.length];
                      _colorIndex++;
                      return ListTile(
                        onTap: () => _showUserDetails(user), // Navigate to details page on tap
                        title: Container( // Wrap the name in a Container
                          child: Text(user['leadName']),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), // Optional: add border radius
                            color: Colors.grey[200], // Optional: add background color
                          ),
                          padding: EdgeInsets.all(8), // Optional: add padding
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Display other user details here
                        ),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                          child: Center(
                            child: Text(
                              user['leadName'][0].toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20, // Adjust the font size if needed
                              ),
                            ),
                          ),
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

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user['leadName']}'),
            Text('Email: ${user['leadEmail']}'),
            Text('Phone: ${user['leadPhone']}'),
            Text('Short Description: ${user['leadShortDescription']}'),
            Text('Brief Description: ${user['leadBriefDescription'] ?? 'N/A'}'),
            Text('Meeting Time: ${user['leadMeetingTime'] ?? 'N/A'}'),
            Text('Meeting Date: ${user['leadMeetingDate'] ?? 'N/A'}'),
            Text('Possible Lead: ${user['possibleLead']}'),
          ],
        ),
      ),
    );
  }
}
