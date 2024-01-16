import 'package:flutter/foundation.dart';

var uri = "https://harshrathod07.github.io/json-api/restaurant.json";

List<Rastauraant> rastauraantData = [];

class Rastauraant {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  double? rating;
  String? location;
  String? city;
  int? averageCostForTwo;
  int? totalRatings;
  int? offerPercentage;
  bool? freeDelivery;
  List<String>? menuList;
  String? menuDescription;
  String? hours;

  Rastauraant(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.rating,
      this.location,
      this.city,
      this.averageCostForTwo,
      this.totalRatings,
      this.offerPercentage,
      this.freeDelivery,
      this.menuList,
      this.menuDescription,
      this.hours});

  factory Rastauraant.fromJson(Map<String, dynamic> json) {
    return Rastauraant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      location: json['location'],
      city: json['city'],
      averageCostForTwo: json['averageCostForTwo'],
      totalRatings: json['totalRatings'],
      offerPercentage: json['offerPercentage'],
      freeDelivery: json['freeDelivery'],
      menuList: json['menuList'].cast<String>(),
      menuDescription: json['menuDescription'],
      hours: json['hours'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['city'] = this.city;
    data['averageCostForTwo'] = this.averageCostForTwo;
    data['totalRatings'] = this.totalRatings;
    data['offerPercentage'] = this.offerPercentage;
    data['freeDelivery'] = this.freeDelivery;
    data['menuList'] = this.menuList;
    data['menuDescription'] = this.menuDescription;
    data['hours'] = this.hours;
    return data;
  }
}
