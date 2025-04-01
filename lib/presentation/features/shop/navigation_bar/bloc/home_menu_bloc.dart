import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../personalisation/settings/settings_page.dart';
import '../../home/home.dart';
import '../../store/store.dart';
import '../../wishlist/wishlist_page.dart';
part 'home_menu_event.dart';
part 'home_menu_state.dart';

class HomeMenuBloc extends Bloc<HomeMenuEvent, HomeMenuState> {
  HomeMenuBloc() : super(HomeMenuState()) {
    on<SetHomeMenuEvent>((event, emit) {
      emit(state.copyWith(currentHomePage: event.currentHomePage));
    });
  }
}
