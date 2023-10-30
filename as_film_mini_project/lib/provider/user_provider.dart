import 'package:flutter/material.dart';
import 'package:as_film_mini_project/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get user => _userModel;

  void setUser(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  void logout() {
    _userModel = null;
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:as_film_mini_project/model/user_model.dart';

// class UserProvider with ChangeNotifier {
//   UserModel? _userModel;
//   String? username;
//   String? password;

//   UserModel? get user => _userModel;

//   void setUser(UserModel user) {
//     _userModel = user;
//     notifyListeners();
//   }

//   void setUserCredentials(String username, String password) {
//     this.username = username;
//     this.password = password;
//     notifyListeners();
//   }

//   void logout() {
//     _userModel = null;
//     username = null;
//     password = null;
//     notifyListeners();
//   }
// }