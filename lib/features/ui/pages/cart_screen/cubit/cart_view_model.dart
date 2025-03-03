import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerceapp/domain/use_cases/delete_items_in_cart_use_case.dart';
import 'package:ecommerceapp/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:ecommerceapp/domain/use_cases/update_items_in_cart_use_case.dart';
import 'package:ecommerceapp/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;
  UpdateItemsInCartUseCase updateItemsInCartUseCase;
  CartViewModel(
      {required this.getItemsInCartUseCase,
      required this.deleteItemsInCartUseCase,
      required this.updateItemsInCartUseCase})
      : super(GetCartLoadingState());

  List<GetCartProductEntity> itemsInCartList = [];
  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold((error) => emit(GetCartErrorState(failures: error)),
        (response) {
      itemsInCartList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void deleteItemsInCart(String productId) async {
    // emit(DeleteItemsInCartLoadingState());
    var either = await deleteItemsInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteItemsInCartErrorState(failures: error)),
        (response) {
      // itemsInCart = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    // emit(DeleteItemsInCartLoadingState());
    var either = await updateItemsInCartUseCase.invoke(productId, count);
    either.fold((error) => emit(DeleteItemsInCartErrorState(failures: error)),
        (response) {
      // itemsInCart = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }
}
