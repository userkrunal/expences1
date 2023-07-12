import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ex_expence.dart';
import '../utils/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ExpenceController expenceController=Get.put(ExpenceController());

  @override
  void initState() {
    super.initState();
    expenceController.loadDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      body: Obx(
            () =>  Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),color: Color(
                      0xffe5d1ac)),

                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: expenceController.dataList.length,
                  itemBuilder: (context, index) {
                  return  GestureDetector(
                    onDoubleTap: () async {
                      DB_Helper db_helper=DB_Helper();
                      int id=expenceController.dataList[index]['id'];
                      await db_helper.deleteDb(id);
                      await expenceController.loadDB();
                    },
                    onLongPress: () {
                      Get.toNamed("/first",arguments: {"status":0,"index":index});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 340,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                        child: ListTile(
                          title: Text("${expenceController.dataList[index]['category']}",style: TextStyle(fontSize: 23),),
                          subtitle: Text("${expenceController.dataList[index]['amount']}",style: TextStyle(fontSize: 18),),
                          trailing: Text("${expenceController.dataList[index]['date']}"),
                        ),
                      ),
                    ),
                  );
          },
        ),
                ),
              ],
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/first',arguments: {"status":1,"index":null});
        },child: Icon(Icons.add),
      ),
    ));
  }
}
