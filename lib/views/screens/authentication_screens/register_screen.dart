import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/controllers/auth_controller.dart';
import 'package:store_app/views/screens/authentication_screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = AuthController();
  // form fields
  late String email;
  late String fullName;
  late String password;
  late String state;
  late String city;
  late String birthDate;
  bool _obscurePassword = true;
  bool _isLoading = false;

  registerUser() async {
    setState(() {
      _isLoading = true;
    });
    await _authController
        .signUpUsers(
          context: context,
          email: email,
          fullName: fullName,
          password: password,
          state: state,
          city: city,
          birthDate: birthDate,
        )
        .whenComplete(() {
          _formKey.currentState!.reset();
          setState(() {
            _isLoading = false;
          });
        });
  }

  // Daftar domain email yang diizinkan
  final List<String> allowedEmailDomains = [
    'gmail.com',
    'yahoo.com',
    'outlook.com',
    'hotmail.com',
    'icloud.com',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final email = value.trim();
    // cek format email terlebih dahulu
    if (!email.contains('@')) {
      return 'Please enter a valid email address with @ domain';
    }

    // ambil bagian domain dari email setelah '@'
    final parts = email.split('@');
    if (parts.length != 2) {
      return 'Email tidak memiliki domain';
    }

    final domain = parts.last.toLowerCase();
    // Cek apakah domain termasuk yang diizinkan
    if (!allowedEmailDomains.contains(domain)) {
      return 'Valid domain gmail.com, yahoo.com, atau hotmail.com';
    }

    return null; // valid
  }

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
                  "Register your Account",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'Please fill the input below to continue',
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: const Color(0xFF6200EE),
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                // Image.asset('assets/images/login.png', height: 100, width: 100),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Name',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                // Tampilan untuk input nama
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
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
                      hintText: 'Enter your full name',
                      hintStyle: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xFF6200EE),
                      ),
                    ),
                    onChanged: (value) {
                      fullName = value;
                    },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your name';
                    //   }
                    //   // Add more validation logic if needed
                    //   return null;
                    // },
                  ),
                ),
                // birth date input
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
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
                      hintText: 'Format (YYYY-MM-DD)',
                      hintStyle: GoogleFonts.getFont(
                        'Nunito Sans',
                        color: const Color(0xFF6200EE),
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: const Icon(
                        Icons.date_range,
                        color: Color(0xFF6200EE),
                      ),
                    ),
                    onChanged: (value) {
                      birthDate = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your birth date';
                      }
                      if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
                        return 'Please enter a valid date in Tahun-Bulan-Tanggal format';
                      }
                      // Add more validation logic if needed
                      return null;
                    },
                  ),
                ),

                // input state and city
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
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
                            hintText: 'State',
                            hintStyle: GoogleFonts.getFont(
                              'Nunito Sans',
                              color: const Color(0xFF6200EE),
                              fontSize: 14,
                              letterSpacing: 0.5,
                            ),
                            prefixIcon: const Icon(
                              Icons.map,
                              color: Color(0xFF6200EE),
                            ),
                          ),
                          onChanged: (value) {
                            state = value;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
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
                            hintText: 'City',
                            hintStyle: GoogleFonts.getFont(
                              'Nunito Sans',
                              color: const Color(0xFF6200EE),
                              fontSize: 14,
                              letterSpacing: 0.5,
                            ),
                          ),
                          onChanged: (value) {
                            city = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // input email
                const SizedBox(height: 10),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    controller: _emailController,
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
                    onChanged: (value) {
                      email = value;
                    },
                    validator: validateEmail,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your email';
                    //   }
                    //   if (!RegExp(
                    //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}"
                    //     r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
                    //   ).hasMatch(value)) {
                    //     return 'Please enter a valid email address with @ domain';
                    //   }
                    //   // Add more validation logic if needed
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(height: 10),
                // Tampilan untuk input password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: _obscurePassword,
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
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
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
                // Tombol untuk Register
                // if (MediaQuery.of(context).viewInsets.bottom == 0)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Proses Register
                        registerUser();
                      }
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
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
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Sign Up',
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
                      "Already have an account?",
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        // Navigate to login screen
                      },
                      child: const Text(
                        'Sign In',
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
