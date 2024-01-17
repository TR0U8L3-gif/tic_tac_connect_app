final class Calculations {
  const Calculations._();

  static double mapValueDouble(
    double inputValue, [
    double minInputRange = -1,
    double maxInputRange = 1,
    double minOutputRange = 0,
    double maxOutputRange = 1,
  ]) {
    return (inputValue - minInputRange) /
            (maxInputRange - minInputRange) *
            (maxOutputRange - minOutputRange) +
        minOutputRange;
  }
}
