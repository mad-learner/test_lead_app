import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/Welcome.jpg', 
    title: 'Welcome to LEAD India', 
    description: 'A Place Where We Create Leaders Who  Become The Catalyst For Change.',
  ),
  Slide(
    imageUrl: 'assets/images/Welcome2.jpg', 
    title: 'Welcome to LEAD India 2', 
    description: 'A Place Where We Create Leaders Who  Become The Catalyst For Change.',
  ),
  Slide(
    imageUrl: 'assets/images/Welcome.jpg', 
    title: 'Welcome to LEAD India 3', 
    description: 'A Place Where We Create Leaders Who  Become The Catalyst For Change.',
  ),
];