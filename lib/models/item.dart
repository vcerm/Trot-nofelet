

import 'package:flutter/material.dart';

class Item {
  String? description;
  String? author;
  String? id;
  String? authorId;

  Item({this.id, this.author, this.description});

  Item.fromJson(String uid, Map<String, dynamic> data) {
    id = uid;
    author = data['Author'];
    description = data['Description'];
  }


  @override
  String toString() {
    return 'Item{description: $description, author: $author, id: $id, authorId: $authorId}';
  }

  Item copy(){
    final copiedAuthor = author;
    final copiedDecs = description;

    return Item(id: id, author: copiedAuthor, description: copiedDecs);
  }
}

// class UserItems{
//   String uid;
//   List<Item> items;
//
//   UserItems({required this.uid, required this.items});
//
//   Map<String, dynamic> toMap(){
//     return {
//
//     }
//   }
// }




// class Item {
//   Item({required this.author, required this.description});
//
//   Item.fromJson(Map<String, Object?> json)
//       : this(
//     author: json['author']! as String,
//     description: json['description'] as String,
//   );
//
//   final String author;
//   final String description;
//
//   Map<String, Object?> toJson() {
//     return {
//       'author' : author,
//       'description' : description,
//     };
//   }
// }


// final items = <Item>[
//   Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Сахаристые изделия'),
//   Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Безе'),
//   Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Мармелад'),
//   Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Марципан'),
//   Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Торты'),
//   Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Мармелад'),
//   Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Сахаристые изделия'),
//   Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
//       ' пирожные и многое другое для сладкого праздника.'
//       ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
//       photo: 'assets/images/item_image.png', category: 'Безе'),
// ];