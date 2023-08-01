import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model/product_model.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Product detail screen"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              SizedBox(height: 10.h,),
              Container(
                padding: EdgeInsets.all(20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Image.network(widget.productModel.productImages.first,height: MediaQuery.of(context).size.height*.5,)),
              ),
              SizedBox(height: 30.h,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Product name  ",style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
                  Text(widget.productModel.productName,style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
                ],
              ),),
              SizedBox(height: 30.h,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Description  ",style: TextStyle(fontSize: 18.spMin,fontWeight: FontWeight.w500),),
                  Text(widget.productModel.description,style: TextStyle(fontSize: 18.spMin,fontWeight: FontWeight.w500),),
                ],
              ),),
              SizedBox(height: 30.h,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Price: ",style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
                  Text(widget.productModel.price.toString(),style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              ),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Currency",style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
                  Text(widget.productModel.currency,style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              ),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Created at",style: TextStyle(fontSize: 16.spMin,fontWeight: FontWeight.w300),),
                  Text(widget.productModel.createdAt,style: TextStyle(fontSize: 16.spMin,fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}