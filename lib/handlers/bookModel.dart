class BookDetail {
  int id;
  String bookName;
  String bookImage;

  BookDetail({this.id, this.bookImage, this.bookName});
  factory BookDetail.fromMap(Map<String, dynamic> json) => BookDetail(
        bookImage: json['bookImage'],
        bookName: json['bookName'],
        id: json['id'],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": bookName,
        "city": bookImage,
      };
}
