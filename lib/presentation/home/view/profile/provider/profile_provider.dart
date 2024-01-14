import 'package:flutter/foundation.dart';

class EditProvider with ChangeNotifier {
  bool _isEditing = false;
  List<String> _l = ["Monicca", "Belluci", "L3_INFO", "+21650239112"];

  bool get isEditing => _isEditing;
  List<String> get L => _l;

  void clic() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void clic_save() {
    _isEditing = !isEditing;
    notifyListeners();
  }
}
