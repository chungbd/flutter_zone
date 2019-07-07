import 'package:editing_popup/rule.dart';
import 'package:flutter/foundation.dart';

class Validator {
  dynamic validate({ 
    @required String text, 
    List<Rule> rules = const []}) {
    var listValidatedRule = rules.map((rule) => rule.check(text)).toList();
    listValidatedRule.removeWhere((val) => val == null);
    return listValidatedRule.length == 0 ? null : true;
  }
}