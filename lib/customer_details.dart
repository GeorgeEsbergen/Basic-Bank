import 'package:basic_bank/sqlite.dart';
import 'package:basic_bank/test.dart';
import 'package:basic_bank/transfer.dart';
import 'package:flutter/material.dart';
import 'constant.dart';


class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key, this.id}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  sqlData sqldata = sqlData();
  List items = [];
  bool isLoading = true;
  TextEditingController controller = TextEditingController();

  Future readData() async {
    List<Map> response = await sqldata
        .selectData("SELECT * FROM `customers` WHERE  id = ${widget.id} ");
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Test(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Text(
                    "${items[0]["name"]} ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(text: "Email"),
                      MainText(text: "${items[0]["email"]}")
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.white,
                    height: 15,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(text: "Phone"),
                      Padding(
                        padding: const EdgeInsets.only(right: 34.0),
                        child: MainText(text: "${items[0]["phone"]}"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.white,
                    height:10,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(text: "Balance"),
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        child: MainText(text: "${items[0]["balance"]}"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  mainButton(
                      size: size,
                      buttonName: "Transfer",
                      fun: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Transfer(
                                      id: items[0]["id"],
                                      balance: items[0]["balance"],
                                      customer: items[0]["name"],
                                    )));
                      })
                ],
              ),
            )
          ],
        ));
  }
}

class MainText extends StatelessWidget {
  const MainText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
