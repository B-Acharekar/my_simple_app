import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student_model.dart';

class StudentService {
  final CollectionReference _studentsCollection =
      FirebaseFirestore.instance.collection('students');

  // Create - Add a new student
  Future<void> addStudent(String name, int age, String grade) async {
    try {
      await _studentsCollection.add({
        'name': name,
        'age': age,
        'grade': grade,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Read - Get stream of students ordered by createdAt descending
  Stream<List<Student>> getStudents() {
    return _studentsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Update - Update student details
  Future<void> updateStudent(
      String id, String name, int age, String grade) async {
    try {
      await _studentsCollection.doc(id).update({
        'name': name,
        'age': age,
        'grade': grade,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Delete - Remove a student
  Future<void> deleteStudent(String id) async {
    try {
      await _studentsCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
