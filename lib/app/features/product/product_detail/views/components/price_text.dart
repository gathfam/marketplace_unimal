part of product_detail;

class _PriceText extends StatelessWidget {
  const _PriceText(this.data, {Key? key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      "Rp ${data}00",
      style: TextStyle(
        // color: Theme.of(context).primaryColor,
        fontSize: 16.sp,
        // fontWeight: FontWeight.bold,
      ),
    ));
  }
}
