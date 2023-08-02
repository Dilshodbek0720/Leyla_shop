// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../data/models/category_model/category_model.dart';
// import '../../../../providers/category_provider.dart';
// import '../../../auth/widgets/add_global_button.dart';
// import '../../../auth/widgets/add_text_fields.dart';
//
//
// class UpdateCategoryScreen extends StatefulWidget {
//   const UpdateCategoryScreen({super.key, required this.categoryModel});
//
//   final CategoryModel categoryModel;
//
//   @override
//   State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
// }
//
// class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Update Category ",
//           style: TextStyle(fontSize: 24.sp),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView(
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.all(28.h),
//                       child: Text("Category Name",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.black),)),
//                   AddGlobalTextField(
//                       icon: Icon(Icons.drive_file_rename_outline),
//                       hintText: widget.categoryModel.categoryName,
//                       keyboardType: TextInputType.text,
//                       textInputAction: TextInputAction.done,
//                       textAlign: TextAlign.start,
//                       controller: context.read<CategoryProvider>().categoryName),
//                   SizedBox(height: 10.h,),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 28.w),
//                       child: Text("Description",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.black),)),
//                   SizedBox(height: 30.h,),
//                   AddGlobalTextField(
//                       icon: Icon(Icons.description),
//                       hintText: widget.categoryModel.description,
//                       keyboardType: TextInputType.text,
//                       textInputAction: TextInputAction.done,
//                       textAlign: TextAlign.start,
//                       controller: context.read<CategoryProvider>().description),
//                   SizedBox(height: 30.h,),
//                   AddGlobalButton(title: "Save", onTap: (){
//                     context.read<CategoryProvider>().updateCategory(
//                       context: context,
//                       categoryModel: CategoryModel(
//                         categoryId: widget.categoryModel.categoryId,
//                         categoryName: context.read<CategoryProvider>().categoryName.text,
//                         description: context.read<CategoryProvider>().description.text,
//                         imageUrl: "imageUrl",
//                         createdAt: DateTime.now().toString(),
//                       ),
//                     );
//                     Navigator.pop(context);
//                   })
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }