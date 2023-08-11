part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {
  final List<StoriesList> storiesList;

  const CategoryState({
    this.storiesList = const [],
  });

  CategoryState copyWith({
    List<StoriesList>? storiesList,
  }) =>
      CategoryState(
        storiesList: storiesList ?? this.storiesList,
      );

  @override
  List<Object?> get props => [storiesList];
}

class StoriesList {
  final String image;
  final String title;

  StoriesList({
    required this.image,
    required this.title,
  });
}
