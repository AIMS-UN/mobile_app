import '/config/api.dart' as api;

Future<Map<String, dynamic>> getGradingCategories(
    {String? subjectCode, String? groupId}) async {
  final response = await api.query('''
    query {
      getGradingCategories(subject_code: "$subjectCode", group_id: "$groupId") {
        id
        name
        weight
        group_id
        subject_code
      }
    }
  ''');

  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getGradingCategories']};
}

Future<Map<String, dynamic>> getGradingCategory(String id) async {
  final response = await api.query('''
    query {
      getGradingCategory(id: "$id") {
        id
        name
        weight
        group_id
        subject_code
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getGradingCategory']};
}

Future<Map<String, dynamic>> getGrades(
    {String? studentId, String? categoryId}) async {
  final response = await api.query('''
    query {
      getGrades(student_id: "$studentId", category_id: "$categoryId") {
        id
        score
        category_id
        student_id
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getGrades']};
}

Future<Map<String, dynamic>> getGrade(String id) async {
  final response = await api.query('''
    query {
      getGrade(id: "$id") {
        id
        score
        category_id
        student_id
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getGrade']};
}
