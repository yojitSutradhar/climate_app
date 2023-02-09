import 'dart:convert';
import 'package:http/http.dart'as http;

class networkdata {
  String url;
  networkdata(this.url);

  Future climatedata() async{
    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String data=response.body;
      var jsondata=jsonDecode(data);
      return jsondata;
    }
    else{
      print(response.statusCode);
    }
  }
}