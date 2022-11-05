import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:3002/graphql';

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'x-forwarded-proto': 'https',
};

void updateCookie(http.Response response) {
  final String? cookie = response.headers['set-cookie'];
  if (cookie != null) {
    headers['cookie'] = cookie;
  }
}

dynamic query(String query) async {
  final http.Response response = await http.post(
    Uri.parse('$baseUrl/graphql'),
    headers: headers,
    body: jsonEncode(<String, String>{'query': query}),
  );
  updateCookie(response);
  return json.decode(response.body);
}
