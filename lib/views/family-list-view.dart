import 'package:flutter/material.dart';
import 'package:hiveExamble/providers/family-view-model.dart';
import 'package:hiveExamble/widgets/add-or-edit-widget.dart';
import 'package:hiveExamble/widgets/confirmation-bottom-sheet.dart';
import 'package:provider/provider.dart';

class FamilyListView extends StatefulWidget {
  @override
  _FamilyListViewState createState() => _FamilyListViewState();
}

class _FamilyListViewState extends State<FamilyListView> {
  @override
  void initState() {
    Provider.of<FamilyViewModel>(context, listen: false).getFamilyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FamilyViewModel>(builder: (_, familyViewModel, __) {
      return familyViewModel.falmilyList == null
          ? Center(child: CircularProgressIndicator())
          : familyViewModel.falmilyList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Add Memeber to your family',
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(
                        Icons.emoji_people,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text(familyViewModel.falmilyList[index].name),
                      subtitle: Text(familyViewModel.falmilyList[index].degree +
                          " " +
                          familyViewModel.falmilyList[index].age.toString() +
                          " Years"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddOrEditWidget(
                                            familyModel: familyViewModel
                                                .falmilyList[index])));
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 15),
                              )),
                          InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12.0)),
                                    ),
                                    builder: (builder) {
                                      return ConfirmedBottomSheet(
                                        headerTitle: "Delete",
                                        message:
                                            "Are You sure about delete the item ?",
                                        secondButtonTitle: "",
                                        closeButtonTitle: "",
                                        secondButtonTextColor: Colors.redAccent,
                                        secondButtonAction: () {
                                          familyViewModel.deleteFamily(
                                              familyViewModel
                                                  .falmilyList[index]);
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              },
                              child: Text(
                                "Delete",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: familyViewModel.falmilyList.length);
    });
  }
}
