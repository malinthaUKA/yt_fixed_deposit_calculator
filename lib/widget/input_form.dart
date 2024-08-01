import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget inputForm(
    String title, TextEditingController controllar, String hinttext) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.robotoMono(
          fontSize: 20,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            controller: controllar,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hinttext,
            ),
          ),
        ),
      ),
      SizedBox(),
    ],
  );
}
