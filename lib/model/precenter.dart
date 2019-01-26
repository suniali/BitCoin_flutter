import 'package:flutter_bitcoine/data/bitcoin_data.dart';
import 'package:flutter_bitcoine/data/dependency_injection.dart';

abstract class BitCoinListViewContract {
  void onBitCoinComplated(List<BitCoin> items);
  void onLoadBitCoinError();
}
class BitCoinPrecenter{
  BitCoinListViewContract _view;
  BitcoinRepository _repository;
  BitCoinPrecenter(this._view)
  {
    _repository=Injector().bitcoinRepository;
  }

  void loadBitCoines()
  {
    _repository.fetchBitCoin()
    .then((c)=>_view.onBitCoinComplated(c))
    .catchError((onError)=>_view.onLoadBitCoinError());
  }
}