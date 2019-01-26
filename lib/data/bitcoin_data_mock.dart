import 'package:flutter_bitcoine/data/bitcoin_data.dart';

class MockBitcoinRepoditory implements BitcoinRepository
{
  @override
  Future<List<BitCoin>> fetchBitCoin() {
    // TODO: implement fetchBitCoin
    return Future.value(bitcoines);
  }

}
var bitcoines=<BitCoin>[
  BitCoin(title: "BitCoin1",body: "This is bitCoin 1"),
  BitCoin(title: "BitCoin2",body: "This is bitCoin 2"),
  BitCoin(title: "BitCoin3",body: "This is bitCoin 3"),
];