import 'package:flutter/material.dart';

class WordLikeRatio extends StatelessWidget {
   WordLikeRatio({Key? key, required this.num1,required this.num2}) : super(key: key);
  late num num1;
  late num num2;

  @override
  Widget build(BuildContext context) {
    String percent =

    ((num1- num2) / (num1 + num2) * 100).toInt().toString();



    return Container(
      child: Row(
        children: [
          Icon(
            Icons.thumbs_up_down_rounded,
            color: Colors.grey.shade600,
          ),
          Container(width: 5,),

          Text(
            "$percent%".replaceAll("-", ""),
            style: TextStyle(color: ((num1- num2) / (num1 + num2) * 100) < 0
                ? Colors.red.shade200
                : Colors.green.shade200),
          )
        ],
      ),

    );
  }
}
