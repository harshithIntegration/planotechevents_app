import 'package:flutter/material.dart';

class ViewLeadsPage extends StatelessWidget {
  final List<Map<String, dynamic>> leadsData;

  const ViewLeadsPage({Key? key, required this.leadsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Leads',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 98, 3, 110),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: leadsData.map<Widget>((lead) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Name: ${lead['leadName']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Lead Phone: ${lead['leadPhone']}'),
                    const SizedBox(height: 10),
                    Text('Lead Email: ${lead['leadEmail']}'),
                    const SizedBox(height: 10),
                    Text('Lead Short Description: ${lead['leadShortDescription']}'),
                    const SizedBox(height: 10),
                    Text('Lead Long Description: ${lead['leadLongDescription']}'),
                    const SizedBox(height: 10),
                    Text('Lead Meeting Date: ${lead['leadMeetingDate']}'),
                    const SizedBox(height: 10),
                    Text('Lead Meeting Time: ${lead['leadMeetingTime']}'),
                    const SizedBox(height: 10),
                    Text('Possible Lead: ${lead['possibleLead']}'),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
