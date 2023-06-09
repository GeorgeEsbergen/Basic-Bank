import 'package:basic_bank/all_transfers.dart';
import 'package:basic_bank/startscreen.dart';
import 'package:basic_bank/view_customer.dart';
import 'package:flutter/material.dart';
import 'new_customer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const StartScreen(),
        NewCustomer.routeName: (context) => NewCustomer(),
        ViewCustomer.routeName: (context) => const ViewCustomer(),
        AllTransfers.routeName: (context) => const AllTransfers(),
      },
    );
  }
}
