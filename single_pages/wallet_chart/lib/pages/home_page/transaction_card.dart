import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.money,
    required this.time,
  });

  final String money, time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          child: [
            const Icon(
              Icons.compare_arrows,
              color: Colors.blueGrey,
            ),
            const Text('Transfer').textColor(Colors.blueGrey),
            Text(money).textColor(Colors.blueGrey).fontWeight(FontWeight.bold),
            Text(time).textColor(Colors.blueGrey).fontSize(12),
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
        const Divider(
          height: 16,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
