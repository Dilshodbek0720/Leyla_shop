import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leyla_shop/ui/tab_admin/product/add_product/add_product_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../data/models/product_model/product_model.dart';
import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class ProductAdminScreen extends StatefulWidget {
  const ProductAdminScreen({super.key});

  @override
  State<ProductAdminScreen> createState() => _ProductAdminScreenState();
}

class _ProductAdminScreenState extends State<ProductAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("PRODUCTS ADmIn", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
        actions: [
        IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductAddScreen();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add),
            )
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductProvider>().getProducts(""),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  ProductModel productModel = snapshot.data![index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      height: 50.w,
                      width: 50.w,
                      fit: BoxFit.cover,
                      imageUrl: productModel.productImages[0],
                      placeholder: (context,
                          url) =>
                      const CupertinoActivityIndicator(),
                      errorWidget: (context,
                          url, error) =>
                      const Icon(
                          Icons.error),
                    ),
                    onLongPress: () {
                      context.read<ProductProvider>().deleteProduct(
                        context: context,
                        productId: productModel.productId,
                      );
                    },
                    title: Text(productModel.productName),
                    subtitle: Text(productModel.description),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductAddScreen(
                            productModel: productModel,
                          );
                        }));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  );
                },
              ),
            )
                : Center(child: Lottie.asset(AppIcons.emptyLottie));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}