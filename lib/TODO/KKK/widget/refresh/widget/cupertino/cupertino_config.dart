
import 'dart:math' as math;
import 'package:flutter/physics.dart' as physics;


const double kDefaultCupertinoIndicatorRadius = 14.0;
const double kDefaultWaterDropCupertinoIndicatorRadius = 10.0;

const maxCircleRadius = 20.0;
const minCircleRadius = maxCircleRadius / 5;

double kCupertinoFrictionFactor(double overscrollFraction) =>
    0.25 * math.pow(1 - overscrollFraction, 2);

double kCupertinoHorizontalFrictionFactor(double overscrollFraction) =>
    0.52 * math.pow(1 - overscrollFraction, 2);
