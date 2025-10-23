class HomeItemCardModel {
  final String mealImage;
  final String mealType;
  final String mealName;
  HomeItemCardModel(this.mealImage, this.mealName, this.mealType);
  static List<HomeItemCardModel> mealsList = [
    HomeItemCardModel(
      'assets/burger/burger1.png',
      'Classic Beef Burger',
      'cheese and lettuce',
    ),
    HomeItemCardModel(
      'assets/burger/burger2.png',
      'Cheese Burger',
      'Beef burger topped',
    ),
    HomeItemCardModel(
      'assets/burger/burger3.png',
      'BBQ Bacon Burger',
      'crispy bacon',
    ),
    HomeItemCardModel(
      'assets/burger/burger4.png',
      'Veggie Burger',
      'fresh veggies',
    ),
    // HomeItemCardModel(
    //   'assets/burger/burger5.png',
    //   'Chicken Burger',
    //   'Fried chicken',
    // ),
    HomeItemCardModel(
      'assets/burger/burger6.png',
      'Spicy Jalapeño Burger',
      'jack cheese',
    ),
    HomeItemCardModel(
      'assets/burger/burger7.png',
      'Mushroom Swiss Burger',
      'Swiss cheese',
    ),
    HomeItemCardModel(
      'assets/burger/burger8.png',
      'Double Beef Burger',
      'melted cheese',
    ),
    HomeItemCardModel(
      'assets/burger/burger9.png',
      'Fish Burger',
      'tartar sauce',
    ),
    HomeItemCardModel(
      'assets/burger/burger10.png',
      'Avocado Burger',
      'avocado slices',
    ),
  ];
}
