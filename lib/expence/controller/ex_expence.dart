import 'package:expences1/expence/model/ex_model.dart';
import 'package:expences1/expence/view/first_screen.dart';
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

  String incomexpenses='expenses';
  num totalincome=0;
  num overall=0;
  num totalexpanse=0;
  int j=0;

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
    totalamount();
  }

  RxList expenceList=[
    'Education','Food','Home maintance','Investment','Salary'
  ].obs;
  RxString selectExpence="Food".obs;
  RxList chackList=[false,false].obs;
  // RxString selectincome="Expence".obs;
  // RxBool isExp=false.obs;

  void totalamount()
  {
    totalincome=0;
    totalexpanse=0;
    for(int i=0;i<dataList.length;i++)
    {
      if(dataList[i]['status']==0)
      {
        totalincome=totalincome+dataList[i]['amount'];
      }
      else if(dataList[i]['status']==1)
      {
        totalexpanse=totalexpanse+dataList[i]['amount'];
      }
    }
    overall=totalincome-totalexpanse;
    update();
  }
}