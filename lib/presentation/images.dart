import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase/app_router.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const Text("Галерея", style: TextStyle(fontSize: 38)),

              const SizedBox(height: 15),

              Expanded(
                flex: 80,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("images").where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i){
                          final DocumentSnapshot documentSnapshot = snapshot.data!.docs[i];
                          return Card(
                            margin: const EdgeInsets.fromLTRB(15,0,15,15),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(image: NetworkImage(documentSnapshot["url"]), height: 200, width: 200),
                                  Text("Название: ${documentSnapshot['name']}", style: TextStyle(fontSize: 22)),
                                  Text("Размер: ${documentSnapshot['size']} байт", style: TextStyle(fontSize: 22)),
                                  Text("Ссылка: ${documentSnapshot['url']}", style: TextStyle(fontSize: 22)),
                                  
                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      const SizedBox(height: 5),
                                      ElevatedButton(
                                        onPressed: () {
                                          updateImage(documentSnapshot);
                                        },
                                        child: const Icon(Icons.edit)
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          deleteImage(
                                            documentSnapshot.id,
                                            documentSnapshot["url"],
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red
                                        ),
                                        child: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if(snapshot.hasError) {
                      return Text("Ошибка загрузки данных", style: TextStyle(fontSize: 22));
                    }
                    return const Center(
                      child: Text("Loading...", style: TextStyle(fontSize: 22))
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: <Widget> [
          Container(
            margin: const EdgeInsets.all(7.0),
            child: FloatingActionButton(
              onPressed: uploadImage,
              tooltip: 'Добавить файл',
              heroTag: "btn1",
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(7.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, signInPage);
              },
              tooltip: 'Выход',
              heroTag: "btn2",
              backgroundColor: Colors.red,
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      )
    );
  }


  void uploadImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      dialogTitle: 'Выбор файла',
    );
    if (result != null) {
      final size = result.files.first.size;
      Uint8List? uploadFile = result.files.single.bytes;

      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      Reference reference = firebaseStorage.ref().child(result.files.single.name);
      UploadTask uploadTask = reference.putData(uploadFile!);
      uploadTask.then((temp) async {
        String url = await reference.getDownloadURL();
        addImageData(result.files.single.name, size.toString(), url);
      });
    } else {}
  }

  //user1@mail.ru
  //password1

  Future<void> addImageData(String name, String size, String url) async {
    final image = firebaseFirestore.collection("images");

    return await image
      .add({'userid': FirebaseAuth.instance.currentUser!.uid, 'name': name, 'size': size, 'url': url})
      .then((value) => print("Изображение добавлено"))
      .catchError((error) => print(error.toString()));
  }

  Future<void> deleteImage(String? id, String? url) async {
    if(id != null && url != null) {
      await FirebaseStorage.instance.refFromURL(url).delete();

      await firebaseFirestore.collection("images")
        .doc(id)
        .delete();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Запись успешно удалена!")));
    }
  }

  Future<void> updateImage([DocumentSnapshot? documentSnapshot]) async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        dialogTitle: 'Выбор файла',
      );
      if (result != null) {
        final size = result.files.first.size;
        Uint8List? uploadFile = result.files.single.bytes;

        FirebaseStorage firebaseStorage = FirebaseStorage.instance;
        // Reference reference = firebaseStorage.ref().child(result.files.single.name);
        Reference referenceImage = FirebaseStorage.instance.refFromURL(documentSnapshot!['url']);
        UploadTask uploadTask = referenceImage.putData(uploadFile!);
        uploadTask.then((temp) async {
          String url = await referenceImage.getDownloadURL();
          
          await firebaseFirestore.collection("images")
            .doc(documentSnapshot.id)
            .update({'userid': FirebaseAuth.instance.currentUser!.uid, 'name': result.files.single.name, 'size': size, 'url': url});

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Запись успешно изменена!")));
        });
      } else {}

      // await firebaseFirestore.collection("images")
      //   .doc(documentSnapshot!.id)
      //   .update({'userid': FirebaseAuth.instance.currentUser!.uid, 'name': name, 'size': size, 'url': url});

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Запись успешно удалена!")));
    
  }

  // Future<void> updateImageData(String name, String size, String url) async {
  //   final image = firebaseFirestore.collection("images");

  //   return await image
  //     .add({'userid': FirebaseAuth.instance.currentUser!.uid, 'name': name, 'size': size, 'url': url})
  //     .then((value) => print("Изображение добавлено"))
  //     .catchError((error) => print(error.toString()));
  // }
}

