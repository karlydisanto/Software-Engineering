import 'package:flutter/material.dart';

const textInputDecoration =  InputDecoration(
    fillColor: const Color(0xFFE0F2F1),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0)
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
    prefixIcon: Padding(
      padding: EdgeInsets.all(0.0),
    )
);

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
