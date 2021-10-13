import 'package:flutter/material.dart';
import 'package:shared_bills_manager/features/home/presentation/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _email;
  String? _password;
  String? _confirmPassword;

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

  Widget _buildCustomTextField(
      {String name = '', bool showCheck = false, void Function(String)? onChange}) {
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
          onChanged: onChange),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
                  child: Column(
                    children: [
                      _buildCustomTextField(
                          name: 'Email',
                          showCheck: _email != null && _email != '',
                          onChange: (email) {
                            setState(() {
                              _email = email;
                            });
                          }),
                      SizedBox(height: 10),
                      _buildCustomTextField(
                          name: 'Password',
                          showCheck: _password != null && _password != '',
                          onChange: (password) {
                            setState(() {
                              _password = password;
                            });
                          }),
                      SizedBox(height: 10),
                      _buildCustomTextField(
                          name: 'Confirm Password',
                          showCheck: _confirmPassword != null && _confirmPassword != '',
                          onChange: (confirmPassword) {
                            setState(() {
                              _confirmPassword = confirmPassword;
                            });
                          }),
                          SizedBox(height: 50),
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                            color: Color.fromRGBO(75, 138, 137, 1),
                              borderRadius: 
                            BorderRadius.circular(8)),
                            child: Text('Create Account', style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                    ],
                  ),
                ),
              )
            ,
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerRight,
              child: Text('Already have an account? Sign In', style: TextStyle(color: Colors.white.withOpacity(0.4)),))
            ],
          ),
        ),
      ),
    );
  }
}
