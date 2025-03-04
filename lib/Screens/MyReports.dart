import 'package:flutter/material.dart';

class MyReports extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {'name': 'تقرير 1', 'date': '2024-03-04'},
    {'name': 'تقرير 2', 'date': '2024-03-03'},
    {'name': 'تقرير 3', 'date': '2024-03-02'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reports'),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Column(
            children: [
              ListTile(
                title: Text(report['name']!),
                subtitle: Text(report['date']!),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      // تنفيذ حذف التقرير
                    } else if (value == 'compare') {
                      // تنفيذ مقارنة التقارير
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'delete', child: Text('حذف')),
                    PopupMenuItem(value: 'compare', child: Text('مقارنة')),
                  ],
                ),
                onTap: () {
                  // فتح صفحة تفاصيل التقرير
                },
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
