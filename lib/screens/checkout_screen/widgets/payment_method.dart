import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/texts.dart';

class PaymentMethodListView extends StatelessWidget {
  final List paymentMethods;
  final int selectedIndex;
  final Function sendPaymentMethod;
  const PaymentMethodListView(
      this.paymentMethods, this.selectedIndex, this.sendPaymentMethod,
      {super.key});

  changeSelectedIndex(newIndex) {
    sendPaymentMethod(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 145, maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethods.length,
          itemBuilder: (BuildContext context, int index) {
            return _payment(paymentMethods[index], index);
          },
        ),
      ),
    );
  }

  Widget _payment(paymentMethod, index) {
    Color bgColor = (index == selectedIndex) ? kPrimaryColor : Colors.white;
    Color textColor = (index == selectedIndex) ? Colors.white : kPrimaryColor;
    Color iconColor =
        (index == selectedIndex) ? Colors.lightGreen : kPrimaryColor;
    return GestureDetector(
      onTap: () => changeSelectedIndex(index),
      child: Container(
        margin: index == 0
            ? EdgeInsets.only(left: 20, right: 4)
            : EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        width: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  paymentMethod,
                  style: kCredText.copyWith(fontSize: 18, color: textColor),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.paypal,
                  color: textColor,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Amet id occaecat id excepteur et et labore incididunt ut eu esse ut",
                  style: kSmallText.copyWith(fontSize: 16),
                )),
            Icon(
              Icons.check_circle,
              size: 18,
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}
