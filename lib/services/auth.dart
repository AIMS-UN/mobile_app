import 'dart:convert';

import '../config/api.dart' as api;

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
  final body = json.decode(response.body);
  if (body['data'] == null) {
    return {'error': body['errors'][0]['message']};
  }
  return body['data']['login'];
}

// register
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
  final body = json.decode(response.body);
  if (body['data'] == null) {
    return {'error': body['errors'][0]['message']};
  }
  return body['data']['register'];
}

// get myAccount
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
  final body = json.decode(response.body);
  if (body['data'] == null) {
    return {'error': body['errors'][0]['message']};
  }
  return body['data']['myAccount'];
}

// logout
Future<Map<String, dynamic>> logout() async {
  final response = await api.query('''
    mutation {
      logout
    }
  ''');
  final body = json.decode(response.body);
  if (body['data'] == null) {
    return {'error': body['errors'][0]['message']};
  }
  return body['data'];
}
