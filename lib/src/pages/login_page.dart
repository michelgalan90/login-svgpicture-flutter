import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app_2/src/widgets/my_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNode = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _submit() async{
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      print('correo correcto');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('wasLogin', true);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains('@')) {
      _email = email;
      return null;
    } else {
      return 'invalid email';
    }
  }

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 4) {
      _password = password;
      return null;
    } else {
      return 'invalid password';
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    final Size size = media.size;

    final EdgeInsets padding = media.padding;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Container(
              height: size.height - padding.top - padding.bottom,
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
                    width: 300,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'correo@example.com',
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: Container(
                                width: 70,
                                height: 40,
                                padding: EdgeInsets.all(10),
                                child:
                                    SvgPicture.asset('assets/icons/email.svg'),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              print(value);
                              // _focusNode.nextFocus();
                            },
                            validator: _validateEmail,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '***********',
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: Container(
                                width: 70,
                                height: 40,
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    'assets/icons/password.svg'),
                              ),
                            ),
                            obscureText: true,
                            focusNode: _focusNode,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (String password) {
                              print(password);
                              _submit();
                            },
                            validator: _validatePassword,
                          ),
                          SizedBox(height: 20),
                          MyBtn(
                            label: 'INGRESAR',
                            fullWidth: true,
                            onPressed: _submit,
                            backgroundColor: Color(0xFF2042FF),
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 30),
                          Text('O inicia con'),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyBtn(
                                  label: 'FACEBOOK',
                                  fullWidth: true,
                                  onPressed: () {},
                                  backgroundColor: Color(0xFF1E88E5),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 18),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: MyBtn(
                                  label: 'GOOGLE',
                                  fullWidth: true,
                                  onPressed: () {},
                                  backgroundColor: Color(0xFFFF4081),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
