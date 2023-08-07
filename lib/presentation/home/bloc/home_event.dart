part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class CounterEvent extends HomeEvent {
  final int number;

  CounterEvent({required this.number});

  @override
  List<Object?> get props {
    return [number];
  }
}
