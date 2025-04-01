part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

/// Categories
final class CategoriesInitialState extends HomeState{}
final class CategoriesLoadingState extends HomeState{}
final class CategoriesLoadedState extends HomeState{
   final List<CategoryEntity> categories;
   CategoriesLoadedState({required this.categories});
}
