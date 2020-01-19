/// 自我手动解析
/// 
/// 类的实例方法 和 类的类方法（static）
/// 
class Person {
  final String name;
  final int age;
  final bool sex;
  // 便利构造
  Person(this.name, this.age, this.sex);

  // Person.fromJson(Map<String ,dynamic> json):name = json['name'], age = json['age'], sex = json['sex'];

  static Person fromJson(Map<String, dynamic> json) {
    var person = Person(json['name'], json['age'], json['sex']);
    return person;
  }

  // Map<String, dynamic> toJson() => {
  //   'name':name,
  //   'age':age,
  //   'sex':sex
  // };

  Map<String, dynamic> toJson() {
    var dict  = {
      'name':name,
      'age':age,
      'sex':sex
    };
    return dict;
  }

}