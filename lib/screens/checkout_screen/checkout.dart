import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/checkout_screen/checkout_summary.dart';
import 'package:foodie/screens/checkout_screen/widgets/delivery_address.dart';
import 'package:foodie/screens/checkout_screen/widgets/payment_method.dart';

import 'models/address.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Address selectedDeliveryAddress;
  setNewAddress(Address newValue) {
    log(newValue.toString());
    setState(() {
      selectedDeliveryAddress = newValue;
    });
  }

  int selectedPaymentMethod = -1;
  getSelectedPaymentMethod(newValue) {
    setState(() {
      selectedPaymentMethod = newValue;
    });
  }

  final paymentMethods = ["Cash on Delivery", "FonePay", "Khalti", "Esewa"];

  final TextEditingController specialInstructionsController = TextEditingController();

  @override
  void dispose() {
    specialInstructionsController.dispose();
    super.dispose();
  }

  String specialInstructions = '';

  void handleTextChanged(String value) {
    setState(() {
      specialInstructions = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 36;
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          FontAwesomeIcons.angleLeft,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Checkout.",
                        style: kBigText.copyWith(fontSize: 28),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30, top: 6, bottom: 20),
                  child: Text(
                    "Delivery Address",
                    style: kBigText.copyWith(fontSize: 18),
                  )),
              //delivery address

              DeliveryAddressListView(setNewAddress),

              //payment method
              Container(
                margin: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                child: Text(
                  "Payment Method",
                  style: kBigText.copyWith(fontSize: 18),
                ),
              ),

              PaymentMethodListView(paymentMethods, selectedPaymentMethod, getSelectedPaymentMethod),

              //special instructions
              Container(
                margin: const EdgeInsets.only(left: 30, top: 32, bottom: 20),
                child: Text(
                  "Special Instructions",
                  style: kBigText.copyWith(fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: specialInstructionsController,
                  onChanged: handleTextChanged,
                  style: kSmallText,
                  decoration: InputDecoration(
                      hintText: 'Any specific instruction for how you want your food to be..',
                      border: const OutlineInputBorder(),
                      hintStyle: kSmallText.copyWith(fontSize: 18)),
                ),
              ),

              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutSummary(
                          selectedDeliveryAddress, paymentMethods[selectedPaymentMethod], specialInstructions),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: kSmallText.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
