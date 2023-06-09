import 'package:basic_bank/all_transfers.dart';
import 'package:basic_bank/sqlite.dart';
import 'package:basic_bank/test.dart';
import 'package:basic_bank/view_customer.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key, this.id, this.balance, required this.customer})
      : super(key: key);
  final id;
  final balance;
  final customer;

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  sqlData sqldata = sqlData();
  List items = [];
  List itemss = [];
  bool isLoading = true;
  TextEditingController controller = TextEditingController();

  Future readData() async {
    List<Map> response = await sqldata
        .selectData("SELECT * FROM `customers` WHERE NOT id = ${widget.id} ");
    items.addAll(response);

    List<Map> respons = await sqldata
        .selectData("SELECT * FROM `customers` WHERE id = ${widget.id} ");
    itemss.addAll(respons);

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Test(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Transfer To : ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 50),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  title: Text(
                                    "transfer to ${items[i]["name"]}",
                                    style: const TextStyle(
                                        color: Color(0xff254cb2)),
                                  ),
                                  content: Form(
                                    child: MainTextFormField2(
                                        size: size,
                                        labelName: "Balance",
                                        hint: "enter balance",
                                        controller: controller),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          double salary = items[i]["balance"];
                                          double ss = widget.balance;
                                          double transfeFrom = ss -
                                              double.parse(controller.text);
                                          double transferTo = salary +
                                              double.parse(controller.text);

                                          int response = await sqldata.updateData(
                                              ''' UPDATE customers SET balance = "${transfeFrom}" WHERE id =${widget.id} 
                                      ''');
                                          int responsee = await sqldata.updateData(
                                              ''' UPDATE customers SET balance = "${transferTo}" WHERE id =${items[i]["id"]} 
                                      ''');
                                          int trans =
                                              await sqldata.insertData(''' 
                                         INSERT INTO "transfer"(`fromcustomer`,`tocustomer`,`balance` ) VALUES("${widget.customer}","${items[i]["name"]}","${controller.text}" )
                                         ''');
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ViewCustomer()),
                                                  (route) => false);
                                        },
                                        child: const Text(
                                          "Transfer",
                                          style: TextStyle(
                                              color: Color(0xff254cb2)),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "cancel",
                                          style: TextStyle(
                                              color: Color(0xff254cb2)),
                                        )),
                                  ],
                                ));
                      },
                      child: CardItem(
                          name: "${items[i]["name"]}",
                          email: "${items[i]["email"]}",
                          balance: double.parse("${items[i]["balance"]}")),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
