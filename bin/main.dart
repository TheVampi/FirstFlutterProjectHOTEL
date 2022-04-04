//write a function that converts seconds to days, weeks, months and years and returns it as a string in the format: "x years, x months, x weeks, x days"  where x is the number of the corresponding unit of time in Dart language 
import 'dart:io';
void main() {
  var a;
  a = stdin.readLineSync();
  int seconds = int.parse(a);
  int years = seconds ~/ (365 * 24 * 60 * 60);
  int months = (seconds - years * 365 * 24 * 60 * 60) ~/ (30 * 24 * 60 * 60);
  int weeks = (seconds - years * 365 * 24 * 60 * 60 - months * 30 * 24 * 60 * 60) ~/ (7 * 24 * 60 * 60);
  int days = (seconds - years * 365 * 24 * 60 * 60 - months * 30 * 24 * 60 * 60 - weeks * 7 * 24 * 60 * 60) ~/ (24 * 60 * 60);
  print('$years years, $months months, $weeks weeks, $days days');
}