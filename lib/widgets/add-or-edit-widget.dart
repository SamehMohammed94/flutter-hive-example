import 'package:flutter/material.dart';
import 'package:hiveExamble/models/family-model.dart';
import 'package:hiveExamble/providers/family-view-model.dart';
import 'package:hiveExamble/views/home-view.dart';
import 'package:hiveExamble/widgets/custom-formfield.dart';
import 'package:hiveExamble/widgets/page-container.dart';
import 'package:provider/provider.dart';

class AddOrEditWidget extends StatefulWidget {
  final FamilyModel familyModel;

  const AddOrEditWidget({Key key, this.familyModel}) : super(key: key);
  @override
  _AddOrEditWidgetState createState() => _AddOrEditWidgetState();
}

class _AddOrEditWidgetState extends State<AddOrEditWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _degreeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.familyModel != null) {
      _nameController = TextEditingController(text: widget.familyModel.name);
      _ageController =
          TextEditingController(text: widget.familyModel.age.toString());
      _degreeController =
          TextEditingController(text: widget.familyModel.degree);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Form",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: CustomTextField(
                      controller: _nameController,
                      // title: "title",
                      hint: "Enter a name",
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Enter name";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: CustomTextField(
                      controller: _ageController,
                      // title: "title",
                      hint: "Enter an age",
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Enter age";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: CustomTextField(
                      controller: _degreeController,
                      // title: "title",
                      hint: "Enter a degree",
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Enter degree";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Consumer<FamilyViewModel>(builder: (_, familyViewModel, __) {
                    return Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * .6,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (widget.familyModel != null) {
                              //Edit
                              familyViewModel.editFamily(
                                  widget.familyModel,
                                  FamilyModel(
                                      name: _nameController.text,
                                      age: int.parse(_ageController.text),
                                      degree: _degreeController.text));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            } else {
                              //add
                              familyViewModel.addToFamily(FamilyModel(
                                  name: _nameController.text,
                                  age: int.parse(_ageController.text),
                                  degree: _degreeController.text));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            }
                          }
                        },
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          widget.familyModel != null ? "Edit" : "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
