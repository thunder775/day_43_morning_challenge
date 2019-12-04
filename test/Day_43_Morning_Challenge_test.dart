import 'dart:math';

import 'package:test/test.dart';
import '../bin/main.dart';
void main() {
  test('Test Case 1', () {
  });
  test('check card', (){
    expect(cardValidator('49927398716'), true);
    expect(cardValidator('2581'), false);
  });




}
