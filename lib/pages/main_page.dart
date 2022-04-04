import 'package:flutter/material.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/list_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    super.initState();
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    
    // Widget _category(List<Item> item){
    //   dynamic categories = [];
    //   return Column();
    // }
    
    final String imageHolder = 'assets/images/item_image.png';

    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
        title: const Text(
          'Трот-нофелет',
          style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffebddd3),
          ),
        ),
        centerTitle: true,
        leading: RawMaterialButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage())
            );
          },
          child: const Icon(
            Icons.person_outline_rounded,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        ),
        backgroundColor: const Color(0xff7d5538),
        shadowColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return Text('нет записей');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i){
              return Container(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xffecd9cc),),
                    child: ListTile(
                      leading: Image.asset(
                        imageHolder,
                        fit: BoxFit.fill,
                      ),
                      contentPadding: const EdgeInsets.all(6.0),
                      title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          snapshot.data!.docs[i].get('Description'),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data!.docs[i].get('Author'),
                            style: const TextStyle(
                              letterSpacing: 3.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '№' + snapshot.data!.docs[i].get('ID').toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}