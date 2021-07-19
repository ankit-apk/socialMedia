import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  var postList = List.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() {
    CollectionReference c = FirebaseFirestore.instance.collection('posts');
    c.snapshots().listen(
      (posts) {
        postList.value = posts.docs;
      },
    );
  }
}
