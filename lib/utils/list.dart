import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detail {
  Detail(this.image, this.title, this.subtitle);

  final IconData image;
  final String title;
  final String subtitle;
}

final List<Detail> stores = [
  Detail(Icons.storefront_sharp, 'Store 1', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 2', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 3', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 4', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 5', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 6', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 7', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 8', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 9', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 10', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 11', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 12', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 13', 'subtitle'),
  Detail(Icons.storefront_sharp, 'Store 14', 'subtitle'),
];

class TransactionHistorys {
  TransactionHistorys(this.title, this.subtitle, this.amount, this.date);

  final String title;
  final String subtitle;
  final double amount;
  final String date;
}

final DateTime date = DateTime.now();

final DateFormat formatter = DateFormat('hh:mm:ss a');
final String currentTime = formatter.format(date);

final List<TransactionHistorys> history = [
  TransactionHistorys('Store 1', 'pay', 33.3, currentTime),
  TransactionHistorys('Store 2', 'pending', 44.4, currentTime),
  TransactionHistorys('Store 3', 'pending', 55.5, currentTime),
  TransactionHistorys('Store 4', 'pay', 66.6, currentTime),
  TransactionHistorys('Store 5', 'pay', 77.7, currentTime),
  TransactionHistorys('Store 6', 'pending', 88.8, currentTime),
];
