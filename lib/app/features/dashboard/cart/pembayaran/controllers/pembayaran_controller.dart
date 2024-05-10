part of pembayaran;

class PembayaranController extends GetxController {
  //TODO: Implement PembayaranController
  final productService = ProductService();

  GetItemPembayaran() => productService.getListPembayaran();
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
