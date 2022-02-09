import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/controllers/cart_controller.dart';
import 'package:ecom/ui/cart_page.dart';
import 'package:ecom/ui/order_page.dart';
import 'package:ecom/ui/store_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [StorePage(), OrderPage()];
  int selectedIndex = 0;
  CartController cartController = Get.put(CartController());
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkSlateGreyColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.darkGreyColor,
          elevation: 0.0,
          title: const Text('E-Com'),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    icon: const Icon(Icons.shopping_cart)),
                Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                      height: 18,
                      width: 18,
                      child: Obx(() => Text(
                            cartController.cartList.length.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ))
              ],
            )
          ],
        ),
        body: Container(
          child: pages.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: 'Store',
              activeIcon: Icon(Icons.store),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Orders',
              activeIcon: Icon(Icons.shopping_bag),
            )
          ],
          currentIndex: selectedIndex,
          backgroundColor: AppColors.darkGreyColor,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.darkSlateGreyColor,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => onItemTapped(index),
        ),
      ),
    );
  }
}
