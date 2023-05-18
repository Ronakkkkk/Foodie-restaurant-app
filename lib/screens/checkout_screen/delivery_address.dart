import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class DeliveryAddressListView extends StatelessWidget {
  final List deliveryAddresses;
  final int selectedIndex;
  final Function sendDeliveryAddress;
  const DeliveryAddressListView(
      this.deliveryAddresses, this.selectedIndex, this.sendDeliveryAddress,
      {super.key});

  void changeSelectedIndex(newIndex) {
    sendDeliveryAddress(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 120, maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: deliveryAddresses.length,
          itemBuilder: (BuildContext context, int index) {
            return _deliveryAddress(deliveryAddresses[index], index);
          },
        ),
      ),
    );
  }

  Widget _deliveryAddress(deliveryAddress, index) {
    Color bgColor = (index == selectedIndex) ? kPrimaryColor : Colors.white;
    Color textColor = (index == selectedIndex) ? Colors.white : kPrimaryColor;
    return GestureDetector(
      onTap: () => changeSelectedIndex(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        margin: index == 0
            ? const EdgeInsets.only(left: 20, right: 4)
            : const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: bgColor),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 10),
              child: index == 0
                  ? Icon(Icons.add_location, color: textColor)
                  : Icon(Icons.location_city, color: textColor),
            ),
            SizedBox(
              width: 60,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(deliveryAddress,
                    textAlign: TextAlign.center,
                    style: kSmallText.copyWith(fontSize: 14, color: textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
