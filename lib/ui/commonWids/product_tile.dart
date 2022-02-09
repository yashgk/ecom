import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/constants/app_constants.dart';
import 'package:ecom/core/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Product? product;
  final Function? update;
  final bool? remove;
  ProductTile({
    @required this.product,
    @required this.update,
    @required this.remove,
  });

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
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.asset(
                  widget.product!.imageUrl!,
                  height: 150,
                  width: 175,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppConstant.sizer(context: context, h: 0.01, w: 0.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product!.productName!,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            AppConstant.sizer(context: context, h: 0.01, w: 0.0),
            Row(
              children: [
                // AppConstant.sizer(context: context, h: 0.0, w: 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
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
                  onTap: () async {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                        widget.remove! ? 'Removed from Cart' : 'Added to Cart.',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 2),
                    );
                    widget.update!();

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.darkSlateGreyColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: widget.remove!
                        ? Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.whiteColor,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          borderRadius: BorderRadius.circular(5),
          color: AppColors.darkGreyColor,
        ),
      ),
    );
  }
}
