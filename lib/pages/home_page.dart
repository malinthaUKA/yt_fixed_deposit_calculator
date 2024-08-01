import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yt_fixed_deposit_calculator/const.dart';
import 'package:yt_fixed_deposit_calculator/widget/body.dart';
import 'package:yt_fixed_deposit_calculator/widget/input_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  late double interest = 0;
  late double total = 0;

  // _controller1.text is Amount
  // _controller2.text is Interest Rate
  // _controller3.text is Period

  void calculation() {
    final calineterestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calinterest = calineterestrate * int.parse(_controller1.text);

    setState(() {
      interest = calinterest;
      total = interest + int.parse(_controller1.text);
    });
  }

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
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputForm(
                "Deposit Amount",
                _controller1,
                "e.g 20000",
              ),
              SizedBox(
                height: 5,
              ),
              inputForm(
                "Annual Interest Rate(%)",
                _controller2,
                "e.g 3",
              ),
              SizedBox(
                height: 5,
              ),
              inputForm(
                "Period(in month)",
                _controller3,
                "e.g 3",
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  calculation();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "CALCULATE",
                      style: GoogleFonts.robotoMono(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              interest != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Result :-",
                          style: GoogleFonts.robotoMono(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Interest: RS " + interest.toStringAsFixed(2),
                            style: GoogleFonts.robotoMono(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Total: RS " + total.toStringAsFixed(2),
                            style: GoogleFonts.robotoMono(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
