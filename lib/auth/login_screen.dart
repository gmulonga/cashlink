import 'package:cashlink/config/constants.dart';
import 'package:cashlink/screens/bottom_nav.dart';
import 'package:cashlink/screens/homepage.dart';
import 'package:cashlink/widgets/custom_button.dart';
import 'package:cashlink/widgets/custom_input.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  String userIp = '';
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isAvailable = false;

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  Future<void> _login() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // Logo
                  Center(
                    child: Hero(
                      tag: "logo",
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        height: 180,
                        width: 200,
                      ),
                    ),
                  ),

                  Text(
                    'Welcome to CashLink',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Join your community in saving, lending\n'
                        'and growing together.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  Form(
                    key: _loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InputField(
                          hintText: 'Phone number',
                          prefixIcon: Icons.phone,
                          controller: _phoneNumberController,
                          isRequired: true,
                          integerOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "This filed is required";
                            }
                            return null;
                          },
                        ),

                        InputField(
                          hintText: 'Enter your password',
                          prefixIcon: Icons.lock_outline,
                          password: true,
                          controller: _passwordController,
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: kPrimary, fontSize: 16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                callBackFunction: _login,
                                label: "Login",
                                backgroundColor: kPrimary,
                                txtColor: kWhite,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        // Terms text
                        Text.rich(
                          TextSpan(
                            text: 'By signing up, you agree to our ',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                            children: [
                              TextSpan(
                                text: 'Terms of service',
                                style: TextStyle(
                                  color: kPrimary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kPrimary,
                                ),
                              ),
                              const TextSpan(text: '\nand '),
                              TextSpan(
                                text: 'Privacy policy',
                                style: TextStyle(
                                  color: kPrimary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kPrimary,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}