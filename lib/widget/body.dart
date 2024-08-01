import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a short delay
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          height: _isExpanded ? 170 : 0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 226, 203, 102),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1,
              )
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fixed Deposit",
                    style: GoogleFonts.robotoMono(
                        fontSize: 35, color: Colors.white),
                  ),
                  Text(
                    "Calculator",
                    style: GoogleFonts.robotoMono(
                        fontSize: 35, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
