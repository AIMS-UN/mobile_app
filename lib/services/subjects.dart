import '/config/api.dart' as api;

Future<Map<String, dynamic>> getSubjects() async {
  final response = await api.query('''
    query {
      getSubjects {
        subjectId
        subjectName
        subjectCode
        careerId
        curriculum
        credits
        groups {
          groupId
          maxCapacity
          teacherId
          schedules {
            scheduleId
            day
            startTime
            endTime
            classroom
            building
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getSubjects']};
}

Future<Map<String, dynamic>> getSubjectByName(String name) async {
  final response = await api.query('''
    query {
      getSubjectByName(subjectName: "$name") {
        subjectId
        subjectName
        subjectCode
        careerId
        curriculum
        credits
        groups {
          groupId
          maxCapacity
          teacherId
          schedules {
            scheduleId
            day
            startTime
            endTime
            classroom
            building
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getSubjectByName']};
}

Future<Map<String, dynamic>> getSubjectByCode(String code) async {
  final response = await api.query('''
    query {
      getSubjectByCode(subjectCode: "$code") {
        subjectId
        subjectName
        subjectCode
        careerId
        curriculum
        credits
        groups {
          groupId
          maxCapacity
          teacherId
          schedules {
            scheduleId
            day
            startTime
            endTime
            classroom
            building
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getSubjectByCode']};
}

Future<Map<String, dynamic>> getSubjectByCareer(String careerId) async {
  final response = await api.query('''
    query {
      getSubjectByCareer(careerId: "$careerId") {
        subjectId
        subjectName
        subjectCode
        careerId
        curriculum
        credits
        groups {
          groupId
          maxCapacity
          teacherId
          schedules {
            scheduleId
            day
            startTime
            endTime
            classroom
            building
          }
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getSubjectByCareer']};
}

Future<Map<String, dynamic>> getClassGroups() async {
  final response = await api.query('''
    query {
      getClassGroups {
        groupId
        maxCapacity
        teacherId
        subject {
          subjectId
          subjectName
          subjectCode
          careerId
          curriculum
          credits
        }
        schedules {
          scheduleId
          day
          startTime
          endTime
          classroom
          building
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getClassGroups']};
}

Future<Map<String, dynamic>> getClassGroupById(String id) async {
  final response = await api.query('''
    query {
      getClassGroupById(groupId: "$id") {
        groupId
        maxCapacity
        teacherId
        subject {
          subjectId
          subjectName
          subjectCode
          careerId
          curriculum
          credits
        }
        schedules {
          scheduleId
          day
          startTime
          endTime
          classroom
          building
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getClassGroupById']};
}
