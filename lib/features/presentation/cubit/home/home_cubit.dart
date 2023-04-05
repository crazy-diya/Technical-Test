import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';

import '../../../domain/usecases/products_list/get_product_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductUseCase getProductUseCase;

  HomeCubit({required this.getProductUseCase}) : super(HomeInitial());

  Future<void> getHomeData(BuildContext context) async {
    try {
      var result = await getProductUseCase.call();
      print(result);
      emit(LoadHomeDataSuccessState(productDetailsEntity: result));
    } catch (_) {
      emit(LoadHomeDataFailState());
    }
  }
}
