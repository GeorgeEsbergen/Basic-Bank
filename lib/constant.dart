// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class mainButton extends StatelessWidget {
  const mainButton({
    super.key,
    required this.size,
    required this.buttonName,
    required this.fun,
  });

  final Size size;
  final String buttonName;

  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height / 18,
        width: size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => const Color(0xff0c1838))),
            onPressed: fun,
            child: Text(buttonName)));
  }
}

class MainTextFormField extends StatelessWidget {
  const MainTextFormField(
      {super.key,
      required this.size,
      this.labelName,
      required this.hint,
      required this.controller});

  final Size size;
  final String? labelName;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.2,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          label: Text("$labelName"),
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class MainTextFormField2 extends StatelessWidget {
  const MainTextFormField2({
    super.key,
    required this.size,
    this.labelName,
    required this.hint,
    required this.controller,
  });

  final Size size;
  final String? labelName;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.2,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Color(0xff1d3a86)),
        cursorColor: const Color(0xff1d3a86),
        decoration: InputDecoration(
          label: Text("$labelName"),
          labelStyle: const TextStyle(color: Color(0xff1d3a86)),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xff1d3a86)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff1d3a86)),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff1d3a86)),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.name,
    required this.balance,
    this.email,
  });

  final String name;
  final String? email;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: Colors.white.withOpacity(0.8),
        shadowColor: Colors.white,
        borderOnForeground: true,
        elevation: 3,
        child: ListTile(
          title: Text(
            "$name",
            style: const TextStyle(
                color: Color(0xff1d3a86), fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "$email",
            style: const TextStyle(color: Color(0xff1d3a86)),
          ),
          trailing: Text(
            "$balance \$",
            style: const TextStyle(
                color: Color(0xff1d3a86), fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class TransferItems extends StatelessWidget {
  const TransferItems({
    super.key,
    required this.from,
    this.to,
    required this.balance,
  });

  final String from;
  final String? to;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "To:        $to",
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "From:    $from",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          trailing: Text(
            "$balance \$",
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const SizedBox(height: 7),
        const Divider(
          color: Colors.white,
          height: 10,
        ),
      ],
    );
  }
}
