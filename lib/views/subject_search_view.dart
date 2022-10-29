import 'package:flutter/material.dart';

import '/services/subjects.dart' as subject_service;
import '/shared/form/form_helpers.dart';
import '/shared/ui_helpers.dart';

class SubjectSearchView extends StatefulWidget {
  const SubjectSearchView({super.key});

  @override
  State<SubjectSearchView> createState() => _SubjectSearchViewState();
}

class _SubjectSearchViewState extends State<SubjectSearchView> {
  Map<String, dynamic> _subjects = {};

  final _careerIdController = TextEditingController();
  final _subjectNameController = TextEditingController();

  _getSubjects() async {
    final subjects = await subject_service.getSubjects();

    setState(() {
      _subjects = subjects;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Búsqueda de asignaturas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: () async {
              await _getSubjects();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Filter'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      formDropdown(
                        label: 'Career',
                        items: _subjects['data']
                            .map((subject) => subject['careerId'])
                            .toSet()
                            .toList(),
                        selectedItem: _subjects['data'][0]['careerId'],
                        controller: _careerIdController,
                      ),
                      verticalSpaceRegular,
                      formDropdown(
                        label: 'Subject',
                        items: _subjects['data']
                            // .where((subject) =>
                            //     subject['careerId'] == _careerIdController.text)
                            .map((subject) => subject['subjectName'])
                            .toSet()
                            .toList(),
                        selectedItem: _subjects['data'][0]['subjectName'],
                        controller: _subjectNameController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        print("careerId: ${_careerIdController.text}");
                        print("subjectName: ${_subjectNameController.text}");
                        // update the list of subjects with the new filters
                        setState(() {
                          _subjects['data'] = _subjects['data']
                              .where((subject) =>
                                  subject['careerId'] ==
                                      _careerIdController.text &&
                                  subject['subjectName'] ==
                                      _subjectNameController.text)
                              .toList();
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Filter'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          verticalSpaceMedium,
          if (_subjects != {} && _subjects['data'] != null)
            Expanded(
              child: ListView.builder(
                itemCount: _subjects['data'].length,
                itemBuilder: (context, index) {
                  final subject = _subjects['data'][index];
                  return Card(
                    child: ExpansionTile(
                      title: Text(
                        '${subject['subjectCode']} - ${subject['subjectName']}',
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: subject['groups'].length,
                          itemBuilder: (context, index) {
                            final group = subject['groups'][index];
                            return ListTile(
                              title: Text('Grupo ${index + 1}'),
                              subtitle: Text('Teacher: ${group['teacherId']}'),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Grupo ${index + 1}'),
                                    content: GroupScheduleWidget(
                                        group: group, index: index),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}

class GroupScheduleWidget extends StatelessWidget {
  const GroupScheduleWidget(
      {super.key, required this.group, required this.index});

  final Map<String, dynamic> group;
  final int index;

  static const Map<int, String> _days = {
    1: 'Lunes',
    2: 'Martes',
    3: 'Miércoles',
    4: 'Jueves',
    5: 'Viernes',
    6: 'Sábado',
    7: 'Domingo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: group['schedules'].length,
        itemBuilder: (context, index) {
          final schedule = group['schedules'][index];
          return ListTile(
            title: Text(
                '${_days[schedule['day']]} ${schedule['startTime']} - ${schedule['endTime']}'),
            subtitle: Text(
                'Classroom ${schedule['classroom']} in ${schedule['building']} building'),
          );
        },
      ),
    );
  }
}
