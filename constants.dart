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
