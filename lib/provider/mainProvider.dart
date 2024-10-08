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
  TextEditingController productDescriptionController=TextEditingController();
  TextEditingController totalProductController=TextEditingController();
  TextEditingController currentStatusContoller=TextEditingController();
  DateTime selectedDate=DateTime.now();
  String productSelectedcategoryid = "";
  File?  addProductFileImg;
  String productFileUrl="";

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

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

    //calcute delivery date
    productDetails["DELIVERY_DURATION"]=selectedDate.add(Duration(days: 5));
    productDetails["PRODUCT_DESCRIPTION"]=productDescriptionController.text;
    productDetails["TOTAL_NUMBER OF PRODUCTS"]=totalProductController.text;
    productDetails["STATUS"]="Ongoing";

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
    print("Product added :${productDetails}");
    notifyListeners();
  }
  // Method to update the product status to sold out when required
  Future<void> markProductAsSoldOut(String productId) async {
    await db.collection("PRODUCT").doc(productId).update({
      "CURRENT_STATUS": "Sold Out",
    });
    notifyListeners();
  }

  // Function to retrieve delivery date
  DateTime getDeliveryDate() {
    return selectedDate.add(Duration(days: 5)); // Calculate delivery date as needed
  }

  // void updateSelectedDate(DateTime date){
  //   selectedDate=date;
  //   notifyListeners();
  // }

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
          Map<dynamic,dynamic>map=element.data();
            productList.add(ProductModel(
            element.id,
            map["PRODUCT_NAME"].toString()??"",
            map["PRICE"].toString()??"",
            map["PRODUCT_DESCRIPTION"].toString()??"",
            map["DELIVERY_DURATION"].toString()??"",
            map["PHOTO"].toString()??"",
            map["CURRENT_STATUS"].toString()??"",
            int.tryParse(map["PRODUCT_COUNT"].toString())??0,
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
    db.collection("DESIGNER_WORK").get().then((value){
      if(value.docs.isNotEmpty){
        workList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic>designerwork=element.data();
          workList.add(WorkModel(
              element.id,
              designerwork["PHOTO"]??""
          )
          );
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
// --------------USER/DESIGNER-------------------------------------------------
//   List<DesignerData>designerdataList=[];
//   void getDesignerData(){
//     db.collection("USERS").get().then((value){
//       if(value.docs.isNotEmpty){
//         designerdataList.clear();
//         for(var element in value.docs){
//           designerdataList.add(DesignerData(
//               element.id,
//               element.get("REGISTER_NAME"),
//               element.get("REGISTER_PHONENUMBER"),
//               element.get("DESIGNATION")
//
//           ));
//         }
//       }
//     });
//   }

  // /---------------------------------------------------------------------------------------------------------------------------------------

  TextEditingController RegisterNameController=TextEditingController();
  TextEditingController RegisterPhoneController=TextEditingController();
  TextEditingController RegisterPasswordController=TextEditingController();
  TextEditingController DesignationController=TextEditingController();
  TextEditingController PlaceController=TextEditingController();
  TextEditingController AddressController=TextEditingController();
  // TextEditingController ProfilePictureController=TextEditingController();
  Future<void> addRegistration(BuildContext context) async {
    try {
      String id = DateTime.now().microsecondsSinceEpoch.toString();
      Map<String, dynamic> registerMap = {
        "REGISTER_ID": id,
        "REGISTER_NAME": RegisterNameController.text,
        "REGISTER_PHONENUMBER": RegisterPhoneController.text,
        "REGISTER_PASSWORD": RegisterPasswordController.text,
        "DESIGNATION": DesignationController.text,
        "PLACE": PlaceController.text,
        "ADDRESS": AddressController.text,
      };

      // Add the registration data to Firestore
      await db.collection("USERS").doc(id).set(registerMap);

      // Save user data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("REGISTER_NAME", RegisterNameController.text);
      await prefs.setString("REGISTER_PHONENUMBER", RegisterPhoneController.text);
      await prefs.setString("REGISTER_PASSWORD", RegisterPasswordController.text);

      // Navigate based on designation
      if (DesignationController.text == "USER") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserHomePage(user_Name: '', phone_Number: '', pass_word: '', place_: '', address_: '', userId: '',)),
        );
      } else if (DesignationController.text == "DESIGNER") {
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
  List<UsersModel> usersList=[];
  void getUsers(){
    db.collection("USERS").get().then((value){
      if(value.docs.isNotEmpty){
        usersList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic>userdata=element.data();
         usersList.add(UsersModel(
             element.id,
             userdata["REGISTER_NAME"]??"",
             userdata["REGISTER_PHONENUMBER"]??"",
             userdata["REGISTER_PASSWORD"]??"",
             userdata["DESIGNATION"]??"",
             userdata["PLACE"]??"",
             userdata["ADDRESS"]??"",
         ));
        }
      }
    });
  }

  // -------------------------------------------Add to cart......................................................................

  List<ProductModel>cartList=[];

  // Map to hold TextEditingControllers for each product
  Map<String,TextEditingController>countController={};
  Map<String,TextEditingController>totalPriceController={};

  // Initialize Controller with the current value
  void initController(String productId,double price){
    // Create controllers for each product
    if(!countController.containsKey(productId)){
      countController[productId]=TextEditingController(text: "1");
      totalPriceController[productId]=TextEditingController(text: price.toStringAsFixed(2));
    }
  }
  void increment(String productId,double unitPrice) {
    int item_Count=int.parse(countController[productId]!.text);
    item_Count++;
    countController[productId]!.text=item_Count.toString();
    totalPriceController[productId]!.text=(item_Count*unitPrice).toStringAsFixed(2);// Update total price
    notifyListeners();
  }

  void decrement(String productId,double unitPrice) {
    int item_Count=int.parse(countController[productId]!.text);
    if (item_Count > 1) {
      item_Count--;
      countController[productId]!.text=item_Count.toString();
      totalPriceController[productId]!.text=(item_Count*unitPrice).toStringAsFixed(2);
      notifyListeners();
    }
  }

  void addToCart(String userId,String productId,String img,String price,String name){
    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm $productId ${totalPriceController[productId]}");
    HashMap<String,dynamic>cart=HashMap();
    cart["PRODUCT_NAME"]=name;
    cart["PRODUCT_IMAGE"]=img;
    cart["PRODUCT_PRICE"]=price; // Save the price as a string with 2 decimal places
    cart["PRODUCT_COUNT"]=countController[productId]==null?0:countController[productId]!.text;
    cart["TOTAL_PRICE"]=totalPriceController[productId]==null?0:totalPriceController[productId]!.text;
    print("Total_price ----------${cart["TOTAL_PRICE"]}");
    db.collection("USERS").doc(userId).collection("CART").doc(productId).set(cart,SetOptions(merge: true));
    print("rrrrrrrr  :"+cartList.length.toString());
    getAddedCart(userId);
    notifyListeners();
  }

  void getAddedCart(String userId){
    db.collection("USERS").doc(userId).collection("CART").get().then((value){

      if(value.docs.isNotEmpty){
        cartList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic>cart=element.data();
          cartList.add(ProductModel(
              element.id,
              cart["PRODUCT_NAME"]??"",
              cart["PRODUCT_PRICE"]??"",
              cart["PRODUCT_DESCRIPTION"]??"",
              cart["DELIVERY_DURATION"]??"",
              cart["PRODUCT_IMAGE"]??"",
              cart["CURRENT_STATUS"]??"",
            cart["PRODUCT_COUNT"]??0
          ));
          notifyListeners();
          print("cart details"+cartList.toString());
          print("rrrrrrrr  :"+cartList.length.toString());
          print("Product Price:${cart["PRODUCT_PRICE"]}");

        }
      }
    });
  }
  double calculateGrandTotal(){
    double grandTotal=0.0;
    for(var product in cartList){
      double price=double.tryParse(product.price)??0.0;
      // int count=int.tryParse(product.count)??0;
      int count = product.count;
      // Add to grand total
      grandTotal+=price*count;
    }
    return grandTotal;
  }

  // ------------------------------------- TO GET THE LIKED PRODUCT IN WISHLIST-------------------------------------------------------------------------------------------




















  void addToFavorite(String userId,String productId){
    db.collection("USERS").doc(userId).get().then((value){
      if(value.exists){
        HashMap<String,Object>addToFav=HashMap();
        db.collection("USERS").doc(userId).set({"WISHLIST":FieldValue.arrayUnion([productId])},SetOptions(merge: true));
        db.collection("PRODUCT").doc(userId).set({"FAVOURITED_PRODUCT":FieldValue.arrayUnion([productId])},SetOptions(merge: true));
        notifyListeners();
      }
    });
    notifyListeners();
  }
  List<WishList> wishList = [];

  int Activeindex=0;
  void carouselIndex(int index) {
    Activeindex=index;
    notifyListeners();
  }


  // Future<void> addToWishList(String productName,String productImage,String productPrice)async {
  //   await FirebaseFirestore.instance.collection("WISHLIST").add({
  //     'productName':productName,
  //     'productImage':productImage,
  //     'productPrice':productPrice,
  //   });
  //   print("Product added to wishlist");
  //   getWishList();
  // }
  //
  // List<WishList> wishList = [];
  //
  // void getWishList() {
  //   db.collection("WISHLIST").get().then((value) {
  //     print("==============================Fetched wishlist : ${value.docs.length} items==================================");
  //     if (value.docs.isNotEmpty) {
  //       wishList.clear();
  //       for (var element in value.docs) {
  //         print("------------------Product fetched :${element.get('productName')}=====================");
  //         wishList.add(WishList(
  //                       element.id,
  //                       element.get('productName'),
  //                       element.get('productImage'),
  //                       element.get('productPrice')
  //         ));
  //       }
  //       notifyListeners();
  //     }
  //     else{
  //       wishList.clear();
  //       notifyListeners();
  //     }
  //   });
  // }
  // void deleteWishList(String id){
  // db.collection("WISHLIST").doc(id).delete();
  // getWishList();
  // notifyListeners();
  // }

// -----------------------------ADD TO CART----------------------------------------------------

  // void addToCart(String productImage,productName,productPrice){
  //   FirebaseFirestore.instance.collection("ADD_TO_CART").add({
  //     'productImage':productImage,
  //     'productName':productName,
  //     'productPrice':productPrice,
  //   });
  //   print(".................Product added to cart........");
  //   getCartProduct();
  //   notifyListeners();
  // }

  // List<CartList> cartList=[];
  // void getCartProduct(){
  //   db.collection("CART").get().then((value) {
  //     if(value.docs.isNotEmpty){
  //       cartList.clear();
  //       for(var element in value.docs){
  //         cartList.add(CartList(
  //             element.id,
  //             element.get('productName'),
  //             element.get('productImage'),
  //             element.get('productPrice')
  //         ));
  //       }
  //       notifyListeners();
  //     }
  //     else{
  //       cartList.clear();
  //       notifyListeners();
  //     }
  //   },);
  // }
  }

