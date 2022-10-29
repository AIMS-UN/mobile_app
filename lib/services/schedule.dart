import '/config/api.dart' as api;

Future<Map<String, dynamic>> mySchedule() async {
  final response = await api.query('''
    query {
      getMySchedule {
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
  print("RESPONSE: $response");
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getMySchedule']};
}

Future<Map<String, dynamic>> myScheduleBySemester(String semester) async {
  final response = await api.query('''
    query {
      getMyScheduleBySemester(semester: "$semester") {
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
  return {'data': response['data']['getMyScheduleBySemester']};
}
