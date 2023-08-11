import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<StoryEvent>(_getStories);
  }

  void _getStories(StoryEvent event, Emitter<CategoryState> emit) {
    emit(state.copyWith(storiesList: storyList));
  }
}

final List<StoriesList> storyList = [
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Sevimli'),
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Madina'),
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Jahongir'),
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Ravshan'),
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Sevimli'),
  StoriesList(
      image:
          'https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg',
      title: 'Sevimli'),
];
