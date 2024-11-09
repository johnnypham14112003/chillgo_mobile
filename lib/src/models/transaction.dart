class Transaction {
  String id;
  String accountId;
  String packageId;
  int chillCoinApplied;
  String payMethod;
  double totalPrice;
  String startDate;
  String endDate;
  String status;

  Transaction(
      {required this.id,
      required this.accountId,
      required this.packageId,
      required this.chillCoinApplied,
      required this.payMethod,
      required this.totalPrice,
      required this.startDate,
      required this.endDate,
      required this.status});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      accountId: map['account-id'],
      packageId: map['package-id'],
      chillCoinApplied: map['chill-coin-applied'],
      payMethod: map['pay-method'],
      totalPrice: map['total-price'].toDouble(),
      startDate: map['start-date'],
      endDate: map['end-date'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account-id'] = accountId;
    data['package-id'] = packageId;
    data['chill-coin-applied'] = chillCoinApplied;
    data['pay-method'] = payMethod;
    data['total-price'] = totalPrice;
    data['start-date'] = startDate;
    data['end-date'] = endDate;
    data['status'] = status;
    return data;
  }
}
