import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class CheckoutSummary extends StatelessWidget {
  final String deliveryAddress;
  final String paymentMethod;
  final String specialInstructions;
  const CheckoutSummary(
      this.deliveryAddress, this.paymentMethod, this.specialInstructions,
      {super.key});

  @override
  Widget build(BuildContext context) {
    const dummyOrders = ['Chicken MoMo', 'Strawberry Milkshake', 'Veg C Momo'];
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            FontAwesomeIcons.angleLeft,
                            color: kPrimaryColor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Confirm Order",
                        style: kBigText.copyWith(fontSize: 24),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Delivery Address",
                style: kBigText.copyWith(fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          "Home",
                          style: kCredText.copyWith(fontSize: 16),
                        ),
                      ),
                      Text(
                        "Finshotswith Ronak",
                        style: kCredText.copyWith(
                            fontSize: 14, color: Colors.black54, height: 1.2),
                      ),
                      Text(
                        "M34A+AFE, New Baneshwor 44600, Nepal",
                        style: kCredText.copyWith(
                            fontSize: 14, color: Colors.black54, height: 1.2),
                      ),
                      Text(
                        "near chuna muna school",
                        style: kCredText.copyWith(
                            fontSize: 14, color: Colors.black54, height: 1.2),
                      ),
                      Text(
                        "9840123456",
                        style: kCredText.copyWith(
                            fontSize: 14, color: Colors.black54, height: 1.2),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Payment Method",
                style: kBigText.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Order Summary",
                style: kBigText.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(top: 5),
                        decoration: const BoxDecoration(color: Colors.black12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dummyOrders[index],
                              style: kCredText,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Quantity: 1",
                                  style: kCredTextMedium.copyWith(
                                      color: kPrimaryColor),
                                ),
                                Expanded(child: Container()),
                                const Text("Rs 1000")
                              ],
                            )
                          ],
                        )),
                    itemCount: dummyOrders.length),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Your Total",
                style: kBigText.copyWith(fontSize: 18),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Subtotal",
                          style: kCredText,
                        ),
                        Expanded(child: Container()),
                        const Text("Rs 4000", style: kCredText)
                      ],
                    ),
                    const Divider(height: 20, color: kPrimaryColor),
                    Row(
                      children: [
                        const Text(
                          "Delivery Charge",
                          style: kCredText,
                        ),
                        Expanded(child: Container()),
                        const Text("Rs 4000", style: kCredText)
                      ],
                    ),
                    const Divider(height: 20, color: kPrimaryColor),
                    Row(
                      children: [
                        const Text(
                          "Grand Total",
                          style: kCredText,
                        ),
                        Expanded(child: Container()),
                        const Text("Rs 4000", style: kCredText)
                      ],
                    ),
                    const Divider(height: 20, color: kPrimaryColor),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Special Instructions",
                style: kBigText.copyWith(fontSize: 18),
              ),
              const Text("special instruction"),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kPrimaryColor),
                child: Center(
                  child: Text(
                    'Bring me my food !!!',
                    style: kSmallText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
