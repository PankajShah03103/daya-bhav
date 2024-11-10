
import 'package:flutter/cupertino.dart';

Size getContextSize(BuildContext context) {
  return MediaQuery.of(context).size;
}


double getContextHeight(BuildContext context) {
  return getContextSize(context).height;
}

double getContextWidth(BuildContext context) {
  return getContextSize(context).width;
}