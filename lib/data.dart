
List<User> getFlights(){
  return [
    User("1","Mr.Bajaj", "5 Year", "image/user1.JPG" ,true),
    User("2","Mr.Shah", "2 Year", "image/user2.JPG" ,false),
    User("3","Mr.Verma", "1 Year", "image/user3.jpg" ,true),

  ];
}

class User {


  String name;
  String experience;
  String url;
  bool available;
  String id;

  User(this.id, this.name, this.experience, this.url,
      this.available, );


}