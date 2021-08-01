import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImageData {
  static String fullName;
  static File image;
  ProfileImageData(String fullName, File image) {
    ProfileImageData.fullName = fullName;
    ProfileImageData.image = image;
  }
}

class PersonalInfoData {
  static String dob;
  static String height;
  static String weight;
  static String number;
  static String cast;
  static String address;
  static String education;
  static String hobbies;
  static String fatherName;
  static String motherName;
  static String nativeName;
  static String uncleName;
  static String place;
  PersonalInfoData(
      String dob,
      String height,
      String weight,
      String number,
      String cast,
      String address,
      String education,
      String hobbies,
      String fatherName,
      String motherName,
      String nativeName,
      String uncleName,
      String place) {
    PersonalInfoData.dob = dob;
    PersonalInfoData.height = height;
    PersonalInfoData.weight = weight;
    PersonalInfoData.number = number;
    PersonalInfoData.cast = cast;
    PersonalInfoData.address = address;
    PersonalInfoData.education = education;
    PersonalInfoData.hobbies = hobbies;
    PersonalInfoData.fatherName = fatherName;
    PersonalInfoData.motherName = motherName;
    PersonalInfoData.nativeName = nativeName;
    PersonalInfoData.uncleName = uncleName;
    PersonalInfoData.place = place;
  }
}

class MyData {
  String fullName = "";
  File image;
  String dob = "";
  String heightFeet = "";
  String heightInch = "";
  String weight = "";
  String number = "";
  String cast = "";
  String address = "";
  String education = "";
  String hobbies = "";
  String fatherName = "";
  String motherName = "";
  String nativeName = "";
  String uncleName = "";
  String place = "";
}
