import 'package:expences1/expence/model/ex_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/helper.dart';

class ExpenceController extends GetxController
{
  RxList dataList=[].obs;
  RxBool b1=false.obs;
  RxBool b2=false.obs;
  RxBool addincome = false.obs;
  RxBool addexpanse = true.obs;

  RxString expansedate = "${DateTime.now()}".obs;
  RxString expansetime = "${TimeOfDay.now()}".obs;

  String setDateFormat(DateTime dt)
  {
    var f = DateFormat("dd-MM-yyyy");
    return f.format(dt);
  }
  DB_Helper db_helper=DB_Helper();
  Future<void> loadDB()
  async {
    dataList.value= await db_helper.read_Db();
  }

  RxList expenceList=[
    'Education','Food','Home maintance','Investment','Salary'
  ].obs;
  RxString selectExpence="Food".obs;
  RxList chackList=[false,false].obs;
  RxString selectincome="Expence".obs;
  RxBool isExp=false.obs;
}