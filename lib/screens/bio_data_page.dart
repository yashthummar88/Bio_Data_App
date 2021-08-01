import 'dart:io';

import 'package:biodata/models/my_data.dart';
import 'package:biodata/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BioDataPage extends StatefulWidget {
  const BioDataPage({Key key}) : super(key: key);

  @override
  _BioDataPageState createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage> {
  pw.Widget textLineTitle({String title}) {
    return pw.Text(
      title,
      style: pw.TextStyle(
          decoration: pw.TextDecoration.underline,
          fontSize: 26,
          fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget textLine({String title, String text}) {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(title,
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 2),
            pw.Container(
              width: 160,
              child: pw.Text(
                text,
                style: pw.TextStyle(
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }

  pw.Widget textLine2({String title, String text}) {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(title,
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 2),
            pw.Container(
              child: pw.Text(
                text,
                style: pw.TextStyle(
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }

  final pdf = pw.Document();
  MyData data = MyData();
  Future<void> generatePdf() async {
    final image = pw.MemoryImage(
      File(ProfileImageData.image.path).readAsBytesSync(),
    );
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            width: double.infinity,
            margin: pw.EdgeInsets.only(top: 5, left: 5, right: 10),
            padding: pw.EdgeInsets.only(top: 20, left: 10, bottom: 20),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 2),
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                textLineTitle(title: ProfileImageData.fullName),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        textLine2(
                            title: "Date of Birth : ",
                            text: PersonalInfoData.dob),
                        textLine2(
                            title: "Native place : ",
                            text: PersonalInfoData.nativeName),
                        textLine2(
                            title: "Height : ", text: PersonalInfoData.height),
                        textLine2(
                            title: "Weight : ",
                            text: "${PersonalInfoData.weight} kg"),
                        textLine2(
                            title: "Contact number : ",
                            text: PersonalInfoData.number),
                      ],
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.only(right: 10),
                      height: 105,
                      width: 90,
                      child: pw.Image(image, fit: pw.BoxFit.cover),
                    ),
                  ],
                ),
                textLine(title: "Cast : ", text: PersonalInfoData.cast),
                textLine(title: "Address : ", text: PersonalInfoData.address),
                textLine(title: "Hobbies : ", text: PersonalInfoData.hobbies),
                pw.SizedBox(height: 30),
                textLineTitle(title: "Education"),
                pw.SizedBox(height: 10),
                textLine(
                    title: "Graduate : ", text: PersonalInfoData.education),
                pw.SizedBox(height: 30),
                textLineTitle(title: "Family Details"),
                pw.SizedBox(height: 10),
                textLine(
                    title: "Father name : ", text: PersonalInfoData.fatherName),
                textLine(
                    title: "Mother name : ", text: PersonalInfoData.motherName),
                pw.SizedBox(height: 30),
                textLineTitle(title: "Maternal Details"),
                pw.SizedBox(height: 10),
                textLine(
                    title: "Maternal Uncle name : ",
                    text: PersonalInfoData.uncleName),
                textLine(
                    title: "Maternal Place: ", text: PersonalInfoData.place),
              ],
            ),
          );
        }));

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/example.pdf';
    print(path);
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save(), flush: true);
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Your Bio-Data"),
        actions: [
          IconButton(
              icon: Icon(Icons.download_sharp),
              onPressed: () {
                setState(() {
                  generatePdf();
                });
              })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 5, left: 5, right: 10),
              padding: EdgeInsets.only(top: 20, left: 10, bottom: 20),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textLineTitle1(title: ProfileImageData.fullName),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textLine21(
                              title: "Date of Birth : ",
                              text: PersonalInfoData.dob),
                          textLine21(
                              title: "Native place : ",
                              text: PersonalInfoData.nativeName),
                          textLine21(
                              title: "Height : ",
                              text: PersonalInfoData.height),
                          textLine21(
                              title: "Weight : ",
                              text: "${PersonalInfoData.weight} kg"),
                          textLine21(
                              title: "Contact number : ",
                              text: PersonalInfoData.number),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 105,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: (ProfileImageData.image == null)
                                  ? NetworkImage(
                                      'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg')
                                  : FileImage(
                                      File(ProfileImageData.image.path)),
                            )),
                      ),
                    ],
                  ),
                  textLine1(title: "Cast : ", text: PersonalInfoData.cast),
                  textLine1(
                      title: "Address : ", text: PersonalInfoData.address),
                  textLine1(
                      title: "Hobbies : ", text: PersonalInfoData.hobbies),
                  SizedBox(height: 30),
                  textLineTitle1(title: "Education"),
                  SizedBox(height: 10),
                  textLine1(
                      title: "Graduate : ", text: PersonalInfoData.education),
                  SizedBox(height: 30),
                  textLineTitle1(title: "Family Details"),
                  SizedBox(height: 10),
                  textLine1(
                      title: "Father name : ",
                      text: PersonalInfoData.fatherName),
                  textLine1(
                      title: "Mother name : ",
                      text: PersonalInfoData.motherName),
                  SizedBox(height: 30),
                  textLineTitle1(title: "Maternal Details"),
                  SizedBox(height: 10),
                  textLine1(
                      title: "Maternal Uncle name : ",
                      text: PersonalInfoData.uncleName),
                  textLine1(
                      title: "Maternal Place: ", text: PersonalInfoData.place),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
