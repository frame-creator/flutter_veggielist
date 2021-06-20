import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_veggielist_app/controller/auth_controller.dart';
import 'package:my_veggielist_app/screen/login_page.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color mainColor = Color(0xFFed9a4c);

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: mainColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    textInputField(
                      FontAwesomeIcons.user,
                      '프로필명',
                      TextInputType.name,
                      TextInputAction.next,
                    ),
                    textInputField(
                      FontAwesomeIcons.envelope,
                      '이메일',
                      TextInputType.emailAddress,
                      TextInputAction.next,
                    ),
                    passwordInput(
                      FontAwesomeIcons.lock,
                      '비밀번호',
                      TextInputAction.next,
                    ),
                    passwordInput(
                      FontAwesomeIcons.lock,
                      '비밀번호 재확인',
                      TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    roundedButton('회원가입'),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '계정이 있나요?  ',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            '로그인',
                            style: kBodyText.copyWith(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget backgroundImage() {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
      ),
    );
  }

  Widget textInputField(final IconData icon, final String hint,
      final TextInputType inputType, final TextInputAction inputAction) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }

  Widget passwordInput(
      final iconData, final String hint, final textInputAction) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  iconData,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
            ),
            obscureText: true,
            style: kBodyText,
            //   keyboardType: TextInputType,
            textInputAction: textInputAction,
          ),
        ),
      ),
    );
  }

  Widget roundedButton(String buttonName) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: mainColor,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/*
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('장소등록'),
    ));
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Upload',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signupcontroller = Get.put(SignUpController());
  final formKey = new GlobalKey<FormState>();

  var name = '';
  var email = '';
  var password = '';
  final _passwordController = TextEditingController();
  PickedFile _imageFile;
  Color themeColorOne = Colors.amber[400];
  //Color(0xFFD87423);
  final ImagePicker _picker = ImagePicker();
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

  Future<void> _submit() async {
    if (!formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    formKey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });
    try {
      // Log user in
      await signupcontroller.SignUp(name, email, password, _imageFile.path);
    } on HttpException catch (error) {
      const errorMessage = '';
      Get.snackbar('에러가 발생했습니다.', errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      Get.snackbar('에러가 발생했습니다.', errorMessage);
    }
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
          imageProfile(),
          SizedBox(height: 25.0),
          TextFormField(
            decoration: InputDecoration(
                labelText: '프로필명',
                labelStyle: TextStyle(
                    fontFamily: 'Trueno',
                    fontSize: 20.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: themeColorOne),
                )),
            onSaved: (value) {
              this.name = value;
            },
            //    validator: (value) => value.isEmpty ? '프로필명을 입력해주세요.' : ''),
          ),
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
            //  onChanged: (value) {
            //    this.email = value;
            //  },
            //  validator: (value) =>
            //      value.isEmpty ? '이메일 주소를 입력해주세요.' : validateEmail(value)),
            validator: (value) {
              if (value.isEmpty || !value.contains('@')) {
                return '이메일주소를 입력해주세요.';
              }
              validateEmail(value);
              return null;
            },
            keyboardType: TextInputType.emailAddress,

            onSaved: (value) {
              this.email = value;
            },
          ),
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
              controller: _passwordController,
              onSaved: (value) {
                this.password = value;
              },
              validator: (value) => value.isEmpty ? '비밀번호를 입력해주세요.' : null),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '비밀번호 재확인',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 20.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: themeColorOne),
                  )),
              obscureText: true,
              validator: (value) => value != _passwordController.text
                  ? '비밀번호를 동일하게 입력해주세요.'
                  : null),
          SizedBox(height: 5.0),
          SizedBox(height: 50.0),
          GestureDetector(
            //  behavior: HitTestBehavior.translucent,
            onTap: () {
              _submit();
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: themeColorOne,
                    elevation: 7.0,
                    child: Center(
                        child: Text('회원가입',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('계정이 있나요?'),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text('로그인',
                    style: TextStyle(
                        color: themeColorOne,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 70.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/icons/base.png")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 10.0,
          right: 30.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white70,
              size: 50.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
*/
