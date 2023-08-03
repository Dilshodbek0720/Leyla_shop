import 'package:flutter/material.dart';
import 'package:leyla_shop/utils/colors.dart';

import '../../../../data/models/category_model/category_model.dart';


class CategoryItemView extends StatelessWidget {
  const CategoryItemView({super.key, required this.categoryModel, required this.onTap, required this.selectedId});

  final CategoryModel categoryModel;
  final VoidCallback onTap;
  final String selectedId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            spreadRadius: 1,
            blurRadius: 6,
            color: AppColors.black.withOpacity(0.1)
          )],
          borderRadius: BorderRadius.circular(10),
          color: selectedId ==
              categoryModel.categoryId
              ? Colors.green
              : Colors.white,
        ),
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            categoryModel.categoryName,
            style: TextStyle(
              color: selectedId ==
                  categoryModel.categoryId
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}