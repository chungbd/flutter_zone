import 'package:editing_popup/rule.dart';
import 'package:editing_popup/validator.dart';
import 'package:flutter/material.dart';


class InputView extends StatefulWidget {
  final String labelString;
  final bool autoFocus;
  final String textContent;
  final List<Rule> rules;
  final Widget icon;
  final ValueChanged textOnChange;

  InputView({ 
    @required this.labelString, 
    this.textOnChange,
    this.rules = const [], 
    this.autoFocus = false, 
    this.textContent, 
    this.icon
    });

  @override
  State<StatefulWidget> createState() {
    return _InputViewState();
  }
}

class _InputViewState extends State<InputView> {
  final Validator validator = Validator();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autofocus: widget.autoFocus,
      controller: textController,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText:widget.labelString,
      ),
      validator: (value) {
        if (validator.validate(text: textController.text, rules: widget.rules) != null) {
          
          if (widget.rules.contains(Rule.notEmpty)) {
            return 'Không được để trống!';
          }
          
          if (widget.rules.contains(Rule.validEmail)) {
            return 'Không phải định dạng email!';
          }
        }
      },
    );
  }

  void initData() {
    textController.text = widget.textContent;
    textController.addListener(_onChangeText);
  }

  void _onChangeText() {
    widget.textOnChange(textController.text);
  }

}