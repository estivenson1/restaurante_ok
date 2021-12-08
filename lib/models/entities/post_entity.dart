
class PostEntity {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostEntity({this.userId, this.id, this.title, this.body});

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}