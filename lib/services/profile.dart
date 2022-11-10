import '/config/api.dart' as api;

Future<Map<String, dynamic>> getProfiles() async {
  final response = await api.query('''
    query {
      getProfiles {
        user_id
        doc_id
        name
        lastname
        email
        birthdate
        phone_number
        address
        historials {
          coursed_credits
          approved_credits
          reprobed_credits
          GPA
          career
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getProfiles']};
}

Future<Map<String, dynamic>> getMyProfile() async {
  final response = await api.query('''
    query {
      getMyProfile {
        user_id
        doc_id
        name
        lastname
        email
        birthdate
        phone_number
        address
        historials {
          coursed_credits
          approved_credits
          reprobed_credits
          GPA
          career
        }
      }
    }
  ''');
  if (response['data'] == null) {
    return {'error': response['errors'][0]['message']};
  }
  return {'data': response['data']['getMyProfile']};
}
