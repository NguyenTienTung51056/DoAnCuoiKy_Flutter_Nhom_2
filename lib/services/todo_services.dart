import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoService {
  static Future<bool> deleteById(String id) async {
    final url = 'https://63746ffa48dfab73a4dfc2e3.mockapi.io/todos/$id';
    final uri = Uri.parse(url);
    final res = await http.delete(uri);
    return res.statusCode == 200;
  }

  static Future<List?> fetchTodos() async {
    final url = 'https://63746ffa48dfab73a4dfc2e3.mockapi.io/todos';
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return json;
    } else {}
  }

  static Future<bool> updateTodo(String id, Map body) async {
    // gửi dữ liệu  đến server
    final url = 'https://63746ffa48dfab73a4dfc2e3.mockapi.io/todos/$id';
    final uri = Uri.parse(url);
    final res = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return res.statusCode == 200;
  }

  static Future<bool> addTodo(Map body) async {
    final url = 'https://63746ffa48dfab73a4dfc2e3.mockapi.io/todos';
    final uri = Uri.parse(url);
    final res = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return res.statusCode == 201;
  }
}
