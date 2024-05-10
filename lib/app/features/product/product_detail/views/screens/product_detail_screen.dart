library product_detail;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:marketplace/app/constans/app_constants.dart';
import 'package:marketplace/app/shared_components/custom_button.dart';
import 'package:marketplace/app/shared_components/custom_icon_button.dart';
import 'package:marketplace/app/shared_components/indicator.dart';
import 'package:marketplace/app/utils/services/rest_api_services.dart';
import 'package:marketplace/app/utils/ui/ui_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// binding
part '../../bindings/product_detail_binding.dart';

// controller
part '../../controllers/product_detail_controller.dart';

// component
part '../components/back_button.dart';
part '../components/favorite_button.dart';
part '../components/buy_button.dart';
part '../components/chat_button.dart';
part '../components/name_text.dart';
part '../components/body_content.dart';
part '../components/description_text.dart';
part '../components/price_text.dart';
part '../components/product_image.dart';
part '../components/rating.dart';
part '../components/review_text.dart';
part '../components/share_button.dart';
part '../components/views_text.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.data.value == null)
            ? Center(child: Text("Product Not Found"))
            : _buildProductDetail(
                product: controller.data.value!,
                // user: controller.dataUser.value!,
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kSpacing / 2),
        child: SizedBox(
            width: 1.sw,
            child: CustomButton(
              label: "Add to Chart",
              onTap: () {},
              textColor: Colors.white,
            )),
      ),
    );
  }

  Widget _buildProductDetail({required Product product}) {
    print(product);
    return Stack(
      children: [
        // DETAIL CONTENT
        SingleChildScrollView(
          controller: controller.scroll,
          child: Column(
            children: [
              Stack(
                children: [
                  // BACKGROUND IMAGES
                  Hero(tag: product.id, child: _ProductImage(product.images)),

                  // BODY
                  _BodyContent(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: kSpacing),
                        _NameText(product.name),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: _PriceText(product.price.toString()),
                            ),
                          ],
                        ),
                        SizedBox(height: kSpacing),
                        _DescriptionText(product.description),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        // HEADER BUTTON
        Obx(
          () => AnimatedOpacity(
            opacity: controller.opacityActionButton.value,
            duration: Duration(milliseconds: 200),
            onEnd: () => controller.onEndAnimationActionButton(),
            child: Visibility(
              visible: controller.isVisibleActionButton.value,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 25.sp,
                ),
                child: Row(
                  children: [
                    _BackButton(onPressed: () => controller.back()),
                    Spacer(),
                    // _FavoriteButton(
                    //   initial: product.isFavorite,
                    //   onChanged: (favorite) {
                    //     controller.changeFavoriteProduct(product, favorite);
                    //   },
                    // ),
                    SizedBox(width: 15.w),
                    _ShareButton(onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
