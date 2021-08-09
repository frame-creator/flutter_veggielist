import 'dart:async';
import 'dart:ui';
//import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

//import 'package:path_provider/path_provider.dart';

class MailerPage extends StatefulWidget {
  @override
  _MailerPageState createState() => new _MailerPageState();
}

class _MailerPageState extends State<MailerPage> {
  static const TextStyle kBodyText =
      TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

  static const Color kWhite = Colors.white;
  static const Color mainColor = Color(0xFFF0B690);
  List<String> attachment = <String>[];
  final TextEditingController _subjectController =
      TextEditingController(text: '제목을 입력해주세요.');
  final TextEditingController _bodyController =
      TextEditingController(text: ''' 문의하실 내용을 입력해주세요.
  ''');
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> send() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    final MailOptions mailOptions = MailOptions(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: <String>['veggielistcontact@gmail.com'],
      isHTML: true,
      // bccRecipients: ['other@example.com'],
      // ccRecipients: <String>['third@example.com'],
      attachments: attachment,
    );

    String platformResponse;

    try {
      await FlutterMailer.send(mailOptions);
      platformResponse = '';
    } on PlatformException catch (error) {
      platformResponse = error.toString();
      print(error);
      if (!mounted) {
        return;
      }
      await showDialog<void>(
          context: _scafoldKey.currentContext,
          builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Message',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(error.message),
                  ],
                ),
                contentPadding: const EdgeInsets.all(26),
                title: Text(error.code),
              ));
    } catch (error) {
      platformResponse = error.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }
    // ignore: deprecated_member_use
    _scafoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
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
              key: _scafoldKey,
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 25,
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
                  ),
                  Column(children: [
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: ImageIcon(
                                  AssetImage("assets/icons/base.png"),
                                  size: 40,
                                  color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('베지리스트',
                                style: TextStyle(
                                    fontFamily: 'IBMPlexSansKR-Bold',
                                    fontSize: 35.0,
                                    color: Colors.white)),
                          ),
                        ]),
                  ]),
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.width * 0.3,
                      ),
                      titleInputField(
                        FontAwesomeIcons.edit,
                        '문의 제목',
                        TextInputType.name,
                        TextInputAction.next,
                      ),
                      descriptionInputField(
                        FontAwesomeIcons.pencilAlt,
                        '문의 내용',
                        TextInputType.multiline,
                        TextInputAction.next,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      roundedButton('문의하기'),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text('veggielistcontact@gmail.com',
                              style: TextStyle(
                                  fontFamily: 'IBMPlexSansKR-Bold',
                                  fontSize: 22.0,
                                  color: Colors.white)))
                    ],
                  ))
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
            image: AssetImage('assets/images/6.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
      ),
    );
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
            controller: _subjectController,
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
                return '제목을 입력해주세요.';
              }
              return null;
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
          controller: _bodyController,
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
              return '문의 내용을 입력해주세요.';
            }
            return null;
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
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: send,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}      
        /*
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child:
                //  Padding(
                //    padding: const EdgeInsets.all(8.0),
                //    child:
                Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                      height: 143.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xffFCE183), Color(0xffFF7375)]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(75.0)),
                          color:
                              //Color(0xFFFE8A7E)
                              Colors.red[200])),

                  Column(
                    children: <Widget>[
                      SizedBox(height: 20),

                      //  AnimatedText(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 250,
                          top: 50,
                        ),
                        child: Text('문의하기',
                            style: TextStyle(
                                fontFamily: 'Cute',
                                fontSize: 50.0,
                                color: Colors.white)),
                      ),

                      //   CarouseWithIndicator(),
                      //   SizedBox(
                      //      height: 95
                      //   ),
                    ],
                  ),

                  //   CarouseWithIndicator(),
                  //   SizedBox(
                  //      height: 95
                  //   ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.0, top: 40.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12
                                      //Color(0xFFA4B2AE)
                                      ),
                                  child: Center(
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 15.0, color: Colors.white)))))),
                ]),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _subjectController,
                    style: TextStyle(
                        fontFamily: 'Cute',
                        fontSize: 30.0,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '문의내용 제목',
                      labelStyle: TextStyle(
                          fontFamily: 'Cute',
                          fontSize: 40.0,
                          color: Color(0xffFF7375)),
                      contentPadding: EdgeInsets.all(30.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _bodyController,
                    maxLines: 5,
                    style: TextStyle(
                        fontFamily: 'Cute',
                        fontSize: 30.0,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(30.0),
                        labelText: '문의내용',
                        labelStyle: TextStyle(
                            fontFamily: 'Cute',
                            fontSize: 40.0,
                            color: Color(0xffFF7375)),
                        border: OutlineInputBorder()),
                  ),
                ),
                IconButton(
                  onPressed: send,
                  icon: const Icon(Icons.send),
                  iconSize: 46,
                  color: Colors.red[200],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/