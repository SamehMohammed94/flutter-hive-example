import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hiveExamble/models/family-model.dart';

class FamilyViewModel extends ChangeNotifier {
  List<FamilyModel> _falmilyList;
  List<FamilyModel> get falmilyList => _falmilyList;

  getFamilyData() async {
    var familyModel = await Hive.openBox<FamilyModel>('familyModel');
    _falmilyList = familyModel.values.toList();
    notifyListeners();
  }

  addToFamily(FamilyModel value) async {
    var familyModel = await Hive.openBox<FamilyModel>('familyModel');
    familyModel.add(value);
    getFamilyData();
    notifyListeners();
  }

  editFamily(FamilyModel oldValue, FamilyModel newValue) async {
    var familyModel = await Hive.openBox<FamilyModel>('familyModel');
    var index = familyModel.values.toList().indexWhere((element) =>
        element.age == oldValue.age &&
        element.name == oldValue.name &&
        element.degree == oldValue.degree);
    familyModel.putAt(index, newValue);
    getFamilyData();
    notifyListeners();
  }

  deleteFamily(FamilyModel oldValue) async {
    var familyModel = await Hive.openBox<FamilyModel>('familyModel');
    var index = familyModel.values.toList().indexWhere((element) =>
        element.age == oldValue.age &&
        element.name == oldValue.name &&
        element.degree == oldValue.degree);
    familyModel.deleteAt(index);
    getFamilyData();
    notifyListeners();
  }
}
