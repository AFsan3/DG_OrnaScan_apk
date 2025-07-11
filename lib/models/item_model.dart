import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String model;

  @HiveField(2)
  double weight;

  @HiveField(3)
  String purity; // '22K', '18K', 'Silver', 'Silver ACPL', 'Diamond'

  @HiveField(4)
  double makingCharge;

  @HiveField(5)
  double stoneCharge;

  @HiveField(6)
  double diamondAmount;

  ItemModel({
    required this.name,
    required this.model,
    required this.weight,
    required this.purity,
    this.makingCharge = 0.0,
    this.stoneCharge = 0.0,
    this.diamondAmount = 0.0,
  });
}
