import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tapp/data/features/shop/home/model/category.dart';
import 'package:tapp/domain/features/shop/home/entities/categories.dart';
import 'package:tapp/domain/features/shop/home/usecases/shop/categories.dart';
import 'package:tapp/service_locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    /// ---> Categories
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesInitialState());
      emit(CategoriesLoadingState());
       final res = await ServiceLocator.instance.getIt<GetCategoriesUseCase>().call(params: null);
       res.fold((error){
         emit(CategoriesInitialState());
       }, (data){
         List<CategoryModel> category_models_list = data as List<CategoryModel>;
         List<CategoryEntity> category_entity_list = category_models_list.map((e)=>CategoryEntity.fromSnapshot(e.toJson())).toList();
         emit(CategoriesLoadedState(categories: category_entity_list));
       });
    });
  }
}
