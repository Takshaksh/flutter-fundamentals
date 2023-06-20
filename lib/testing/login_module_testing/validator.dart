class Validator{
  static bool isEmpty(String value){
    if(value.isEmpty){
      return true;
    }
    return false;
  }

  static bool isValidEmail(String email){
    if(RegExp(r'\S+@\S+\.\S+').hasMatch(email.trim())){
      return true;
    }else{
      return false;
    }
  }
}