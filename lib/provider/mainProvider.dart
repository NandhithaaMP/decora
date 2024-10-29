import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decora/Designer/newEnquiryScreen.dart';
import 'package:decora/constants/call_functions.dart';
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
    clearCategory();
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
    categoryList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearCategory(){
    categorynameController.clear();
    notifyListeners();
  }

  //-------------------------------------------------------ADD PRODUCT---------------------------------------------------------------------------------

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
    productDetails["STATUS"]=currentStatusContoller.text;
    // productDetails["STATUS"]="Ongoing";

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
            map["STATUS"].toString()??"",
            int.tryParse(map["PRODUCT_COUNT"].toString())??0,
              map["CATEROGYID"].toString()??"",
              map["CATEROGY_NAME"].toString()??"",
              map["TOTAL_NUMBER OF PRODUCTS"].toString()??"",
          )
          );
        }
      }

    });
    notifyListeners();
  }

  void clearAddedProduct(){
   productnameController.clear();
   categoryNameController.clear();
   priceController.clear();
   // selectedDate.add(Duration(days: 5));
   productDescriptionController.clear();
   totalProductController.clear();
   addProductFileImg=null;
   productFileUrl="";
   currentStatusContoller.clear();
   notifyListeners();
  }

  void deleteProduct(String productId, BuildContext context){
    db.collection("PRODUCT").doc(productId).delete();
    productList.removeWhere((element) => element.pid == productId);
    notifyListeners();
  }

  void editAdminDetails(){

  }



  logOutAlert(BuildContext context, ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AlertDialog alert =AlertDialog(
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
                    child: const Text('No', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      finish(context);
                      // finish(context);
                    }),
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.yellow),
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
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      // loginphoneController.clear();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false);

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
  String workFileUrl="";

  Future<void> addDesignerWork(String designerId) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addWork = HashMap();
    addWork["WORK_ID"]=id;
    addWork["DESIGNER_ID"]=designerId;
    if (addWorkFileImg == null) return;

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

  List<WorkModel>workList=[];

  void getDesignerWork(String loginUserId){
    db.collection("DESIGNER_WORK").where("DESIGNER_ID",isEqualTo:loginUserId ).get().then((value){
      if(value.docs.isNotEmpty){
        workList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic>designerwork=element.data();
          workList.add(WorkModel(
              element.id,
              designerwork["PHOTO"]??"",
              designerwork["DESIGNER_ID"]??""
          )

          );
          print("WORKlIST:${wishList}");

        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void deleteDesignerWork(String workId, BuildContext context){
    db.collection("DESIGNER_WORK").doc(workId).delete();
    // getDesignerWork(loginUserId);
    workList.removeWhere((element) => element.wid == workId);
    notifyListeners();
  }



// -------------------------------------------CAROUSEL -------------------------------------------------
  int Activeindex=0;
  void carouselIndex(int index) {
    Activeindex=index;
    notifyListeners();
  }
  List<DesignerWorkModel>allAddedWorkList=[];

   getAllAddedWork() async {
    await db.collection("DESIGNER_WORK").get().then((value) async {
      if(value.docs.isNotEmpty){
        allAddedWorkList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic> allWork=element.data();
          String designer_id=allWork["DESIGNER_ID"];
          await db.collection("USERS").doc(designer_id).get().then((value) {
            if(value.exists){
              Map<dynamic,dynamic>deswork=value.data() as Map;
              allAddedWorkList.add(DesignerWorkModel(
                  value.id,
                  allWork["PHOTO"]??"",
                  allWork["DESIGNER_ID"]??"",
                  deswork["REGISTER_NAME"]??"",
                  deswork["PLACE"]??"",
                  deswork["USERS_IMAGE"]??"",
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

  String designerProfilePic="";
  String designerName="";
  String designation="";
  String designerPlace="";
  String designerPhone="";
  List<String>designerWork=[];

  void getDesignerDetails(String designerID){
    db.collection("USERS").doc(designerID).get().then((value) {
      if(value.exists){
        designerWork.clear();
        Map<dynamic,dynamic>details=value.data() as Map;
        designerProfilePic=details["USERS_IMAGE"];
        designerName=details["REGISTER_NAME"];
        designation=details["DESIGNATION"];
        designerPlace=details["PLACE"];
        designerPhone=details["REGISTER_PHONENUMBER"];
        allAddedWorkList.forEach((element){
          if(element.designerId == designerID){
            designerWork.add(element.workImage);
          }
        });

      }
      notifyListeners();
    },);
  }

  // /--------------------------------------------------------REGISTRATION-------------------------------------------------------------------------------

  TextEditingController RegisterNameController=TextEditingController();
  TextEditingController RegisterPhoneController=TextEditingController();
  TextEditingController RegisterPasswordController=TextEditingController();
  TextEditingController DesignationController=TextEditingController();
  TextEditingController PlaceController=TextEditingController();
  TextEditingController AddressController=TextEditingController();
  // TextEditingController ProfilePictureController=TextEditingController();

  File? addUsersImage;
  String UsersImageURL="";
  // List<File> imagefileList = [];


  Future<void> addRegistration(BuildContext context, String from,String oldid) async {
    LoginProvider loginPro = Provider.of<LoginProvider>(context, listen: false);
    try {
      String id = oldid;
      Map <String, dynamic> regMap = Map();
      if(from == "NEW"){
         id = DateTime.now().microsecondsSinceEpoch.toString();
        regMap["REGISTER_ID"] = id;
        regMap["REGISTER_PASSWORD"] = RegisterPasswordController.text;
        regMap["DESIGNATION"] = DesignationController.text;
      }

      regMap["REGISTER_NAME"] = RegisterNameController.text;
      regMap["REGISTER_PHONENUMBER"] = RegisterPhoneController.text;
      regMap["PLACE"] = PlaceController.text;
      regMap["ADDRESS"] = AddressController.text;
      loginPro.loginAddress = AddressController.text;
      if(addUsersImage != null){
        String photoId=DateTime.now().millisecondsSinceEpoch.toString();
        ref=FirebaseStorage.instance.ref().child(photoId);
        await ref.putFile(addUsersImage!).whenComplete(() async{
          await ref.getDownloadURL().then((value) {
            regMap["USERS_IMAGE"]=value;
          },);
        },);
      }
      else if(UsersImageURL != ""){
         regMap["USERS_IMAGE"] = UsersImageURL;
         }

      else{
        regMap["USERS_IMAGE"]="";
      }


      // Add the registration data to Firestore
      await db.collection("USERS").doc(id).set(regMap,SetOptions(merge: true));

      // Save user data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("REGISTER_NAME", RegisterNameController.text);
      await prefs.setString("REGISTER_PHONENUMBER", RegisterPhoneController.text);
      await prefs.setString("REGISTER_PASSWORD", RegisterPasswordController.text);

      loginPro.usersAuthorized(RegisterPhoneController.text, RegisterPasswordController.text, context);


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

  void editUsers(String userId){
    db.collection("USERS").doc(userId).get().then((value) {
      Map<dynamic,dynamic> editusers=value.data()as Map;
      if(value.exists){
        RegisterNameController.text=editusers["REGISTER_NAME"].toString();
        RegisterPhoneController.text=editusers["REGISTER_PHONENUMBER"].toString();
        RegisterPasswordController.text=editusers["REGISTER_PASSWORD"].toString();
        PlaceController.text=editusers["PLACE"].toString();
        AddressController.text=editusers["ADDRESS"].toString();
        notifyListeners();
      }
    },);
    notifyListeners();
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
             userdata["USERS_IMAGE"]??"",
         ));
        }
      }
    });
  }

  List<UsersModel>designerList=[];
  void getDesigners(){
    db.collection("USERS").where("DESIGNATION",isEqualTo: "DESIGNER").get().then((value) {
      if(value.docs.isNotEmpty){
        designerList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic> designer=element.data();
          designerList.add(UsersModel(
              element.id,
              designer["REGISTER_NAME"]??"",
              designer["REGISTER_PASSWORD"]??"",
              designer["REGISTER_PHONENUMBER"]??"",
              designation,
              designer["PLACE"]??"",
              designer["ADDRESS"]??"",
              designer["USERS_IMAGE"]??"",
          ));
        }
        notifyListeners();
      }
    },);
  }

  // -------------------------------------------Add to cart......................................................................

  List<ProductModel>cartList=[];

  // Map to hold TextEditingControllers for each product
  Map<String,TextEditingController>countController={};
  Map<String,TextEditingController>totalPriceController={};
// Method to initialize controllers
  void initController(String productId, double unitPrice) {
    countController[productId] ??= TextEditingController(text: '1'); // Default quantity 1
    totalPriceController[productId] ??= TextEditingController(text: unitPrice.toStringAsFixed(2));
  }
  // Increment function
  void increment(String productId, double unitPrice, String userId) {
    int currentCount = int.parse(countController[productId]?.text ?? '1');
    currentCount++;
    countController[productId]?.text = currentCount.toString();

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
  void addToCart(String userId,String productId,String img,String price,String name){

    print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${countController[productId]}");
    int productCount=0;
    if(countController[productId]!=null) {
      productCount = int.parse(countController[productId]!.text);
    }
    double totalPrice=0;
    if(totalPriceController[productId]!=null) {
      totalPrice = double.parse(totalPriceController[productId]!.text);
    }

    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm $productId ${totalPriceController[productId]}");
    HashMap<String,dynamic>cart=HashMap();
    cart["PRODUCT_NAME"]=name;
    cart["PRODUCT_IMAGE"]=img;
    cart["PRODUCT_PRICE"]=price; // Save the price as a string with 2 decimal places
    cart["PRODUCT_COUNT"]=productCount;
    cart["TOTAL_PRICE"]=totalPrice;

    print("Total_price ----------${cart["TOTAL_PRICE"]}");
    db.collection("USERS").doc(userId).collection("CART").doc(productId).set(cart,SetOptions(merge: true));
    print("rrrrrrrr  :"+cartList.length.toString());
    getAddedCart(userId);
    updateGrandTotal();
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
            cart["PRODUCT_COUNT"]??0,
            cart["CATEROGYID"]??"",
            cart["CATEROGY_NAME"]??"",
            cart["TOTAL_NUMBER OF PRODUCTS"]??""
          ));
          notifyListeners();
          print("cart details"+cartList.toString());
          print("rrrrrrrr  :"+cartList.length.toString());
          print("Product Price:${cart["PRODUCT_PRICE"]}");

        }
      }
    });
  }


  // Function to calculate and add grand total to Firestore
  void addGrandTotalToUsers(String userId){
    // First, calculate the grand total
    double grandTotal=calculateGrandTotal();
    // Prepare the data to store in Firestore
    Map<String,dynamic>cart_total={
      "CART_GRANDTOTAL":grandTotal
    };
    db.collection("USERS").doc(userId).set(cart_total,SetOptions(merge: true)).then((value) {
      print("GRAND TOTAL UPDATED SUCCESSFULLY!----");
    },).catchError((error){
      print("FAILED TO UPDATE GRAND TOTAL :$error");
    });
  }

  // Grand total calculation
  double calculateGrandTotal() {
    double grandTotal = 0.0;
    for (var product in cartList) {
      String productId = product.pid;
      double productTotal = double.parse(totalPriceController[productId]?.text ?? '0');
      grandTotal += productTotal;
    }
    return grandTotal;
  }

  // Method to update grand total
  void updateGrandTotal() {
    notifyListeners(); // Notify the UI that the grand total has changed
  }
  double grandTotal=0.0;
  void getGrandTotal(String userId)async{
  try{
    DocumentSnapshot doc=await db.collection("USERS").doc(userId).get();
    if (doc.exists){
      if(doc.data()!=null&&doc["CART_GRANDTOTAL"]!=null){
        grandTotal=doc["CART_GRANDTOTAL"];
        notifyListeners();
      }
    }
  }
  catch(e){
    print("Failed to fetch grand total:$e");
  }

  }

  void deleteProductFromCart(String userId,String productId){
    db.collection("USERS").doc(userId).collection("CART").doc(productId).delete();
    print("You deleted product from cart-----------------");
    getAddedCart(userId);
    notifyListeners();
  }
// ---------------------------------------------ADD TO BUY NOW-----------------------------------------------------------------

  // Map to hold TextEditingControllers for each product
  Map<String,TextEditingController>countBuyController={};
  Map<String,TextEditingController>totalPriceBuyController={};

// Method to initialize controllers
  void initBuyController(String productId, double unitPrice) {
    countBuyController[productId] ??= TextEditingController(text: '1'); // Default quantity 1
    totalPriceBuyController[productId] ??= TextEditingController(text: unitPrice.toStringAsFixed(2));
  }

  // Increment function
  void incrementBuy(String productId, double unitPrice, String userId) {

    int currentCount = int.parse(countBuyController[productId]?.text ?? '1');
    currentCount++;
    countBuyController[productId]?.text = currentCount.toString();
    print("hhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiii $unitPrice     $currentCount");

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


  void addToBuyNow(String pimg,String pname,String price,String userId,String productId){
    int productCount=0;
    if(countBuyController[productId]!=null){
      productCount=int.parse(countBuyController[productId]!.text);
    }
    double totalPrice=0;
    if(totalPriceBuyController[productId]!=null){
      totalPrice=double.parse(totalPriceBuyController[productId]!.text);
    }

    HashMap<String ,dynamic> buy=HashMap();
    buy["PRODUCT_NAME"]=pname;
    buy["PRODUCT_IMAGE"]=pimg;
    buy["PRODUCT_PRICE"]=price;
    buy["PRODUCT_COUNT"]=productCount;
    buy["TOTAL_PRICE"]=totalPrice;

    db.collection("USERS").doc(userId).collection("BUY_NOW").doc(productId).set(buy,SetOptions(merge: true));
    notifyListeners();

  }

  List<ProductModel>buynowList=[];

  void getBuyNow(String userId){
    db.collection("USERS").doc(userId).collection("BUY_NOW").get().then((value){

      if(value.docs.isNotEmpty){
        buynowList.clear();
        for(var element in value.docs){
          Map<dynamic,dynamic>cart=element.data();
          buynowList.add(ProductModel(
              element.id,
              cart["PRODUCT_NAME"]??"",
              cart["PRODUCT_PRICE"]??"",
              cart["PRODUCT_DESCRIPTION"]??"",
              cart["DELIVERY_DURATION"]??"",
              cart["PRODUCT_IMAGE"]??"",
              cart["CURRENT_STATUS"]??"",
              cart["PRODUCT_COUNT"]??0,
              cart["CATEROGYID"]??"",
              cart["CATEROGY_NAME"]??"",
              cart["TOTAL_NUMBER OF PRODUCTS"]??"",
          ));
          notifyListeners();
          print("cart details"+buynowList.toString());
          print("rrrrrrrr  :"+buynowList.length.toString());
          print("Product Price:${cart["PRODUCT_PRICE"]}");

        }
      }
    });
  }
// ------------------------------------- TO GET THE LIKED PRODUCT IN WISHLIST-------------------------------------------------------------------------------------------
  bool isLiked=false;
  void toggleFavorite(String userId, String productId,BuildContext context) {
    LoginProvider logPro=Provider.of<LoginProvider>(context, listen: false);
    // Toggle the like state and update the wishlist accordingly
    isLiked = !isLiked;

    // Get the user document
    db.collection("USERS").doc(userId).get().then((value) {
      if (value.exists) {
        //get the current wishlist

        List<dynamic> currentWishlist=value.data()?["WISHLIST"]??[];

        if(currentWishlist.contains(productId)){
          // if the product is already in the wishlist, remove it
          db.collection("USERS").doc(userId).update({
            "WISHLIST":FieldValue.arrayRemove([productId])
          });
          // Remove from favourite_product field in the product collection

          db.collection("PRODUCT").doc(productId).update({
            "FAVOURITED_USER":FieldValue.arrayRemove([userId])
          });
          logPro.favProductIdList.remove(productId);

          // value.removeFromWishList(widget.item.productName);
          const snackBar = SnackBar(content: Text("Removed from wishlist"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else{
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

  void removeFromWishList(String userId,String productId) {
    // Remove the product from the WISHLIST field in the user's document
    db.collection("USERS").doc(userId).update({
      "WISHLIST":FieldValue.arrayRemove([productId])
    }).then((value) {
      notifyListeners();
    },);
    notifyListeners();
  }

  bool isLoading=true;
  Future<void> getWishList()async{
    isLoading=true;
    notifyListeners();

    isLoading=false;
    notifyListeners();
  }



  List<ProductModel> wishList = [];

  Future<void> getFavorite(String userId) async {
    print("hhhhhhhhhhhhhhhhhhhhhhhh");
     await db.collection("USERS").doc(userId).get().then((value) async {
      if(value.exists){
        wishList.clear();
        Map<dynamic,dynamic>wishMap=value.data() as Map;
        List<dynamic> fav=wishMap["WISHLIST"]??[];
        for(var ele in fav){
          String proId=ele.toString();
          await db.collection("PRODUCT").doc(proId).get().then((value) {
            if(value.exists){
              Map<dynamic,dynamic>map=value.data() as Map;
              wishList.add(ProductModel(
                value.id,
                map["PRODUCT_NAME"].toString()??"",
                map["PRICE"].toString()??"",
                map["PRODUCT_DESCRIPTION"].toString()??"",
                map["DELIVERY_DURATION"].toString()??"",
                map["PHOTO"].toString()??"",
                map["CURRENT_STATUS"].toString()??"",
                int.tryParse(map["PRODUCT_COUNT"].toString())??0,
                map["CATEROGYID"].toString()??"",
                map["CATEROGY_NAME"].toString()??"",
                map["TOTAL_NUMBER OF PRODUCTS"].toString()??""
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

  MainProvider(){
    filteredProductsList=productList;
    getUsers();
  }

  String selectedCategory="All";
  List<ProductModel>filteredProductsList=[];
  // Function to update the selected category and filter products accordingly

  void filteredSelectedCategory(String categoryName,){
    selectedCategory=categoryName;
    if(selectedCategory=="All"){
      filteredProductsList=productList; // Show all products if "All" is selected

    }
    else{
      // Filter the products based on the selected category
      
      filteredProductsList=productList.where((product) => product.categoryName==categoryName,).toList();
    }
    notifyListeners();
  }
  // Function to update products and categories from the database
  void updateProductsAndCategories(List<CategoryModel> categories, List<ProductModel> products) {
    categoryList = categories;
    productList = products;
    filteredProductsList = productList; // Initially, show all products
    notifyListeners();
  }

}

