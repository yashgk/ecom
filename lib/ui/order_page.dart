import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/controllers/order_controller.dart';
import 'package:ecom/ui/commonWids/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return orderController.orderList.isEmpty
        ? Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor)),
              child: Text(
                "No Orders",
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
              decoration: BoxDecoration(color: AppColors.darkSlateGreyColor),
              child: ListView.builder(
                  itemCount: orderController.orderList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderTile(
                      product: orderController.orderList[index],
                    );
                  }),
            ),
          );
  }
}
