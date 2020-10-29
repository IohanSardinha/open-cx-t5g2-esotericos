import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Ops! Something went wrong. Try again later...");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading...");
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrospective Wall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Retrospective Wall Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class GetDataFromFirestore extends StatelessWidget{
  GetDataFromFirestore();
  @override
  Widget build(BuildContext context) {
    CollectionReference reference = FirebaseFirestore.instance.collection("Teste");

    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc("Teste").get(),
      builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return Text("${data['text']}");
          }

          return Text("loading");
        }
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();
  CollectionReference reference = FirebaseFirestore.instance.collection("Teste");

  void updateValue(BuildContext context)
  {
    reference.doc("Teste").update({'text':myController.text})
                          .then((value) => Scaffold.of(context).showSnackBar(SnackBar(
                              content: const Text("Value Updated")
                            )
                          ))
                          .catchError((error) => Scaffold.of(context).showSnackBar(SnackBar(
                            content: const Text("Failed to update text")
                            )
                          ));
    myController.text = "";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetDataFromFirestore(),
            TextField(
              controller: myController,
            ),
            TextButton(
                onPressed: () => updateValue(context),
                child: Text('Update Value in cloud firestore')),
          ],
        ),
      ),
    );
  }
}
