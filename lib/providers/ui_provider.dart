import 'package:flutter/widgets.dart';

class UIProvider extends ChangeNotifier{
  int _slectedMenuOpt = 1;

  int get selectedMenuOpt{
    return this._slectedMenuOpt;
  }

  set selectMenuOpt(int index){
    this._slectedMenuOpt = index;
    notifyListeners();
  }
}