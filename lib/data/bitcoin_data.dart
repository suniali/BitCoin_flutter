class BitCoin{
  String title;
  String body;
  BitCoin({this.title,this.body});

  BitCoin.fromMap(Map<String,dynamic> map) :title=map['title'],body=map['body'];
}

 abstract class BitcoinRepository {
   Future<List<BitCoin>> fetchBitCoin();
 }
 class FetchDataExeption implements Exception
 {
   final _message;

   FetchDataExeption([this._message]);

   String toString()
   {
     if(_message==null)
     {
       return "Exeption";
     }
     return "Exeption = $_message";
   }
 }