import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/constants/app_constants.dart';
import 'package:ecom/core/model/product_model.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatefulWidget {
  final Product? product;

  OrderTile({
    @required this.product,
  });

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  String snackBarText = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // This ontap will lead to product description page
        print("Product description called");
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.darkGreyColor,
        ),
        height: 110,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                widget.product!.imageUrl!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            AppConstant.sizer(context: context, h: 0.0, w: 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.sizer(context: context, h: 0.03, w: 0.0),
                Text(
                  widget.product!.productName!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                AppConstant.sizer(context: context, h: 0.02, w: 0.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    "₹ " + widget.product!.price!,
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
