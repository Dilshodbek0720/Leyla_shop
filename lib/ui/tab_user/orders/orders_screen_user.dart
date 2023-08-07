import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leyla_shop/utils/icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../data/models/order_model/order_model.dart';
import '../../../providers/order_provider.dart';
import '../../../utils/colors.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("ORDERS", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: context
            .read<OrderProvider>()
            .listenOrdersList(FirebaseAuth.instance.currentUser!.uid),
        builder:
            (BuildContext context, AsyncSnapshot<List<OrderModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? Column(
                  children: [
                    Expanded(
                      child: ListView(
              children: List.generate(
                      snapshot.data!.length,
                          (index) {
                        OrderModel orderModel = snapshot.data![index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.greenAccent.withOpacity(0.5)
                          ),
                          child: ListTile(
                            title: Text(orderModel.productName),
                            subtitle: Text("Count: ${orderModel.count.toString()}"),
                            trailing: IconButton(onPressed: (){
                              Provider.of<OrderProvider>(context, listen: false).deleteOrder(context: context, orderId: orderModel.orderId);
                            }, icon: Icon(Icons.delete))
                        ));
                      },
              ),
            ),
                    ),
                    // Container(
                    //   height: 60.h,
                    //   width: double.infinity,
                    //   padding: EdgeInsets.all(10.sp),
                    //   margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 10.h),
                    //   decoration: BoxDecoration(
                    //     color: Colors.greenAccent.withOpacity(0.2),
                    //     border: Border.all(width: 1, color: Colors.green),
                    //     borderRadius: BorderRadius.circular(16.r)
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text("Umumiy summa: ", style: TextStyle(
                    //         fontSize: 20
                    //       ),),
                    //       Text(context.read<OrderProvider>().sum.toString(), style: TextStyle(
                    //           fontSize: 20
                    //       ),),
                    //     ],
                    //   ),
                    // )
                  ],
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