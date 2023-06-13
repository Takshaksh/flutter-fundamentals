num sum(num a, num b){
  return a + b;
}

bool isEmail(String email){
  if(email.trim().isEmpty){
    return false;
  }

  if(RegExp(r'\S+@\S+\.\S+').hasMatch(email.trim())){
    return true;
  }else{
    return false;
  }

}