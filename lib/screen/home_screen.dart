import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:treeved/resources/colors.dart' as resources;
import 'package:treeved/screen/components/circular_slider.dart';
import 'package:treeved/screen/components/monthly_cards_method.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool checked = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "TreeVed",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: height * 0.028,
                color: resources.textColor3,
              ),
            ),
            backgroundColor: resources.mainBackGroundColor,
            actions: [
              IconButton(
                splashRadius: height * 0.03,
                color: resources.textColor1,
                icon: const Icon(Icons.question_mark_rounded),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Task for internship",
                  );
                },
              )
            ],
            elevation: 10,
          ),
          body: Container(
            width: width,
            color: resources.mainBackGroundColor,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.03),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kritagya,how much do you need?",
                            style: TextStyle(
                              height: 2.5,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.05,
                              color: resources.textColor3.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "Move the dial and set any amount you neet upto ₹50,000?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.042,
                              color: resources.textColor1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: height * 0.04,
                                horizontal: width * 0.03),
                            padding: EdgeInsets.symmetric(
                                vertical: width * 0.08,
                                horizontal: height * 0.06),
                            width: width,
                            // height: height * 0.5,
                            decoration: BoxDecoration(
                              color: resources.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(width * 0.05),
                              ),
                            ),
                            child: Column(children: [
                              CircularSlider(width: width),
                              Text(
                                "Stash is instant.Money will be credited within seconds.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                  color: resources.textColor1.withOpacity(0.6),
                                ),
                              ),
                            ]),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showMonthlyCards(context);
                  },
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: resources.darkBlue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.08),
                        topRight: Radius.circular(width * 0.08),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed to EMI application",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.023,
                          color: resources.textColor3,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
