part of 'home_menu_bloc.dart';

abstract class HomeMenuEvent {
  const HomeMenuEvent();
}

class SetHomeMenuEvent extends HomeMenuEvent {
  final int? currentHomePage;
  SetHomeMenuEvent({required this.currentHomePage});
}
