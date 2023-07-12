import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'expence/view/first_screen.dart';
import 'expence/view/home_screen.dart';

void main()
{
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => HomeScreen(),
          '/first':(p0) => InsertScreen(),
        },
      )
  );
}

//first