import 'dart:convert';

import 'package:store_app/global_variables.dart';
import 'package:store_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/services/manage_http_response.dart';

class AuthController {

  // SIGN UP USER
  //.................................................................
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
    required String birthDate,
    required String state,
    required String city,
  }) async {
    // Your existing sign-up logic...
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: state,
        city: city,
        password: password,
        birthDate: birthDate,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'), // use the global uri variable
        body: user
            .toJson(), // convert user object to JSON string for the request body
        headers: <String, String>{
          'Content-Type':
              'application/json; chartset=UTF-8', // notify the server that the request body contains JSON data
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          // Handle successful response here
          showSnackBar(context, 'Account has been Created for you');
        },
      );
    } catch (e) {
      // Handle errors here
      // ignore: avoid_print
      print('Error signing up user: $e');
    }
  }


  // SIGN IN USER
  //.................................................................
  Future<void> signInUsers({
    required context,
    required String email,
    required String password,
  }) async {
    // Your existing sign-in logic...
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'), // use the global uri variable
        body: jsonEncode({
          'email':
              email, // Berisi Email pengguna yang akan digunakan untuk masuk dalam request body
          'password':
              password, // Berisi Kata Sandi pengguna yang akan digunakan untuk masuk dalam request body
        }),
        headers: <String, String>{
          'Content-Type':
              'application/json; chartset=UTF-8', // notify the server that the request body contains JSON data
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          // Handle successful response here
          showSnackBar(context, 'Login Success');
        },
      );
    } catch (e) {
      // Handle errors here
      // ignore: avoid_print
      print('Error signing in user: $e');
    }
  }
}
