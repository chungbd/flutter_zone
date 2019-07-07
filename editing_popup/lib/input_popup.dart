import 'package:editing_popup/input_view.dart';
import 'package:editing_popup/rule.dart';
import 'package:flutter/material.dart';

class InputPopup extends StatefulWidget {
  final String labelTitle;
  final String textContent;
  final List<Rule> listRule;
  final ValueChanged onSubmitText;
  InputPopup({ 
    @required this.labelTitle,
    @required this.listRule,
    this.onSubmitText,
    this.textContent,
    });

  @override
  State<StatefulWidget> createState() {
    return _InputPopupState();
  }
}

class _InputPopupState extends State<InputPopup> {
  bool isValidated = false;
  final _formKey = GlobalKey<FormState>();
  String curText = "";

  @override
  Widget build(BuildContext context) {
    return 
    new Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.7),
        body:
          SafeArea(
            child: 
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                      new Expanded( 
                          child: new Material(
                              color: Colors.grey.withOpacity(0.2),                    
                              child: 
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).pop();
                                  },
                                  ),
                          ),
                      ),
                      new Container(
                          color: Colors.white,
                          padding: new EdgeInsets.symmetric(horizontal: 8),
                          child: 
                            Form(
                              key: _formKey,
                              child: 
                                InputView(
                                  labelString: widget.labelTitle,
                                  autoFocus:true,
                                  rules:widget.listRule,
                                  textContent:widget.textContent,
                                  textOnChange: (val) {
                                    curText = val;
                                    var isCurrentValid = _formKey.currentState.validate();
                                    if (isCurrentValid != isValidated) {
                                      setState(() {
                                        isValidated = isCurrentValid;  
                                      });
                                    }
                                  },
                                ),
                            )
                      ),
                      new Container(
                          color: Colors.white,
                          padding: new EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          child: 
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: 
                                    FlatButton(
                                      color: Theme.of(context).accentColor,
                                      textColor: Colors.white,
                                      child: Text("Hủy"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                    },),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: 
                                    FlatButton(
                                      color: isValidated ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                                      textColor: Colors.white,
                                      child: Text("Lưu"),
                                      onPressed: () {
                                        if (isValidated) {
                                          widget.onSubmitText(curText);
                                          // If the form is valid, we want to show a Snackbar
                                          Navigator.of(context).pop();
                                        }  
                                    },),
                                ),                             
                              ],)
                      ),                    
                  ],
              ),
            )
    );
  }
}