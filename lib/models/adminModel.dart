class CategoryModel{
  String id;
  String categoryName;
  CategoryModel(this.id,this.categoryName);
}
class ProductModel{
  String pid;
  String productName;
  String price;
  // String deliveryDate;
  String productImage;
  ProductModel(this.pid,this.productName,this.price,this.productImage);
}
class WorkModel {
  String wid;
  String workImage;

  WorkModel(this.wid, this.workImage);
}

class DesignerData{
  String id;
  String designerName;
  String designerEmail;
  String designerType;
  DesignerData(this.id,this.designerName,this.designerEmail,this.designerType);
}