import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model/category_model.dart';
import '../../../providers/category_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import 'add_category/add_category_screen.dart';

class CategoryAdminScreen extends StatefulWidget {
  const CategoryAdminScreen({super.key});

  @override
  State<CategoryAdminScreen> createState() => _CategoryAdminScreenState();
}

class _CategoryAdminScreenState extends State<CategoryAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("CATEGORIES ADmIn", style: TextStyle(
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
                      return CategoryAddScreen();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
      ),

      //
      // AppBar(
      //   title: const Text("Categories Admin"),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) {
      //               return CategoryAddScreen();
      //             },
      //           ),
      //         );
      //       },
      //       icon: const Icon(Icons.add),
      //     )
      //   ],
      // ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  CategoryModel categoryModel = snapshot.data![index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      height: 50.w,
                      width: 50.w,
                      fit: BoxFit.cover,
                      imageUrl: categoryModel.imageUrl,
                      placeholder: (context,
                          url) =>
                      const CupertinoActivityIndicator(),
                      errorWidget: (context,
                          url, error) =>
                      const Icon(
                          Icons.error),
                    ),
                    onLongPress: () {
                      context.read<CategoryProvider>().deleteCategory(
                        context: context,
                        categoryId: categoryModel.categoryId,
                      );
                    },
                    title: Text(categoryModel.categoryName),
                    subtitle: Text(categoryModel.description),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CategoryAddScreen(
                                categoryModel: categoryModel,
                              );
                            },
                          ),
                        );
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