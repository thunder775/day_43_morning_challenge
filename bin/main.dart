///  Is this a valid credit card number?
///  Are credit card numbers just a random combination of the digits from 0-9? NO!
//  Credit card numbers are a systematic combination of numbers that can satisfy
//  a single test. This test is created so that errors can be avoided while
//  typing in credit card numbers as well as detect counterfeit cards!
//
//  The algorithm is as follows:
//
//  - Reverse the order of the digits in the number.
//  - Take the first, third, ... and every other odd digit in the reversed digits
//  and sum them to form the partial sum s1
//  - Taking the second, fourth ... and every other even digit in the reversed digits:
//        - Multiply each digit by two and sum the digits if the answer is greater
//          than nine to form partial sums for the even digits
//        - Sum the partial sums of the even digits to form s2
//  - If s1 + s2 ends in zero then the original number is in the form of a valid
//  credit card number as verified by the Luhn test.
//  Example
/// Input : 49927398716
/// Output: 49927398716 passes the test
bool cardValidator(String card) {
  List<int> cardNumber =
      card.split('').map((element) => int.parse(element)).toList();
  cardNumber = cardNumber.reversed.toList();

  List<int> sums = gets1Ands2(cardNumber);
  return sums.reduce((a, b) => a + b) % 10 == 0;
}

List<int> gets1Ands2(List<int> numbers) {
  int s1 = 0;
  int s2 = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (i % 2 != 0) {
      s2 += validEvenPlaceOutput(numbers[i]);
    } else {
      s1 += numbers[i];
    }
  }
  print('$s2 $s1');
  return [s1, s2];
}

int validEvenPlaceOutput(int number) => number * 2 > 9
    ? (number * 2)
        .toString()
        .split('')
        .map((element) => int.parse(element))
        .reduce((a, b) => a + b)
    : number * 2;

main() {
  print(cardValidator('49927398716'));
}
