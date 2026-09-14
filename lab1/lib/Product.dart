class Product {
  final String id;
  final String name;
  final double price;
  final int quatity;
  final String? description;
  final String? image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quatity,
    this.description,
    this.image
  });

  //copyWith: Tạo bản sao của đối tượng Product với các thuộc tính được chỉ định
  Product copyWith({String? id, String? name, double? price, int? quatity, String? description, String? image}){
    return new Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quatity: quatity ?? this.quatity,
      description: description ?? this.description,
      image: image ?? this.image
    );
  }

  //fromJson: Khởi tạo đối tượng Product từ 1 bản đồ dữ liệu (Map<String, dynamic>)
  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quatity: json['quatity'] as int? ?? 0 ,
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  //toJson: Chuyển đổi đối tượng Product thành 1 bản đồ dữ liệu (Map<String, dynamic>),
  //Ngược lại của fromJson
  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quatity,
      'description': description,
      'image': image
    };
  }

  //
}