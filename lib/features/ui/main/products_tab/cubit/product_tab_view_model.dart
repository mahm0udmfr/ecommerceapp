import 'package:ecommerceapp/domain/entities/product_response_entity.dart';
import 'package:ecommerceapp/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerceapp/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  ProductTabViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductTabInitialState());
  //holds data and handle logic

  List<ProductEntity> productsList = [];
  int numberOfCartItems = 0;

  static ProductTabViewModel get(context) =>
      BlocProvider.of<ProductTabViewModel>(context);

  void getAllProducts() async {
    emit(ProductTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) => emit(ProductTabErrorState(failures: error)),
        (response) {
      productsList = response.data!;
      emit(ProductTabSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) => emit(AddToCartErrorState(failures: error)),
        (response) {
      numberOfCartItems = response.numOfCartItems!.toInt();
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
