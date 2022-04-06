
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nofelet/models/item.dart';

class DatabaseService{
  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('items');
  final CollectionReference _userItemsCollection = FirebaseFirestore.instance.collection('user_items');

  Future addOrUpdateItem(Item item) async {
    DocumentReference itemRef = _itemsCollection.doc(item.id);
    return await itemRef.set({
      'Author' : item.author,
      'Description' : item.description
    });
  }

  Stream<List<Item>> getItems(String? author) {
    Query query;
    if(author != null) {
      query = _itemsCollection.where('Author', isEqualTo: author);
    } else {
      query = _itemsCollection;
    }
    return query.snapshots().map((QuerySnapshot data) =>
      data.docs.map((DocumentSnapshot doc) => Item.fromJson(doc.data, id: 'cwLTrbcPNH0jRprsRgge')).toList());
  }
}