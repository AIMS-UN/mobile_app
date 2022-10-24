import 'package:flutter/material.dart';

class GradingScreen extends StatefulWidget {
  const GradingScreen({super.key});

  @override
  State<GradingScreen> createState() => _GradingScreen();
}

class _GradingScreen extends State<GradingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          DataTable(columns: const [
            DataColumn(
                label: Text(
              'ID',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent),
            )),
            DataColumn(
                label: Text(
              'Subject',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent),
            )),
            DataColumn(
                label: Text(
              'Grading',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent),
            ))
          ], rows: const [
            DataRow(cells: [
              DataCell(
                Text(
                  "0001",
                ),
              ),
              DataCell(
                Text(
                  "Ingesoft",
                ),
              ),
              DataCell(
                Text(
                  "5.0",
                ),
              ),
            ]),
          ]),
        ]),
      ),
    );
  }
}
