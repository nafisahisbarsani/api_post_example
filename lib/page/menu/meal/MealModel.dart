class Category {
  String strCategory;
  String strCategoryDescription;

  Category({
    required this.strCategory,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        strCategory: json["strCategory"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
        "strCategoryDescription": strCategoryDescription,
      };
}
