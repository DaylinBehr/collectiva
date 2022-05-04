class Item {
  String? id;
  String? name;
  String? description;
  String? image;
  String? price;
  String? category;
  String? subCategory;
  String? brand;
  String? color;
  String? size;
  String? quantity;
  Map<String?,String?>? fields;


  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.category,
    this.subCategory,
    this.brand,
    this.color,
    this.size,
    this.quantity,
    this.fields,
  });

static Item? fromDataMap(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      subCategory: json['subCategory'],
      brand: json['brand'],
      color: json['color'],
      size: json['size'],
      quantity: json['quantity'],
      fields: json['fields'],
    );
  }

  toJsonMap() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['brand'] = brand;
    data['color'] = color;
    data['size'] = size;
    data['quantity'] = quantity;
    data['fields'] = fields;
    return data;
  }
}