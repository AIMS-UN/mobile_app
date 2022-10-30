import 'dart:ffi';

import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import '/services/grading.dart' as grading;
import '/services/subjects.dart' as subjects_service;

class GradingView extends StatefulWidget {
  const GradingView({super.key});

  @override
  State<StatefulWidget> createState() => _GradingView();
}

class _GradingView extends State<GradingView> {
  Map<String, dynamic> _gradings = {};

  Map<String, dynamic> _subjects = {};

  Map<String, dynamic> _categories = {};

  _getGradings() async {
    final gradings = await grading.getGrades();
    print("GRADINGS: $gradings");
    setState(() {
      _gradings = gradings;
    });
  }

  _getSubjects() async {
    final subjects = await subjects_service.getSubjects();
    print("SUBJECTS: $subjects");
    setState(() {
      _subjects = subjects;
    });
  }

  _getCategories() async {
    final categories = await grading.getGradingCategories();
    print("CATEGORIES: $categories");
    setState(() {
      _categories = categories;
    });
  }

  String _getSubjectName(String categoryId) {
    if (_categories['data'] == null) {
      return '';
    }
    for (var i = 0; i < _categories['data'].length; i++) {
      if (_categories['data'][i]['id'] == categoryId) {
        if (_subjects['data'] == null) {
          return '';
        }
        for (var j = 0; j < _subjects['data'].length; j++) {
          if (_subjects['data'][j]['subjectCode'] ==
              _categories['data'][i]['subject_code']) {
            return _subjects['data'][j]['subjectName'];
          }
        }
      }
    }
    return '';
  }

  // return floating number with 2 decimal places double
  String _getWeight(String categoryId) {
    if (_categories['data'] == null) {
      return '';
    }
    for (var i = 0; i < _categories['data'].length; i++) {
      if (_categories['data'][i]['id'] == categoryId) {
        return _categories['data'][i]['weight'].toStringAsFixed(2);
      }
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    _getGradings();
    _getSubjects();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardSettings(
        children: [
          if (_gradings != {} && _gradings['data'] != null)
            for (var i = 0; i < _gradings['data'].length; i++)
              CardSettingsSection(
                header: CardSettingsHeader(
                  // get name using grade.category_id => category.subject_code => subject.subjectName
                  label: _getSubjectName(_gradings['data'][i]['category_id']),
                ),
                children: [
                  CardSettingsText(
                    label: 'Calificación',
                    initialValue: _gradings['data'][i]['score'].toString(),
                    enabled: false,
                  ),
                  CardSettingsText(
                    // weight is in decimal form (0.2, 0.3, 0.5) multiply by 100 to get percentage
                    label: 'peso',
                    initialValue:
                        _getWeight(_gradings['data'][i]['category_id']),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
