import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyla_shop/data/models/product_model/product_model.dart';
import 'package:leyla_shop/utils/colors.dart';
import 'package:leyla_shop/utils/icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GridviewItem extends StatelessWidget {
  const GridviewItem({super.key, required this.onTap, required this.index, required this.productModel, required this.isActive});
  final VoidCallback onTap;
  final int index;
  final bool isActive;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
                16),
            color: Colors.white,
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
              offset: Offset(0,7)
          )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Hero(
                  tag: index,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius
                          .circular(16),
                      child:
                      CachedNetworkImage(
                        height: 170.w,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: productModel
                            .productImages
                            .first,
                        placeholder: (context,
                            url) =>
                        const CupertinoActivityIndicator(),
                        errorWidget: (context,
                            url, error) =>
                        const Icon(
                            Icons.error),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10.w,
                    top: 10.w,
                    child: SizedBox(height: 27.w,width: 27.w,child: SvgPicture.asset(isActive?AppIcons.activeLike:AppIcons.passiveLike),))
              ],
            ),
            SizedBox(height: 7),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .center,
              children: [
                Text(
                  productModel
                      .productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight:
                      FontWeight
                          .w500),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    productModel
                        .description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.C_878788,
                        fontWeight:
                        FontWeight.w500),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Price: ${productModel.price} ${productModel.currency}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.C_878788,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 1),
                Text(
                  "Count: ${productModel.count}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.C_878788,
                      fontWeight:
                      FontWeight
                          .w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
