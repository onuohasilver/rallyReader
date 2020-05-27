import 'package:flutter/material.dart';

final List<BookItem> bookList = [
  BookItem(
      image: 'assets/demoCover.jpg',
      title: 'The Return of the Stars',
      pages: 340,
      author: 'Onuoha Silver',
      rating: 3,
      favorite: 57,
      completion: .78),
  BookItem(
      image: 'assets/demoCoverr.jpg',
      title: 'Smart People die too',
      pages: 340,
      favorite: 35,
      author: 'Jeremiah Hudson',
      rating: 3,
      completion: .78)
];

class BookItem {
  BookItem(
      {@required this.image,
      @required this.title,
      @required this.pages,
      @required this.author,
      @required this.rating,
      @required this.favorite,
      @required this.completion});
  final String image;
  final int favorite;
  final String title;
  final int pages;
  final String author;
  final double rating;
  final double completion;
}
