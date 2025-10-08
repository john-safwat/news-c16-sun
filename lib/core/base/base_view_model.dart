import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/base/base_navigator.dart';

abstract class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier{

  N? navigator;


}