



// --------------------------------------------GET CATEGORY----------------------------------------------------------------------------------

class CategoryModel{
  String id;
  String categoryName;
  CategoryModel(this.id,this.categoryName);
}

// ----------------------------------GET PRODUCT DETAILS-------------------------------------------------------------------------------

class ProductModel{
  String pid;
  String productName;
  // String price;
  double price;
  String productDescription;
  String deliveryDuration;
  String productImage;
  String status;
  int count;
  String categoryId;
  String categoryName;
  String totalProduct;


  ProductModel(this.pid,this.productName,this.price,this.productDescription,this.deliveryDuration,this.productImage,this.status,this.count,this.categoryId,this.categoryName,this.totalProduct);
}
// ----------------------------------------GET DESIGNER WORK---------------------------------------------------------------------

class WorkModel {
  String wid;
  String workImage;
  String designerId;
  WorkModel(this.wid, this.workImage,this.designerId);
}
class DesignerWorkModel{
  String wid;
  String workImage;
  String designerId;
  String designerName;
  String designerPlace;
  String designerPhoto;
  DesignerWorkModel(this.wid,this.workImage,this.designerId,this.designerName,this.designerPlace,this.designerPhoto);
}

// ----------------------------------------------GET USERS DATA-------------------------------------------------------------------
class UsersModel{
  String id;
  String usersName;
  String usersPassword;
  String usersPhoneNumber;
  String designation;
  String usersPlace;
  String usersAddress;
  String userImage;
  UsersModel(this.id,this.usersName,this.usersPassword,this.usersPhoneNumber,this.designation,this.usersPlace,this.usersAddress,this.userImage);
}
