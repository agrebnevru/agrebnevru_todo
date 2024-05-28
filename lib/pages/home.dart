import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:agrebnevru_todo/firebase_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userToDo = '';
  List todoList = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  void initState() {
    super.initState();

    initFirebase();

    todoList.addAll([
      'Buy milk',
      'Wash dishes',
      'Купить картошку',
    ]);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Меню')),
          body: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('На главную')),
              Padding(padding: EdgeInsets.only(left: 15)),
              ElevatedButton(
                  onPressed: () {}, child: Text('Наше простое меню')),
            ],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || null == snapshot.data?.docs) {
            return Text('Нет записей');
          }

          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                    onDismissed: (direction) {
                      FirebaseFirestore.instance
                          .collection('items')
                          .doc(snapshot.data!.docs[index].id)
                          .delete();
                    },
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                        child: ListTile(
                      title: Text(snapshot.data?.docs[index].get('item')),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_sweep,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('items')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      ),
                    )));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить элемент'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Отмена')),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('items')
                              .add({'item': _userToDo});
                          Navigator.of(context).pop();
                        },
                        child: const Text('Добавить')),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          // color: Colors.white,
        ),
      ),
    );
  }
}
