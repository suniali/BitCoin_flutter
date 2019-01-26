import 'package:flutter_bitcoine/data/bitcoin_data.dart';
import 'package:flutter_bitcoine/data/bitcoin_data_mock.dart';
import 'package:flutter_bitcoine/data/bitcoin_data_prod.dart';

enum Flaver { Mock, Prod }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flaver _flaver;
  static void configure(Flaver flaver) {
    _flaver = flaver;
  }

  factory Injector() {
    return _singleton;
  }
  Injector._internal();

  BitcoinRepository get bitcoinRepository {
    switch (_flaver) {
      case Flaver.Mock:
        return MockBitcoinRepoditory();
      default:
        return ProdBitcoinData();
    }
  }
}
