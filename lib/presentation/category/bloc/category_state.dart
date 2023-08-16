part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {
  final int number;
  final List<StoriesList> storiesList;
  final Status firebaseStatus;

  const CategoryState({
    this.number = 0,
    this.storiesList = const [],
    this.firebaseStatus = Status.initial,
  });

  CategoryState copyWith({
    int? number,
    List<StoriesList>? storiesList,
    Status? firebaseStatus,
  }) =>
      CategoryState(
        number: number ?? this.number,
        storiesList: storiesList ?? this.storiesList,
        firebaseStatus: firebaseStatus ?? this.firebaseStatus,
      );

  @override
  List<Object?> get props => [storiesList, number, firebaseStatus];
}

class StoriesList {
  final String image;
  final String title;

  StoriesList({
    required this.image,
    required this.title,
  });
}
