import '/config/api.dart' as api;

Future<Map<String, dynamic>> login(String username, String password) async {
  final response = await api.query('''
    mutation {
      login(username: "$username", password: "$password") {
        id
        username
        role
      }
    }
  ''');
  if (response['data'] == null) {
    // return {'error': response['errors'][0]['message']};
    return {'error': 'An error occured'};
  }
  return {'data': response['data']['login']};
}

Future<Map<String, dynamic>> register(
    String username, String password, String role) async {
  final response = await api.query('''
    mutation {
      register(username: "$username", password: "$password", role: "$role") {
        id
        username
        role
      }
    }
  ''');
  if (response['data'] == null) {
    // return {'error': response['errors'][0]['message']};
    return {'error': 'An error occured'};
  }
  return {'data': response['data']['register']};
}

Future<Map<String, dynamic>> myAccount() async {
  final response = await api.query('''
    query {
      myAccount {
        id
        username
        role
      }
    }
  ''');
  if (response['data'] == null) {
    // return {'error': response['errors'][0]['message']};
    return {'error': 'An error occured'};
  }
  return {'data': response['data']['myAccount']};
}

Future<Map<String, dynamic>> logout() async {
  final response = await api.query('''
    mutation {
      logout
    }
  ''');
  if (response['data'] == null) {
    // return {'error': response['errors'][0]['message']};
    return {'error': 'An error occured'};
  }
  return {'data': response['data']['logout']};
}
