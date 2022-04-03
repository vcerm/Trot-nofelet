import 'package:nofelet/models/user.dart';

import '../models/item.dart';

class UserPreferences{

  static final myUser = User(
      id: 1,
      name: 'Вилли Вонка',
      email: 'myemail@mail.ru',
      password: '123',
      photo: 'assets/images/User_image.jpg',
      items: <Item>[
        Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Сахаристые изделия'),
        Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Безе'),
        Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Мармелад'),
        Item(id: 12343451, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Марципан'),
        Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Торты'),
        Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Мармелад'),
        Item(id: 1234251, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Сахаристые изделия'),
        Item(id: 4325362, author: 'Вилли Вонка', description: 'Торты, капкейки, кейкпопсы, муссовые'
            ' пирожные и многое другое для сладкого праздника.'
            ' Индивидуальный подход к дизайну и только свежие и качественные продукты!',
            photo: 'assets/images/item_image.png', category: 'Безе'),
      ],
  );
}