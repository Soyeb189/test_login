

import 'package:http/http.dart' as http;

class CallApi{
  final String _url = "http://192.168.43.61:8086/";

  postData(data,apiUrl) async{
    var _fullUrl = _url + apiUrl;
    return await http.post(
      _fullUrl,
      body: data,
      headers: _setHeadersReg()
    
    );
  }

  

  getData(apiUrl) async{
    var _fullUrl = _url+apiUrl;
    return await http.get(
      _fullUrl,
      headers: _setHeaders()
    );
  }

  _setHeaders() => {
      'Content-type' : 'application/json',
       'Accept' : 'application/json'
  };

    _setHeadersReg() => {
      'Content-type' : 'application/x-www-form-urlencoded',
       'Accept' : 'application/json'
  };
}