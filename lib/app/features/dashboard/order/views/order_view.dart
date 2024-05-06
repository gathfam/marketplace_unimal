library order;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

part '../controllers/order_controller.dart';
part '../bindings/order_binding.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order',
            style: TextStyle(fontSize: 12.sp),
          ),
          centerTitle: true,
        ),
        body: Container());
  }
}
