import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/controllers/cart_controller.dart';
import 'package:ecom/core/controllers/order_controller.dart';
import 'package:ecom/ui/commonWids/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.put(CartController());
  OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkSlateGreyColor,
        appBar: AppBar(
          backgroundColor: AppColors.darkGreyColor,
          elevation: 0.0,
          title: const Text("Cart"),
        ),
        body: cartController.cartList.isEmpty
            ? Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor)),
                  child: Text(
                    "Cart is Empty",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Obx(
                () => Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: AppColors.darkSlateGreyColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.71,
                          // padding: const EdgeInsets.symmetric(horizontal: 10),
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: List.generate(
                              cartController.cartList.length, (index) {
                            return ProductTile(
                              remove: true,
                              product: cartController.cartList[index],
                              update: () {
                                cartController.removeFromCart(
                                    cartController.cartList[index]);
                                setState(() {});
                              },
                            );
                          }),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          SnackBar snackBar = SnackBar(
                            content: Text(
                              'Payment Successful',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                          );
                          orderController.onMakePaymet(cartController.cartList);
                          cartController.onMakePayment();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.darkGreyColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Make Payment',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
