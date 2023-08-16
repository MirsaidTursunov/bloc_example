import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<StoryEvent>(_getStories);
    on<IndexChange>(_indexChange);
    on<GmailEvent>(_singWithEmail);
    on<SignUpGmailEvent>(_singUpWithEmail);
  }

  void _getStories(StoryEvent event, Emitter<CategoryState> emit) {
    emit(state.copyWith(storiesList: storyList));
  }

  void _indexChange(IndexChange event, Emitter<CategoryState> emit) {
    emit(state.copyWith(number: event.index));
  }

  Future<void> _singWithEmail(
      GmailEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.gmail, password: event.password);
      emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
  }

  Future<void> _singUpWithEmail(
      SignUpGmailEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.gmail, password: event.password);
      emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
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

enum Status { initial, loading, success, error }

extension FirebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
