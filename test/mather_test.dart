import 'package:first_flutter/testing/unit_testing/mather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  // #1 Testing sum function
  test("Testing sum function", () {
    // Arrange
    int a = 23;
    double b = 27.0;

    // Act
    var result = sum(a, b);

    // Assert
    expect(result, 50.0);
  });

  // #2 Check whether input is email or not
  test("Check if the string is email", () {
    // Arrange
    String userEmail = "shivam@space.com";
    String wrongEmail = "shivam@spacecom";

    // Act
    var result =  isEmail(userEmail);

    // Assert
    expect(result, true);

  });



}