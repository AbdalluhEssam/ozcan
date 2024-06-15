import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:ozcan/core/class/statusrequest.dart';
import 'package:path/path.dart';

import '../functions/checkinterner.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data,   {String? token}) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkurl),
          body: data,
            headers: {"Authorization": "Bearer $token"}
        );
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201|| response.statusCode == 202) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl, Map data,
      {String? token}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl),
            headers: {"Authorization": "Bearer $token"});
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201|| response.statusCode == 202) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  // postRequestWithFiles(String url, Map data, File file, String filename) async {
  //   var request = http.MultipartRequest("POST", Uri.parse(url));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multipartFile = http.MultipartFile(filename, stream, length,
  //       filename: basename(file.path));
  //   request.files.add(multipartFile);
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   var myrequest = await request.send();
  //
  //   var response = await http.Response.fromStream(myrequest);
  //   if (myrequest.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print("Error${myrequest.statusCode}");
  //   }
  // }

  Future<dynamic> postRequestWithFiles(String url, Map<String, String> data, File file, String filename, {String? token}) async {
    try {
      // Set up headers, allowing for an optional token
      Map<String, String> headers = {
        if (token != null) "Authorization": "Bearer $token",
        // No need to specify content-type for MultipartRequest
      };

      var request = http.MultipartRequest("POST", Uri.parse(url));

      // Add the file to the request
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile(
        filename,
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);
      request.headers.addAll(headers);

      // Add the form fields to the request
      data.forEach((key, value) {
        request.fields[key] = value;
      });

      // Send the request and await the response
      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);

      // Handle redirection if necessary
      if (myRequest.statusCode == 302 || myRequest.statusCode == 301) {
        String redirectUrl = response.headers['location']!;
        log("Redirecting to $redirectUrl");

        // Update the request URL and resend the request
        request = http.MultipartRequest("POST", Uri.parse(redirectUrl));
        request.files.add(multipartFile);
        request.headers.addAll(headers);
        data.forEach((key, value) {
          request.fields[key] = value;
        });

        myRequest = await request.send();
        response = await http.Response.fromStream(myRequest);
      }

      // Check the response status and return the result or log the error
      if (myRequest.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
        return jsonDecode(response.body);
      } else {
        log("Error ${myRequest.statusCode}: ${response.body}");
        return null; // Or handle the error as needed
      }
    } catch (e) {
      log("Exception occurred: $e");
      return null; // Or handle the error as needed
    }
  }
  // postRequestWithFiles(String url, Map data, File file, String filename,
  //     {String? token}) async {
  //   Map<String, String> headers = {
  //     "Authorization": "Bearer $token",
  //     "Content-Type": "application/json",
  //   };
  //
  //   var request = http.MultipartRequest("POST", Uri.parse(url));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multipartFile = http.MultipartFile(filename, stream, length,
  //       filename: basename(file.path));
  //   request.files.add(multipartFile);
  //   request.headers.addAll(headers);
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   var myRequest = await request.send();
  //
  //   var response = await http.Response.fromStream(myRequest);
  //   if (myRequest.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     log("Error${myRequest.statusCode}");
  //   }
  // }
}
