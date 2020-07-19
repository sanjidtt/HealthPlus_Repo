double stepcount = 3500;

int choice;

double maxValue = 1000.0;

void increm() {
  stepcount += 100;
}

String percentageModifier(double value) {
  value = stepcount;
  final roundedValue = value.ceil().toInt().toString();
  return '$roundedValue';
}
