import 'package:flutter_test/flutter_test.dart';
import 'package:project1/Medication.dart';
import 'package:project1/AddPage.dart';

void main(){
  test('add Medication Celexa once a day', () async {
    medications.clear();
    final med = Medication('celexa', 1);
    addMed(med);
    expect(medications[0], med);
  });
}