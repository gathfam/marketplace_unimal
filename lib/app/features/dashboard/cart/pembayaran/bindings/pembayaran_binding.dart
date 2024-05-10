part of pembayaran;

class PembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranController>(
      () => PembayaranController(),
    );
  }
}
