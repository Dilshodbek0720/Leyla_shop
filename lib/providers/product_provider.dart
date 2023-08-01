import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/firebase/product_service.dart';
import '../data/models/product_model/product_model.dart';
import '../data/models/universal_data.dart';
import '../utils/ui_utils/loading_dialog.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider({required this.productService});

  final ProductService productService;

  final TextEditingController productName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController count = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController currency = TextEditingController();


  Future<void> addProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {

    showLoading(context: context);
    UniversalData universalData =
    await productService.addProduct(productModel: productModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
    productName.clear();
    description.clear();
    count.clear();
    price.clear();
    currency.clear();
  }

  Future<void> updateProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
    await productService.updateProduct(productModel: productModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }

    productName.clear();
    description.clear();
    count.clear();
    price.clear();
    currency.clear();

  }

  Future<void> deleteProduct({
    required BuildContext context,
    required String productId,
  }) async {

    showLoading(context: context);

    UniversalData universalData =
    await productService.deleteProduct(productId: productId);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Stream<List<ProductModel>> getProducts() =>
      FirebaseFirestore.instance.collection("products").snapshots().map(
            (event1) => event1.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );

  Stream<List<ProductModel>> getProduct({required String categoryId})async*{
    if(categoryId.isEmpty){
      yield* FirebaseFirestore.instance.collection('products').snapshots().map(
              (querySnapshot) => querySnapshot.docs
                  .map((doc) => ProductModel.fromJson(doc.data())).toList()
      );
    }else{
      yield* FirebaseFirestore.instance.collection("products").where("categoryId", isEqualTo: categoryId)
          .snapshots().map((querySnapshot) => querySnapshot.docs.map((doc) =>
      ProductModel.fromJson(doc.data())).toList()
      );
    }
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    notifyListeners();
  }
}