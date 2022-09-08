import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:treeved/resources/colors.dart' as resources;
import 'package:treeved/resources/lists.dart' as lists;
import 'package:treeved/screen/bloc/home_bloc.dart';

import 'bank_dialog_method.dart';

Future<void> showMonthlyCards(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => HomeBloc(),
          child: BottomSheet(
            enableDrag: false,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            builder: (BuildContext _) => Container(
              height: height * 0.7,
              padding: EdgeInsets.only(
                top: height * 0.03,
              ),
              decoration: const BoxDecoration(
                color: resources.mainBackGroundColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(45),
                  topEnd: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.035),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "how do you wish to repay?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.03,
                                color: resources.textColor3.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              "Choose anyone or make your own",
                              style: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.023,
                                color: resources.textColor1.withOpacity(0.7),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: lists.cardsAmount.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(MonthlyCardSelected(index));
                                        },
                                        child: Stack(children: [
                                          Container(
                                            height: height * 0.22,
                                            width: height * 0.22,
                                            margin: EdgeInsets.symmetric(
                                                vertical: height * 0.02,
                                                horizontal: width * 0.01),
                                            padding:
                                                EdgeInsets.all(height * 0.02),
                                            decoration: BoxDecoration(
                                              color: lists.cardsColor[index],
                                              borderRadius:
                                                  BorderRadiusDirectional.all(
                                                Radius.circular(height * 0.03),
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BlocBuilder<HomeBloc,
                                                      HomeState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is CardIndexSelected) {
                                                        return Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      height *
                                                                          0.01),
                                                          width: width * 0.1,
                                                          height: width * 0.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          child: state.index ==
                                                                  index
                                                              ? const Icon(
                                                                  Icons.check,
                                                                  size: 30.0,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Container(),
                                                        );
                                                      }
                                                      return Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    height *
                                                                        0.01),
                                                        width: width * 0.1,
                                                        height: width * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 2,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  MonthlyCardsDetails(
                                                    index: index,
                                                  ),
                                                ]),
                                          ),
                                          Positioned(
                                              left: width * 0.09,
                                              child: index == 1
                                                  ? Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4,
                                                          horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black54,
                                                            blurRadius: 20.0,
                                                          ),
                                                        ],
                                                        color: resources
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .all(
                                                          Radius.circular(
                                                              height * 0.03),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "recommended",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              height * 0.018,
                                                          color: resources
                                                              .textColor1,
                                                        ),
                                                      ),
                                                    )
                                                  : Container())
                                        ]),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                  msg: "This feature is not avaliable yet.",
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * 0.025,
                                      vertical: height * 0.02),
                                  side: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  shape: const StadiumBorder()),
                              child: Text(
                                "Create your own plan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.019,
                                  fontFamily: "PJS",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.025,
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showBankNames(context),
                    child: Container(
                        width: width,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: resources.darkBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.08),
                            topRight: Radius.circular(width * 0.08),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Select your bank account",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.023,
                              color: resources.textColor3,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            onClosing: () {},
          ),
        );
      });
}

class MonthlyCardsDetails extends StatelessWidget {
  const MonthlyCardsDetails({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: lists.cardsAmount[index],
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w500,
              fontSize: height * 0.025,
              fontFamily: "PJS",
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: '/ mo\n',
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w700,
              fontSize: height * 0.017,
              fontFamily: "PJS",
              color: resources.textColor3,
            ),
          ),
          TextSpan(
            text: 'for ${lists.cardsMonths[index]} months\n',
            style: TextStyle(
              height: 1.3,
              fontWeight: FontWeight.w500,
              fontSize: height * 0.02,
              fontFamily: "PJS",
              color: resources.textColor3,
            ),
          ),
          TextSpan(
            text: 'See calculations',
            style: TextStyle(
              height: 2,
              fontWeight: FontWeight.w500,
              fontSize: height * 0.017,
              fontFamily: "PJS",
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: Colors.black,
              decorationThickness: 2,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
