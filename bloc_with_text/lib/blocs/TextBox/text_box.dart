import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class TextBox extends StatefulWidget {
  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  final _textEditController  = TextEditingController();
  FocusNode focusNode;
  TextBloc _bloc;

  @override
  void initState() {
    initData();
    _bloc = BlocProvider.of<TextBloc>(context);
    super.initState();
  }

  void initData() {
    focusNode = FocusNode();
    focusNode.addListener(textFieldFocusDidChange);
    _textEditController.addListener(_onTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {    
        return TextField(
          controller: _textEditController,
          focusNode: focusNode,
        );
      },
    );
  }

  void textFieldFocusDidChange() {
    if (focusNode.hasFocus) {
      
    } else {

    }
  }

  void resignFocusNode() {
    focusNode = FocusNode();
    FocusScope.of(context).requestFocus();
  }

  void _onTextChanged() {
    _bloc.add(
      Changing(content: _textEditController.text)
    );
  }  
}