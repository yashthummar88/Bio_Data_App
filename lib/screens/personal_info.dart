import 'package:biodata/models/my_data.dart';
import 'package:biodata/utils/utils.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2_1 = TextEditingController();
  TextEditingController controller2_2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  TextEditingController controller10 = TextEditingController();
  TextEditingController controller11 = TextEditingController();
  TextEditingController controller12 = TextEditingController();
  TextEditingController controller13 = TextEditingController();

  MyData data = MyData();
  double opacity = 0.5;
  int count = 0;
  int _currentStep = 0;
  String height;
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
        title: Text("Create Bio-Data"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                controller1.clear();
                controller2_1.clear();
                controller2_2.clear();
                controller3.clear();
                controller4.clear();
                controller5.clear();
                controller6.clear();
                controller7.clear();
                controller8.clear();
                controller9.clear();
                controller10.clear();
                controller11.clear();
                controller12.clear();
                controller13.clear();
              })
        ],
      ),
      body: Container(
        child: Stepper(
          onStepTapped: (step) {
            setState(() {
              count = 0;
              _currentStep = step;
            });
          },
          currentStep: _currentStep,
          onStepContinue: continued,
          onStepCancel: cancel,
          steps: [
            Step(
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 0 ? StepState.complete : StepState.disabled,
              title: Text("Personal Details"),
              content: Form(
                key: formKeys[0],
                child: Column(
                  children: [
                    TextFields(
                        hintText: "Date of Birthday",
                        type: TextInputType.datetime,
                        data: data.dob,
                        controller: controller1),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFields(
                              hintText: "Height(Feet)",
                              type: TextInputType.number,
                              data: data.heightFeet,
                              controller: controller2_1),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFields(
                              hintText: "Height(Inch)",
                              type: TextInputType.number,
                              data: data.heightFeet,
                              controller: controller2_2),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFields(
                        hintText: "Weight(Kg)",
                        type: TextInputType.number,
                        data: data.weight,
                        controller: controller3),
                    SizedBox(height: 10),
                    TextFields(
                        hintText: "Contact number",
                        type: TextInputType.number,
                        data: data.number,
                        controller: controller4),
                    SizedBox(height: 10),
                    TextFields(
                        hintText: "Cast",
                        type: TextInputType.text,
                        data: data.cast,
                        controller: controller5),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controller6,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Invalid Input";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        setState(() {
                          data.address = val;
                        });
                      },
                      maxLines: 4,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Address",
                          hintStyle: TextStyle(
                              fontSize: 19, color: Colors.grey.shade500)),
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 10),
                    TextFields(
                        hintText: "Education",
                        type: TextInputType.text,
                        data: data.education,
                        controller: controller7),
                    SizedBox(height: 10),
                    TextFields(
                        hintText: "Hobbies",
                        type: TextInputType.text,
                        data: data.hobbies,
                        controller: controller8),
                  ],
                ),
              ),
            ),
            Step(
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
                title: Text("Family Details"),
                content: Form(
                  key: formKeys[1],
                  child: Column(
                    children: [
                      TextFields(
                          hintText: "Father name",
                          type: TextInputType.text,
                          data: data.fatherName,
                          controller: controller9),
                      SizedBox(height: 10),
                      TextFields(
                          hintText: "Mother name",
                          type: TextInputType.text,
                          data: data.motherName,
                          controller: controller10),
                      SizedBox(height: 10),
                      TextFields(
                          hintText: "Native name",
                          type: TextInputType.text,
                          data: data.nativeName,
                          controller: controller11),
                    ],
                  ),
                )),
            Step(
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
                title: Text("Family Details"),
                content: Form(
                  key: formKeys[2],
                  child: Column(
                    children: [
                      TextFields(
                          hintText: "Maternal Uncle name",
                          type: TextInputType.text,
                          data: data.uncleName,
                          controller: controller12),
                      SizedBox(height: 10),
                      TextFields(
                          hintText: "Maternal Place",
                          type: TextInputType.text,
                          data: data.place,
                          controller: controller13),
                    ],
                  ),
                )),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: button2(
                  name: "BACK",
                  textColor: Colors.blue,
                  borderColor: Colors.blue,
                  backColor: Colors.white),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 77,
            ),
            InkWell(
              child: Opacity(
                opacity: (count >= 3) ? opacity = 1 : opacity = 0.5,
                child: button2(
                    name: "NEXT",
                    textColor: Colors.white,
                    borderColor: Colors.blue,
                    backColor: Colors.blue),
              ),
              onTap: () {
                height = "${controller2_1.text}'${controller2_2.text}\"";
                PersonalInfoData(
                  controller1.text,
                  height,
                  controller3.text,
                  controller4.text,
                  controller5.text,
                  controller6.text,
                  controller7.text,
                  controller8.text,
                  controller9.text,
                  controller10.text,
                  controller11.text,
                  controller12.text,
                  controller13.text,
                );
                Navigator.of(context).pushNamed("bio_data_page");
              },
            ),
            SizedBox(width: 15),
          ],
        ),
      ],
    );
  }

  continued() {
    _currentStep < 2
        ? setState(() {
            if (formKeys[_currentStep].currentState.validate()) {
              formKeys[_currentStep].currentState.save();
              _currentStep += 1;
              count++;
            }
          })
        : setState(() {
            count++;
          });
  }

  cancel() {
    _currentStep > 0
        ? setState(() {
            _currentStep -= 1;
          })
        : null;
  }
}
