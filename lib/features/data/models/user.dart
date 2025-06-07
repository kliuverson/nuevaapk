class User{
  int? userId;
  int? id;
  String? title;
  String body = '';

  User(Map map){
    this.userId = map['userId'];
    this.id = map['id'];
    this.title = map['title'];
    this.body = map['body'];
  }
}