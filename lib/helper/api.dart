import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  // Start Get method
  Future get({required String url, String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    log('Url : $url');
    log('Token : $token');
    http.Response response = await http.get(Uri.parse(url),headers: header);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'opps There was an error, try later! ${response.statusCode}');
    }
  }

// Start post method
  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }

    log('Url : $url');
    log('Token : $token');
    log('Body : $data');

    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'Opps There was an error, try later! ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  // Start put method
  Future<Map<String, dynamic>> put({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type' : 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }

    log('Url : $url');
    log('Token : $token');
    log('Body : $data');

    http.Response response =
    await http.put(Uri.parse(url), body: data, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data['title']);
      return data;
    } else {
      throw Exception(
        'Opps There was an error, try later! ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

} // Api

/* Dio()
    try {
      http.Response response = await dio.get(url);
      log('statusCode: ${response.statusCode}');
      return response.data;
    } on DioException catch (e) {
      //final String messageError = e.response.toString();
      throw Exception('Opps There was an error, try later!');
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
*/

/*

     'Accept' : 'application/json',
   'Content-Type' : 'multipart/form-data; boundary=<calculated when request is sent>',
   'Authorization' : 'Bearer '

 */

/*
  Future add({
    required String url,
    Map<String, dynamic>? body,
    String? token,}) async {


    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response =
          await dio.post(url, data: body, queryParameters: headers);
      log('statusCode: ${response.statusCode}');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Opps There was an error, try later! $e');
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  */
