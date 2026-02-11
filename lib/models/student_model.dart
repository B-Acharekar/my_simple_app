import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final int age;
  final String grade;
  final DateTime createdAt;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.grade,
    required this.createdAt,
  });

  // Convert Student object to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'grade': grade,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Create Student object from Firestore Map
  factory Student.fromMap(String id, Map<String, dynamic> map) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      grade: map['grade'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
