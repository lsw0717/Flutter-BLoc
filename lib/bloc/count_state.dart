part of 'count_bloc.dart';

enum CountStatus { init, load, done }

class CountState {
  final CountStatus status;
  final int num;

  CountState({required this.status, required this.num});

  /// factory 패턴 => 객체(생성자) 선언 안해줘도 바로 사용 가능.
  /// CountStatus 초기화
  factory CountState.initial() {
    return CountState(status: CountStatus.init, num: 0);
  }

  /// 멤버 함수
  CountState copyWith({CountStatus? status, int? num}) {
    return CountState(
        status: status ?? this.status,
        num: num ?? this.num);
  }
}
