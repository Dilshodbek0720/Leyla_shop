import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model/category_model.dart';
import '../../../providers/category_provider.dart';
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
        title: const Text("Categories Admin"),
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
                    leading: Image.network(
                      categoryModel.imageUrl,
                      width: 50,
                      height: 50,
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
    );
  }
}