part of home;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final productService = ProductService();

  List<Product> getAllProduct() => productService.getAll();
  List<Product> getFashionProduct() => productService.getFashion();

  void goToDetailProduct(Product product) {
    // print(product);
    Get.toNamed(Routes.product + "/${product.id}");
  }

  void OpenDialogAds() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        AlertDialog(
          backgroundColor:
              Colors.transparent, // Set background color to transparent
          contentPadding: EdgeInsets.zero, // Remove default padding
          content: Stack(
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('X'),
              ),
              SizedBox(
                // height: 200,
                child: Image.asset(
                  "assets/images/adsBanner.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void onInit() {
    OpenDialogAds();
    super.onInit();
  }
}
