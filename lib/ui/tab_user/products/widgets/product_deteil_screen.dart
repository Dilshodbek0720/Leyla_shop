import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/models/order_model/order_model.dart';
import '../../../../data/models/product_model/product_model.dart';
import '../../../../providers/order_provider.dart';
import '../../../../utils/colors.dart';
import '../../../auth/widgets/add_global_button.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(
      {super.key, required this.productModel, required this.index});

  final ProductModel productModel;
  final int index;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("PRODUCT", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                SizedBox(height: 20.h,),
                CarouselSlider(
                  items: List.generate(widget.productModel.productImages.length, (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 0,
                            )
                          ]
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.productModel.productImages[index],
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  )), options: CarouselOptions(
                    autoPlay: true,
                    height: 350.h,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true
                ),),
                // Container(
                //   child: Hero(
                //     tag: widget.index,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(25.r),
                //       child: CachedNetworkImage(
                //         height: 350.h,
                //         width: 350.h,
                //         fit: BoxFit.cover,
                //         imageUrl: widget.productModel.productImages.first,
                //         placeholder: (context, url) =>
                //         const CupertinoActivityIndicator(),
                //         errorWidget: (context, url, error) =>
                //         const Icon(Icons.error),
                //       ),
                //     ),
                //   ),
                //   margin: EdgeInsets.all(37.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(25.r),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.4),
                //         blurRadius: 6,
                //         spreadRadius: 1,
                //       )
                //     ]
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Text(
                    widget.productModel.productName,
                    style: TextStyle(
                        fontSize: 32.spMin,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Text(
                    widget.productModel.description,
                    style: TextStyle(
                        fontSize: 22.spMin,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Text(
                    "Count: ${widget.productModel.count}",
                    style: TextStyle(
                        fontSize: 22.spMin,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Text(
                    "Price: ${widget.productModel.price} ${widget.productModel.currency}",
                    style: TextStyle(
                        fontSize: 22.spMin,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 195.w, right: 40.w, bottom: 10.h, top: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.greenAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (count > 1) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                        ),
                      ),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {
                            if ((count + 1) <= widget.productModel.count) {
                              setState(() {
                                count++;
                              });
                            }
                          },
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Text(
                    "Total price: ${widget.productModel.price * count}.   ${widget.productModel.currency}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20.h,)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: AddGlobalButton(
              onTap: () {
                Provider.of<OrderProvider>(context, listen: false).addOrder(
                  context: context,
                  orderModel: OrderModel(
                    count: count,
                    totalPrice: widget.productModel.price * count,
                    orderId: "",
                    productId: widget.productModel.productId,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    orderStatus: "ordered",
                    createdAt: DateTime.now().toString(),
                    productName: widget.productModel.productName,
                  ),
                );
              },
              title: "Add to Card",
            ),
          ),
          SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}