// ignore_for_file: unnecessary_this

import 'package:basic_bank/sqlite.dart';
import 'package:basic_bank/startscreen.dart';
import 'package:basic_bank/test.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class AllTransfers extends StatefulWidget {
  const AllTransfers({Key? key}) : super(key: key);
  static const routeName = "AllTransfers";

  @override
  State<AllTransfers> createState() => _AllTransfersState();
}

class _AllTransfersState extends State<AllTransfers> {
  sqlData sqldata = sqlData();
  List items = [];
  bool isLoading = true;

  Future readData() async {
    List<Map> response = await sqldata.selectData("SELECT * FROM `transfer`");
    items.addAll(response);
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Test(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()));
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Image.asset(
                    "assets/images/exchange.png",
                    width: 85,
                    height: 85,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, i) => TransferItems(
                      to: "${items[i]["tocustomer"]}",
                      balance: double.parse(
                        "${items[i]["balance"]}",
                      ),
                      from: "${items[i]["fromcustomer"]}",
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
