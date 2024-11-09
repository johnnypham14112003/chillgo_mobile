import 'package:chillgo_mobile/src/data/api_client.dart';

class CartRepository {
  static final CartRepository _instance = CartRepository._();
  factory CartRepository() {
    return _instance;
  }
  CartRepository._();

  Future createPackageTransaction(
      {required String accountId,
      required String packageId,
      int chillCoinApplied = 0,
      required String payMethod,
      required double totalPrice,
      String? startDate,
      String? endDate,
      String? voucherCodeList,
      String? status}) async {
    final startDate = DateTime.now();
    final endDate = DateTime.now().add(const Duration(days: 30));
    final response = await apiClient.post('package-transaction', body: {
      "account-id": accountId,
      "package-id": packageId,
      "chill-coin-applied": chillCoinApplied,
      "pay-method": payMethod,
      "total-price": totalPrice,
      "start-date": startDate.toString(),
      "end-date": endDate.toString(),
      "voucher-code-list": "string",
      "status": status
    });

    return response;
  }
}
