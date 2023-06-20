import 'package:first_flutter/testing/login_module_testing/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Check email is empty or not", (){
    // Arrange & Act
    var result = Validator.isEmpty('');

    // Assert
    expect(result, true);
  });

  test("Validate email address", () {
    // Arrange & Act
    var result = Validator.isValidEmail("shivam@shivam.com");
    
    // Assert
    expect(result, true);
  });
}