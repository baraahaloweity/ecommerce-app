import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Response Body: ${response.body}");
          Map responsebody = jsonDecode(response.body);
          print("Decoded Response: $responsebody");
          return Right(responsebody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } else {
        return Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return Left(StatusRequest.serverfailure);
    }
  }
}
