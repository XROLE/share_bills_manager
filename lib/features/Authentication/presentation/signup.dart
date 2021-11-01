import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_bloc.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_event.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_states.dart';
import 'package:shared_bills_manager/features/home/presentation/index.dart';
import 'package:shared_bills_manager/injection_container.dart';
import 'package:shared_bills_manager/utils/validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  String? _confirmPassword;

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  Widget socialMediaAuthBuilder({String image = ''}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        width: 130,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ));
  }

  Widget _buildCustomTextField({
    String name = '',
    bool showCheck = false,
    void Function(String)? onChange,
  }) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.4)))),
      child: TextFormField(
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
        decoration: InputDecoration(
          labelText: name,
          suffixIcon: showCheck
              ? Icon(
                  Icons.check,
                  color: Colors.white.withOpacity(0.4),
                )
              : null,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          border: InputBorder.none,
        ),
        onChanged: onChange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider<SignUpBloc>(
          create: (_) => sl<SignUpBloc>(),
          child: BlocBuilder<SignUpBloc, SignUpState>(builder: (innerContext, state) {
            print('This is the state =================> $state');

            return Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Color.fromRGBO(31, 31, 31, 1),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(height: 100, child: Image.asset('assets/img/logo.png')),
                  Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        child: Text(
                          'Shared Bills',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                  ),
                  SizedBox(height: 50),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Sign up with one of the following',
                          style: TextStyle(color: Colors.white.withOpacity(0.7)))),
                  SizedBox(height: 20),
                  Container(
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          socialMediaAuthBuilder(image: 'assets/img/google.png'),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: 'assets/img/twitter.png'),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: 'assets/img/facebook.png'),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: 'assets/img/apple.png'),
                        ],
                      )),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildCustomTextField(
                              name: 'Email',
                              showCheck: _isEmailValid,
                              onChange: (email) {
                                String? _errorString = Validator.validateEmail(email);
                                if (_errorString == null) {
                                  setState(() {
                                    _isEmailValid = true;
                                  });
                                } else {
                                  _isEmailValid = false;
                                }

                                setState(() {
                                  _email = email;
                                });
                              }),
                          SizedBox(height: 10),
                          _buildCustomTextField(
                              name: 'Password',
                              showCheck: _isPasswordValid,
                              onChange: (password) {
                                String? _errorString = Validator.validatePassword(password);
                                if (_errorString == null) {
                                  _isPasswordValid = true;
                                } else {
                                  _isPasswordValid = false;
                                }
                                setState(() {
                                  _password = password;
                                  _isConfirmPasswordValid = false;
                                });
                              }),
                          SizedBox(height: 10),
                          _buildCustomTextField(
                              name: 'Confirm Password',
                              showCheck: _isConfirmPasswordValid,
                              onChange: (confirmPassword) {
                                if (_password == confirmPassword) {
                                  setState(() {
                                    _isConfirmPasswordValid = true;
                                  });
                                } else {
                                  _isConfirmPasswordValid = false;
                                }
                                setState(() {
                                  _confirmPassword = confirmPassword;
                                });
                              }),
                          SizedBox(height: 50),
                          InkWell(
                            onTap: () async {
                              String? _emailError = Validator.validateEmail(_email ?? '');
                              String? _passwordError = Validator.validatePassword(_password ?? '');

                              if (_emailError != null && _emailError.isNotEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(_emailError)));
                              } else if (_passwordError != null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(_passwordError)));
                              } else if (_confirmPassword != _password) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Passwords do not match')));
                              } else {
                              BlocProvider.of<SignUpBloc>(innerContext).add(
                                  SignUpWithEmailAndPassword(_email ?? '', _password ?? ''));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(75, 138, 137, 1),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'Create Account',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Already have an account? Sign In',
                        style: TextStyle(color: Colors.white.withOpacity(0.4)),
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
