import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _obsecureForgotPassword = true;
  bool _obsecureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot Password",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "Please enter new password and confirm it",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset('assets/images/login.png', height: 150, width: 150),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "New Password",
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF6200EE),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                // TAMPILAN UNTUK INPUT NEW PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _obsecureForgotPassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(0xFF6200EE),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: 'Enter your new password',
                      hintStyle: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obsecureForgotPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF6200EE),
                        ),
                        onPressed: () => setState(
                          () => _obsecureForgotPassword =
                              !_obsecureForgotPassword,
                        ),
                      ),
                    ),
                    validator: (value) {
                      // Validasi input password
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
                // TAMPILAN UNTUK INPUT CONFIRM PASSWORD
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Confirm Password",
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF6200EE),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _obsecureConfirmPassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(0xFF6200EE),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: 'Repeat your password',
                      hintStyle: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obsecureConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF6200EE),
                        ),
                        onPressed: () => setState(
                          () => _obsecureConfirmPassword =
                              !_obsecureConfirmPassword,
                        ),
                      ),
                    ),
                    // Menghubungkan input password ke variabel password
                    validator: (value) {
                      // Validasi input password
                      if (value == null || value.isEmpty) {
                        return 'Repeat your new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      // Add more validation logic if needed
                      return null;
                    },
                  ),
                ),
                // TOMBOL UNTUK CONFIRM
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    // Proses login
                    onPressed: () {
                      // ignore: avoid_print
                      print("berhasil");
                      // if (_formKey.currentState!.validate()) {
                      //   // If the form is valid, proceed with login
                      //   await _authController.signInUsers(
                      //     context: context,
                      //     email: email,
                      //     password: password,
                      //   );
                      // }
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
                      'Confirm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
