import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String name;
  String email;
  Map<String, dynamic> address;
  List<String> orderHistory;
  int phone;
  List<String> wishList;

  User(
      { this.name = '',
       this.email = '',
       this.phone = 0,
      required this.address,
      this.userId = '',
      this.orderHistory = const [],
      this.wishList = const [],
      });

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc){
    final data = doc.data()!;
    return User(
      userId: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      address: Map<String, dynamic>.from(data['address'] ?? {}),
      phone: data['phone'] ?? 0,
      orderHistory: List<String>.from(data['orderHistory'] ?? []),
      wishList: List<String>.from(data['wishList'] ?? []),
    );
  }

  static Future<User?> fetchUser(String userId) async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if(doc.exists){
        return User.fromFirestore(doc);
      }
    }
    catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }
}
