import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_veggielist_app/controller/auth_controller.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_veggielist_app/screen/tab.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color mainColor = Color(0xFFF0B690);

class _SignUpPageState extends State<SignUpPage> {
  PickedFile imageFile;
  final ImagePicker _picker = ImagePicker();
  final _formKey = new GlobalKey<FormState>();
  var _name = '';
  var _email = '';
  var _password = '';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final SignUpController authController = Get.put(SignUpController());
  void _submit() {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });

    // Log user in
    authController.signUp(_name, _email, _password, imageFile.path);
    //_nameController.text, _emailController.text,
    // _passwordController.text, _imageFile.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                            child: imageFile == null
                                ? CircleAvatar(
                                    radius: size.width * 0.14,
                                    backgroundColor: Colors.black26.withOpacity(
                                      0.2,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.userAstronaut,
                                      color: kWhite,
                                      size: size.width * 0.1,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: size.width * 0.14,
                                    backgroundImage:
                                        FileImage(File(imageFile.path))),
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
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.camera,
                              color: kWhite,
                            ),
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
                        FontAwesomeIcons.userAstronaut,
                        '프로필명',
                        TextInputType.name,
                        TextInputAction.next,
                      ),
                      textEmailInputField(
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
                      passwordConfirmInput(
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
                              // Get.back();
                              Get.to(TabPage());
                            },
                            child: Text(
                              '로그인',
                              style: kBodyText.copyWith(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
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
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
      ),
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
            "프로필 이미지를 골라주세요.",
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
              label: Text("카메라"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("갤러리"),
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
      imageFile = pickedFile;
    });
    print(imageFile.path);
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
          child: TextFormField(
              controller: nameController,
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
              validator: (value) {
                if (value.isEmpty) {
                  return '닉네임을 입력해 주세요.';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              }),
        ),
      ),
    );
  }

  Widget textEmailInputField(final IconData icon, final String hint,
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
          child: TextFormField(
            controller: emailController,
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
            validator: (value) {
              if (value.isEmpty || !value.contains('@')) {
                return '유효한 이메일 형식이 아닙니다.';
              }
              return null;
            },
            onSaved: (value) {
              _email = value;
            },
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
          child: TextFormField(
            controller: passwordController,
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
            validator: (value) {
              if (value.isEmpty || value.length < 6) {
                return '비밀번호를 6자리 이상으로 설정해주세요.';
              }
              return null;
            },
            onSaved: (value) {
              _password = value;
            },
          ),
        ),
      ),
    );
  }

  Widget passwordConfirmInput(
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
          child: TextFormField(
            controller: passwordConfirmController,
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
            validator: (value) {
              if (value != passwordController.text) {
                return '비밀번호가 일치하지 않습니다.';
              }
              return null;
            },
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
        onPressed: _submit,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
