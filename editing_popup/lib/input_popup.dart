import 'package:flutter/material.dart';

class InputPopup extends StatefulWidget {
  final String labelTitle;

  InputPopup({ 
    @required this.labelTitle 
    });

  @override
  State<StatefulWidget> createState() {
    
    return InputPopupState();
  }
}

class InputPopupState extends State<InputPopup> {
  bool isValidated = false;

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
                          child: new TextField(
                              autofocus: true,
                              decoration: new InputDecoration(
                                  labelText: widget.labelTitle,
                              ),
                          ),
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