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
  MoneyBloc _moneyBloc = new MoneyBloc();
  
  TextEditingController _controllerCounterCoin = new TextEditingController(text: "1");
  List<Money> monies = [Money(country:'AFN'),Money(country:'XCD'),Money(country:'AUD'),Money(country:'BDT'),
                        Money(country:'XOF'),Money(country:'BRL'),Money(country:'KHR'),Money(country:'XAF'),
                        Money(country:'CUP'),Money(country:'EUR'),Money(country:'GEL'),Money(country:'HTG'),
                        Money(country:'INR'),Money(country:'ILS'),Money(country:'KZT'),Money(country:'KWD'),
                        Money(country:'LSL'),Money(country:'MYR'),Money(country:'MUR'),Money(country:'MNT'),
                        Money(country:'MMK'),Money(country:'XPF'),Money(country:'NOK'),Money(country:'PGK'),
                        Money(country:'RWF'),Money(country:'WST'),Money(country:'RSD'),Money(country:'SEK'),
                        Money(country:'TZS'),Money(country:'TND'),Money(country:'UAH'),Money(country:'UZS'),
                        Money(country:'YER'),Money(country:'DZD'),Money(country:'ARS'),Money(country:'AZN'),
                        Money(country:'BYN'),Money(country:'BOB'),Money(country:'BGN'),Money(country:'CAD'),
                        Money(country:'CNY'),Money(country:'CRC'),Money(country:'CZK'),Money(country:'USD'),
                        Money(country:'GHS'),Money(country:'GNF'),Money(country:'HKD'),Money(country:'IRR'),
                        Money(country:'JMD'),Money(country:'LAK'),Money(country:'LYD'),Money(country:'MKD'),
                        Money(country:'NIO'),Money(country:'PKR'),Money(country:'PEN'),Money(country:'QAR'),
                        Money(country:'STD'),Money(country:'SLL'),Money(country:'SOS'),Money(country:'SDG'),
                        Money(country:'SYP'),Money(country:'TMT'),Money(country:'GBP'),Money(country:'VEF'),
                        Money(country:'AMD'),Money(country:'BSD'),Money(country:'BAM'),Money(country:'KYD'),
                        Money(country:'COP'),Money(country:'DKK'),Money(country:'EGP'),Money(country:'ETB'),
                        Money(country:'GIP'),Money(country:'HUF'),Money(country:'IQD'),Money(country:'JPY'),
                        Money(country:'KPW'),Money(country:'LVL'),Money(country:'CHF'),Money(country:'MGA'),
                        Money(country:'MDL'),Money(country:'MAD'),Money(country:'NPR'),Money(country:'PHP'),
                        Money(country:'RON'),Money(country:'SAR'),Money(country:'SGD'),Money(country:'ZAR'),
                        Money(country:'SRD'),Money(country:'TWD'),Money(country:'TOP'),Money(country:'VND'),
                        Money(country:'ALL'),Money(country:'BBD'),Money(country:'BTN'),Money(country:'BND'),
                        Money(country:'CLP'),Money(country:'CDF'),Money(country:'DOP'),Money(country:'ERN'),
                        Money(country:'GTQ'),Money(country:'HNL'),Money(country:'IDR'),Money(country:'KES'),
                        Money(country:'KGS'),Money(country:'LRD'),Money(country:'MOP'),Money(country:'MVR'),
                        Money(country:'MXN'),Money(country:'NAD'),Money(country:'NZD'),Money(country:'OMR'),
                        Money(country:'PYG'),Money(country:'SHP'),Money(country:'SCR'),Money(country:'SBD'),
                        Money(country:'LKR'),Money(country:'THB'),Money(country:'TRY'),Money(country:'AED'),
                        Money(country:'VUV'),Money(country:'ZMW'),Money(country:'AOA'),Money(country:'AWG'),
                        Money(country:'BHD'),Money(country:'BZD'),Money(country:'BWP'),Money(country:'BIF'),
                        Money(country:'KMF'),Money(country:'HRK'),Money(country:'DJF'),Money(country:'FJD'),
                        Money(country:'GMD'),Money(country:'GYD'),Money(country:'ISK'),Money(country:'JOD'),
                        Money(country:'KRW'),Money(country:'LBP'),Money(country:'MWK'),Money(country:'MRO'),
                        Money(country:'MZN'),Money(country:'NGN'),Money(country:'PAB'),Money(country:'PLN'),
                        Money(country:'RUB'),Money(country:'SZL'),Money(country:'TJS'),Money(country:'TTD'),
                        Money(country:'UGX'),Money(country:'UYU')];
// change method get countries
  Money  _fromCoin ;
  Money  _toCoin;
  
  // static Future<List<Money>> Curries() async {
  //    List<Money> tempmonies =  await Util.GetCurries();
  //    return tempmonies;
  // }

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



  

     