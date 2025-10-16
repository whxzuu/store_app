import 'dart:convert';

class User {
  // define fields
  final String id;
  final String fullName;
  final String birthDate;
  final String email;
  final String state;
  final String city;

  final String password;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.password,
    required this.birthDate,
  });

  // serialization: convert User object to Map
  // map: a map is collection of key-value pairs
  // why: converting to map is an intermediate step that makes it easier to serialize to JSON
  // the object to format that can be easily stored or transmitted

  // dart object to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'city': city,
      'password': password,
      'birthDate': birthDate,
    };
  }

  // serialization: convert Map to JSON String
  // this method directly encodes the User object to a JSON string

  // json.encode: converts a Dart object (like Map) to a JSON string
  // into a json string representation, making it suitable for storage or transmission
  // between different systems.

  String toJson() => json.encode(toMap());

  // deserialization: convert Map to User object
  // purpose - manipulate data in a structured way within the application : once data is converted to user object
  // it can be easily accessed and manipulated using the properties and methods defined in the User class
  // for example, you can access the user's full name using user.fullName - want to save user data received from an API or a database

  // the factory constructor is used here because it allows for more complex initialization logic
  // than a regular constructor, such as parsing data from a map and creating an instance of the class
  // it provides a clear and concise way to create User instances from map data
  // factory constructor: a special type of constructor that can return an instance of the class
  // fromMap: creates a User object from a Map

  // default ke String kosong

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? '', // sesuai dengan nama field di database, di MongoDb adalah { _id }
      fullName: map['fullName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      state: map['state'] as String? ?? '',
      city: map['city'] as String? ?? '',
      password: map['password'] as String? ?? '',
      birthDate: map['birthDate'] as String? ?? '',
    );
  }


  // deserialization: convert JSON String to User object
  // this method decodes a JSON string to a Map and then creates a User object from
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
