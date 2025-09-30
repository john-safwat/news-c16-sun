class CategoryDm {
  String id;
  String name;

  String image;

  CategoryDm(this.id, this.name, this.image);

  static List<CategoryDm> categories =  [
    CategoryDm("general", "General", "assets/images/general.png"),
    CategoryDm("business", "Business", "assets/images/busniess.png"),
    CategoryDm("entertainment", "Entertainment", "assets/images/entertainment.png"),
    CategoryDm("health", "Health", "assets/images/helth.png"),
    CategoryDm("science", "Science", "assets/images/science.png"),
    CategoryDm("technology", "Technology", "assets/images/technology.png"),
    CategoryDm("sports", "Sports", "assets/images/sport.png"),
  ];
}
