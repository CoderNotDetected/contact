import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Contact(),
    );
  }
}

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

final controller = TextEditingController();
final namecon = TextEditingController();
final contactcon = TextEditingController();

class _ContactState extends State<Contact> {
  List<Map<String, dynamic>> names = [
    {'name': 'Finel', 'contact': '1234567890'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (c, i) {
            return ListTile(
              title: Text(names[i]['name'] + ' ' + names[i]['contact']),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: const Text("Add New Contact"),
                  content: Column(
                    children: [
                      TextFormField(
                        controller: namecon,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefix: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      TextFormField(
                        controller: contactcon,
                        decoration: const InputDecoration(
                          labelText: 'Contact',
                          prefix: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            names.add({
                              'name': namecon.text,
                              'contact': contactcon.text,
                            });
                          });
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
