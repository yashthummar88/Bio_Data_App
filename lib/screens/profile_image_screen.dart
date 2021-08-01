import 'dart:io';

import 'package:biodata/models/my_data.dart';
import 'package:biodata/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicturePage extends StatefulWidget {
  const ProfilePicturePage({Key key}) : super(key: key);

  @override
  _ProfilePicturePageState createState() => _ProfilePicturePageState();
}

class _ProfilePicturePageState extends State<ProfilePicturePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  MyData data = MyData();

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      (pickedFile != null)
          ? data.image = File(pickedFile.path)
          : print("No Image Selected");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Bio-Data Creator",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  data.image = null;
                  data.fullName = null;
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 75),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        getImage();
                      },
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: (data.image == null)
                            ? NetworkImage(
                                'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg')
                            : FileImage(File(data.image.path)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _nameController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please Enter your name.... ";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        data.fullName = val;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Full name"),
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Expanded(flex: 3, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        if (data.image != null) {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            ProfileImageData(data.fullName, data.image);
                            Navigator.of(context).pushNamed("personal_info");
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Plese Select Photo from your device",
                              ),
                              action: SnackBarAction(
                                label: "DISMISS",
                                onPressed: () {},
                              ),
                            ),
                          );
                        }
                      },
                      child: button(
                          backColor: Colors.blue,
                          textColor: Colors.white,
                          title: "NEXT"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
