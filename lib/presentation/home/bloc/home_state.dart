part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int number;

  const HomeState({
    this.number = 0,
  });

  HomeState copyWith({
    int? number,
  }) =>
      HomeState(
        number: number ?? this.number,
      );

  @override
  List<Object?> get props => [number];
}
