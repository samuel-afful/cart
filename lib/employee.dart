class Employee {
  int id;
  String name;
  String photoUrl;

  Employee(this.id,this.name,this.photoUrl);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'photoUrl': photoUrl
    };
    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    photoUrl = map['photoUrl']; 
  }
}