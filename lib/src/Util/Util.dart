
import 'package:changer/src/Model/ChangeCoin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



class Util{
  // String _key= "2917fb8b760e21b26285";
  
  
// currencyId
  // static Future<List<Money>> GetCurries()
  // async 
  // {
  //   List<Money> listMoney;
  //   String queryapi = "https://free.currconv.com/api/v7/countries?apiKey=2917fb8b760e21b26285";
  //   final rep = await http.get(queryapi);
  //   if(rep.statusCode == 200)
  //   {
       
  //      Map<String, dynamic> jsson = json.decode(rep.body);
       
  //      for(int i = 0; i < jsson["results"].length;i++)
  //      {
  //          listMoney.add(Money(country: jsson[i]["currencyId"].toString()));

  //      }
       
       
  //   }
   
  //   return listMoney;

    
  // }

  Future<double> GetChange(ChangeCoin cc)
  async 
  {
    var data = cc.fromCoin.country+"_"+cc.toCoin.country;
    // debugPrint(data);
    String queryapi = "https://free.currconv.com/api/v7/convert?q="+data+"&compact=ultra&apiKey=2917fb8b760e21b26285";
    final rep = await http.get(queryapi);
    if(rep.statusCode == 200)
    {
     
      var result = double.parse(json.decode(rep.body)[data].toString()) * cc.countCoin1;
      return redondDouble(result);
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


  ToastOn (String msg)
  {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    debugPrint("msg");
  }

}