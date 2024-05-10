import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marketplace/app/shared_components/custom_button.dart';
import 'package:marketplace/app/shared_components/input_field.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: 1.sh,
        width: 1.sw,
        padding: EdgeInsets.all(25.sp),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 26.sp,
                    color: Color(0xFFBA704F),
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  // height: 150.h,
                  child: Image.asset(
                    "assets/images/logo.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InputField(label: "Nama", controller: controller.nama),
                SizedBox(
                  height: 15.sp,
                ),
                InputField(label: "Email", controller: controller.email),
                SizedBox(
                  height: 15.sp,
                ),
                InputField(label: "Username", controller: controller.username),
                SizedBox(
                  height: 15.sp,
                ),
                InputField(label: "Password", controller: controller.password),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: 1.sw,
                    child: CustomButton(
                      label: "Register",
                      onTap: () {
                        Get.toNamed("/dashboard");
                      },
                      textColor: Colors.white,
                    )),
                SizedBox(
                  height: 15.sp,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
