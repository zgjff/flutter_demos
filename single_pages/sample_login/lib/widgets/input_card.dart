import 'package:flutter/material.dart';

class IntputCard extends StatelessWidget {
  const IntputCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(225, 95, 27, 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _inputField('Email or Phone Number'),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          _inputField('Password'),
        ],
      ),
    );
  }

  Padding _inputField(String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.lightBlueAccent,
      ),
    );
  }
}
