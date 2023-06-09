import 'package:basic_bank/sqlite.dart';
import 'package:basic_bank/startscreen.dart';
import 'package:basic_bank/test.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'customer_details.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({Key? key}) : super(key: key);
  static const routeName = "ViewCustomer";

  @override
  State<ViewCustomer> createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer> {
  sqlData sqldata = sqlData();
  List items = [];
  bool isLoading = true;

  Future readData() async {
    List<Map> response = await sqldata.selectData("SELECT * FROM `customers`");
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
                    height: 25,
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
                    "assets/images/money.png",
                    width: 85,
                    height: 85,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerDetails(
                                      id: items[i]["id"],
                                    ))); /*Transfer(id: items[i]["id"],balance:items[i]["balance"] ,))*/
                      },
                      child: CardItem(
                          name: "${items[i]["name"]}",
                          balance: double.parse(
                            "${items[i]["balance"]}",
                          ),
                          email: "${items[i]["email"]}"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
