import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:treeved/resources/colors.dart' as resources;
import 'package:treeved/resources/lists.dart' as lists;
import 'package:treeved/screen/bloc/home_bloc.dart';

Future<void> showBankNames(BuildContext context) {
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
            onClosing: () {},
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            backgroundColor: resources.mainBackGroundColor,
            builder: (BuildContext _) => SizedBox(
              height: height * 0.6,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Where should we send the money?",
                            style: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.026,
                              color: resources.textColor3.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "amount will be credited to this bank account,EMI will also be debited from this bank account.",
                            style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.02,
                              color: resources.textColor1.withOpacity(0.7),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: lists.bankAccNo.length,
                            itemBuilder: ((context, index) {
                              return BankTiles(
                                index: index,
                              );
                            }),
                          ),
                          SizedBox(height: height * 0.01),
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
                              "Change account",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.019,
                                fontFamily: "PJS",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        "Tap for 1-click KYC",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.023,
                          color: resources.textColor3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

class BankTiles extends StatelessWidget {
  const BankTiles({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ListTile(
      onTap: () {
        BlocProvider.of<HomeBloc>(context).add(BankSelected(index));
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: width * 0.08,
        child: Image.asset(
          lists.bankImages[index],
          width: width * 0.095,
        ),
      ),
      title: Text(
        lists.bankNames[index],
        style: TextStyle(
          height: 1.4,
          fontWeight: FontWeight.w600,
          fontSize: height * 0.02,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      subtitle: Text(
        lists.bankAccNo[index],
        style: TextStyle(
          height: 1.4,
          fontWeight: FontWeight.w600,
          fontSize: height * 0.02,
          color: resources.textColor1.withOpacity(0.7),
        ),
      ),
      trailing: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is BankIndexSelected) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.01),
              width: width * 0.07,
              height: width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: state.index == index
                  ? Icon(
                      Icons.check,
                      size: width * 0.05,
                      color: Colors.white,
                    )
                  : Container(),
            );
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.007),
            width: width * 0.07,
            height: width * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
