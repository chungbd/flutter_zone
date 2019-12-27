import 'package:equatable/equatable.dart';

abstract class TextEvent extends Equatable {
  const TextEvent();

  @override
  List<Object> get props => [];
}

class Edit extends TextEvent {
  
}

class Finsh extends TextEvent {
  
}

class Clean extends TextEvent {
  
}

class Changing extends TextEvent {
  final String content;

  const Changing({
    this.content
  });
}