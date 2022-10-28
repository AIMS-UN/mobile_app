import 'package:flutter/material.dart';

import '/layouts/auth_form.dart';
import '/shared/form/form_helpers.dart';
import '/shared/ui_helpers.dart';
import '/services/subjects.dart' as subject_service;

class SubjectSearchView extends StatefulWidget {
  const SubjectSearchView({super.key});

  @override
  State<SubjectSearchView> createState() => _SubjectSearchViewState();
}

class _SubjectSearchViewState extends State<SubjectSearchView> {
  Map<String, dynamic> _subjects = {};

  final _careerIdController = TextEditingController();
  final _subjectNameController = TextEditingController();

  void _getSubjects() async {
    final subjects = await subject_service.getSubjects();

    print(subjects);
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
      body: Column(
        children: [
          Expanded(
            child: FormLayout(
              submitText: 'Search',
              onSubmit: () async => {},
              form: [
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
              responseMessage: ValueNotifier<String>(''),
            ),
          ),
          _subjects != {} && _subjects['data'] != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _subjects['data']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final subject = _subjects['data'][index];
                      return ListTile(
                        title: Text(subject['subjectName']),
                        subtitle: Text(subject['subjectCode']),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SubjectDetailView(
                                subject: subject,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class SubjectDetailView extends StatelessWidget {
  const SubjectDetailView({super.key, required this.subject});

  final Map<String, dynamic> subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject['subjectName']),
      ),
      body: ListView.builder(
        itemCount: subject['groups'].length,
        itemBuilder: (context, index) {
          final group = subject['groups'][index];
          return ListTile(
            title: Text('Group ${index + 1}'),
            subtitle: Text('Teacher: ${group['teacherId']}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GroupDetailView(
                    group: group,
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GroupDetailView extends StatelessWidget {
  const GroupDetailView({super.key, required this.group, required this.index});

  final Map<String, dynamic> group;
  final int index;

  static const Map<int, String> _days = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group ${index + 1}'),
      ),
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
