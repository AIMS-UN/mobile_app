import '/config/api.dart' as api;

Future<Map<String, dynamic>> getCareers() async {
  final response = await api.query('''
    query {
      getCareers {
        careerId
        careerName
        credits
        department {
          departmentId
          departmentName
          faculty {
            facultyId
            facultyName
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getCareers']};
}

Future<Map<String, dynamic>> getCareerById(String id) async {
  final response = await api.query('''
    query {
      getCareerById(careerId: "$id") {
        careerId
        careerName
        credits
        department {
          departmentId
          departmentName
          faculty {
            facultyId
            facultyName
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getCareerById']};
}

Future<Map<String, dynamic>> getDepartments() async {
  final response = await api.query('''
    query {
      getDepartments {
        departmentId
        departmentName
        faculty {
          facultyId
          facultyName
        }
        careers {
          careerId
          careerName
          credits
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getDepartments']};
}

Future<Map<String, dynamic>> getDepartmentById(String id) async {
  final response = await api.query('''
    query {
      getDepartmentById(departmentId: "$id") {
        departmentId
        departmentName
        faculty {
          facultyId
          facultyName
        }
        careers {
          careerId
          careerName
          credits
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getDepartmentById']};
}

Future<Map<String, dynamic>> getFaculties() async {
  final response = await api.query('''
    query {
      getFaculties {
        facultyId
        facultyName
        departments {
          departmentId
          departmentName
          careers {
            careerId
            careerName
            credits
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getFaculties']};
}

Future<Map<String, dynamic>> getFacultyById(String id) async {
  final response = await api.query('''
    query {
      getFacultyById(facultyId: "$id") {
        facultyId
        facultyName
        departments {
          departmentId
          departmentName
          careers {
            careerId
            careerName
            credits
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getFacultyById']};
}
