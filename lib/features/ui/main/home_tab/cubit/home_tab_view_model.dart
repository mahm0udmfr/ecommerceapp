import 'package:ecommerceapp/domain/entities/category_response_entity.dart';
import 'package:ecommerceapp/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerceapp/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerceapp/features/ui/main/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) => emit(CategoryErrorState(faliurs: error)),
        (response) {
      categoriesList = response.data!;
      emit(CategorySuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) => emit(BrandsErrorState(faliurs: error)), (response) {
      brandsList = response.data!;
      emit(BrandsSuccessState(brandResponseEntity: response));
    });
  }
}
