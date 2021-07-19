import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  var postList = List.empty(growable: true).obs;
  var searchedPosts = List.empty(growable: true).obs;
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

  void searchPosts(String query) {
    final posts = postList.where(
      (posts) {
        final college = posts['clg'].toString().toLowerCase();
        final society = posts['soc'].toString().toLowerCase();
        final search = query.toLowerCase();

        return college.contains(search) || society.contains(search);
      },
    ).toList();
    searchedPosts.value = posts;
  }
}
