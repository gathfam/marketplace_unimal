part of product_detail;

class _NameText extends StatelessWidget {
  const _NameText(this.data, {Key? key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20.sp,
      ),
      textAlign: TextAlign.left,
    );
  }
}
