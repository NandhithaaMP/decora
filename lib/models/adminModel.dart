class CategoryModel{
  String id;
  String categoryName;
  CategoryModel(this.id,this.categoryName);
}
class ProductModel{
  String pid;
  String productName;
  String price;
  String productDescription;
  String deliveryDuration;
  String productImage;
  String status;

  ProductModel(this.pid,this.productName,this.price,this.productDescription,this.deliveryDuration,this.productImage,this.status);
}
class WorkModel {
  String wid;
  String workImage;
  WorkModel(this.wid, this.workImage);
}
class UsersModel{
  String id;
  String usersName;
  String usersPassword;
  String usersPhoneNumber;
  String designation;
  String usersPlace;
  String usersAddress;
  UsersModel(this.id,this.usersName,this.usersPassword,this.usersPhoneNumber,this.designation,this.usersPlace,this.usersAddress);
}

class WishList{
  String id;
  String productName;
  String productImage;
  String productPrice;
  WishList(this.id,this.productName,this.productImage,this.productPrice);
}
// --------------------------------------------------------------------------------------------
//
// class DesignerData{
//   String id;
//   String designerName;
//   String designerEmail;
//   String designerType;
//   DesignerData(this.id,this.designerName,this.designerEmail,this.designerType);
// }
// class UserData{
//   String id;
//   String userName;
//   String userPhonenumber;
//   UserData(this.id,this.userName,this.userPhonenumber);
// }

// class CartList{
//   String id;
//   String productName;
//   String productImage;
//   String productPrice;
//   CartList(this.id,this.productName,this.productImage,this.productPrice);
// }