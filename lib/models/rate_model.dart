class RateModel {
  double rate22k;
  double rate18k;
  double silverRate;
  double silverACPLRate;
  double diamondAmount;

  RateModel({
    required this.rate22k,
    required this.rate18k,
    required this.silverRate,
    required this.silverACPLRate,
    required this.diamondAmount,
  });

  factory RateModel.empty() {
    return RateModel(
      rate22k: 0.0,
      rate18k: 0.0,
      silverRate: 0.0,
      silverACPLRate: 0.0,
      diamondAmount: 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate22k': rate22k,
      'rate18k': rate18k,
      'silverRate': silverRate,
      'silverACPLRate': silverACPLRate,
      'diamondAmount': diamondAmount,
    };
  }

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      rate22k: json['rate22k'] ?? 0.0,
      rate18k: json['rate18k'] ?? 0.0,
      silverRate: json['silverRate'] ?? 0.0,
      silverACPLRate: json['silverACPLRate'] ?? 0.0,
      diamondAmount: json['diamondAmount'] ?? 0.0,
    );
  }
}
