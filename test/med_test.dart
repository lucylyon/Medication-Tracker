import 'package:flutter_test/flutter_test.dart';
import 'package:project1/Medication.dart';

void main(){
  test('create Medication Celexa once a day', () async {
    final med = Medication('celexa', 1);
    expect(med.name, 'celexa');
    expect(med.frequency, 1);
  });
}