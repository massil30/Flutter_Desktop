import 'dart:convert';

class Utilisateur {
  String name;
  String date;
  Utilisateur({this.date, this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Utilisateur(
      name: map['name'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromJson(String source) => Utilisateur.fromMap(json.decode(source));
}
