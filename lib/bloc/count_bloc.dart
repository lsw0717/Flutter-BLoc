import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState.initial()) {
    on<CountPlusEvent>(_countPlusEvent);
    on<CountMinusEvent>(_CountMinusEvent);
  }

  void _countPlusEvent(CountPlusEvent event, Emitter<CountState> emit) {
    int num = event.num + 1;
    emit(state.copyWith(status: CountStatus.done, num: num));
  }

  void _CountMinusEvent(CountMinusEvent event, Emitter<CountState> emit) {
    int num = event.num - 1;
    emit(state.copyWith(status: CountStatus.done, num: num));
  }
}
