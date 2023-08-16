part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {}

class StoryEvent extends CategoryEvent {
  StoryEvent();

  @override
  List<Object?> get props {
    return [];
  }
}

class IndexChange extends CategoryEvent {
  final int index;

  IndexChange({required this.index});

  @override
  List<Object?> get props {
    return [];
  }
}

class GmailEvent extends CategoryEvent {
  final String gmail;
  final String password;

  GmailEvent({required this.gmail, required this.password});

  @override
  List<Object?> get props {
    return [];
  }
}

class SignUpGmailEvent extends CategoryEvent {
  final String gmail;
  final String password;

  SignUpGmailEvent({required this.gmail, required this.password});

  @override
  List<Object?> get props {
    return [];
  }
}
