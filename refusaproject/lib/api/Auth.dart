import 'dart:io';
import 'dart:convert';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';                              //
//import 'package:image_picker/image_picker.dart';                              //

//import 'package:untitled/pages/Landing.dart';                                 //
//import 'package:untitled/pages/updateProfile.dart';                           //

class User {
  final String name;
  final int userId;
  final String user;
  final String password;

  const User({
    required this.name,
    required this.password,
    required this.user,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      userId: json['userId'],
      user: json['user'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      'user': user,
      'password': password,
    };
  }
}

class Auth {
  static Future<User> login(email, password, BuildContext context) async {
    //final _auth = FirebaseAuth.instance;
    //var url = Uri.http('http://127.0.0.1:3000', '/users');
    //var url = Uri.http('localhost:3000', '/users');
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/users'));
    //var response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      //Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      //Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      //var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      //var users = jsonResponse['users'];
      //var users = User.fromJson(jsonResponse);
      print(response.body);
      var users = User.fromJson(jsonDecode(response.body));
      try {
        var users = User.fromJson(jsonDecode(response.body));
        //print('users: $users');
      } catch (e) {
        print('failed');
        //Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    /* try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPAge()));
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } */
  }
}
