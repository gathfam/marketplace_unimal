library cart;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marketplace/app/shared_components/custom_button.dart';

part '../controllers/cart_controller.dart';
part '../bindings/cart_binding.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(fontSize: 12.sp),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(25.sp),
                width: 1.sw,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.sp),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Color(0xFFBA704F), Colors.white])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          "Rp0.,-",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 0.4.sw,
                        child: CustomButton(
                          label: "Check Out",
                          onTap: () {
                            // Get.toNamed("/dashboard");
                          },
                          textColor: Colors.white,
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
