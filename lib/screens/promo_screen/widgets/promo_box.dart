import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: 250,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apply Promo',
            style:
                kSmallText.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: kSmallText,
            decoration: InputDecoration(
                hintText: 'Eneter Promocode',
                border: OutlineInputBorder(),
                hintStyle: kSmallText.copyWith(fontSize: 18)),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 163,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: Center(
                  child: Text(
                    ' Cancel',
                    style: kSmallText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 163,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPromoColorAlt),
                child: Center(
                    child: Text(
                  'Apply',
                  style: kSmallText.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
