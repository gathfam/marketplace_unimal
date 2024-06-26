part of product_detail;

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(
        FontAwesomeIcons.chevronLeft,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: onPressed,
      size: 28.sp,
      borderRadius: 10.sp,
      tooltip: "Back",
    );
  }
}
