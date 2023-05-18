import 'package:flutter/material.dart';

class CheckoutSummary extends StatelessWidget {
  final String deliveryAddress;
  final String paymentMethod;
  final String specialInstructions;
  const CheckoutSummary(
      this.deliveryAddress, this.paymentMethod, this.specialInstructions,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(deliveryAddress +
            "\n" +
            paymentMethod +
            "\n" +
            specialInstructions),
      ),
    );
  }
}
