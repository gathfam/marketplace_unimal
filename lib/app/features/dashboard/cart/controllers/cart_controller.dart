part of cart;

class CartController extends GetxController {
  //TODO: Implement CartController

  final productService = ProductService();

  Item1() => productService.getListCart();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
