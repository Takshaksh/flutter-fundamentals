import 'package:first_flutter/testing/unit_testing/mather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Util function checker - ", () { 
    test("Testing sum function", () {
      // Arrange
      int a = 23;
      double b = 27.0;

      var result = sum(a, b); // Act

      expect(result, 50.0); // Assert
    });

    test("Check if the string is email", () {
      // Arrange
      String userEmail = "shivam@space.com";
      String wrongEmail = "shivam@spacecom";

      var result =  isEmail(wrongEmail); // Act

      expect(result, false, reason: "Change to correct bool value"); // Assert
    });
  }); // utils group()



} // main()