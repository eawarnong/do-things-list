import 'package:flutter/material.dart';
import '../../../../utils/itemUtils.dart';

class AmountCurrencyText extends StatelessWidget {
  final double price;
  final String currency;
  AmountCurrencyText( this.price, this.currency );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${ItemUtils.getPrice(price)}'),
        Text(
          ' $currency', 
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0
          )
        )
      ],
    );
  }
}