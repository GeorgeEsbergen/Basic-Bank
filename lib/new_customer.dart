import 'package:basic_bank/sqlite.dart';
import 'package:basic_bank/startscreen.dart';
import 'package:basic_bank/test.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class NewCustomer extends StatelessWidget {
  static const routeName = "newCustomer";
  TextEditingController customer = TextEditingController();
  TextEditingController balance = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  sqlData sqldata = sqlData();

  NewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Test(),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      "Add New Customer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    MainTextFormField(
                      size: size,
                      labelName: 'Customer Name',
                      hint: 'Enter customer name',
                      controller: customer,
                    ),
                    const SizedBox(height: 30),
                    MainTextFormField(
                      size: size,
                      labelName: "Email",
                      hint: "example@gmail.com",
                      controller: email,
                    ),
                    const SizedBox(height: 30),
                    MainTextFormField(
                      size: size,
                      labelName: "Phone",
                      hint: "Phone Number",
                      controller: phone,
                    ),
                    const SizedBox(height: 30),
                    MainTextFormField(
                      size: size,
                      labelName: "Balance",
                      hint: "First Balance",
                      controller: balance,
                    ),
                    const SizedBox(height: 100),
                    mainButton(
                        size: size,
                        buttonName: "Add",
                        fun: () async {
                          int response = await sqldata.insertData(''' 
                  INSERT INTO "customers"(`name`,`balance`,`email`,`phone` ) VALUES("${customer.text}","${balance.text}","${email.text}" , "${phone.text}")
                  ''');
                          if (response > 0) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()),
                                (route) => false);
                          }
                          print(response);
                        }),
                /*    mainButton(
                        size: size,
                        buttonName: "Add",
                        fun: () async {
                          int response = await sqldata.insertData(''' 
                  DELETE FROM customers  
           ''');
                          int responsee = await sqldata.insertData('''
                  DELETE FROM transfer''');
                          if (response > 0) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()),
                                (route) => false);
                          }
                          print(response);
                        }),*/
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
