part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int number;
  final bool numberVisible;

  const HomeState({
    this.number = 0,
    this.numberVisible = true,
  });

  HomeState copyWith({
    int? number,
    bool? numberVisible,
  }) =>
      HomeState(
        number: number ?? this.number,
        numberVisible: numberVisible ?? this.numberVisible,
      );

  @override
  List<Object?> get props => [number, numberVisible];
}
