import 'package:changer/src/Model/ChangeCoin.dart';
import 'package:changer/src/Model/Money.dart';
import 'package:changer/src/Util/Util.dart';
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
  Util _util = new Util();
  MoneyBloc _moneyBloc = new MoneyBloc();
  // change method get countries
  TextEditingController _controllerCounterCoin = new TextEditingController(text: "1");
  List<Money> monies = [Money(id:'AED'),
Money(id:'AFN'),
Money(id:'ALL'),
Money(id:'AMD'),
Money(id:'AOA'),
Money(id:'ARS'),
Money(id:'AUD'),
Money(id:'AWG'),
Money(id:'AZN'),
Money(id:'BAM'),
Money(id:'BBD'),
Money(id:'BDT'),
Money(id:'BGN'),
Money(id:'BHD'),
Money(id:'BIF'),
Money(id:'BND'),
Money(id:'BOB'),
Money(id:'BRL'),
Money(id:'BSD'),
Money(id:'BTN'),
Money(id:'BWP'),
Money(id:'BYN'),
Money(id:'BZD'),
Money(id:'CAD'),
Money(id:'CDF'),
Money(id:'CHF'),
Money(id:'CLP'),
Money(id:'CNY'),
Money(id:'COP'),
Money(id:'CRC'),
Money(id:'CUP'),
Money(id:'CZK'),
Money(id:'DJF'),
Money(id:'DKK'),
Money(id:'DOP'),
Money(id:'DZD'),
Money(id:'EGP'),
Money(id:'ERN'),
Money(id:'ETB'),
Money(id:'EUR'),
Money(id:'FJD'),
Money(id:'GBP'),
Money(id:'GEL'),
Money(id:'GHS'),
Money(id:'GIP'),
Money(id:'GMD'),
Money(id:'GNF'),
Money(id:'GTQ'),
Money(id:'GYD'),
Money(id:'HKD'),
Money(id:'HNL'),
Money(id:'HRK'),
Money(id:'HTG'),
Money(id:'HUF'),
Money(id:'IDR'),
Money(id:'ILS'),
Money(id:'INR'),
Money(id:'IQD'),
Money(id:'IRR'),
Money(id:'ISK'),
Money(id:'JMD'),
Money(id:'JOD'),
Money(id:'JPY'),
Money(id:'KES'),
Money(id:'KGS'),
Money(id:'KHR'),
Money(id:'KMF'),
Money(id:'KPW'),
Money(id:'KRW'),
Money(id:'KWD'),
Money(id:'KYD'),
Money(id:'KZT'),
Money(id:'LAK'),
Money(id:'LBP'),
Money(id:'LKR'),
Money(id:'LRD'),
Money(id:'LSL'),
Money(id:'LVL'),
Money(id:'LYD'),
Money(id:'MAD'),
Money(id:'MDL'),
Money(id:'MGA'),
Money(id:'MKD'),
Money(id:'MMK'),
Money(id:'MNT'),
Money(id:'MOP'),
Money(id:'MRO'),
Money(id:'MUR'),
Money(id:'MVR'),
Money(id:'MWK'),
Money(id:'MXN'),
Money(id:'MYR'),
Money(id:'MZN'),
Money(id:'NAD'),
Money(id:'NGN'),
Money(id:'NIO'),
Money(id:'NOK'),
Money(id:'NPR'),
Money(id:'NZD'),
Money(id:'OMR'),
Money(id:'PAB'),
Money(id:'PEN'),
Money(id:'PGK'),
Money(id:'PHP'),
Money(id:'PKR'),
Money(id:'PLN'),
Money(id:'PYG'),
Money(id:'QAR'),
Money(id:'RON'),
Money(id:'RSD'),
Money(id:'RUB'),
Money(id:'RWF'),
Money(id:'SAR'),
Money(id:'SBD'),
Money(id:'SCR'),
Money(id:'SDG'),
Money(id:'SEK'),
Money(id:'SGD'),
Money(id:'SHP'),
Money(id:'SLL'),
Money(id:'SOS'),
Money(id:'SRD'),
Money(id:'STD'),
Money(id:'SYP'),
Money(id:'SZL'),
Money(id:'THB'),
Money(id:'TJS'),
Money(id:'TMT'),
Money(id:'TND'),
Money(id:'TOP'),
Money(id:'TRY'),
Money(id:'TTD'),
Money(id:'TWD'),
Money(id:'TZS'),
Money(id:'UAH'),
Money(id:'UGX'),
Money(id:'USD'),
Money(id:'USD'),
Money(id:'UYU'),
Money(id:'UZS'),
Money(id:'VEF'),
Money(id:'VND'),
Money(id:'VUV'),
Money(id:'WST'),
Money(id:'XAF'),
Money(id:'XCD'),
Money(id:'XOF'),
Money(id:'XPF'),
Money(id:'YER'),
Money(id:'ZAR'),
Money(id:'ZMW')];

  
  Money  _fromCoin ;
  Money  _toCoin ;
  

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
            mainAxisAlignment: MainAxisAlignment.center,
            
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
            textAlign: TextAlign.center,
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
            initialData: ChangeCoin(result: "0"),
            builder: (context,snapshot )
            {
              return TextField(         
                  controller: TextEditingController()..text = '${snapshot.data.result.toString()}',
                  style: TextStyle(
                      color: Colors.white  ,
                      fontSize: 20.0,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
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
                          mon.id,
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
         
          if(_fromCoin != null  && _toCoin != null  && _fromCoin.id != _toCoin.id )
          {
            debugPrint("si");
              if(double.tryParse(_controllerCounterCoin.text.toString()) >= 1)
            {
              _moneyBloc.sendData.add(ChangeCoin( 
                fromCoin: _fromCoin,
                toCoin:_toCoin,
                countCoin1: double.parse(_controllerCounterCoin.text.toString())
              ));
            }
          }
          else
          {
            debugPrint("si");
            _util.ToastOn("You must to select the coin to convert!");
            
            
          }
        },
      ),
    );
  }

 

  

}



  

     