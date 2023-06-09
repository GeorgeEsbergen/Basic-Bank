import 'package:basic_bank/test.dart';
import 'package:basic_bank/view_customer.dart';
import 'package:flutter/material.dart';
import 'all_transfers.dart';
import 'constant.dart';
import 'new_customer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Test(),
            SizedBox(
              width: double.infinity,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/transfer.png"),
                              fit: BoxFit.contain)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Basic Bank",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 180),
                    mainButton(
                        size: size,
                        buttonName: "View All Customer",
                        fun: () {
                          Navigator.of(context)
                              .pushNamed(ViewCustomer.routeName);
                        }),
                    const SizedBox(height: 30),
                    mainButton(
                      size: size,
                      buttonName: 'Add New Customer',
                      fun: () {
                        Navigator.of(context).pushNamed(NewCustomer.routeName);
                      },
                    ),
                    const SizedBox(height: 30),
                    mainButton(
                      size: size,
                      buttonName: 'All Transfers',
                      fun: () {
                        Navigator.pushNamed(context, AllTransfers.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
