import 'package:ecom/core/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Product> cartList = <Product>[].obs;

  void addToCart(Product product) {
    print('added to cart');
    if (!cartList.contains(product)) {
      cartList.add(product);
    }
    notifyChildrens();
  }

  void removeFromCart(Product product) {
    print('removed from cart');
    cartList.removeWhere((element) => element.productId == product.productId);
    notifyChildrens();
  }

  void onMakePayment() {
    cartList.clear();
    notifyChildrens();
  }
}
