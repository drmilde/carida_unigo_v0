import 'dart:math';

import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../services/controller/ug_state_controller.dart';
import 'bar_chart.dart';

class BarChartWidget extends StatefulWidget {
  List<double> werte = <double>[];

  BarChartWidget({required this.werte, Key? key}) : super(key: key);

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  UGStateController _controller = Get.find();
  List<BarValue<void>> _values = <BarValue<void>>[];
  double targetMax = 5;
  double targetMin = 0;
  bool _showValues = false; // zeigt Werte an
  bool _smoothPoints = false;
  bool _colorfulBars = false; //lässt alle Balken unterschiedlich bunt werden
  bool _showLine = false; // zeigt die Mittelpunkt Linie an
  int minItems = 7; // wie viele Balken werden angezeigt
  bool _legendOnEnd = true;
  bool _legendOnBottom = true;

  @override
  void initState() {
    super.initState();
    _updateValues();
  }

  void _updateValues() {
    _values.clear();
    _values.addAll(List.generate(minItems, (index) {
      return BarValue<void>(widget.werte[index]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: BarChart(
        data: _values,
        height: MediaQuery.of(context).size.height * 0.4,
        dataToValue: (BarValue value) => value.max ?? 0.0,
        itemOptions: BarItemOptions(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Balken Breite
          minBarWidth: 4.0,
          barItemBuilder: (data) {
            final colorForValue = Colors.accents[data.itemIndex % 15];
            return BarItem(
              radius: const BorderRadius.vertical(
                top: Radius.circular(14.0), // Balken Radius
              ),
              color: _colorfulBars
                  ? colorForValue
                  : _controller.appConstants.turquoise, // Balken Farbe
              //Theme.of(context).colorScheme.primary,
            );
          },
        ),
        backgroundDecorations: [
          GridDecoration(
            showHorizontalValues: _showValues,
            showVerticalValues: _showValues,
            showTopHorizontalValue: _legendOnBottom ? _showValues : false,
            horizontalLegendPosition: _legendOnEnd
                ? HorizontalLegendPosition.end
                : HorizontalLegendPosition.start,
            verticalLegendPosition: _legendOnBottom
                ? VerticalLegendPosition.bottom
                : VerticalLegendPosition.top,
            horizontalAxisStep: 1,
            verticalAxisStep: 1,
            verticalValuesPadding: const EdgeInsets.symmetric(vertical: 4.0),
            horizontalValuesPadding:
                const EdgeInsets.symmetric(horizontal: 4.0),
            textStyle: Theme.of(context).textTheme.caption,
            gridColor:
                //Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                Colors.white,
          ),
          //_buildDurchschnittsDing(context),
        ],
        foregroundDecorations: [
          SparkLineDecoration(
            // line des Mittelpunkts
            lineWidth: 2.0,
            lineColor: //_controller.appConstants.light_green,
                Theme.of(context)
                    .primaryColor
                    .withOpacity(_showLine ? 1.0 : 0.0),
            smoothPoints: _smoothPoints,
          ),
          ValueDecoration(
            alignment: Alignment.bottomCenter,
            textStyle: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          BorderDecoration(
            endWithChart: false,
            borderWidth: 0,
          )
        ],
      ),
    );
  }

  TargetAreaDecoration _buildDurchschnittsDing(BuildContext context) {
    return TargetAreaDecoration(
      //areaPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      targetAreaFillColor: _controller.appConstants.light_grey.withOpacity(0.5),
      // Bereichsfarbe Hintergrund
      targetLineColor: _controller.appConstants.dark_grey.withOpacity(0.5),
      // Bereichslinienfarbe Hintergrund
      //Theme.of(context).colorScheme.error,
      targetAreaRadius: BorderRadius.circular(20.0),
      // Bereichsradius Hintergrund
      targetMax: targetMax,
      targetMin: targetMin,
      colorOverTarget: //_controller.appConstants.light_green,
          Theme.of(context).colorScheme.error,
    );
  }
}
