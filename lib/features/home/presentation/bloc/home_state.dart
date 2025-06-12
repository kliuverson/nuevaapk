part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<User> users;

  const HomeLoadSuccess(this.users);
}

final class HomeLoadFailure extends HomeState {
  final String message;

  const HomeLoadFailure(this.message);
}
