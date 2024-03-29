import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wicka/logic/base/HttpResponse.dart';
import 'package:wicka/logic/firebase/Auth.dart';
import 'package:http/http.dart' as http;

class BaseRouteAPI {
  final String baseUrl = 'http://10.20.250.44:3000/';
  // final String baseUrl = 'http://192.168.0.145:3000/';
  String apiName;

  @protected
  Future<HttpResponse> getData(String urlEnd,
      {Map<String, String> headers}) async {
    await Auth().checkExpiredDateToken();
    final response = await http.get(Uri.parse('${this._getUrl()}$urlEnd'),
        headers: this.getHeaders(headers));
    return this.handleResponse(response);
  }

  Future<HttpResponse> deleteData(String urlEnd,
      {Map<String, String> headers}) async {
    await Auth().checkExpiredDateToken();
    final response = await http.delete(Uri.parse('${this._getUrl()}$urlEnd'),
        headers: this.getHeaders(headers));
    return this.handleResponse(response);
  }

  Future<HttpResponse> postData(String urlEnd,
      {Map<String, String> headers, dynamic bodyData}) async {
    try {
      await Auth().checkExpiredDateToken();
      final response = await http.post(Uri.parse('${this._getUrl()}$urlEnd'),
          headers: this.getHeaders(headers), body: bodyData);
      return this.handleResponse(response);
    } on TimeoutException catch (_) {
      return this.badResponse();
    } on Exception catch (error) {
      print(error);
      return this.badResponse();
    }
  }

  Future<HttpResponse> putData(String urlEnd,
      {Map<String, String> headers, dynamic bodyData}) async {
    await Auth().checkExpiredDateToken();
    final response = await http.put(Uri.parse('${this._getUrl()}$urlEnd'),
        headers: this.getHeaders(headers), body: bodyData);
    return this.handleResponse(response);
  }

  HttpResponse handleResponse(http.Response response) {
    HttpResponse httpResponse = HttpResponse();
    httpResponse.statusCode = response.statusCode;
    httpResponse.result = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      httpResponse.success = true;
    } else {
      httpResponse.success = false;
      httpResponse.message = 'Algo salió mal en el proceso';
    }
    return httpResponse;
  }

  HttpResponse badResponse() {
    HttpResponse httpResponse = HttpResponse();
    httpResponse.statusCode = 0;
    httpResponse.success = false;
    httpResponse.result = "Timeout Connection";
    return httpResponse;
  }

  String _getUrl() {
    return '$baseUrl$apiName/';
  }

  Map<String, String> getHeaders(Map<String, String> anotherHeaders) {
    Map<String, String> headersMap = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (anotherHeaders != null) {
      headersMap.addAll(anotherHeaders);
    }
    return headersMap;
  }
}
