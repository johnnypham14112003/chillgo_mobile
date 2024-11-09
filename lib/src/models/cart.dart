class Cart {
  double totalAmount;
  double discount;
  double totalPay;
  List<dynamic> items;

  Cart({
    required this.totalAmount,
    required this.totalPay,
    this.discount = 2000,
    required this.items,
  });
}
