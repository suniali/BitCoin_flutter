
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bitcoine/data/bitcoin_data.dart';
class ProdBitcoinData implements BitcoinRepository
{
   final String url="https://jsonplaceholder.typicode.com/posts";
  @override
  Future<List<BitCoin>> fetchBitCoin() async{
    // TODO: implement fetchBitCoin
    http.Response response=await http.get(url);
    final List responseBody=json.decode(response.body);
    final statusCode=response.statusCode;
    if(statusCode!=200 || response.body==null)
    {
      throw FetchDataExeption("An error ocurred : [Status code is : $statusCode]");
    }
    return responseBody.map((c)=>BitCoin.fromMap(c)).toList();
  }

}