import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ecom_exp/features/product/domain/repo.dart';
import 'package:ecom_exp/features/product/data/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(ProductInitial()) {
    fetchProducts();
  }
  List<ProductModel> products = [];
  void fetchProducts() {
    emit(ProductInLoading());
    try {
      products = productRepo.fetchProducts();
      emit(ProductLoaded());
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void filterProducts(String filter) {
    emit(ProductInLoading());
    try {
      final items = productRepo.fetchProducts();
      products =
          items
              .where(
                (item) => item.name.toString().toLowerCase().contains(
                  filter.toLowerCase(),
                ),
              )
              .toList();
      emit(ProductLoaded());
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  ProductModel? selectedProductModel;
  void selectProduct(ProductModel productModel) {
    selectedProductModel = productModel;
  }
}
