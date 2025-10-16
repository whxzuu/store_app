import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/views/screens/authentication_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  // final AuthController _authController = AuthController();
  // late String email;
  // late String fullName;
  // late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login your Account",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'To Explore the world exclusive products here',
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/images/login.png', height: 150, width: 150),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                // Tampilan untuk input email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: const Color(0xFF6200EE),
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xFF6200EE),
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: 'Enter your email address',
                      hintStyle: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF6200EE),
                      ),
                    ),
                    // onChanged: (value) {
                    //   email = value;
                    // },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email address with @ domain';
                      }
                      // Add more validation logic if needed
                      return null;
                    },
                  ),
                ),
                // Tampilan untuk input Full Name and Password
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                // Tampilan untuk input password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscurePassword,
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: const Color(0xFF6200EE),
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xFF6200EE),
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF6200EE),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF6200EE),
                        ),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    // onChanged: (value) {
                    //   password = value;
                    // },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      // Add more validation logic if needed
                      return null;
                    },
                  ),
                ),
                // Tombol untuk login
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      // Proses login
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // await _authController.signUpUsers(
                          //   context: context,
                          //   email: email,
                          //   fullName: fullName,
                          //   password: password,
                          // );
                          // print(email);
                          // print(fullName);
                          // print(password);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6200EE),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        textStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to registration screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6200EE),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
