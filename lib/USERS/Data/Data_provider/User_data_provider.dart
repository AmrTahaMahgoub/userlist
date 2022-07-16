
import 'package:http/http.dart' as http;


class ApiProvider {

  Future<http.Response> fetchUserList() async {

    http.Response userdatatypedata = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=1'));
    print(userdatatypedata.body);
    return  userdatatypedata;

  }
}
