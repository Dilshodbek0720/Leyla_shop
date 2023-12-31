import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../../../../data/models/category_model/category_model.dart';
import '../../../../providers/category_provider.dart';
import '../../../../utils/colors.dart';
import '../../../auth/widgets/add_global_button.dart';
import '../../../auth/widgets/add_text_fields.dart';

class CategoryAddScreen extends StatefulWidget {
  CategoryAddScreen({super.key, this.categoryModel});

  CategoryModel? categoryModel;

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    if (widget.categoryModel != null) {
      context.read<CategoryProvider>().setInitialValues(widget.categoryModel!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<CategoryProvider>(context, listen: false).clearTexts();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: Text(
            widget.categoryModel == null ? "Category Add" : "Category Update",
            style: TextStyle(
              fontFamily: "Cinzel",
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.C_01AA4F,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .clearTexts();
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  AddGlobalTextField(
                      hintText: "Name",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: context
                          .read<CategoryProvider>()
                          .categoryNameController),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 200,
                    child: AddGlobalTextField(
                        maxLine: 100,
                        hintText: "Description",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: context
                            .read<CategoryProvider>()
                            .categoryDescController),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: TextButton(
                      onPressed: () {
                        showBottomSheetDialog();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).indicatorColor),
                      child: context
                              .watch<CategoryProvider>()
                              .categoryUrl
                              .isEmpty
                          ? const Text(
                              "Image Not Selected",
                              style: TextStyle(color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Image.network(
                              context.watch<CategoryProvider>().categoryUrl),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: AddGlobalButton(
                  title: widget.categoryModel == null
                      ? "Add category"
                      : "Update Category",
                  onTap: () {
                    if (widget.categoryModel == null) {
                      context.read<CategoryProvider>().addCategory(
                            context: context,
                          );
                    } else {
                      context.read<CategoryProvider>().updateCategory(
                          context: context,
                          currentCategory: widget.categoryModel!);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      print("VBNKM<");
      await Provider.of<CategoryProvider>(context, listen: false)
          .uploadCategoryImage(context, xFile);
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      await Provider.of<CategoryProvider>(context, listen: false)
          .uploadCategoryImage(context, xFile);
    }
  }
}
