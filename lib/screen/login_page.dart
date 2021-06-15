/*import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('로그인페이지'),
    ));
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_veggielist_app/screen/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  Color themeColorOne = Colors.amber[400];
  //Color(0xFFD87423);

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return '이메일 형식에 맞지 않습니다.';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 40.0)),
                  Positioned(
                      top: 50.0,
                      child: Text('베지리스트',
                          style:
                              TextStyle(fontFamily: 'Trueno', fontSize: 40.0))),
                  Positioned(
                      top: 97.0,
                      left: 200.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: themeColorOne))),
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '이메일',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 20.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: themeColorOne),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? '이메일 주소를 입력해주세요.' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '비밀번호',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 20.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: themeColorOne),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) => value.isEmpty ? '비밀번호를 입력해주세요.' : null),
          SizedBox(height: 5.0),
          SizedBox(height: 50.0),
          GestureDetector(
            //  behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: themeColorOne,
                    elevation: 7.0,
                    child: Center(
                        child: Text('로그인',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('계정을 만드시겠어요?'),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Get.to(SignUpPage());
                },
                child: Text('회원가입',
                    style: TextStyle(
                        color: themeColorOne,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }
}
