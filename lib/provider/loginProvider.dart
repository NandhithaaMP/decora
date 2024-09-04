import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/adminModel.dart';

class LoginProvider extends ChangeNotifier{
  final FirebaseFirestore db=FirebaseFirestore.instance;
  FirebaseAuth  auth=FirebaseAuth.instance;



}