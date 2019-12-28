import 'package:changer/src/Model/ChangeCoin.dart';
import 'package:changer/src/Model/Money.dart';
import 'package:changer/src/bloc/MoneyBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Changer extends StatefulWidget
{
  @override
  _Changer createState() => _Changer();

}

class _Changer extends State<Changer>
{
  
  @override
  Widget build(BuildContext ctx)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Changer"),
        leading: Icon(Icons.attach_money),
      ),
      body:  Column(
        children: <Widget>[
          MoneyField()
        ],
      )
        
        
      
         
        
      
    );
  }
}

class MoneyField extends StatefulWidget
{
  @override
  _MoneyField createState() => _MoneyField();

}

class _MoneyField extends State<MoneyField>
{
  MoneyBloc _moneyBloc = new MoneyBloc();
  
  TextEditingController _controllerCounterCoin = new TextEditingController(text: "1");

  Money  _fromCoin ;
  Money  _toCoin;

  List<Money> monies = [
  
    Money(country: "USD"),
    Money(country: "EUR")
  ];

  @override
  void dispose() {
    _moneyBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext ctx)
  {
    return Container(
      margin: EdgeInsets.only(left:15.0,right: 15.0,top:15.0),
      padding: EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
          color: Colors.blue,
            borderRadius: new BorderRadius.all(new Radius.circular(15.0))
      ),
      constraints: BoxConstraints(
        minHeight: 0,
       
      ),
      child: Column(
        
        children: <Widget>[ 
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              _selectCoin( 1),
              IconButton(
                icon: Icon(Icons.compare_arrows),
                iconSize: 15.0,
                onPressed: ()
                {
                  setState(() {
                     var temp = _fromCoin;
                  _fromCoin = _toCoin;
                  _toCoin = temp;
                  });
                 
                  
                },
                color: Colors.white,
              ),
              _selectCoin(0)
            ]
          ),    
          TextField(         
            controller: _controllerCounterCoin,
            style: TextStyle(
                color: Colors.white  ,
                fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: const EdgeInsets.only(bottom: -11.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white,width: 2.0)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white,width: 2.0)
              ),
            )
          ),
          StreamBuilder<ChangeCoin>(
            stream: _moneyBloc.changerStream,
            initialData: ChangeCoin(result: 0),
            builder: (context,snapshot )
            {
              return TextField(         
                  controller: TextEditingController()..text = '${snapshot.data.result.toString()}',
                  style: TextStyle(
                      color: Colors.white  ,
                      fontSize: 20.0,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: const EdgeInsets.only(bottom: -11.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2.0)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2.0)
                    ),
                  )
                );
            }
          ),
          _changercCoin()
        ],
        ),
    );
  }

  Widget _selectCoin(int x)
  {
    return Container(
            alignment:Alignment.topLeft,
            color: Colors.blue,
            child:  DropdownButton<Money>(
                icon: Icon(Icons.arrow_drop_down,color: Colors.white),
                iconSize: 24,
                underline: Container(
                  height: 2.0,
                  color: Colors.white,
                ),
                hint:  Text(  
                    "Coin",                  
                    style: TextStyle(
                      backgroundColor: Colors.blue,
                      color: Colors.white
                    ),
                  ),
                value: x == 1 ? _fromCoin : _toCoin,
                onChanged: (Money value) {
                  setState(() {
                    if(x == 1)
                    {
                        _fromCoin = value;
                    }
                    else if(x == 0)
                    {
                      _toCoin = value;
                    }
                    
                  });
                },
                items: monies.map((Money mon) {
                  return  DropdownMenuItem<Money>(
                    value: mon,
                    child: Row(
                      children: <Widget>[
                        Text(
                          mon.country,
                          style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0
                            ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
  }

  Widget _changercCoin()
  {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        textColor: Colors.blue,
        color:Colors.white,
        child: Text("changer".toUpperCase(),textDirection: TextDirection.ltr,style:TextStyle(fontSize:15.0)),
        onPressed: ()
        {
          if(_fromCoin.country == "" || _toCoin.country == "" || _fromCoin.country == _toCoin.country )
          {
              _showDialog();
             debugPrint("Same ");
          }
          else
          {
            if(double.tryParse(_controllerCounterCoin.text.toString()) >= 1)
            {
              _moneyBloc.sendData.add(ChangeCoin( 
                fromCoin: _fromCoin,
                toCoin:_toCoin,countCoin1: 
                double.parse(_controllerCounterCoin.text.toString())
              ));
            }
            
          }
        },
      ),
    );
  }

  void _showDialog()
  {
    showDialog(
      context:context,
      builder: (BuildContext ctx)
      {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Change Country")
        );
      }
    );
  }

}



  

     