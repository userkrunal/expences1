// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/ex_expence.dart';
// import '../model/ex_model.dart';
// import '../utils/helper.dart';
//
// class InsertScreen extends StatefulWidget {
//   const InsertScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InsertScreen> createState() => _InsertScreenState();
// }
//
// class _InsertScreenState extends State<InsertScreen> {
//   TextEditingController eAmount = TextEditingController();
//   TextEditingController eNotes = TextEditingController();
//   TextEditingController eDate = TextEditingController();
//   TextEditingController eStatus = TextEditingController();
//   TextEditingController eTime = TextEditingController();
//   TextEditingController eCategory = TextEditingController();
//
//   Map d1 = {};
//
//   @override
//   void initState() {
//     super.initState();
//     d1 = Get.arguments;
//
//     if (d1['status'] == 0) {
//       int index = d1['index'];
//       eCategory = TextEditingController(
//           text: expenceController.dataList[index]['category']);
//       eAmount = TextEditingController(
//           text: "${expenceController.dataList[index]['amount']}");
//       eDate = TextEditingController(
//           text: expenceController.dataList[index]['date']);
//       eTime = TextEditingController(
//           text: expenceController.dataList[index]['time']);
//       eStatus = TextEditingController(
//           text: expenceController.dataList[index]['status']);
//       eNotes = TextEditingController(
//           text: expenceController.dataList[index]['note']);
//     }
//   }
//
//   ExpenceController expenceController = Get.put(ExpenceController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: Text(d1['status'] == 1 ? "Add Data" : "Update"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // TextF(
//               //     title: "Notes",
//               //     controller: eNotes,
//               //     input: TextInputType.text),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                   hintText: "Amount",
//                   suffixIcon: Icon(Icons.dialpad_rounded)
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextF(
//                   title: "Date", controller: eDate, input: TextInputType.text),
//
//               // TextF(title: "Category",controller: eCategory,input: TextInputType.text),
//               Container(
//                 decoration: BoxDecoration(border: Border.all(color: Colors.indigoAccent.shade400),borderRadius: BorderRadius.circular(20),color: Colors.indigoAccent.shade200),
//                 child: Obx(
//                   () => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: DropdownButton(
//                       isExpanded: false,
//                       borderRadius: BorderRadius.circular(10),
//                       focusColor: Colors.indigo.shade50,
//                       alignment: Alignment.center,
//                       style: TextStyle(color: Colors.white,fontSize: 18),
//                       iconEnabledColor: Colors.white70,
//                       dropdownColor: Colors.indigoAccent.shade100,
//                       underline: Container(),
//                       value: expenceController.selectExpence.value,
//                       items: expenceController.expenceList
//                           .map((element) => DropdownMenuItem(
//                               child: Center(
//                                 child: Text("$element"),
//                               ),
//                               value: element))
//                           .toList(),
//                       onChanged: (value) {
//                         expenceController.selectExpence.value = value! as String;
//                       },
//                       //hint: Text("--Category--"),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Container(
//               //   height: 130,
//               //   width: double.infinity,
//               //   decoration: BoxDecoration(
//               //       border: Border.all(color: Colors.black45),
//               //       borderRadius: BorderRadius.circular(10)),
//               //   child: Column(
//               //     mainAxisSize: MainAxisSize.min,
//               //     children: [
//               //       // Obx(
//               //       //       () =>  RadioListTile(value: expenceController.selectincome, groupValue: expenceController.selectExpence.value, onChanged:(value) {
//               //       //     expenceController.selectExpence.value=value as String;
//               //       //   },title: Text("Expence"),),
//               //       // ),
//               //       // Obx(
//               //       //       () =>  RadioListTile(value: expenceController.selectincome, groupValue: expenceController.selectExpence.value, onChanged:(value) {
//               //       //     expenceController.selectExpence.value=value as String;
//               //       //   },title: Text("Income"),),
//               //       // ),
//               //       // Obx(
//               //       //   () => CheckboxListTile(
//               //       //     value: expenceController.chackList.value[0],
//               //       //     onChanged: (value) {
//               //       //       expenceController.chackList[0] = value!;
//               //       //     },
//               //       //     title: Text("Expence"),
//               //       //   ),
//               //       // ),
//               //       // Obx(
//               //       //   () => CheckboxListTile(
//               //       //     value: expenceController.chackList.value[1],
//               //       //     onChanged: (value) {
//               //       //       expenceController.chackList[1] = value!;
//               //       //     },
//               //       //     title: Text("Income"),
//               //       //   ),
//               //       // ),
//               //     ],
//               //   ),
//               // ),
//
//               // TextF(title: "Status",controller: eStatus,input: TextInputType.text),
//               //TextF(title: "Time",controller: eTime,input: TextInputType.text),
//               SizedBox(height: 10),
//               ElevatedButton(
//                   onPressed: () async {
//                     DB_Helper db_helper = DB_Helper();
//
//                     if (d1['status'] == 1) {
//                       ExpenceModel model = ExpenceModel(
//                         category: eCategory.text,
//                         date: eDate.text,
//                         time: eTime.text,
//                         status: eStatus.text,
//                         amount: int.parse(eAmount.text),
//                       );
//                       await db_helper.insertinDb(model);
//                     } else {
//                       ExpenceModel model = ExpenceModel(
//                         amount: int.parse(eAmount.text),
//                         id: expenceController.dataList[d1['index']]['id'],
//                         status: eStatus.text,
//                         category: eCategory.text,
//                         time: eTime.text,
//                         date: eDate.text,
//                       );
//                       await db_helper.updateDB(model);
//                     }
//
//                     await expenceController.loadDB();
//                     print("Date=${expenceController.dateTime}");
//                     Get.back();
//                   },
//                   child: Text("Submit"))
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
//
//   Widget TextF({title, controller, input}) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: controller,
//           keyboardType: input,
//           decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               label: Text("$title"),
//               hintText: "$title"),
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }
//
// // Container(
// //   height: 58,
// //   width: 100,
// //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black45)),
// //   child: Padding(
// //     padding: const EdgeInsets.all(8.0),
// //     child: DateTimePicker(
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2050),
// //       dateLabelText: 'Date',
// //       onChanged: (value) {
// //         expenceController.dateTime.value=value as String;
// //       },
// //     ),
// //   ),
// // ),
// // Container(
// //   height: 58,
// //   width: 100,
// //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black45)),
// //   child: Padding(
// //     padding: const EdgeInsets.all(8.0),
// //     child: DateTimePicker(
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2050),
// //       dateLabelText: 'Date',
// //       onChanged: (value) {
// //         expenceController.dateTime.value=value as String;
// //       },
// //     ),
// //   ),
// // ),


import 'package:expences1/expence/controller/ex_expence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/ex_model.dart';
import '../utils/helper.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}
ExpenceController controller = Get.put(ExpenceController());

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController txtAmount = TextEditingController();

   Map m1=Get.arguments;
  @override
  void initState() {
    super.initState();
    //controller.dataList.value=controller.setDateFormat(DateTime.now()) as List;
    if(m1['status']==0)
      {
        int index=m1['index'];
        txtAmount=TextEditingController(text: "${controller.dataList[index]['amount']}");
        controller.expansedate.value=controller.dataList[index]['date'];
        controller.selectExpence.value=controller.dataList[index]['category'];
        controller.incomexpenses=controller.dataList[index]['inex'];

      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.arrow_back_sharp),
                  SizedBox(width: 90),
                  Text("Add Transaction",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                    "How much?",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtAmount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(Container(
                            height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),color: Colors.transparent,),
                              
                              child: Center(
                                child: DropdownButton(
                            isExpanded: false,

                            borderRadius: BorderRadius.circular(10),
                            focusColor: Colors.indigo.shade50,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            iconEnabledColor: Colors.white70,
                            dropdownColor: Colors.indigoAccent.shade100,
                            underline: Container(),
                            value: controller.selectExpence.value,
                            items: controller.expenceList
                                  .map((element) => DropdownMenuItem(
                                      child: Center(
                                        child: Text("$element"),
                                      ),
                                      value: element))
                                  .toList(),
                            onChanged: (value) {
                                controller.selectExpence.value = value! as String;
                            },
                          ),
                              )));
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black45)),
                          child: Row(
                            children: [
                              SizedBox(width: 25),
                              Obx(
                                () =>  Text("${controller.selectExpence}",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 22)),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.black12,
                              ),
                              SizedBox(width: 20)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        GestureDetector(
                            onTap: () {
                              controller.incomexpenses='income';
                              if(controller.b1==false) {
                                controller.b1.value = true;
                              }
                              else
                                {
                                  controller.b1.value=false;
                                }
                            },
                            child: Obx(
                              () =>  Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: controller.b1==true?Colors.green.shade400:Colors.green.shade200),
                                child: Center(child: Text("Income",style: TextStyle(fontSize: 18,color: Colors.white),)),
                              ),
                            ),
                          ),

                        GestureDetector(
                          onTap: () {
                            controller.incomexpenses='expenses';
                            if(controller.b2==false)
                              {
                                controller.b2.value=true;

                              }
                            else
                              {
                                controller.b2.value=false;
                              }
                          },
                          child: Obx(
                            () => Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: controller.b2==true?Colors.red.shade400:Colors.red.shade200),
                              child: Center(child: Text("Expence",style: TextStyle(fontSize: 18,color: Colors.white)),),
                            ),
                          ),
                        ),
                      ],),
                      SizedBox(height: 40),
                      Container(
                        height: 70,
                        width: 360,
                        child: Column(
                          children: [
                            time_date(0, context)
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      DB_Helper db_helper = DB_Helper();

                      if (m1['status'] == 1) {
                        ExpenceModel model = ExpenceModel(
                          date: controller.expansedate.value,
                          category: controller.selectExpence.value,
                          status: controller.incomexpenses== 'expenses'? 1: 0,
                          amount: int.parse(txtAmount.text),
                          inex: controller.incomexpenses
                        );
                        await db_helper.insertinDb(model);
                      } else {
                        ExpenceModel model = ExpenceModel(
                          amount: int.parse(txtAmount.text),
                          id:controller.dataList[m1['index']]['id'],
                          category: controller.selectExpence.value,
                          status:controller.incomexpenses== 'expenses' ? 1: 0,
                          date: controller.expansedate.value,
                          inex: controller.incomexpenses,
                        );
                        await db_helper.updateDB(model);
                      }
                      await controller.loadDB();
                      Get.back();
                    },
                    child: Container(height: 50,width: 200,
                      child: Center(child: Text("Countinue",style: TextStyle(fontSize: 25,color: Colors.white))),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xff7F3DFF)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget time_date(int i,BuildContext context) {
  return InkWell(
    onTap: () async {
      if (i == 0) {
        DateTime? selectdate = await showDatePicker(
          context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(2050));

        controller.expansedate.value = controller.setDateFormat(selectdate!);
      } else {
        TimeOfDay? selecttime = await showTimePicker(
            context: context, initialTime: TimeOfDay.now());
        controller.expansetime.value = "$selecttime";
      }
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(i == 0 ? Icons.calendar_month : Icons.watch_later_outlined,
              size: 20, color: Colors.black45),
          SizedBox(width: 5),
          Obx(
                () => Text(
                i == 0
                    ? "${controller.expansedate.value}"
                    : "${controller.expansetime.value}",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),

          ),
        ],
      ),
    ),
  );
}