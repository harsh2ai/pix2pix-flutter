import 'package:flutter/material.dart';

TextFormField customtextfield(
    {TextEditingController? controller,
    String? labeltext,
    String? hinttext,
    bool? showText,
    String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    obscureText: showText ?? false,
    decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(labeltext.toString()),
        hintText: hinttext,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), gapPadding: 10)),
    validator: validator ?? (value) {},
  );
}

BoxDecoration halfGreyScaler() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      colors: [
        Colors.grey,
        Colors.transparent,
      ],
      begin: Alignment(0, 0.1),
      end: Alignment(0.2, 0.1),
      tileMode: TileMode.clamp,
    ),
    backgroundBlendMode: BlendMode.saturation,
  );
}
