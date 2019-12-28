import 'package:changer/src/Model/ChangeCoin.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Util{
  // String _key= "2917fb8b760e21b26285";
  
  

  Future<double> GetChange(ChangeCoin cc)
  async 
  {
    var data = cc.fromCoin.country+"_"+cc.toCoin.country;
    String queryapi = "https://free.currconv.com/api/v7/convert?q="+data+"&compact=ultra&apiKey=2917fb8b760e21b26285";
    final rep = await http.get(queryapi);
    if(rep.statusCode == 200)
    {
      return redondDouble(double.parse(json.decode(rep.body)[data].toString())) * cc.countCoin1;
    }
    else
    {
      return 0.0;
    }

    
  }

  double redondDouble(double x)
    {
      return double.parse(x.toStringAsFixed(2)) ;
    }
}