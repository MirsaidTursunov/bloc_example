part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {
  final int number;
  final List<StoriesList> storiesList;

  const CategoryState({
    this.number = 0,
    this.storiesList = const [],
  });

  CategoryState copyWith({
    int? number,
    List<StoriesList>? storiesList,
  }) =>
      CategoryState(
        number: number ?? this.number,
        storiesList: storiesList ?? this.storiesList,
      );

  @override
  List<Object?> get props => [storiesList, number];
}

class StoriesList {
  final String image;
  final String title;

  StoriesList({
    required this.image,
    required this.title,
  });
}
