import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

Future fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://www.jiosaavn.com/api.php?__call=webapi.getLaunchData&api_version=4&_format=json&_marker=0&ctx=wap6dot0'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("Error");
  }
}
