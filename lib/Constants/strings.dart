// ignore_for_file: unused_import

import 'package:cv_builder/data/services/storage_service.dart';
import 'package:flutter/material.dart';

const baseUrl = 'https://api.escuelajs.co/api/v1';
const zoom = '/';
const homeScreen = '/home_Screen';
const productDetalScreen = '/product_detals_screen';
const splashScreen = '/splash_screen';
const onbord = '/onBoarding_screens';
const cartScreen = '/cart_Screen';
const Color backColor = Color(0xFFffffff);
Color appColor = const Color(0xFFeaddff);
Color appColor1 = const Color(0xFF250561);
Color textColor = const Color(0xFF250561);

final StorageService storageService1 = StorageService();
List<String> personalDetails = [
  'First Name',
  'Last Name',
  'Profession',
  'Email',
  'Phone Number',
  'Country',
  'City',
  'Address',
  'Portfolio',
];

List<String> experience = [
  'Title/Position',
  'Organization/Company Title',
  'Description',
];
