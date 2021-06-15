/*import 'package:flutter/material.dart';

class CreatePlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('장소등록'),
    ));
  }
}
*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_veggielist_app/http/NetworkHandler.dart';

class CreatePlacePage extends StatefulWidget {
  CreatePlacePage({Key key}) : super(key: key);

  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  final networkHandler = NetworkHandler();
  bool circular = false;
  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            titleTextField(),
            SizedBox(
              height: 20,
            ),
            addressTextField(),
            SizedBox(
              height: 20,
            ),
            aboutTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                if (_globalkey.currentState.validate()) {
                  Map<String, String> data = {
                    "title": _title.text,
                    "address": _address.text,
                    "about": _about.text,
                  };
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "채식 맛집 등록하기",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 100.0,
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

  Widget titleTextField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value.isEmpty) return "맛집 이름을 입력해주세요.";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber[400],
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.border_color_outlined,
          color: Colors.amber[400],
        ),
        labelText: "맛집 이름",
        helperText: "",
        hintText: "맛집 이름을 입력해 주세요.",
      ),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      controller: _address,
      validator: (value) {
        if (value.isEmpty) return "맛집 주소를 입력해 주세요.";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber[400],
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.border_color_outlined,
          color: Colors.amber[400],
        ),
        labelText: "맛집 주소",
        helperText: "",
        hintText: "맛집 주소를 입력해주세요.",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value.isEmpty) return "맛집 설명을 입력해주세요.";

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        labelText: "맛집 설명",
        helperText: "",
        hintText: "맛집 설명을 입력해 주세요.",
      ),
    );
  }
}
