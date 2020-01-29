import 'dart:async';
import 'package:changer/src/Model/ChangeCoin.dart';
import 'package:changer/src/Util/Util.dart';

class MoneyBloc
{
  StreamController<ChangeCoin> _input = StreamController();
  StreamController<ChangeCoin> _output = StreamController();
  Util _util = Util();
  StreamSink<ChangeCoin> get sendData => _input.sink;
  Stream<ChangeCoin> get changerStream => _output.stream;

  void dispose()
  {
    _input.close();
    _output.close();
  }

  MoneyBloc()
  {
    _input.stream..asBroadcastStream().listen(_onEvent);
      
  }

  void _onEvent(ChangeCoin cc)
  async 
  {
    
    cc.result = await _util.GetChange(cc);
   
    if(cc.result == "")
    {
      _util.ToastOn("Please check your connection Internet!");

    }
    _output.add(cc);
  }
}