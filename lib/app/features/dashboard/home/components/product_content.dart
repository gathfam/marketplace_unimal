part of home;

class _ProductContent extends StatelessWidget {
  const _ProductContent(this.data, {required this.onPressed, Key? key})
      : super(key: key);

  final List<Product> data;
  final Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    print(data);
    // return Text("TES");
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: List.generate(data.length, (int index) {
          // print(data[index]);
          return ProductCard(
            heroTag: data[index].id,
            data: ProductCardData(
              id: index,
              image: data[index].images[0],
              initialFavorite: true,
              brand: data[index].brand,
              name: data[index].name,
              price: data[index].price,
            ),
            onTap: () {
              onPressed(data[index]);
            },
          );
        }));
  }
}
