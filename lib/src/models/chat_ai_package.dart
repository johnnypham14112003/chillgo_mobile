class ChatAiPackage {
  String id;
  String code;
  String name;
  String description;
  double price;
  int duration;
  String status;
  ChatAiPackage({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'duration': duration,
      'status': status,
    };
  }

  factory ChatAiPackage.fromMap(Map<String, dynamic> map) {
    return ChatAiPackage(
      id: map['id'] as String,
      code: map['code'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      duration: map['duration'] as int,
      status: map['status'] as String,
    );
  }
}


