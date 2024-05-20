import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer; 
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/provider/utils/api_helper/app_exception.dart';


class ApiBaseHelper {
  Future<dynamic> getData(String url) async {
    // try {
    final response = await http.get(Uri.parse(url));
    debugPrint("Response: ${response.body}");
    return json.decode(response.body);
    // } catch (e) {
    //   throw FetchDataException('Failed to fetch data. Error: $e');
    // }
  }

  // Future<dynamic> getDataWithToken(String url) async {
  //   debugPrint("this is url $url");
  //   // debugger();
  //   log(Constant.loginToken, name: "LoginToken");
  //   // try {
  //   var header = {
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${Constant.loginToken}"
  //   };
  //   final response = await http.get(Uri.parse(url), headers: header);
  //   debugPrint("Response: ${response.body}");
  //   debugPrint("Response: ${response.statusCode}");
  //   return json.decode(response.body);
  //   // } on SocketException {
  //   //   throw FetchDataException('No Internet connection');
  //   // }
  // }

  Future<dynamic> postMethod(String url, dynamic body) async {
    // try {
    debugPrint("this is body server $body");
    var header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: header);
    debugPrint("this is errror $response");
    debugPrint("this is response code ${response.statusCode}");
    return json.decode(response.body);
    // } catch (e) {
    //   throw FetchDataException('Failed to perform POST request. Error: $e');
    // }
  }

 Future getdepositeaccount(String token) async {
  print("kxa");
    try {
      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Add token to Authorization header
      };
print("printing $header");

      var response = await http.get(
        Uri.parse(ApiUrl.depositAccount), 
        headers: header,
      );
 
      if (response.statusCode == 200) {
       
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      developer.log(e.toString()); 
    }
  }
}









  Future<dynamic> postMethodWithOutContainType(String url, dynamic body) async {
    // try {
    debugPrint("this is body serve r$body");
    var header = {
      "Accept": "application/json",
      // "Content-Type": "application/json",
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: header);
    debugPrint("this is errror ${response.body}");
    debugPrint("this is response code ${response.statusCode}");
    return json.decode(response.body);
    // } catch (e) {
    //   throw FetchDataException('Failed to perform POST request. Error: $e');
    // }
  }

  // Future<dynamic> postMethodWithAuth(
  //   String url,
  //   body,
  // ) async {
  //   var responseJson;
  //   // try {

  //   var header = {
  //     "Accept": "application/json",
  //     // "Content-Type": "application/json",
  //     "Authorization": "Bearer ${Constant.loginToken}"
  //   };
  //   final response =
  //       await http.post(Uri.parse(url), body: body, headers: header);
  //   debugPrint("response ${response.body}");
  //   responseJson = json.decode(response.body);
  //   // } on SocketException {
  //   //   throw FetchDataException('No Internet connection');
  //   // }
  //   return responseJson;
  // }

  // Future<dynamic> postMethodWithAuthAndContentType(
  //   String url,
  //   body,
  // ) async {
  //   var responseJson;
  //   // try {
  //   debugPrint("this is server body $body}");

  //   var header = {
  //     "Accept": "application/json",
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer ${Constant.loginToken}"
  //   };
  //   final response =
  //       await http.post(Uri.parse(url), body: body, headers: header);
  //   debugPrint("response ${response.body}");
  //   responseJson = json.decode(response.body);
  //   // } on SocketException {
  //   //   throw FetchDataException('No Internet connection');
  //   // }
  //   return responseJson;
  // }

  // multiParseWithToken(url, body, filepath) async {
  //   debugPrint("this is url : $url");
  //   debugPrint("this is body : $body");
  //   debugPrint("this is filepath : $filepath");
  //   if (filepath != "") {
  //     // String addimageUrl = '$base/updateProfile';
  //     Map<String, String> headers = {
  //       'Content-Type': 'multipart/form-data',
  //       'Accept': 'application/json',
  //       "Authorization": "Bearer ${Constant.loginToken}",
  //     };

  //     // var imageFile = File(
  //     //     controller.selectedImagePath.value); // Replace with your image path
  //     // var imageStream = http.ByteStream(imageFile.openRead());
  //     // var length = await imageFile.length();
  //     var request = http.MultipartRequest('PUT', Uri.parse(url))
  //       ..fields.addAll(body)
  //       ..headers.addAll(headers)
  //       ..files.add(await http.MultipartFile.fromPath('photo', filepath));
  //     var response = await request.send();

  //     var data = await http.Response.fromStream(response);
  //     return jsonDecode(data.body);
  //   } else {
  //     debugPrint("here with out image ");
  //     Map<String, String> header = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${Constant.loginToken}',
  //     };

  //     var response = await http.put(Uri.parse(url),
  //         body: jsonEncode(body), headers: header);
  //     debugPrint("this is respnsee server :${response.body}}");
  //     debugPrint("this is respnsee server :${response.statusCode}}");

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     }
  //   }
  // }

  // Future<dynamic> postMethodWithAuthwithEncode(
  //   String url,
  //   body,
  // ) async {
  //   var responseJson;
  //   // try {
  //   debugPrint("this is body : ${jsonEncode(body)}");

  //   var header = {
  //     // "Accept": "application/json",
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer ${Constant.loginToken}"
  //   };
  //   final response = await http.post(Uri.parse(url),
  //       body: jsonEncode(body), headers: header);
  //   debugPrint("response ${response.body}");
  //   responseJson = json.decode(response.body);
  //   // } on SocketException {
  //   //   throw FetchDataException('No Internet connection');
  //   // }
  //   return responseJson;
  // }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server. StatusCode: ${response.statusCode}');
    }
  }

