import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response, // the HTTP response to be managed
  required BuildContext context, // the context in which this function is called
  required VoidCallback
  onSuccess, // callback function to be executed on successful response
}) {
  // switch statement to handle different http status codes
  switch (response.statusCode) {
    case 200:
      // If the server returns an OK response, execute the onSuccess callback
      onSuccess();
      break;
    case 400:
      // Handle bad request
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    // case 401:
    //   // Handle unauthorized access
    //   showSnackBar(context, json.decode(response.body)['msg']);
    //   break;
    // case 403:
    //   // Handle forbidden access
    //   showSnackBar(context, json.decode(response.body)['msg']);
    //   break;
    // case 404:
    //   // Handle not found
    //   showSnackBar(context, json.decode(response.body)['msg']);
    //   break;
    case 500:
      // Handle server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    default:
      // Handle other status codes
      debugPrint(
        'Unexpected status code: ${response.statusCode}, Body: ${response.body}',
      );
  }
}

void showSnackBar (BuildContext context, String tittle) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(tittle)));
}
// For example, you might want to check the status code and handle errors accordingly