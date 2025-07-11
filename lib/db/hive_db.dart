import 'package:hive_flutter/hive_flutter.dart';
import '../models/item_model.dart';
import '../models/rate_model.dart';

class HiveDB {
  static const String itemsBoxName = 'itemsBox';
  static const String rateBoxName = 'rateBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(RateModelAdapter());
    await Hive.openBox<ItemModel>(itemsBoxName);
    await Hive.openBox<RateModel>(rateBoxName);
  }

  // Rate Functions
  static Future<void> saveRate(RateModel rate) async {
    final box = Hive.box<RateModel>(rateBoxName);
    await box.clear();
    await box.add(rate);
  }

  static RateModel? getRate() {
    final box = Hive.box<RateModel>(rateBoxName);
    return box.isNotEmpty ? box.getAt(0) : null;
  }

  // Item Functions
  static Future<void> addItem(ItemModel item) async {
    final box = Hive.box<ItemModel>(itemsBoxName);
    await box.add(item);
  }

  static List<ItemModel> getAllItems() {
    final box = Hive.box<ItemModel>(itemsBoxName);
    return box.values.toList();
  }

  static Future<void> updateItem(int index, ItemModel updatedItem) async {
    final box = Hive.box<ItemModel>(itemsBoxName);
    await box.putAt(index, updatedItem);
  }

  static Future<void> deleteItem(int index) async {
    final box = Hive.box<ItemModel>(itemsBoxName);
    await box.deleteAt(index);
  }

  static void clearAll() {
    Hive.box<ItemModel>(itemsBoxName).clear();
    Hive.box<RateModel>(rateBoxName).clear();
  }
}
