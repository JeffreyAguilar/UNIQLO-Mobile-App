
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/models/products.dart';

class ProductService {
  final CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');

  CollectionReference<Object?> getProducts(){
    return productsCollection..snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromFirestore(doc.data() as Map<String,dynamic>);
      }).toList();
    });
  }
}