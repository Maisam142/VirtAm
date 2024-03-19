class StepCalculator {
  static const double METRIC_RUNNING_FACTOR = 1.02784823;
  static const double METRIC_WALKING_FACTOR = 0.708;

  static const double IMPERIAL_RUNNING_FACTOR = 0.750319;
  static const double IMPERIAL_WALKING_FACTOR = 0.555;

  double calculateCalories({
    required bool isMetric,
    required bool isRunning,
    required double bodyWeight,
    required double stepLength,
    required int stepCount,
  }) {
    double calories = 0.0;
    if (isMetric) {
      calories += (bodyWeight * (isRunning ? METRIC_RUNNING_FACTOR : METRIC_WALKING_FACTOR)) *
          stepLength / 100000.0;
    } else {
      calories += (bodyWeight * (isRunning ? IMPERIAL_RUNNING_FACTOR : IMPERIAL_WALKING_FACTOR)) *
          stepLength / 63360.0;
    }
    return calories;
  }

  double mDistance = 0.0; // initialize distance variable
  bool mIsMetric = true; // set default unit to metric

  // Function to calculate distance based on step length and unit
  void onStep(int mStepLength) {
    if (mIsMetric) {
      mDistance += mStepLength / 100000.0; // centimeters to kilometers
    } else {
      mDistance += mStepLength / 63360.0; // inches to miles
    }
  }
}
