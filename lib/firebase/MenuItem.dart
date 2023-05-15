class MenuItems {
  final String name;

  final String cuisine;
  final String picture;
  final String price;
  final String category;
  //you can add extra field here
  MenuItems(
      {required this.name,
      required this.cuisine,
      required this.picture,
      required this.price,
      required this.category});
  MenuItems.fromJson(
    Map<String, dynamic> json,
  )   : name = json['Name'],
        cuisine = json['Cuisine'],
        picture = json['Picture'],
        price = json['Price'],
        category = json['Type'];
}
