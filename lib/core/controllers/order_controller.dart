import 'package:ecom/core/model/product_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<Product> orderList = <Product>[].obs;

  void onMakePaymet(List<Product> list) {
    orderList.addAll(list);
    notifyChildrens();
  }
}
