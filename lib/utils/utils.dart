import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFields extends StatefulWidget {
  String hintText;
  TextInputType type;
  String data;
  TextEditingController controller;
  TextFields({this.hintText, this.type, this.data, this.controller});
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) {
        if (val.isEmpty) {
          return "Invalid Input";
        }
        return null;
      },
      onSaved: (val) {
        setState(() {
          widget.data = val;
          print("OnSaved := ${widget.data}");
        });
      },
      keyboardType: widget.type,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 19, color: Colors.grey.shade500)),
      style: TextStyle(fontSize: 19),
    );
    ;
  }
}

Widget button({String title, Color backColor, Color textColor}) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    decoration: BoxDecoration(
        color: backColor, borderRadius: BorderRadius.circular(20)),
    child: Text(
      title,
      style: TextStyle(fontSize: 23, color: textColor),
    ),
  );
}

Widget button2(
    {String name, Color textColor, Color backColor, Color borderColor}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backColor,
        border: Border.all(color: borderColor)),
    child: Text(
      name,
      style: TextStyle(fontSize: 25, color: textColor),
    ),
  );
}

Widget textLineTitle1({String title}) {
  return Text(
    title,
    style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 26,
        fontWeight: FontWeight.bold),
  );
}

Widget textLine1({String title, String text}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          SizedBox(width: 2),
          Container(
            width: 160,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 3),
    ],
  );
}

Widget textLine21({String title, String text}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          SizedBox(width: 2),
          Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 3),
    ],
  );
}
