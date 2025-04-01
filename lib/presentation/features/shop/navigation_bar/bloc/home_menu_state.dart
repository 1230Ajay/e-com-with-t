part of 'home_menu_bloc.dart';

class HomeMenuState {
  final int currentHomePage;
  final List<Widget> pages = <Widget>[
    HomePage(),
    Store(),
    WishlistPage(),
    SettingsPage()
  ];

  HomeMenuState({this.currentHomePage = 0});

  Widget get currentPage => pages[currentHomePage];

  HomeMenuState copyWith({int? currentHomePage}) {
    return HomeMenuState(
        currentHomePage: currentHomePage ?? this.currentHomePage);
  }
}
