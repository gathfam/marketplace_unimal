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
                Divider(),
                _opsiPengiriman(),
                Divider(),
                _metodePembayaran()
              ],
            ),
          ),
          Positioned(bottom: 0, child: _buatPesanan()),
        ],
      ),
    );
  }
}

Widget _opsiPengiriman() {
  return Container(
    width: 1.sw,
    // height: 150.h,
    child: Wrap(
      direction: Axis.vertical,
      spacing: 5.sp,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Opsi Pengiriman",
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reguler",
              style: TextStyle(fontSize: 12.sp),
            ),
            Container(
              width: 0.86.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Akan diterima pada tanggal 21-25 Juni",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                  ),
                  Text(
                    "Rp. 30.000",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _metodePembayaran() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Metode Pembayaran",
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
      ),
      Column(
        children: [
          RadioListTile<String>(
            title: Text(
              'COD',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            value: 'COD',
            groupValue: "COD",
            onChanged: (value) {},
          ),
          // RadioListTile<String>(
          //   title: Text(
          //     'OVO',
          //     style: TextStyle(
          //       fontSize: 12.sp,
          //     ),
          //   ),
          //   value: 'OVO',
          //   groupValue: "ovo",
          //   onChanged: (value) {},
          // ),
          // RadioListTile<String>(
          //   title: Text(
          //     'Alfamart',
          //     style: TextStyle(
          //       fontSize: 12.sp,
          //     ),
          //   ),
          //   value: 'Alfamart',
          //   groupValue: "alfamart",
          //   onChanged: (value) {},
          // ),
        ],
      ),
    ],
  );
}

Widget _buatPesanan() {
  return Container(
    padding: EdgeInsets.all(25.sp),
    width: 1.sw,
    height: 100.h,
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
    // return Text("TES");
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: List.generate(data.length, (int index) {
          // print(data[index]);
          return ItemPembayaran(
            heroTag: data[index].id_produk,
            data: ItemPembayaranData(
              id: index,
              image: data[index].gambar_produk[0],
              initialFavorite: true,
              brand: data[index].merk_produk,
              name: data[index].nama_produk,
              price: data[index].harga,
            ),
            onTap: () {
              // onPressed(data[index]);
            },
          );
        }));
  }
}
