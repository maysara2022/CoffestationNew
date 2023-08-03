class SellerModel {
  String sellerType;
  String productType;
  String idNumber;
  String idExpDate;

  // String urlIdImg;
  // String urlCommercialHistoryImg;
  // String urlLicenseImg;

  SellerModel({
    required this.sellerType,
    required this.productType,
    required this.idNumber,
    required this.idExpDate,
    // required this.urlIdImg,
    // required this.urlCommercialHistoryImg,
    // required this.urlLicenseImg,
  });

  // Method to convert data to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'sellerType': sellerType,
      'productType': productType,
      'idNumber': idNumber,
      'idExpDate': idExpDate,
    };
  }
}
