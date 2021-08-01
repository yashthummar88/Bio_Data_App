import 'package:biodata/screens/bio_data_page.dart';
import 'package:biodata/screens/personal_info.dart';
import 'package:biodata/screens/profile_image_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => ProfilePicturePage(),
        "personal_info": (context) => PersonalInfo(),
        "bio_data_page": (context) => BioDataPage(),
      },
    ),
  );
}
