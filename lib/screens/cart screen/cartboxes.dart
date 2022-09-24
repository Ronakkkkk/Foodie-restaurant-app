import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart%20screen/quantity.dart';

class Cartbox extends StatelessWidget {
  const Cartbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 378,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: ((context, index) => SizedBox(
                    width: 20,
                  )),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _cartcontent(index);
              },
            )),
      ],
    );
  }

  Widget _cartcontent(int index) {
    return Container(
      height: 350,
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: 250,
            width: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffDCDBDB)),
            child: Image(image: AssetImage('assets/images/bowl.png')),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Ameircan Salad With Seasoning',
            style: ksmalltext.copyWith(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                '\$',
                style: ksmalltext.copyWith(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                width: 4,
              ),
              Text('12.45',
                  style: ksmalltext.copyWith(color: Colors.grey, fontSize: 16)),
            ],
          ),
          Cartquantity()
        ],
      ),
    );
  }
}
