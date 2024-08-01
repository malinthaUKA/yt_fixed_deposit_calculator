import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yt_fixed_deposit_calculator/const.dart';
import 'package:yt_fixed_deposit_calculator/widget/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          shadowColor: Colors.black26,
          toolbarHeight: 60,
          backgroundColor: Color.fromARGB(255, 226, 203, 102),
          elevation: 0,
          leading: const Icon(
            Icons.notes,
            size: 30,
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: Icon(
                Icons.info,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
        // body: MyWidget(),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          height: 170,
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
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 60),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350.0,
                    child: DefaultTextStyle(
                      style: GoogleFonts.robotoMono(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Fixed Deposit',
                            speed: Duration(milliseconds: 100),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350.0,
                    child: DefaultTextStyle(
                      style: GoogleFonts.robotoMono(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Calculator',
                            speed: Duration(milliseconds: 100),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [],
        ),
      ],
    );
  }
}
