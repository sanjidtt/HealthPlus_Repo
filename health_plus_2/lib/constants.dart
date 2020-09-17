import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

///...Registration_1...
String regUsername1;
String regEmail1;
String regPassword1;
String regConfirmPassword1;
String universalId;

///..............

///...Registration_2...
String reg2Age;
String reg2Gender;
String reg2GenderNum;
String reg2Weight;
String reg2Height;
String reg2Steps;
String reg2Water;
String reg2Calorie;
String reg2Protein;
String reg2Fat;
String reg2Carb;
String reg2Sleep;

///....................

///...Diet_Add_Food...
class FoodDetails {
  final String foodLabel;
  final String foodKCal;
  final String foodCarbs;
  final String foodProtien;
  final String foodFat;
  final String foodPic;

  FoodDetails(this.foodLabel, this.foodKCal, this.foodCarbs, this.foodProtien,
      this.foodFat, this.foodPic);
}

String dietSearch;

String temp_label;
String temp_kcal;
String temp_prot;
String temp_carb;
String temp_fat;
String temp_picture;

String checkNum(var json_var) {
  if (json_var != null) {
    return (json_var).toStringAsFixed(2);
  } else {
    return (json_var).toString();
  }
}

String checkNumKcal(var json_var) {
  if (json_var != null) {
    return (json_var).toStringAsFixed(0);
  } else {
    return (json_var).toString();
  }
}

///...................

///.....Diet_Food_Detail......

double servingVar = 1;

int foodChoice = 1;

const int foodBreakfast = 1;
const int foodLunch = 2;
const int foodSnack = 3;
const int foodDinner = 4;

bool foodChoiceButton = false;

FoodDetails tempObj2;

///...........................

///........Dashboard_Initialisation.......

///.......................................
double stepcount = 5000;

int choice;

int varId = 1;
int varValue = 3450;

String email = 'snorlax@gmail.com';
String password = 'test123';
String name = 'snory';
String gender = '5';

String stepID = '1';
String stepDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
String steps = '750';

double maxValue = 7000.0;

void increm() {
  stepcount += 100;
}

///...Percentage Modifier...
String percentageModifier(double value) {
  value = stepcount;
  final roundedValue = value.ceil().toInt().toString();
  return '$roundedValue';
}

String percentageModifierDiet(double value) {
  value = todaySteps.toDouble();
  final roundedValue = value.ceil().toInt().toString();
  return '$roundedValue';
}

///...Database...

///...Pedometer...

addStepMethod(String stepVarID, String stepVarDate, String stepsVar) {
  print(stepVarDate);
  var url = 'http://192.168.0.103/Test_localhost/insertSteps.php';
  http.post(url, body: {
    'STEP_ID': stepVarID,
    'STEP_DATE': stepVarDate,
    'STEPS_STEP': stepsVar,
  });
}

int todaySteps;

double retSteps() {
  return todaySteps + 0.0;
}

class WeekSteps {
  String xDate;
  double ySteps;

  WeekSteps(this.xDate, this.ySteps);
}

dynamic getWeekStepsGraphData() {
  List<WeekSteps> WeekStepsGraphData = <WeekSteps>[
    WeekSteps('25-07-20', 2500),
    WeekSteps('26-07-20', 3000),
    WeekSteps('27-07-20', 3700),
    WeekSteps('28-07-20', 1200),
    WeekSteps('29-07-20', 4200),
    WeekSteps('30-07-20', 4000),
    WeekSteps('31-07-20', 3500),
  ];
  return WeekStepsGraphData;
}

class MonthSteps {
  String xDate;
  double ySteps;

  MonthSteps(this.xDate, this.ySteps);
}

dynamic getMonthStepsGraphData() {
  List<MonthSteps> MonthStepsGraphData = <MonthSteps>[
    MonthSteps('02-07-20', 2500),
    MonthSteps('03-07-20', 2700),
    MonthSteps('04-07-20', 3000),
    MonthSteps('05-07-20', 3100),
    MonthSteps('06-07-20', 3150),
    MonthSteps('07-07-20', 3000),
    MonthSteps('08-07-20', 3500),
    MonthSteps('09-07-20', 3700),
    MonthSteps('10-07-20', 1200),
    MonthSteps('11-07-20', 4200),
    MonthSteps('12-07-20', 4500),
    MonthSteps('13-07-20', 4000),
    MonthSteps('14-07-20', 4600),
    MonthSteps('15-07-20', 4800),
    MonthSteps('16-07-20', 5000),
    MonthSteps('17-07-20', 5200),
    MonthSteps('18-07-20', 4500),
    MonthSteps('19-07-20', 5500),
    MonthSteps('20-07-20', 5800),
    MonthSteps('21-07-20', 6000),
    MonthSteps('22-07-20', 6200),
    MonthSteps('23-07-20', 6350),
    MonthSteps('24-07-20', 6500),
    MonthSteps('25-07-20', 6000),
    MonthSteps('26-07-20', 5500),
    MonthSteps('27-07-20', 5200),
    MonthSteps('28-07-20', 4000),
    MonthSteps('29-07-20', 4200),
    MonthSteps('30-07-20', 4500),
    MonthSteps('31-07-20', 3500),
  ];
  return MonthStepsGraphData;
}
