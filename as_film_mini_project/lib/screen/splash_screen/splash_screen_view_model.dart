import 'package:flutter/material.dart';

class SplashScreenViewModel with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  // Method untuk menonaktifkan isLoading setelah beberapa waktu (3 detik)
  void disableLoading() {
    Future.delayed(const Duration(seconds: 3), () {
      _isLoading = false;
      notifyListeners(); 
    });
  }
}
