import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category_model/category_model.dart';
import '../../../providers/category_provider.dart';
import '../../../utils/colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("CATEGORIES", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: [
                SizedBox(height: 10.h,),
                ...List.generate(
                  snapshot.data!.length,
                      (index) {
                    CategoryModel categoryModel = snapshot.data![index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.greenAccent.withOpacity(0.5)
                      ),
                      child: ListTile(
                        onTap: (){

                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(categoryModel.imageUrl,height: 60, width: 60, fit: BoxFit.cover,)),
                        title: Text(categoryModel.categoryName),
                        subtitle: Text(categoryModel.description),
                      ),
                    );
                  },
                ),
              ]
            )
                : const Center(child: Text("Empty!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),));
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