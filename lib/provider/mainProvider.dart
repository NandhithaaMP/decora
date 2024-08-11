import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../models/adminModel.dart';

class MainProvider extends ChangeNotifier{
  final FirebaseFirestore db=FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");


  //Admin add Category
  TextEditingController categorynameController=TextEditingController();

  void addCategory(){
    String id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String,Object>category=HashMap();
    category["CATEGORY_NAME"]=categorynameController.text;
    category["CATEGORY_ID"]=id;
    db.collection("CATEGORY").doc(id).set(category);
    getCategory();
    notifyListeners();

  }

  List<CategoryModel> categoryList=[];
  void getCategory(){
    db.collection("CATEGORY").get().then((value){
      if(value.docs.isNotEmpty){
        categoryList.clear();
        for(var element in value.docs){
          categoryList.add(CategoryModel(
            element.id,
            element.get("CATEGORY_NAME")
          ));
          notifyListeners();
        }
      }
    });
  }
  void deleteCategory(String id,BuildContext context){
    db.collection("CATEGORY").doc(id).delete();
    getCategory();
    notifyListeners();
  }

  //add product--------------------------------------------------------------------------------------------------------------------

  TextEditingController productnameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController categoryNameController=TextEditingController();
  DateTime selectedDate=DateTime.now();
  String productSelectedcategoryid = "";
  File?  addProductFileImg;
  String productFileUrl="";

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addProductFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  Future<void> addProduct() async {
    String id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String,Object>productDetails=HashMap();
    productDetails["PRODUCT_NAME"]=productnameController.text;
    productDetails["CATEROGY_NAME"]=categoryNameController.text;
    productDetails["CATEROGYID"]=productSelectedcategoryid;
    productDetails["PRICE"]=priceController.text;
    productDetails["DELIVERY_DATE"]=selectedDate;
    if (addProductFileImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addProductFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          productDetails["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    }
    db.collection("PRODUCT").doc(id).set(productDetails);
    notifyListeners();
  }
  void updateSelectedDate(DateTime date){
    selectedDate=date;
    notifyListeners();
  }

  // List<ProductModel> productList = [];
  //
  // void getAddedProduct() {
  //   print('Fetching products...');
  //
  //   db.collection("PRODUCT").get().then((value) {
  //     if (value.docs.isNotEmpty) {
  //       productList.clear();
  //
  //       for (var element in value.docs) {
  //         try {
  //           String categoryName = element.data().containsKey("PRODUCT_NAME")
  //               ? element.get("PRODUCT_NAME")
  //               : "Unknown Category";
  //
  //           String price = element.data().containsKey("PRICE")
  //               ? element.get("PRICE")
  //               : "0"; // or some default value
  //
  //           String photo = element.data().containsKey("PHOTO")
  //               ? element.get("PHOTO")
  //               : ""; // or some default value
  //
  //           productList.add(ProductModel(
  //             element.id,
  //             categoryName,
  //             price,
  //             photo,
  //           ));
  //         } catch (e) {
  //           print('Error processing product: ${element.id}, $e');
  //         }
  //       }
  //
  //       notifyListeners(); // Notify after the product list has been updated
  //     }
  //   }).catchError((error) {
  //     print('Error fetching products: $error');
  //   });
  // }
  List<ProductModel>productList=[];
  void getAddedProduct(){
    print('fdddd');
    notifyListeners();
    db.collection("PRODUCT").get().then((value) {
      print('ddddd');
      notifyListeners();
      if(value.docs.isNotEmpty){
        notifyListeners();
        productList.clear();
        for(var element in value.docs){
          notifyListeners();
          productList.add(ProductModel(
            element.id,
            element.get("PRODUCT_NAME"),
            element.get("PRICE"),
            // element.get("DELIVERY_DATE"),
            element.get("PHOTO"),
          )
          );
        }
      }

    });
    notifyListeners();
  }

}