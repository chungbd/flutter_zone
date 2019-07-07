typedef RuleChecker = String Function(String text);

class Rule {
  RuleChecker check;

  Rule({ this.check });

  static Rule notEmpty = Rule(check: (text) {
    return text.isEmpty ? "" : null;
  });

  static Rule validEmail = Rule(check: (text) {
    var regExp = RegExp(
      "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
      caseSensitive: false,
    );
    
    return regExp.hasMatch(text) ? "" : null;
  });
}