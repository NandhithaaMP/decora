import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decora/Designer/newEnquiryScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Designer----------------------------------------------------------------------------------------------------------------------------------------------------
  File? addWorkFileImg;
  String workFileUrl="";

  // Future<void> addDesignerWork() async {
  //   String id=DateTime.now().millisecondsSinceEpoch.toString();
  //    HashMap<String,Object> addWork=HashMap();
  //    if(addWorkFileImg!=null){
  //      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
  //      ref = FirebaseStorage.instance.ref().child(photoId);
  //      await ref.putFile(addProductFileImg!).whenComplete(() async {
  //        await ref.getDownloadURL().then((value) {
  //          addWork["PHOTO"] = value;
  //
  //          notifyListeners();
  //        });
  //        notifyListeners();
  //      });
  //    }
  //    db.collection("DESIGNER_WORK").doc(id).set(addWork);
  //    notifyListeners();
  //
  // }
  Future<void> addDesignerWork() async {
    if (addWorkFileImg == null) return;

    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addWork = HashMap();

    String photoId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child(photoId);

    await ref.putFile(addWorkFileImg!).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        workFileUrl = value;
        addWork["PHOTO"] = value;

        // Save to Firestore
        // FirebaseFirestore.instance.collection("DESIGNER_WORK").doc(id).set(addWork);

        db.collection("DESIGNER_WORK").doc(id).set(addWork);
        addWorkFileImg = null;
        notifyListeners();
      });
    });
  }
  Future DesignerImgGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      designerCropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }


  Future DesignerImgCamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      designerCropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> designerCropImage(String path, String from) async {
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
      addWorkFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  List<WorkModel>workList=[];
  void getDesignerWork(){
    db.collection("DEIGNER_WORK").get().then((value){
      if(value.docs.isNotEmpty){
        workList.clear();
        for(var element in value.docs){
          workList.add(WorkModel(
              element.id,
              element.get("PHOTO")
          )
          );
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
// --------------USER/DESIGNER-------------------------------------------------
  List<DesignerData>designerdataList=[];
  void getDesignerData(){
    db.collection("USERS").get().then((value){
      if(value.docs.isNotEmpty){
        designerdataList.clear();
        for(var element in value.docs){
          designerdataList.add(DesignerData(
              element.id,
              element.get("REGISTER_NAME"),
              element.get("REGISTER_PHONENUMBER"),
              element.get("DESIGNATION")

          ));
        }
      }
    });
  }

  // /---------------------------------------------------------------------------------------------------------------------------------------

  TextEditingController RegisterNameController=TextEditingController();
  TextEditingController RegisterPhoneController=TextEditingController();
  TextEditingController RegisterPasswordController=TextEditingController();
  TextEditingController designationController=TextEditingController();
  Future<void> addRegistration(BuildContext context) async {
    try {
      String id = DateTime.now().microsecondsSinceEpoch.toString();
      Map<String, dynamic> registerMap = {
        "REGISTER_ID": id,
        "REGISTER_NAME": RegisterNameController.text,
        "REGISTER_PHONENUMBER": RegisterPhoneController.text,
        "REGISTER_PASSWORD": RegisterPasswordController.text,
        "DESIGNATION": designationController.text,
      };

      // Add the registration data to Firestore
      await db.collection("USERS").doc(id).set(registerMap);

      // Save user data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("REGISTER_NAME", RegisterNameController.text);
      await prefs.setString("REGISTER_PHONENUMBER", RegisterPhoneController.text);
      await prefs.setString("REGISTER_PASSWORD", RegisterPasswordController.text);

      // Navigate based on designation
      if (designationController.text == "USER") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserHomePage()),
        );
      } else if (designationController.text == "DESIGNER") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NewEnquiryScreen()),
        );
      } else {
        // Handle unknown designation
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Registration Error"),
            content: Text("Unknown designation. Please select a valid option."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }

      notifyListeners();
    } catch (e) {
      print("Error during registration: $e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Registration Error"),
          content: Text("There was an error during registration. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
  // -------------------------------------GET THE LIKE PRODUCT IN WISHLIST-------------------------------------------------------------------------------------------

  Future<void> addToWishList(String productName,String productImage,String productPrice)async {
    await FirebaseFirestore.instance.collection("WISHLIST").add({
      'productName':productName,
      'productImage':productImage,
      'productPrice':productPrice,
    });
    print("Product added to wishlist");
    getWishList();
  }

  List<WishList> wishList=[];
  void getWishList(){
    db.collection("WISHLIST").get().then((value){
      if(value.docs.isNotEmpty){
        wishList.clear();
        for(var element  in value.docs){
          wishList.add(WishList(
              element.id,
              element.get('PRODUCT_NAME'),
              element.get('PRICE'),
              element.get("PHOTO")
          )
          );
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }


// Future<void> addRegistration(BuildContext context) async {
  //   try{
  //     String id=DateTime.now().microsecondsSinceEpoch.toString();
  //     HashMap<String,dynamic>registermap=HashMap();
  //     registermap["REGISTER_ID"]=id;
  //     registermap["REGISTER_NAME"]=RegisterNameController.text;
  //     registermap["REGISTER_PHONENUMBER"]=RegisterPhoneController.text;
  //     registermap["REGISTER_PASSWORD"]=RegisterPasswordController.text;
  //     registermap["DESIGNATION"]=designationController.text;
  //
  //     await db.collection("USERS").doc(id).set(registermap);
  //
  //     SharedPreferences  prefs = await SharedPreferences.getInstance();
  //     await prefs.setString("REGISTER_NAME", RegisterNameController.text);
  //     await prefs.setString("REGISTER_PHONENUMBER", RegisterPhoneController.text);
  //     await prefs.setString("REGISTER_PASSWORD", RegisterPasswordController.text);
  //     // notifyListeners();
  //     if(designationController.text=="USER"){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserHomePage(),));
  //     }
  //     else if(designationController.text=="DESIGNER"){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewEnquiryScreen(),));
  //     }
  //     notifyListeners();
  //   }catch(e){
  //     print("Errors during registration:$e");
  //     showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text("Registration Error"),
  //           content: Text("There was an error during registration .Please try again."),
  //           actions: [
  //             TextButton(onPressed: () => Navigator.pop(context),
  //                 child: Text("OK")
  //             )
  //           ],
  //         ),
  //     );
  //   }
  //
  //
  // }
  // void updateUserDetails({  required String userId,String? place,  }){
  //
  // }
  // List<UserData> userdataList=[];
  // void getUserdetails(){
  //   db.collection("USERS").get().then((onValue){
  //     if(onValue.docs.isNotEmpty){
  //         userdataList.clear();
  //         for(var element in onValue.docs){
  //           userdataList.add(UserData(
  //             element.id,
  //             element.get("REGISTER_NAME"),
  //             element.get("REGISTER_PHONENUMBER"),
  //           ));
  //         }
  //     }
  //   });
  // }

}