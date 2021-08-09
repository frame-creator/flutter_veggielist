// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_veggielist_app/controller/create_place_controller.dart';

import 'package:my_veggielist_app/screen/user_page.dart';

class RouteCreatePlacePage extends StatefulWidget {
  @override
  _RouteCreatePlacePageState createState() => _RouteCreatePlacePageState();
}

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color mainColor = Color(0xFFF0B690);

class _RouteCreatePlacePageState extends State<RouteCreatePlacePage> {
  PickedFile imageFile;
  final ImagePicker _picker = ImagePicker();
  final _formKey = new GlobalKey<FormState>();
  var _title = '';
  var _address = '';
  var _description = '';
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  final CreatePlaceController createPlaceController =
      Get.put(CreatePlaceController());
  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    createPlaceController.createPlace(
        _title, _address, _description, imageFile.path);
    Get.to(UserPage());
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: imageFile == null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.0), //or 15.0
                                      child: Container(
                                        height: size.width * 0.4,
                                        width: size.width * 0.6,
                                        color: Colors.black26.withOpacity(
                                          0.2,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.mapMarkedAlt,
                                          color: kWhite,
                                          size: size.width * 0.1,
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.0), //or 15.0
                                      child: Container(
                                          height: size.width * 0.4,
                                          width: size.width * 0.6,
                                          child: Image.file(

                                              // FileImage(
                                              File(imageFile.path),
                                              fit: BoxFit.cover)),
                                    )),
                          //      CircleAvatar(
                          //          radius: size.width * 0.14,
                          //          backgroundImage:
                          //              FileImage(File(imageFile.path))),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.15,
                        left: size.width * 0.65,
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
                      ),
                      Positioned(
                        top: 15,
                        left: 15,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.black87.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: kWhite, width: 2),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
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
                      titleInputField(
                        FontAwesomeIcons.edit,
                        '맛집 이름',
                        TextInputType.name,
                        TextInputAction.next,
                      ),
                      addressInputField(
                        FontAwesomeIcons.mapMarkerAlt,
                        '맛집 주소',
                        TextInputType.text,
                        TextInputAction.next,
                      ),
                      descriptionInputField(
                        FontAwesomeIcons.pencilAlt,
                        '맛집 설명',
                        TextInputType.multiline,
                        TextInputAction.next,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      roundedButton('맛집 등록하기'),
                      SizedBox(
                        height: 30,
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
            "맛집 이미지를 골라주세요.",
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

  Widget titleInputField(final IconData icon, final String hint,
      final TextInputType inputType, final TextInputAction inputAction) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            controller: titleController,
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
                return '맛집 이름을 입력해주세요.';
              }
              return null;
            },
            onSaved: (value) {
              _title = value;
            },
          ),
        ),
      ),
    );
  }

  Widget addressInputField(final IconData icon, final String hint,
      final TextInputType inputType, final TextInputAction inputAction) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            controller: addressController,
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
                return '맛집 주소를 입력해주세요.';
              }
              return null;
            },
            onSaved: (value) {
              _address = value;
            },
          ),
        ),
      ),
    );
  }

  Widget descriptionInputField(final IconData icon, final String hint,
      final TextInputType inputType, final TextInputAction inputAction) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          controller: descriptionController,
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
          maxLines: 5,
          validator: (value) {
            if (value.isEmpty) {
              return '맛집 설명을 입력해주세요.';
            }
            return null;
          },
          onSaved: (value) {
            _description = value;
          },
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
