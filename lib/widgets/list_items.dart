import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';

class ItemList extends StatelessWidget {

  final items = <Item>[
    Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
    Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
        ' пирожные и многое другое для сладкого праздника.'
        ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
        photo: 'assets/images/item_image.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i){
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffecd9cc),),
            child: ListTile(
              leading: Image.asset(
                items[i].photo,
                fit: BoxFit.fill,
              ),
              contentPadding: const EdgeInsets.all(6.0),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  items[i].description,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[i].author,
                    style: const TextStyle(
                      letterSpacing: 3.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '№' + items[i].id.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
