import 'package:bloc/bloc.dart';

import 'text_event.dart';
import 'text_state.dart';


class TextBloc extends Bloc<TextEvent, TextState> {
  @override
  TextState get initialState => Empty();

  @override
  Stream<TextState> mapEventToState(TextEvent event) async* {
    var currentState = state;
    if (event is Finsh) {
      yield Done(currentState.content);
    }
    
    if (event is Edit) {
      yield Right(currentState.content);
    }
  }

}
