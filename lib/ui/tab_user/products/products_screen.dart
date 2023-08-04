import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leyla_shop/ui/tab_user/products/widgets/grid_view_item.dart';
import 'package:leyla_shop/ui/tab_user/products/widgets/product_deteil_screen.dart';
import 'package:leyla_shop/ui/tab_user/products/widgets/category_item_view.dart';
import 'package:leyla_shop/ui/tab_user/products/widgets/product_item_view.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/category_model/category_model.dart';
import '../../../data/models/product_model/product_model.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String selectedCategoryId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("PRODUCTS", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          StreamBuilder<List<CategoryModel>>(
            stream: context.read<CategoryProvider>().getCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CategoryModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItemView(
                        categoryModel: CategoryModel(
                          categoryId: "",
                          description: "",
                          categoryName: "All",
                          imageUrl: "",
                          createdAt: "",
                        ),
                        onTap: () {
                          setState(() {
                            selectedCategoryId = "";
                          });
                        },
                        selectedId: selectedCategoryId,
                      ),
                      ...List.generate(
                        snapshot.data!.length,
                            (index) {
                          CategoryModel categoryModel =
                          snapshot.data![index];
                          return CategoryItemView(
                            categoryModel: categoryModel,
                            onTap: () {
                              setState(() {
                                selectedCategoryId =
                                    categoryModel.categoryId;
                              });
                            },
                            selectedId: selectedCategoryId,
                          );
                        },
                      )
                    ],
                  ),
                )
                    : const Center(child: Text("Empty!"));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          StreamBuilder<List<ProductModel>>(
            stream: context
                .read<ProductProvider>()
                .getProducts(selectedCategoryId),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? Expanded(
                  child: StreamBuilder<List<ProductModel>>(
                    stream: context
                        .read<ProductProvider>()
                        .getProducts(selectedCategoryId),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProductModel>> snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!.isNotEmpty
                            ? GridView(
                          padding: EdgeInsets.all(15.sp),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.6),
                              children: [
                                ...List.generate(
                                    snapshot.data!.length, (index) {
                                  ProductModel productModel =
                                  snapshot.data![index];
                                  return GridviewItem(
                                    onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                              productModel:
                                              productModel,
                                              index: index,
                                            ),
                                      ),
                                    );
                                  },
                                    index: index,
                                    isActive: true,
                                    productModel: productModel,
                                  );
                                })
                              ],
                            )
                            : const Center(
                          child: Text(
                            "Product Empty!",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      return const Center(
                          child: CircularProgressIndicator());
                    },
                  ),
                )
                    : const Center(child: Text("Product Empty!"));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}