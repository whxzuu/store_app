import 'package:store_app/global_variables.dart';
import 'package:store_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/services/manage_http_response.dart';

class AuthController {
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
        birthDate: birthDate
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'), // use the global uri variable
        body: user
            .toJson(), // convert user object to JSON string for the request body
        headers: <String, String>{
          'Content-Type':
              'application/json; chartset=UTF-8', // specify content type as JSON
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
      // print('Error signing up user: $e');
    }
  }

  Future<void> signInUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    // Your existing sign-in logic...
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        password: password,
        birthDate: '' // Placeholder, replace with actual birth date
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'), // use the global uri variable
        body: user
            .toJson(), // convert user object to JSON string for the request body
        headers: <String, String>{
          'Content-Type':
              'application/json; chartset=UTF-8', // specify content type as JSON
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          // Handle successful response here
          showSnackBar(context, 'Login Successful');
        },
      );
    } catch (e) {
      // Handle errors here
      // print('Error signing in user: $e');
    }
  }
}
