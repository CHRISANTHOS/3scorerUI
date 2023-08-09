import 'package:flutter/material.dart';

Widget customButton({required String text, required VoidCallback? onTap, IconData? icon, Color? bgColor, Color? textColor,required bool alignT}){
  return SizedBox(
    height: 50,
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(5),
          backgroundColor: MaterialStatePropertyAll(bgColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(width: 0.5, color: Colors.white)
              )
          )
      ),
      child: Row(
        children: [
          icon == null ? Container() : Icon(icon, color: Colors.white,),
          const SizedBox(width: 5,),
          Text(text,textAlign: alignT ? TextAlign.center : TextAlign.left, style: TextStyle(color: textColor ?? Colors.white),),
        ],
      ),
    ),
  );
}