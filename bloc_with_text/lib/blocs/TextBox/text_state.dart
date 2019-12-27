import 'package:equatable/equatable.dart';

abstract class TextState extends Equatable {
  final String content;
  final String error;

  const TextState(
    this.content,
    this.error
    );

  @override
  List<Object> get props => [];
}

class Empty extends TextState {
  final String hintText;

  const Empty({
    this.hintText
  }):super(null,null);

  @override
  List<Object> get props => [this.hintText];
}

class Wrong extends TextState {
  
  const Wrong(
    String content,
    String error,
  ): super(content, error);
}

class Right extends TextState {
  const Right(
    String content,
  ): super(content, null);
}

class Done extends TextState {
  const Done(
    String content,
  ): super(content, null);
}
