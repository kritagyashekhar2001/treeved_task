import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:treeved/resources/colors.dart' as resources;
import 'package:treeved/screen/bloc/home_bloc.dart';

class CircularSlider extends StatelessWidget {
  const CircularSlider({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
      max: 50000,
      appearance: CircularSliderAppearance(
          customColors: CustomSliderColors(
              dynamicGradient: true,
              trackColor: resources.lightBrown,
              progressBarColors: [resources.lightBrown, resources.darkBrown]),
          size: width * 0.7,
          customWidths: CustomSliderWidths(progressBarWidth: width * 0.05)),
      initialValue: 15000,
      onChangeEnd: (double endValue) {
        BlocProvider.of<HomeBloc>(context).add(AmountValueChanged(endValue));
      },
      innerWidget: (double value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "credit amount",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.05,
                  color: resources.textColor1.withOpacity(0.6),
                ),
              ),
              Text(
                "₹${value.toStringAsFixed(2)}",
                style: TextStyle(
                  height: 1.2,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationColor: resources.textColor1,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.08,
                  color: Colors.black,
                ),
              ),
              Text(
                "1.04% monthly",
                style: TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.04,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
