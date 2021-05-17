import 'package:wicka/shared_preferences/SessionUserSP.dart';

class TokenController {
  verifyAndRefreshToken() async{
    if(await _isExpiredToken()){
       // FirebaseAut
    }
  }
  
  Future<bool> _isExpiredToken() async{
    var date = await SessionUserSP().getExpireDateToken();
    return date.isAfter(DateTime.now().subtract(Duration(minutes: 1)));
  }
}