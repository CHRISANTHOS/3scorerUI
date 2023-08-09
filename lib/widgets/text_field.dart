import 'package:flutter/material.dart';

Widget textField({required String label ,String? hint, required TextEditingController controller,bool? noEdit, bool? obscure,  int? maxLines = 1}){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF5F5F5)
    ),
    child: TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hint, border: InputBorder.none, labelText: label),
      readOnly: noEdit ?? false,
      obscureText: obscure ?? false,
    ),
  );
}