part of rest_api_service;

/// FAKE PRODUCT SERVICE
// put all custom setup in RestApiService (duration timeout, exception handling , etc..)
// and extend restApiService, if you need custom service provider
class ProductService extends RestApiServices {
  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }
  ProductService._internal();

  Product? getProductByID(String id) {
    final allProduct = getAll();
    final result = allProduct.where((product) => product.id == id).toList();
    return (result.length > 0) ? result[0] : null;
  }

  List<Product> getAll() {
    return [
      EminaLipmask,
      EminaPowder,
      EminaSerum
    ];
  }

  List<Product> getListCart(){
    return [
      EminaLipmask
    ];
  }
  List<Product> getListPembayaran(){
    return [
      EminaLipmask
    ];
  }

  List<Product> getListOrder(){
    return [
      EminaLipmask
    ];
  }

  List<Product> getFashion() {
    return [];
  }

  final EminaLipmask = Product(
    id: "35366",
    images: [AssetImage(ImageEtalasePath.EminaLipmask)],
    brand: "Emina",
    name: "Lipmask",
    price: 30,
    description:
        "Lorem ipsum At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  );
  final EminaPowder = Product(
    id: "35367",
    images: [AssetImage(ImageEtalasePath.EminaPowder)],
    brand: "Emina",
    name: "Powder",
    price: 25,
    description:
        "Lorem ipsum At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  );
  final EminaSerum = Product(
    id: "35368",
    images: [AssetImage(ImageEtalasePath.EminaSerum)],
    brand: "Emina",
    name: "Serum",
    price: 40,
    description:
        "Lorem ipsum At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
  );
}
