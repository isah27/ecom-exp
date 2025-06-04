import 'dart:developer';

class ProductModel {
  final dynamic id, name, price, description, imageUrl;
  final int quantity;
  ProductModel({
    this.id,
    this.name,
    this.quantity = 1,
    this.price,
    this.description,
    this.imageUrl,
  });
  bool favorite = false;
  String get removeNewLine {
    return name.toString().replaceAll("\n", " ");
  }

  num get amount {
    final removeCurrency = price.toString().replaceAll(RegExp(r'[^0-9.]'), '');
    log("removeCurrency: $removeCurrency");
    return double.tryParse(removeCurrency) ?? 0.0;
  }
}
