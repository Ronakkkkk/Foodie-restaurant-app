class MenuItems {
  final String name;
  final int price;
  final String cuisine;

  //you can add extra field here
  MenuItems({required this.name, required this.price, required this.cuisine});
  MenuItems.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        price = json['Price'],
        cuisine = json['Cuisine'];
}
