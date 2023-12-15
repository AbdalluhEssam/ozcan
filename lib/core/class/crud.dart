import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:ozcan/core/class/statusrequest.dart';

import '../functions/checkinterner.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
      try{
        if (await checkInternet()) {
          var response = await http.post(Uri.parse(linkurl), body: data);
          print(response.statusCode);
          if (response.statusCode == 200 || response.statusCode == 201) {
            Map responsebody = jsonDecode(response.body);
            print(responsebody);
            return Right(responsebody);
          } else {
            return const Left(StatusRequest.serverFailure);
          }
        } else {
          return const Left(StatusRequest.offlineFailure);
        }
      }catch(_){
        return const Left(StatusRequest.serverFailure);
      }
  }
  Future<Either<StatusRequest, Map>> getData(String linkurl, Map data) async {
      try{
        if (await checkInternet()) {
          var response = await http.get(Uri.parse(linkurl));
          print(response.statusCode);
          if (response.statusCode == 200 || response.statusCode == 201) {
            Map responsebody = jsonDecode(response.body);
            print(responsebody);
            return Right(responsebody);
          } else {
            return const Left(StatusRequest.serverFailure);
          }
        } else {
          return const Left(StatusRequest.offlineFailure);
        }
      }catch(_){
        return const Left(StatusRequest.serverFailure);
      }
  }
}
