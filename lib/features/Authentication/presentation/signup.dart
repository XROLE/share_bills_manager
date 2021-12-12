import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_bloc.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_event.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_states.dart';
import 'package:shared_bills_manager/features/home/presentation/index.dart';
import 'package:shared_bills_manager/injection_container.dart';
import 'package:shared_bills_manager/utils/constant.dart';
import 'package:shared_bills_manager/utils/modal.dart';
import 'package:shared_bills_manager/utils/toastHelper.dart';
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

  bool isSignUp = true;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;
  bool _canReloadBlocState = false;

  Widget socialMediaAuthBuilder({String image = Constants.EMPTY_MAIL_STRING}) {
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
            final state = innerContext.watch<SignUpBloc>().state;

            if (state is Loading) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                SharedBillsModalDialog.loadindModal(innerContext);
              });
            } else if (state is Loaded && _canReloadBlocState) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Navigator.pop(Get.context ?? innerContext);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              });
            } else if (state is Error && _canReloadBlocState) {
              Navigator.pop(Get.context ?? innerContext);
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                ToastHelper.showError(title: "Error", message: state.message);
              });
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Color.fromRGBO(31, 31, 31, 1),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(height: 100, child: Image.asset(ImageUrls.LOGO_IMAGE_URL)),
                  Center(
                    child: Text(
                          Constants.SHARED_BILLS,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                  ),
                  SizedBox(height: 50),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(Constants.SIGN_UP_WITH_ONE_OF_THE_FOLLOWING,
                          style: TextStyle(color: Colors.white.withOpacity(0.7)))),
                  SizedBox(height: 20),
                  Container(
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          socialMediaAuthBuilder(image: ImageUrls.GOOGLE_IMAGE_URL),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: ImageUrls.TWITTER_IMAGE_URL),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: ImageUrls.FACEBOOK_IMAGE_URL),
                          SizedBox(width: 12),
                          socialMediaAuthBuilder(image: ImageUrls.APPLE_IMAGE_URL),
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
                              name: Constants.EMAIL,
                              showCheck: _isEmailValid,
                              onChange: (email) {
                                String? _errorString = Validator.validateEmail(email);
                                if (_errorString == null) {
                                  setState(() {
                                    _canReloadBlocState = false;
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
                              name: Constants.PASSWORD,
                              showCheck: _isPasswordValid,
                              onChange: (password) {
                                String? _errorString = Validator.validatePassword(password);
                                if (_errorString == null) {
                                  setState(() {
                                    _canReloadBlocState = false;
                                    _isPasswordValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _isPasswordValid = false;
                                  });
                                }
                                if (_password != null &&
                                    _password != Constants.EMPTY_STRING &&
                                    _password == _confirmPassword) {
                                  setState(() {
                                    _isConfirmPasswordValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _isConfirmPasswordValid = false;
                                  });
                                }

                                setState(() {
                                  _password = password;
                                });
                              }),
                          SizedBox(height: 10),
                          if (isSignUp)
                            _buildCustomTextField(
                                name: Constants.CONFIRM_PASSWORD,
                                showCheck: _isConfirmPasswordValid,
                                onChange: (confirmPassword) {
                                  if (_password == confirmPassword) {
                                    setState(() {
                                      _canReloadBlocState = false;
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
                              setState(() {
                                _canReloadBlocState = true;
                              });
                              String? _emailError = Validator.validateEmail(_email ?? '');
                              String? _passwordError = Validator.validatePassword(_password ?? '');
                              if (_emailError != null && _emailError.isNotEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(_emailError)));
                                return;
                              } else if (_passwordError != null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(_passwordError)));
                                return;
                              }
                              if (isSignUp) {
                                if (_confirmPassword != _password) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(Constants.PASSWORDS_DO_NOT_MATCH)));
                                } else {
                                  BlocProvider.of<SignUpBloc>(innerContext).add(
                                      SignUpWithEmailAndPassword(_email ?? Constants.EMPTY_STRING,
                                          _password ?? Constants.EMPTY_STRING));
                                }
                              } else {
                                BlocProvider.of<SignUpBloc>(innerContext).add(
                                    SignInWithEmailAndPassword(_email ?? Constants.EMPTY_STRING,
                                        _password ?? Constants.EMPTY_STRING));
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
                                isSignUp ? Constants.CREATE_ACCOUNT : Constants.SIGN_IN,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  if (isSignUp)
                    Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSignUp = false;
                            });
                          },
                          child: Text(
                            Constants.ALREADY_HAVE_AN_ACCOUNT,
                            style: TextStyle(color: Colors.white.withOpacity(0.4)),
                          ),
                        )),
                  if (!isSignUp)
                    Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSignUp = true;
                            });
                          },
                          child: Text(
                            Constants.DONT_HAVE_AN_ACCOUNT,
                            style: TextStyle(color: Colors.white.withOpacity(0.4)),
                          ),
                        )),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
