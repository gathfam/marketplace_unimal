library home;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:marketplace/app/config/routes/app_pages.dart';
import 'package:marketplace/app/constans/app_constants.dart';
import 'package:marketplace/app/shared_components/product_card.dart';
import 'package:marketplace/app/utils/services/rest_api_services.dart';

part '../controllers/home_controller.dart';
part '../bindings/home_binding.dart';
part '../../home/components/product_content.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(25.sp),
      ),
    ));
  }
}
