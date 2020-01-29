
import 'package:changer/src/Model/ChangeCoin.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



class Util{
  // String _key= "2917fb8b760e21b26285";
  
  Future<String> GetChange(ChangeCoin cc)
  async 
  {
    var data = cc.fromCoin.country+"_"+cc.toCoin.country;
   
    String queryapi = "https://free.currconv.com/api/v7/convert?q="+data+"&compact=ultra&apiKey=2917fb8b760e21b26285";
    final rep = await http.get(queryapi);
    
    if(rep.statusCode == 200)
    {
     
      var result = double.parse(json.decode(rep.body)[data].toString()) * cc.countCoin1;
      return redondDouble(result).toString();
    }
    else
    {
      
      return "";
    }
  }

  double redondDouble(double x)
  {
      return double.parse(x.toStringAsFixed(2)) ;
  }


  ToastOn (String msg)
  {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
    
  }

}