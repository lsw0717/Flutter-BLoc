part of 'count_bloc.dart';

abstract class CountEvent extends Equatable {
  /// 클래스의 기본 생성자 자동으로 생성되지만 예의상 선언해줬다.
  const CountEvent();

  /// extends Equatable 쓸 때 필수로 있어야함.
  @override
  List<Object> get props => [];
}

class CountPlusEvent extends CountEvent {
  int num;

  CountPlusEvent({required this.num});
}

class CountMinusEvent extends CountEvent {
  int num;

  CountMinusEvent({required this.num});
}