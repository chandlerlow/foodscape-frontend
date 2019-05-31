import 'package:flutter/material.dart';

import 'view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Busy;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
