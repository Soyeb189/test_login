
class Menu{
  int menuId;
  String menuName;
  String menuActionId;
  String menuImg;
  String menuCreatedDate;

  Menu({this.menuId,this.menuName,this.menuActionId,this.menuImg,this.menuCreatedDate});

   factory Menu.fromJson(Map<String, dynamic> json){
    return Menu(
      menuId: json['menu_id'] as int,
      menuName: json['menu_name'] as String,
      menuActionId: json['menu_action_id'] as String,
      menuImg: json['menu_img'] as String,
      menuCreatedDate: json['menu_created_date'] as String,
    );
  }
}