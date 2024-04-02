library login;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketplace/app/shared_components/custom_button.dart';
import 'package:marketplace/app/shared_components/input_field.dart';

// binding
part '../../bindings/login_binding.dart';

// controller
part '../../controllers/login_controller.dart';

// model

// component

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return MaterialApp(
      // Add MaterialApp as the ancestor
      home: Scaffold(
        // Wrap your SafeArea with Scaffold
        body: SafeArea(
          child: Container(
            height: 1.sh,
            padding: EdgeInsets.all(25.0),
            color: Colors.white,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 250.h,
                  child: Image.asset(
                    "assets/images/logo.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    InputField(label: "Email", controller: controller.username),
                    SizedBox(
                      height: 15.sp,
                    ),
                    InputField(
                        label: "Password", controller: controller.password),
                  ],
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 1.sw,
                        child: CustomButton(
                          label: "Login",
                          onTap: () {},
                          textColor: Colors.white,
                        )),
                    SizedBox(
                      height: 15.sp,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Daftar',
                            style: TextStyle(
                              color: Color(0xFFBA704F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
