import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decora/Designer/chatBoxScreen.dart';
import 'package:decora/Designer/newEnquiryScreen.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/models/messages.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/loginScreen.dart';
import 'package:decora/user/userBottomNavigation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/adminModel.dart';

class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");


  //Admin add Category
  TextEditingController categorynameController = TextEditingController();

  void addCategory() {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object>category = HashMap();
    category["CATEGORY_NAME"] = categorynameController.text;
    category["CATEGORY_ID"] = id;
    db.collection("CATEGORY").doc(id).set(category);
    clearCategory();
    getCategory();
    notifyListeners();
  }

  List<CategoryModel> categoryList = [];

  void getCategory() {
    db.collection("CATEGORY").get().then((value) {
      if (value.docs.isNotEmpty) {
        categoryList.clear();
        for (var element in value.docs) {
          categoryList.add(CategoryModel(
              element.id,
              element.get("CATEGORY_NAME")
          ));
          notifyListeners();
        }
      }
    });
  }

  void deleteCategory(String id, BuildContext context) {
    db.collection("CATEGORY").doc(id).delete();
    categoryList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearCategory() {
    categorynameController.clear();
    notifyListeners();
  }

  //-------------------------------------------------------ADD PRODUCT---------------------------------------------------------------------------------

  TextEditingController productnameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController totalProductController = TextEditingController();
  TextEditingController currentStatusContoller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String productSelectedcategoryid = "";
  File? addProductFileImg;
  String productFileUrl = "";

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery);

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

  Future<void> addProduct(String from, String oldid) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object>productDetails = HashMap();

    productDetails["PRODUCT_NAME"] = productnameController.text;
    productDetails["CATEROGY_NAME"] = categoryNameController.text;
    productDetails["CATEROGYID"] = productSelectedcategoryid;
    productDetails["PRICE"] = priceController.text;

    //calcute delivery date
    productDetails["DELIVERY_DURATION"] = selectedDate.add(Duration(days: 5));
    productDetails["PRODUCT_DESCRIPTION"] = productDescriptionController.text;
    productDetails["TOTAL_NUMBER OF PRODUCTS"] = totalProductController.text;
    productDetails["STATUS"] = currentStatusContoller.text;
    // productDetails["STATUS"]="Ongoing";

    if (addProductFileImg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addProductFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          productDetails["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    }
    if (from == "NEW") {
      productDetails["PRODUCT_ID"] = id;
    }
    if (from == "EDIT") {
      db.collection("PRODUCT").doc(oldid).set(
          productDetails, SetOptions(merge: true));
    }
    else {
      db.collection("PRODUCT").doc(id).set(productDetails);
    }

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

  // // Function to retrieve delivery date
  // DateTime getDeliveryDate() {
  //   return selectedDate.add(Duration(days: 5)); // Calculate delivery date as needed
  // }

  void updateSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  DateTime getDeliveryDate() {
    return selectedDate.add(Duration(days: 5));
  }


  void editProduct(String productId) {
    db.collection("PRODUCT").doc(productId).get().then((value) {
      Map<dynamic, dynamic> editProduct = value.data() as Map;
      if (value.exists) {
        productnameController.text = editProduct["PRODUCT_NAME"];
        categoryNameController.text = editProduct["CATEROGY_NAME"];
        priceController.text = editProduct["PRICE"];
        productDescriptionController.text = editProduct["PRODUCT_DESCRIPTION"];
        totalProductController.text = editProduct["TOTAL_NUMBER OF PRODUCTS"];
        currentStatusContoller.text = editProduct["STATUS"];

        notifyListeners();
      }
    },);
    notifyListeners();
  }


  List<ProductModel>productList = [];

  void getAddedProduct() {
    print('fdddd');
    notifyListeners();
    db.collection("PRODUCT").get().then((value) {
      print('ddddd');
      notifyListeners();
      if (value.docs.isNotEmpty) {
        notifyListeners();
        productList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic>map = element.data();
          productList.add(ProductModel(
            element.id,
            map["PRODUCT_NAME"].toString() ?? "",
            double.tryParse(map["PRICE"].toString()) ?? 0,
            map["PRODUCT_DESCRIPTION"].toString() ?? "",
            map["DELIVERY_DURATION"].toString() ?? "",
            map["PHOTO"].toString() ?? "",
            map["STATUS"].toString() ?? "",
            int.tryParse(map["PRODUCT_COUNT"].toString()) ?? 0,
            map["CATEROGYID"].toString() ?? "",
            map["CATEROGY_NAME"].toString() ?? "",
            map["TOTAL_NUMBER OF PRODUCTS"].toString() ?? "",
          )
          );
        }
      }
    });
    notifyListeners();
  }

  void clearAddedProduct() {
    productnameController.clear();
    categoryNameController.clear();
    priceController.clear();
    // selectedDate.add(Duration(days: 5));
    productDescriptionController.clear();
    totalProductController.clear();
    addProductFileImg = null;
    productFileUrl = "";
    currentStatusContoller.clear();
    notifyListeners();
  }

  void deleteProduct(String productId, BuildContext context) {
    db.collection("PRODUCT").doc(productId).delete();
    productList.removeWhere((element) => element.pid == productId);
    notifyListeners();
  }

// _______________________________________LOGOUT_________________________________?
  logOutAlert(BuildContext context,) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      scrollable: true,
      title: const Text(
        "Do you want to Logout",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: TextButton(
                    child: const Text(
                        'No', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      finish(context);
                      // finish(context);
                    }),
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  // border: Border.all(color:Colors.yellow),
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: TextButton(
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences
                          .getInstance();
                      prefs.clear();
                      // loginphoneController.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()), (
                          Route<dynamic> route) => false);
                    }),
              ),
            ],
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // ---------------------------------------------------ADD DESIGNER WORK-------------------------------------------------------------------------------------------------
  File? addWorkFileImg;
  String workFileUrl = "";

  Future<void> addDesignerWork(String designerId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> addWork = HashMap();
    addWork["WORK_ID"] = id;
    addWork["DESIGNER_ID"] = designerId;
    if (addWorkFileImg == null) return;

    String photoId = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
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
        getDesignerWork(designerId);
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

  List<WorkModel>workList = [];

  void getDesignerWork(String loginUserId) {
    db.collection("DESIGNER_WORK")
        .where("DESIGNER_ID", isEqualTo: loginUserId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        workList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic>designerwork = element.data();
          workList.add(WorkModel(
              element.id,
              designerwork["PHOTO"] ?? "",
              designerwork["DESIGNER_ID"] ?? ""
          )

          );
          print("WORKlIST:${wishList}");
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void deleteDesignerWork(String workId, BuildContext context) {
    db.collection("DESIGNER_WORK").doc(workId).delete();
    // getDesignerWork(loginUserId);
    workList.removeWhere((element) => element.wid == workId);
    notifyListeners();
  }


// -------------------------------------------CAROUSEL -------------------------------------------------
  int Activeindex = 0;

  void carouselIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  List<DesignerWorkModel>allAddedWorkList = [];

  getAllAddedWork() async {
    await db.collection("DESIGNER_WORK").get().then((value) async {
      if (value.docs.isNotEmpty) {
        allAddedWorkList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> allWork = element.data();
          String designer_id = allWork["DESIGNER_ID"];
          await db.collection("USERS").doc(designer_id).get().then((value) {
            if (value.exists) {
              Map<dynamic, dynamic>deswork = value.data() as Map;
              allAddedWorkList.add(DesignerWorkModel(
                value.id,
                allWork["PHOTO"] ?? "",
                allWork["DESIGNER_ID"] ?? "",
                deswork["REGISTER_NAME"] ?? "",
                deswork["PLACE"] ?? "",
                deswork["USERS_IMAGE"] ?? "",
              ));
            }
          },);
          // allAddedWorkList.add(WorkModel(
          //     element.id,
          //     allWork["PHOTO"],
          //     allWork["DESIGNER_ID"]??""
          // ));
          print("jjjjjjjjjjjjjjjjjjjj+${allAddedWorkList}");
          print("88888888888888888888888888888:${allWork["PHOTO"]}");
        }

        notifyListeners();
      }
    },);
  }

  String designerProfilePic = "";
  String designerName = "";
  String designation = "";
  String designerPlace = "";
  String designerPhone = "";
  List<String>designerWork = [];

  void getDesignerDetails(String designerID) {
    db.collection("USERS").doc(designerID).get().then((value) {
      if (value.exists) {
        designerWork.clear();
        Map<dynamic, dynamic>details = value.data() as Map;
        designerProfilePic = details["USERS_IMAGE"];
        designerName = details["REGISTER_NAME"];
        designation = details["DESIGNATION"];
        designerPlace = details["PLACE"];
        designerPhone = details["REGISTER_PHONENUMBER"];
        allAddedWorkList.forEach((element) {
          if (element.designerId == designerID) {
            designerWork.add(element.workImage);
          }
        });
      }
      notifyListeners();
    },);
  }

  // /--------------------------------------------------------REGISTRATION-------------------------------------------------------------------------------

  TextEditingController RegisterNameController = TextEditingController();
  TextEditingController RegisterPhoneController = TextEditingController();
  TextEditingController RegisterPasswordController = TextEditingController();
  TextEditingController DesignationController = TextEditingController();
  TextEditingController PlaceController = TextEditingController();
  TextEditingController AddressController = TextEditingController();

  // TextEditingController ProfilePictureController=TextEditingController();

  File? addUsersImage;
  String UsersImageURL = "";

  // List<File> imagefileList = [];


  Future<void> addRegistration(BuildContext context, String from,
      String oldid) async {
    LoginProvider loginPro = Provider.of<LoginProvider>(context, listen: false);
    try {
      String id = oldid;
      Map <String, dynamic> regMap = Map();
      if (from == "NEW") {
        id = DateTime
            .now()
            .microsecondsSinceEpoch
            .toString();
        regMap["REGISTER_ID"] = id;
        regMap["REGISTER_PASSWORD"] = RegisterPasswordController.text;
        regMap["DESIGNATION"] = DesignationController.text;
      }

      regMap["REGISTER_NAME"] = RegisterNameController.text;
      regMap["REGISTER_PHONENUMBER"] = RegisterPhoneController.text;
      regMap["PLACE"] = PlaceController.text;
      regMap["ADDRESS"] = AddressController.text;
      loginPro.loginAddress = AddressController.text;
      if (addUsersImage != null) {
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        ref = FirebaseStorage.instance.ref().child(photoId);
        await ref.putFile(addUsersImage!).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            regMap["USERS_IMAGE"] = value;
          },);
        },);
      }
      else if (UsersImageURL != "") {
        regMap["USERS_IMAGE"] = UsersImageURL;
      }

      else {
        regMap["USERS_IMAGE"] = "";
      }


      // Add the registration data to Firestore
      await db.collection("USERS").doc(id).set(regMap, SetOptions(merge: true));

      // Save user data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("REGISTER_NAME", RegisterNameController.text);
      await prefs.setString(
          "REGISTER_PHONENUMBER", RegisterPhoneController.text);
      await prefs.setString(
          "REGISTER_PASSWORD", RegisterPasswordController.text);

      loginPro.usersAuthorized(
          RegisterPhoneController.text, RegisterPasswordController.text,
          context);


      notifyListeners();
    } catch (e) {
      print("Error during registration: $e");
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Registration Error"),
              content: Text(
                  "There was an error during registration. Please try again."),
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


  Future UsersgetImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      UserscropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future UsersgetImagecamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      UserscropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> UserscropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
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
      // print(' TTTy EYFE ' + imagefileList.length.toString());
      addUsersImage = File(croppedFile.path);

      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void editUsers(String userId) {
    db.collection("USERS").doc(userId).get().then((value) {
      Map<dynamic, dynamic> editusers = value.data() as Map;
      if (value.exists) {
        RegisterNameController.text = editusers["REGISTER_NAME"].toString();
        RegisterPhoneController.text =
            editusers["REGISTER_PHONENUMBER"].toString();
        RegisterPasswordController.text =
            editusers["REGISTER_PASSWORD"].toString();
        PlaceController.text = editusers["PLACE"].toString();
        AddressController.text = editusers["ADDRESS"].toString();
        notifyListeners();
      }
    },);
    notifyListeners();
  }

  List<UsersModel> usersList = [];

  void getUsers() {
    db.collection("USERS").get().then((value) {
      if (value.docs.isNotEmpty) {
        usersList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic>userdata = element.data();
          usersList.add(UsersModel(
            element.id,
            userdata["REGISTER_NAME"] ?? "",
            userdata["REGISTER_PHONENUMBER"] ?? "",
            userdata["REGISTER_PASSWORD"] ?? "",
            userdata["DESIGNATION"] ?? "",
            userdata["PLACE"] ?? "",
            userdata["ADDRESS"] ?? "",
            userdata["USERS_IMAGE"] ?? "",
          ));
        }
      }
    });
  }

  List<UsersModel>designerList = [];

  void getDesigners() {
    db.collection("USERS").where("DESIGNATION", isEqualTo: "DESIGNER")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        designerList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> designer = element.data();
          designerList.add(UsersModel(
            element.id,
            designer["REGISTER_NAME"] ?? "",
            designer["REGISTER_PASSWORD"] ?? "",
            designer["REGISTER_PHONENUMBER"] ?? "",
            designation,
            designer["PLACE"] ?? "",
            designer["ADDRESS"] ?? "",
            designer["USERS_IMAGE"] ?? "",
          ));
        }
        notifyListeners();
      }
    },);
  }

  // -------------------------------------------Add to cart......................................................................


  // Map to hold TextEditingControllers for each product
  Map<String, TextEditingController>countController = {};
  Map<String, TextEditingController>totalPriceController = {};

// Method to initialize controllers
  initController(String productId, double unitPrice) async {
    countController[productId] ??=
        TextEditingController(text: '1'); // Default quantity 1
    totalPriceController[productId] ??=
        TextEditingController(text: unitPrice.toStringAsFixed(2));
    print(
        "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz ${countController[productId]?.text}  ");
    print("xxxxxxxxxxxxxxxxxxxxxx   ${totalPriceController[productId]?.text}");
    // notifyListeners();
  }

  // Increment function
  void increment(String productId, double unitPrice, String userId) {
    int currentCount = int.parse(countController[productId]?.text ?? '1');
    currentCount++;
    countController[productId]?.text = currentCount.toString();
    print("kkkkkkkkkkklllllllllllllllllllllll $productId  $currentCount");
    print(
        "kkkkkkkkkkkbbbbbbbbbbbbbbbbbbbbbbbb $unitPrice  ${countController[productId]
            ?.text }  $currentCount");
    // Update total price for that product
    double totalPrice = currentCount * unitPrice;
    totalPriceController[productId]?.text = totalPrice.toStringAsFixed(2);

    // Call to update the grand total
    updateGrandTotal();

    notifyListeners(); // Notify UI about changes
  }

  // Decrement function
  void decrement(String productId, double unitPrice, String userId) {
    int currentCount = int.parse(countController[productId]?.text ?? '1');
    if (currentCount > 1) {
      currentCount--;
      countController[productId]?.text = currentCount.toString();

      // Update total price for that product
      double totalPrice = currentCount * unitPrice;
      totalPriceController[productId]?.text = totalPrice.toStringAsFixed(2);

      // Call to update the grand total
      updateGrandTotal();

      notifyListeners(); // Notify UI about changes
    }
  }

  void clearCart() {
    countController.clear();
    totalPriceController.clear();
  }

  void addToCart(String userId, String productId, String img, String price,
      String name) {
    print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${countController[productId]}");
    int productCount = 0;
    if (countController[productId] != null) {
      print("Count-------------------------------------------------");
      productCount = int.parse(countController[productId]!.text);
    }
    double totalPrice = 0;
    if (totalPriceController[productId] != null) {
      print("tota------------------------------");
      totalPrice = double.parse(totalPriceController[productId]!.text);
    }

    print(
        "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm $productId ${totalPriceController[productId]}");
    HashMap<String, dynamic>cart = HashMap();
    cart["PRODUCT_NAME"] = name;
    cart["PRODUCT_IMAGE"] = img;
    cart["PRODUCT_PRICE"] =
        price; // Save the price as a string with 2 decimal places
    cart["PRODUCT_COUNT"] = productCount;
    cart["TOTAL_PRICE"] = totalPrice;
    cart["PRODUCT_ID"] = productId;

    print("Total_price ----------${cart["TOTAL_PRICE"]}");
    print("Total_COUNT ----------${cart["PRODUCT_COUNT"]}");
    db.collection("USERS").doc(userId).collection("CART").doc(productId).set(
        cart, SetOptions(merge: true));
    print("rrrrrrrr  :" + cartList.length.toString());
    getAddedCart(userId);
    updateGrandTotal();
    notifyListeners();
  }

  List<ProductModel>cartList = [];

  void getAddedCart(String userId) {
    print("nnnnnnnnnn$userId");
    db.collection("USERS").doc(userId).collection("CART").get().then((value) {
      print("ooooooooooooooo");
      if (value.docs.isNotEmpty) {
        print("pppppppppppp");
        cartList.clear();
        for (var element in value.docs) {
          print("qqqqqqcccccccccccccc");
          Map<dynamic, dynamic>cart = element.data();
          cartList.add(ProductModel(
              element.id,
              cart["PRODUCT_NAME"] ?? "",
              double.parse(cart["PRODUCT_PRICE"] ?? 0),
              cart["PRODUCT_DESCRIPTION"] ?? "",
              cart["DELIVERY_DURATION"] ?? "",
              cart["PRODUCT_IMAGE"] ?? "",
              cart["CURRENT_STATUS"] ?? "",
              cart["PRODUCT_COUNT"] ?? 0,
              cart["CATEROGYID"] ?? "",
              cart["CATEROGY_NAME"] ?? "",
              cart["TOTAL_NUMBER OF PRODUCTS"] ?? ""
          ));
          notifyListeners();
          print("cart details" + cartList.toString());
          print("rrrrrrrr  :" + cartList.length.toString());
          print("Product Price:${cart["PRODUCT_PRICE"]}");
        }
      }
    });
  }


  // Function to calculate and add grand total to Firestore
  void addGrandTotalToUsers(String userId) {
    // First, calculate the grand total
    double grandTotal = calculateGrandTotal();
    // Prepare the data to store in Firestore
    Map<String, dynamic>cart_total = {
      "CART_GRANDTOTAL": grandTotal
    };
    db.collection("USERS").doc(userId)
        .set(cart_total, SetOptions(merge: true))
        .then((value) {
      print("GRAND TOTAL UPDATED SUCCESSFULLY!----");
    },).catchError((error) {
      print("FAILED TO UPDATE GRAND TOTAL :$error");
    });
  }

  // Grand total calculation
  double calculateGrandTotal() {
    double grandTotal = 0.0;
    for (var product in cartList) {
      String productId = product.pid;
      double productTotal = double.parse(
          totalPriceController[productId]?.text ?? '0');
      grandTotal += productTotal;
    }
    return grandTotal;
  }

  // Method to update grand total
  void updateGrandTotal() {
    notifyListeners(); // Notify the UI that the grand total has changed
  }

  double grandTotal = 0.0;

  void getGrandTotal(String userId) async {
    try {
      DocumentSnapshot doc = await db.collection("USERS").doc(userId).get();
      if (doc.exists) {
        if (doc.data() != null && doc["CART_GRANDTOTAL"] != null) {
          grandTotal = doc["CART_GRANDTOTAL"];

          notifyListeners();
        }
      }
    }
    catch (e) {
      print("Failed to fetch grand total:$e");
    }
  }

  void deleteProductFromCart(String userId, String productId) {
    db.collection("USERS").doc(userId).collection("CART")
        .doc(productId)
        .delete();
    print("You deleted product from cart-----------------");
    getAddedCart(userId);
    notifyListeners();
  }


//
//      void clearCart(){
//     countController.clear();
//     totalPriceController.clear();
//   }
//
//   List<ProductModel>cartList=[];
//
//   // Map to hold TextEditingControllers for each product
//   Map<String,TextEditingController>countController={};
//   Map<String,TextEditingController>totalPriceController={};
// // Method to initialize controllers
//   void initController(String productId, double unitPrice) {
//     if(!countController.containsKey(productId)){
//       countController[productId] ??= TextEditingController(text: '1'); // Default quantity 1
//     }
//     if(!totalPriceController.containsKey(productId)){
//       totalPriceController[productId] ??= TextEditingController(text: unitPrice.toStringAsFixed(2));
//     }
//
//   }
//   // Increment function
//   void increment(String productId, double unitPrice, String userId) {
//     int currentCount = int.parse(countController[productId]?.text ?? '1');
//     currentCount++;
//     countController[productId]?.text = currentCount.toString();
//
//     // Update total price for that product
//     double totalPrice = currentCount * unitPrice;
//     totalPriceController[productId]?.text = totalPrice.toStringAsFixed(2);
//     addToCart(userId, productId, "", unitPrice.toString(), "");
//     // Call to update the grand total
//     updateGrandTotal();
//
//     notifyListeners(); // Notify UI about changes
//   }
//
//   // Decrement function
//   void decrement(String productId, double unitPrice, String userId) {
//     int currentCount = int.parse(countController[productId]?.text ?? '1');
//     if (currentCount > 1) {
//       currentCount--;
//       countController[productId]?.text = currentCount.toString();
//
//       // Update total price for that product
//       double totalPrice = currentCount * unitPrice;
//       totalPriceController[productId]?.text = totalPrice.toStringAsFixed(2);
//
//       // Call to update the grand total
//       updateGrandTotal();
//       addToCart(userId, productId, "", unitPrice.toString(), "");
//       notifyListeners(); // Notify UI about changes
//     }
//   }
//   void addToCart(String userId,String productId,String img,String price,String name){
//
//     print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${countController[productId]}");
//     int productCount=0;
//     if(countController[productId]!=null) {
//       productCount = int.parse(countController[productId]!.text);
//     }
//     double totalPrice=0;
//     if(totalPriceController[productId]!=null) {
//       totalPrice = double.parse(totalPriceController[productId]!.text);
//     }
//
//     print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm $productId ${totalPriceController[productId]}");
//     HashMap<String,dynamic>cart=HashMap();
//     cart["PRODUCT_NAME"]=name;
//     cart["PRODUCT_IMAGE"]=img;
//     cart["PRODUCT_PRICE"]=price; // Save the price as a string with 2 decimal places
//     // cart["PRODUCT_COUNT"]=countController[productId]==null?0:countController[productId]!.text;
//     cart["PRODUCT_COUNT"]=productCount;
//     // cart["TOTAL_PRICE"]=totalPriceController[productId]==null?0:totalPriceController[productId]!.text;
//     cart["TOTAL_PRICE"]=totalPrice;
//     print("Total_price ----------${cart["TOTAL_PRICE"]}");
//     db.collection("USERS").doc(userId).collection("CART").doc(productId).set(cart,SetOptions(merge: true));
//     print("rrrrrrrr  :"+cartList.length.toString());
//     getAddedCart(userId);
//     updateGrandTotal();
//     notifyListeners();
//   }
//
//   void getAddedCart(String userId){
//     db.collection("USERS").doc(userId).collection("CART").get().then((value){
//
//       if(value.docs.isNotEmpty){
//         cartList.clear();
//         for(var element in value.docs){
//           Map<dynamic,dynamic>cart=element.data();
//           cartList.add(ProductModel(
//               element.id,
//               cart["PRODUCT_NAME"]??"",
//               cart["PRODUCT_PRICE"]??"",
//               cart["PRODUCT_DESCRIPTION"]??"",
//               cart["DELIVERY_DURATION"]??"",
//               cart["PRODUCT_IMAGE"]??"",
//               cart["CURRENT_STATUS"]??"",
//               cart["PRODUCT_COUNT"]??0,
//               cart["CATEROGYID"]??"",
//               cart["CATEROGY_NAME"]??"",
//               cart["TOTAL_NUMBER OF PRODUCTS"]??""
//           ));
//           notifyListeners();
//           print("cart details"+cartList.toString());
//           print("rrrrrrrr  :"+cartList.length.toString());
//           print("Product Price:${cart["PRODUCT_PRICE"]}");
//
//         }
//       }
//     });
//   }
//
//
//   // Function to calculate and add grand total to Firestore
//   void addGrandTotalToUsers(String userId){
//     // First, calculate the grand total
//     double grandTotal=calculateGrandTotal();
//     // Prepare the data to store in Firestore
//     Map<String,dynamic>cart_total={
//       "CART_GRANDTOTAL":grandTotal
//     };
//     db.collection("USERS").doc(userId).set(cart_total,SetOptions(merge: true)).then((value) {
//       print("GRAND TOTAL UPDATED SUCCESSFULLY!----");
//     },).catchError((error){
//       print("FAILED TO UPDATE GRAND TOTAL :$error");
//     });
//   }
//
//   // Grand total calculation
//   double calculateGrandTotal() {
//     double grandTotal = 0.0;
//     for (var product in cartList) {
//       String productId = product.pid;
//       double productTotal = double.parse(totalPriceController[productId]?.text ?? '0');
//       grandTotal += productTotal;
//     }
//     return grandTotal;
//   }
//
//   // Method to update grand total
//   void updateGrandTotal() {
//     notifyListeners(); // Notify the UI that the grand total has changed
//   }
//   double grandTotal=0.0;
//   void getGrandTotal(String userId)async{
//     try{
//       DocumentSnapshot doc=await db.collection("USERS").doc(userId).get();
//       if (doc.exists){
//         if(doc.data()!=null&&doc["CART_GRANDTOTAL"]!=null){
//           grandTotal=doc["CART_GRANDTOTAL"];
//           notifyListeners();
//         }
//       }
//     }
//     catch(e){
//       print("Failed to fetch grand total:$e");
//     }
//
//   }
//
//   void deleteProductFromCart(String userId,String productId){
//     db.collection("USERS").doc(userId).collection("CART").doc(productId).delete();
//     print("You deleted product from cart-----------------");
//     getAddedCart(userId);
//     notifyListeners();
//   }
// ---------------------------------------------ADD TO BUY NOW-----------------------------------------------------------------

  // Map to hold TextEditingControllers for each product
  Map<String, TextEditingController>countBuyController = {};
  Map<String, TextEditingController>totalPriceBuyController = {};

// Method to initialize controllers
  void initBuyController(String productId, double unitPrice) {
    countBuyController[productId] ??=
        TextEditingController(text: '1'); // Default quantity 1
    totalPriceBuyController[productId] ??=
        TextEditingController(text: unitPrice.toStringAsFixed(2));
  }

  // Increment function
  void incrementBuy(String productId, double unitPrice, String userId) {
    int currentCount = int.parse(countBuyController[productId]?.text ?? '1');
    currentCount++;
    countBuyController[productId]?.text = currentCount.toString();
    print(
        "hhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiii $unitPrice     $currentCount");

    // Update total price for that product
    double totalPrice = currentCount * unitPrice;
    print("vgggggggggggvvvvvvvvvvvv $totalPrice   $productId");
    totalPriceBuyController[productId]?.text = totalPrice.toStringAsFixed(2);
    print("bnggjhgj ${totalPriceBuyController[productId]?.text}");
    notifyListeners();
    // Call to update the grand total
    // updateGrandTotal();

    notifyListeners(); // Notify UI about changes
  }

  // Decrement function
  void decrementBuy(String productId, double unitPrice, String userId) {
    int currentCount = int.parse(countBuyController[productId]?.text ?? '1');
    if (currentCount > 1) {
      currentCount--;
      countBuyController[productId]?.text = currentCount.toString();

      // Update total price for that product
      double totalPrice = currentCount * unitPrice;
      totalPriceBuyController[productId]?.text = totalPrice.toStringAsFixed(2);

      // Call to update the grand total
      updateGrandTotal();

      notifyListeners(); // Notify UI about changes
    }
  }


  void addToBuyNow(String pimg, String pname, String price, String userId,
      String productId) {
    int productCount = 0;
    if (countBuyController[productId] != null) {
      productCount = int.parse(countBuyController[productId]!.text);
    }
    double totalPrice = 0;
    if (totalPriceBuyController[productId] != null) {
      totalPrice = double.parse(totalPriceBuyController[productId]!.text);
    }

    HashMap<String, dynamic> buy = HashMap();
    buy["PRODUCT_NAME"] = pname;
    buy["PRODUCT_IMAGE"] = pimg;
    buy["PRODUCT_PRICE"] = price;
    buy["PRODUCT_COUNT"] = productCount;
    buy["TOTAL_PRICE"] = totalPrice;
    buy["PRODUCT_ID"] = productId;

    db.collection("USERS").doc(userId).collection("BUY_NOW").doc(productId).set(
        buy, SetOptions(merge: true));
    notifyListeners();
  }


  // void addToBuyNow(BuildContext context, String pimg, String pname, String price, String userId, String productId) {
  //   int productCount = 0;
  //   if (countBuyController[productId] != null) {
  //     productCount = int.parse(countBuyController[productId]!.text);
  //   }
  //
  //   double totalPrice = 0;
  //   if (totalPriceBuyController[productId] != null) {
  //     totalPrice = double.parse(totalPriceBuyController[productId]!.text);
  //   }
  //
  //   HashMap<String, dynamic> buy = HashMap();
  //   buy["PRODUCT_NAME"] = pname;
  //   buy["PRODUCT_IMAGE"] = pimg;
  //   buy["PRODUCT_PRICE"] = price;
  //   buy["PRODUCT_COUNT"] = productCount;
  //   buy["TOTAL_PRICE"] = totalPrice;
  //
  //   db.collection("USERS").doc(userId).collection("BUY_NOW").doc(productId).set(buy, SetOptions(merge: true)).then((_) {
  //     // Show Snackbar after successful addition
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('$pname successfully added to order'),
  //         duration: Duration(seconds: 2), // Duration for how long the snackbar will be visible
  //       ),
  //     );
  //   }).catchError((error) {
  //     // Handle any errors that occur during the set operation
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to add product: $error'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   });
  //
  //   notifyListeners();
  // }

  List<ProductModel>buynowList = [];

  void getBuyNow(String userId) {
    db.collection("USERS").doc(userId).collection("BUY_NOW").get().then((
        value) {
      if (value.docs.isNotEmpty) {
        buynowList.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic>cart = element.data();
          buynowList.add(ProductModel(
            element.id,
            cart["PRODUCT_NAME"] ?? "",
            cart["PRODUCT_PRICE"] ?? "",
            cart["PRODUCT_DESCRIPTION"] ?? "",
            cart["DELIVERY_DURATION"] ?? "",
            cart["PRODUCT_IMAGE"] ?? "",
            cart["CURRENT_STATUS"] ?? "",
            cart["PRODUCT_COUNT"] ?? 0,
            cart["CATEROGYID"] ?? "",
            cart["CATEROGY_NAME"] ?? "",
            cart["TOTAL_NUMBER OF PRODUCTS"] ?? "",
          ));
          notifyListeners();
          print("cart details" + buynowList.toString());
          print("rrrrrrrr  :" + buynowList.length.toString());
          print("Product Price:${cart["PRODUCT_PRICE"]}");
        }
      }
    });
  }

  Future<void> addToOrder(String userId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    try {
      // List to hold all items for the order
      List<Map<String, dynamic>> orderItems = [];

      // Fetch items from the CART collection
      QuerySnapshot cartSnapshot = await db.collection("USERS")
          .doc(userId)
          .collection("CART")
          .get();
      for (var doc in cartSnapshot.docs) {
        orderItems.add({
          "PRODUCT_NAME": doc["PRODUCT_NAME"],
          "PRODUCT_COUNT": countController[doc["PRODUCT_ID"]]?.text
              .toString() ?? doc["PRODUCT_COUNT"],
          "PRODUCT_IMAGE": doc["PRODUCT_IMAGE"],
          "PRODUCT_PRICE": doc["PRODUCT_PRICE"],
          "TOTAL_PRICE": totalPriceController[doc["PRODUCT_ID"]]?.text
              .toString() ?? doc["TOTAL_PRICE"],
          "PRODUCT_ID": doc["PRODUCT_ID"]
        });
      }

      // Fetch items from the BUY_NOW collection
      QuerySnapshot buyNowSnapshot = await db.collection("USERS")
          .doc(userId)
          .collection("BUY_NOW")
          .get();
      for (var doc in buyNowSnapshot.docs) {
        orderItems.add({
          "PRODUCT_NAME": doc["PRODUCT_NAME"],
          "PRODUCT_COUNT": doc["PRODUCT_COUNT"],
          "PRODUCT_IMAGE": doc["PRODUCT_IMAGE"],
          "PRODUCT_PRICE": doc["PRODUCT_PRICE"],
          "TOTAL_PRICE": doc["TOTAL_PRICE"],
          "PRODUCT_ID": doc["PRODUCT_ID"]
        });
      }

      // Save all collected items to the ORDER collection if any items were added
      if (orderItems.isNotEmpty) {
        await db.collection("ORDER").doc(id).set({
          "USER_ID": userId,
          "ORDER_ITEMS": orderItems,
          "ORDER_DATE": FieldValue.serverTimestamp()
        });

        // Clear the CART and BUY_NOW collections after order creation
        await clearOrderedProduct(userId, "CART");
        await clearOrderedProduct(userId, "BUY_NOW");

        print("Order added successfully for user: $userId");
      } else {
        print("No items found in CART or BUY_NOW to create an order.");
      }

      notifyListeners();
    } catch (e) {
      print("Error adding order: $e");
    }
  }


  Future<void> clearOrderedProduct(String userId, String from) async {
    var collection = db.collection("USERS").doc(userId).collection(from);
    var snapShots = await collection.get();
    for (var doc in snapShots.docs) {
      await doc.reference.delete();
    }
  }

  List<dynamic> orderList = [];

  Future<void> getOrder(String userId) async {
    print("ccccccccccc");
    try {
      QuerySnapshot orderQuery = await db.collection("ORDER").where(
          "USER_ID", isEqualTo: userId)
          .orderBy("ORDER_DATE", descending: true)
          .get();
      // Clear the previous order list and populate it with the fetched orders

      orderList.clear();
      for (var doc in orderQuery.docs) {
        print("jjjjjjjjjjjjjbbbbbb");
        Map<String, dynamic>orderData = doc.data() as Map<String, dynamic>;
        orderList.addAll(orderData["ORDER_ITEMS"]);
      }

      if (orderList.isEmpty) {
        print(" No orders found for user:$userId");
      }
      else {
        print("Orders retrieved successfully for user:$userId");
      }
      notifyListeners();
    } catch (e) {
      print("Error retrieving order: $e");
    }
  }


  List<Map<String, dynamic>> allOrdersList = [];

  Future<void> getAllOrders() async {
    // print("Fetching orders...");
    try {
      final value = await db.collection("ORDER").get();
      if (value.docs.isNotEmpty) {
        allOrdersList.clear();
        // print("Processing orders...");

        for (var item in value.docs) {
          // Each document may have an array of orders
          var orderArray = item.data()['ORDER_ITEMS'] as List<dynamic>?;

          // Check if the 'orders' array exists
          if (orderArray != null && orderArray.isNotEmpty) {
            for (var order in orderArray) {
              // Ensure each order is a map and add it to the list
              if (order is Map<String, dynamic>) {
                allOrdersList.add(order);
              }
            }
          } else {
            print("No orders array found in document ${item.id}");
          }
        }

        // Print success or no orders found
        print("Orders retrieved successfully. Total orders: ${allOrdersList
            .length}");
      } else {
        print("No orders found in the collection.");
      }

      notifyListeners();
    } catch (e) {
      print("Error retrieving orders: $e");
    }
  }


// ------------------------------------- TO GET THE LIKED PRODUCT IN WISHLIST-------------------------------------------------------------------------------------------
  bool isLiked = false;

  void toggleFavorite(String userId, String productId, BuildContext context) {
    LoginProvider logPro = Provider.of<LoginProvider>(context, listen: false);
    // Toggle the like state and update the wishlist accordingly
    isLiked = !isLiked;

    // Get the user document
    db.collection("USERS").doc(userId).get().then((value) {
      if (value.exists) {
        //get the current wishlist

        List<dynamic> currentWishlist = value.data()?["WISHLIST"] ?? [];

        if (currentWishlist.contains(productId)) {
          // if the product is already in the wishlist, remove it
          db.collection("USERS").doc(userId).update({
            "WISHLIST": FieldValue.arrayRemove([productId])
          });
          // Remove from favourite_product field in the product collection

          db.collection("PRODUCT").doc(productId).update({
            "FAVOURITED_USER": FieldValue.arrayRemove([userId])
          });
          logPro.favProductIdList.remove(productId);

          // value.removeFromWishList(widget.item.productName);
          const snackBar = SnackBar(content: Text("Removed from wishlist"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          // If the product is not in the wishlist, add it
          db.collection("USERS").doc(userId).set({
            "WISHLIST": FieldValue.arrayUnion([productId])
          }, SetOptions(merge: true));

          // Add the product to the FAVOURITED_PRODUCT field in the PRODUCT collection
          db.collection("PRODUCT").doc(productId).set({
            "FAVOURITED_USER": FieldValue.arrayUnion([userId])
          }, SetOptions(merge: true));

          logPro.favProductIdList.add(productId);
          const snackBar = SnackBar(content: Text("Added to wishlist"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // Add the product to the WISHLIST field in USERS collection


        notifyListeners(); // Notify listeners after the changes
      }
    });
  }

  void removeFromWishList(String userId, String productId) {
    // Remove the product from the WISHLIST field in the user's document
    db.collection("USERS").doc(userId).update({
      "WISHLIST": FieldValue.arrayRemove([productId])
    }).then((value) {
      notifyListeners();
    },);
    notifyListeners();
  }

  bool isLoading = true;

  Future<void> getWishList() async {
    isLoading = true;
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }


  List<ProductModel> wishList = [];

  Future<void> getFavorite(String userId) async {
    print("hhhhhhhhhhhhhhhhhhhhhhhh");
    await db.collection("USERS").doc(userId).get().then((value) async {
      if (value.exists) {
        wishList.clear();
        Map<dynamic, dynamic>wishMap = value.data() as Map;
        List<dynamic> fav = wishMap["WISHLIST"] ?? [];
        for (var ele in fav) {
          String proId = ele.toString();
          await db.collection("PRODUCT").doc(proId).get().then((value) {
            if (value.exists) {
              Map<dynamic, dynamic>map = value.data() as Map;
              wishList.add(ProductModel(
                  value.id,
                  map["PRODUCT_NAME"].toString() ?? "",
                  double.tryParse(map["PRICE"].toString()) ?? 0.0,
                  map["PRODUCT_DESCRIPTION"].toString() ?? "",
                  map["DELIVERY_DURATION"].toString() ?? "",
                  map["PHOTO"].toString() ?? "",
                  map["CURRENT_STATUS"].toString() ?? "",
                  int.tryParse(map["PRODUCT_COUNT"].toString()) ?? 0,
                  map["CATEROGYID"].toString() ?? "",
                  map["CATEROGY_NAME"].toString() ?? "",
                  map["TOTAL_NUMBER OF PRODUCTS"].toString() ?? ""
              )
              );
              // notifyListeners();
            }
          },);
        }
        notifyListeners();
      }
    },);
  }


// ----------------------------------------------------------------------------------------------------------------------

  MainProvider() {
    filteredProductsList = productList;
    getUsers();
  }

  String selectedCategory = "All";
  List<ProductModel>filteredProductsList = [];

  // Function to update the selected category and filter products accordingly

  void filteredSelectedCategory(String categoryName,) {
    selectedCategory = categoryName;
    if (selectedCategory == "All") {
      filteredProductsList =
          productList; // Show all products if "All" is selected

    }
    else {
      // Filter the products based on the selected category

      filteredProductsList =
          productList.where((product) => product.categoryName == categoryName,)
              .toList();
    }
    notifyListeners();
  }

  // Function to update products and categories from the database
  void updateProductsAndCategories(List<CategoryModel> categories,
      List<ProductModel> products) {
    categoryList = categories;
    productList = products;
    filteredProductsList = productList;
    // Initially, show all products
    notifyListeners();
  }

  // TextEditingController chatTextController=TextEditingController();
  //
  // Future<void> startChat(String senderId,String receiverId,String message) async {
  //   String id=DateTime.now().millisecondsSinceEpoch.toString();
  //   String chatId=senderId.compareTo(receiverId)<0?"$senderId-$receiverId":"$receiverId-$senderId";
  //   Map<String,dynamic>chatData={
  //     "CREATED_AT":id,
  //     "LAST_MESSAGE":{
  //       "SENT_BY":senderId,
  //       "TEXT":message,
  //       "TIMPSTAMP":id
  //     },
  //     "PARTICIPANTS":[senderId,receiverId]
  //   };
  //   await db.collection("CHAT").doc(chatId).set(chatData,SetOptions(merge:  true));
  //
  //
  //   Map<String ,dynamic> messageData={
  //     "CONENT":message,
  //     "IS_SEEN":false,
  //     "MESSAGE_TYPE":"TEXT",
  //     "RECEIVER_ID":receiverId,
  //     "SENDER_ID":senderId,
  //     "TIMESTAMP":id
  //   };
  //   db.collection("CHAT").doc(chatId).collection("MESSAGE").doc(id).set(messageData);
  //   notifyListeners();
  // }

// -----------------------------CHAT--------------------------------------------------------------------------------
// --------------------------------------CHAT--------------------------------------------------------------------------
//   TextEditingController messageController = TextEditingController();
//    String getChatId(String userId1,userId2){
//     List<String> userIDs=[userId1,userId1];
//     userIDs.sort();
//     return userIDs.join("-");
//   }
//
//   List<Message> userMessagesList=[];
//     Future <void> addTextMessage(Message messages)async {
//      String chatId=getChatId(messages.senderId, messages.receiverId);
//      if (userMessagesList.isEmpty) {
//        db.collection("CHATS").doc(chatId).set({
//          "CREATED_AT": DateTime.now(),
//          "PARTICIPANTS": [messages.senderId, messages.receiverId],
//          "LAST_MESSAGE": {
//            "TEXT": messages.content,
//            "SENT_BY": messages.senderId,
//            "TIMESTAMP": DateTime.now(),
//          }
//        }, SetOptions(merge: true));
//      } else {
//        db.collection("CHATS").doc(chatId).set({
//          "LAST_MESSAGE": {
//            "TEXT": messages.content,
//            "SENT_BY": messages.senderId,
//            "TIMESTAMP": DateTime.now(),
//          }
//        },SetOptions(merge: true));
//      }
//
//      await db.collection("CHATS").doc(chatId).collection("MESSAGES").doc(messages.messageId).set(messages.toJson());
//      notifyListeners();
//    }
//   ScrollController scrollController = ScrollController();
//   Future<void> fetchUserMessages(String userId,String senderId) async {
//     String chatId = getChatId(userId, senderId);
//     userMessagesList.clear();
//     db.collection("CHATS").doc(chatId).collection("MESSAGES").orderBy("TIMESTAMP",descending: false).snapshots().listen((value){
//       if(value.docs.isNotEmpty){
//         userMessagesList.clear();
//         for(var element in value.docs){
//           Map<dynamic,dynamic>map=element.data();
//           DateTime addedDate = DateTime.now();
//           if (map['TIMESTAMP'] != null) {
//             Timestamp timestamp = map['TIMESTAMP'];
//             addedDate = timestamp.toDate(); // Safely converting timestamp
//           }
//           userMessagesList.add(Message(
//             messageId: element.id,
//             senderId: map["SENDER_ID"]??"",
//             receiverId:  map["RECEIVER_ID"]??"",
//             sentTime: addedDate,
//             content: map["CONTENT"]??"",
//             isSeen: false,
//             messageType: map["MESSAGE_TYPE"]??"",));
//         }
//
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           scrollController.jumpTo(scrollController.position.maxScrollExtent);
//         });
//         notifyListeners();
//       }
//
//     });
//
//   }
//



// TextEditingController messageController = TextEditingController();
// String designer_Name = "";
// String designer_Phone = "";
// String designer_Photo = "";
//
// List<MessageModel> messagesList = [];

// void setChatPartner(String name, String phone, String photo) {
//   designer_Name = name;
//   designer_Phone = phone;
//   designer_Photo = photo;
//   notifyListeners();
// }
//
// Future<void> sendMessage(String senderId, String receiverId) async {
//   if (messageController.text.trim().isEmpty) return;
//
//   String message = messageController.text.trim();
//   messageController.clear();
//   try {
//     await startChat(senderId, receiverId, message);
//   } catch (e) {
//     print("Error sending message: $e");
//   }
// }

  // Future<void> startChat(String senderId, String receiverId,String message) async {
  //   print("nnnnnnuuuuuuuuuuuu");
  //   DateTime date = DateTime.now();
  //   String id = date.millisecondsSinceEpoch.toString();
  //   String chatId =getChatId(senderId, receiverId);
  //
  //   Map<String, dynamic> chatData = {
  //     "CREATED_AT": date,
  //     "LAST_MESSAGE": {
  //       "SENT_BY": senderId,
  //       "TEXT": message,
  //       "TIMESTAMP": date,
  //     },
  //     "PARTICIPANTS": [senderId, receiverId],
  //   };
  //
  //   try {
  //     await db.collection("CHAT").doc(chatId).set(
  //         chatData, SetOptions(merge: true));
  //
  //     Map<String, dynamic> messageData = {
  //       "CONTENT": message,
  //       "IS_SEEN": false,
  //       "MESSAGE_TYPE": "TEXT",
  //       "RECEIVER_ID": receiverId,
  //       "SENDER_ID": senderId,
  //       "TIMESTAMP": date,
  //     };
  //     await db.collection("CHAT").doc(chatId).collection("MESSAGE").doc(id).set(
  //         messageData);
  //     notifyListeners();
  //   } catch (e) {
  //     print("Error starting chat: $e");
  //   }
  // }
  //
  // void onDesignerSelected(BuildContext context, String login_Id, String name,String receiver_Id,
  //     String phone, String photo) {
  //   setChatPartner(name, phone, photo);
  //   callNext(context, ChatScreen(login_Id: login_Id, receiver_Id: receiver_Id,
  //     ));
  // }
  //
  // void dispose() {
  //   messageController.dispose();
  //   super.dispose();
  // }
  //
  //
  // void getChatDetails(String senderId, receiverId) {
  //   String chatID = senderId.compareTo(receiverId) < 0
  //       ? "$senderId-$receiverId"
  //       : "$receiverId-$senderId";
  //   db.collection("CHAT").doc(chatID).collection("MESSAGE")
  //       .orderBy("TIMESTAMP", descending: true)
  //       .snapshots().listen((value) {
  //     if (value.docs.isNotEmpty) {
  //       messagesList.clear();
  //       for (var element in value.docs) {
  //         Map<dynamic, dynamic> msg = element.data();
  //         DateTime timestamp = (msg["TIMESTAMP"] as Timestamp).toDate();
  //         messagesList.add(MessageModel(
  //             element.id,
  //             msg["CONTENT"],
  //             msg["SENDER_ID"],
  //             msg["RECEIVER_ID"],
  //             timestamp,
  //             msg["IS_SEEN"],
  //             msg["MESSAGE_TYPE"]
  //         ));
  //       }
  //       notifyListeners();
  //     }
  //   },);
  // }
  //
  // List<MessageModel>enquiriesList = [];
  //
  // void getEnquiriesForDesigner(String designer_id_) {
  //   enquiriesList.clear();
  //   db.collection("CHAT")
  //       .where("PARTICIPANTS", arrayContains: designer_id_)
  //       .snapshots()
  //       .listen((value) async {
  //     for (var doc in value.docs) {
  //       var msgSnap = await db.collection("CHAT").doc(doc.id).collection(
  //           "MESSAGE")
  //           .orderBy("TIMESTAMP", descending: true).limit(1).get();
  //
  //       if (msgSnap.docs.isNotEmpty) {
  //         var msgDoc = msgSnap.docs.first;
  //         Map<String, dynamic>msgData = msgDoc.data();
  //         DateTime timestamp = (msgData["TIMESTAMP"] as Timestamp).toDate();
  //         // Fetch user details based on the sender or receiver ID
  //
  //         String otherUSerId = msgData["SENDER_ID"] == designer_id_
  //             ? msgData["RECIEVER_ID"]
  //             : msgData["SENDER_ID"];
  //         var userSnapShot = await db.collection("USERS")
  //             .doc(otherUSerId)
  //             .get();
  //         Map<String, dynamic>? userData = userSnapShot.data();
  //         enquiriesList.add(MessageModel(
  //           msgDoc.id,
  //           msgData["CONTENT"],
  //           msgData["SENDER_ID"],
  //           msgData["RECEIVER_ID"],
  //           timestamp,
  //           msgData["IS_SEEN"],
  //           msgData["MESSAGE_TYPE"],
  //           // userId: otherUSerId,
  //           // userName: userData?["name"] ?? "Unknown",
  //           // // Ensure safe access with fallback
  //           // userPhone: userData?["phone"] ?? "No phone",
  //           // userPhoto: userData?["photoUrl"] ?? "default_photo_url",
  //
  //         ));
  //       }
  //
  //
  //       notifyListeners();
  //     }
  //   });
  // }

}
