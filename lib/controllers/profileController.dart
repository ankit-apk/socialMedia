import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final picker = ImagePicker();
  File file = File('');
  RxString imageUrl = ''.obs;
  var picFromGoogle = List.empty(growable: true).obs;
  var detailsFromGoogle = List.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getImageFirebase();
    getData();
  }

  getImage() async {
    final _imagePicker = ImagePicker();
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    await uploadImage();
    Get.snackbar('Successful', 'Image has been uploaded');
  }

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;

    //Upload to Firebase
    var snapshot = await _firebaseStorage
        .ref()
        .child('images/users/profile/${GetStorage().read('uid')}')
        .putFile(file);
    var downloadUrl = await snapshot.ref.getDownloadURL();
    imageUrl.value = downloadUrl;

    Map<String, dynamic> demoData = {
      'name': '',
      'age': '',
      'gender': '',
      'college': '',
      'img': imageUrl.value,
      'uid': GetStorage().read('uid')
    };

    CollectionReference c = FirebaseFirestore.instance.collection('users');
    DocumentReference d = c.doc(GetStorage().read('uid'));
    await d.set(demoData);
    await getImageFirebase();
  }

  updateData(String name, String age, String gender, String college) async {
    Map<String, String> data = {
      "name": name,
      "age": age,
      "gender": gender,
      "college": college
    };

    CollectionReference c = FirebaseFirestore.instance.collection('users');
    DocumentReference d = c.doc(GetStorage().read('uid'));

    await d.update(data);
    await getData();
    Get.snackbar('Updated', 'Body Updated');
  }

  getData() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection
        .where('uid', isEqualTo: GetStorage().read('uid'))
        .get();

    for (var snapshot in querySnapshot.docs) {
      Map<String, dynamic> data = snapshot.data();
      detailsFromGoogle.value = [data];
    }
  }

  getImageFirebase() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection
        .where('uid', isEqualTo: GetStorage().read('uid'))
        .get();

    for (var snapshot in querySnapshot.docs) {
      Map<String, dynamic> data = snapshot.data();
      picFromGoogle.value = [data];
    }
  }
}
