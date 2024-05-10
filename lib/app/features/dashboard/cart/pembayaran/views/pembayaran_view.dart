library pembayaran;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marketplace/app/shared_components/custom_button.dart';
import 'package:marketplace/app/shared_components/dashed_line.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:marketplace/app/shared_components/item_pembayaran.dart';
import 'package:marketplace/app/utils/services/rest_api_services.dart';

part "../controllers/pembayaran_controller.dart";
part "../bindings/pembayaran_binding.dart";

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            padding: EdgeInsets.all(25.sp),
            child: Wrap(
              runSpacing: 15.sp,
              children: [
                _alamatPengiriman(),
                DottedLine(
                  direction: Axis
                      .horizontal, // Change to Axis.vertical for vertical line
                  lineLength:
                      double.infinity, // Ensures line spans the entire width
                  lineThickness: 2.0,
                  dashColor: Color(0xFFBA704F),
                  dashLength: 10.sp,
                  dashGapLength: 10.sp,
                  // gap: 5.0,
                  // color: Colors.grey,
                ),
                _ProductContent(controller.GetItemPembayaran()),
              ],
            ),
          ),
          Positioned(bottom: 0, child: _buatPesanan()),
        ],
      ),
    );
  }
}

Widget _buatPesanan() {
  return Container(
    padding: EdgeInsets.all(25.sp),
    width: 1.sw,
    height: 100.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.sp),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Pembayaran",
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              "Rp0.,-",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
            width: 0.4.sw,
            child: CustomButton(
              label: "Buat pesanan",
              onTap: () {
                Get.toNamed("/pembayaran");
              },
              textColor: Colors.white,
            )),
      ],
    ),
  );
}

Widget _alamatPengiriman() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.location_on_sharp),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "Alamat Pengiriman",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        height: 8.h,
      ),
      Text(
        "Kelompok 4 | (+62) 8xx-xxxx-xxxx \nBlang Pulo, Muara Satu, Kota \nLhokseumawe, NAD, 22154",
        style: TextStyle(fontSize: 12.sp),
      )
    ],
  );
}

class _ProductContent extends StatelessWidget {
  const _ProductContent(this.data, {Key? key}) : super(key: key);

  final List<Product> data;
  // final Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    print(data);
    // return Text("TES");
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: List.generate(data.length, (int index) {
          // print(data[index]);
          return ItemPembayaran(
            heroTag: data[index].id,
            data: ItemPembayaranData(
              id: index,
              image: data[index].images[0],
              initialFavorite: true,
              brand: data[index].brand,
              name: data[index].name,
              price: data[index].price,
            ),
            onTap: () {
              // onPressed(data[index]);
            },
          );
        }));
  }
}
