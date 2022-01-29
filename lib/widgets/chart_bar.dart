import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentage;

  ChartBar(this.label, this.spendingAmount, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\₹ ${spendingAmount.toStringAsFixed(0)}',
            )),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.55,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(height: constraints.maxHeight * 0.15, child: Text(label)),
        ],
      );
    });
  }
}
