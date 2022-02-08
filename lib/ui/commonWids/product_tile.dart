import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/constants/app_constants.dart';
import 'package:ecom/core/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Product? product;
  final Function? update;
   ProductTile({@required this.product, @required this.update});

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  String snackBarText = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // This ontap will lead to product description page
        print("Product description called");
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.product!.imageUrl!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppConstant.sizer(context: context, h: 0.01, w: 0.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.product!.productName!,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            AppConstant.sizer(context: context, h: 0.01, w: 0.0),
            Row(
              children: [
                AppConstant.sizer(context: context, h: 0.0, w: 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text(
                    "₹ " + widget.product!.price!,
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  widget.product!.rating!,
                  style: TextStyle(
                      color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
                AppConstant.sizer(context: context, h: 0.0, w: 0.03),
              ],
            ),
            AppConstant.sizer(context: context, h: 0.01, w: 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppColors.darkSlateGreyColor,
                    ),
                  ),
                ),
                AppConstant.sizer(context: context, h: 0.0, w: 0.005),
                InkWell(
                  onTap: () async {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                        'Added to Cart.',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: AppColors.darkGreyColor,
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: AppColors.darkSlateGreyColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: AppColors.whiteColor,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.darkGreyColor,
        ),
      ),
    );
  }
}
