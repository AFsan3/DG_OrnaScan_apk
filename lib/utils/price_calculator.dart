import '../models/item_model.dart';
import '../models/rate_model.dart';

class PriceCalculator {
  static double calculatePrice(ItemModel item, RateModel rate) {
    double ratePerGram;

    switch (item.purity) {
      case '22K':
        ratePerGram = rate.rate22k;
        double goldAmount = ratePerGram * item.weight;
        double total = goldAmount + item.makingCharge + item.stoneCharge;
        return _addGst(total);
        
      case '18K':
        ratePerGram = rate.rate18k;
        double goldAmount = ratePerGram * item.weight;
        double total = goldAmount + item.makingCharge + item.stoneCharge;
        return _addGst(total);

      case 'Silver':
        ratePerGram = rate.rateSilver;
        return ratePerGram * item.weight;

      case 'Silver ACPL':
        ratePerGram = rate.rateSilverAcpl;
        return ratePerGram * item.weight;

      case 'Diamond':
        ratePerGram = rate.rate18k;
        double sum = ratePerGram + item.makingCharge;
        double total = (sum * item.weight) + item.diamondAmount;
        return _addGst(total);

      default:
        return 0.0;
    }
  }

  static double _addGst(double amount) {
    return amount + (amount * 0.03); // 3% GST
  }
}
