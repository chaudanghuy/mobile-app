class WpConfig {
  // YOUR WEBISTE URL
  static const String websiteUrl = "https://news.gac8.net";

  //FEATURE TAG ID
  static const int featuredTagID = 2;

  //VIDEO TAG ID
  static const int videoTagId = 3;

  // Hometab 4 categories
  // -- 'Serial Number' : [Category Id, 'Category Name'] -- Length should be 4.
  static const Map selectedCategories = {
    '1': [13, "Tin nóng"],
    '2': [4, "Mẹo vặt"],
    '3': [6, "Sức khỏe"],
    '4': [5, "Tâm sự"],
    '5': [85, "Thời trang"],
    '6': [15, "Ngẫm"],
    '7': [76, "Phong thủy"],
    '8': [84, "Bóng đá"],
  };

  /*
  List of blocked categories. Do nothing if you don't want to block any categories.
  If you want to bloc any category and it's posts then enter values like these:

  Example: If you want to block category id 10 & 12, then it will be look like this:

    static const String blockedCategoryIds = "10,12";
    static const String blockedCategoryIdsforPopularPosts = "-10,-12";

  */

  static const String blockedCategoryIds = "";
  static const String blockedCategoryIdsforPopularPosts = "";

  // FEATURE IMGAE -  IF YOUR POSTS DON"T HAVE A FEATURE IMAGE
  static const String randomPostFeatureImage =
      "https://images.pexels.com/photos/1034940/pexels-photo-1034940.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=1280";

  // FEATURE CATEGORY IMGAE -  IF YOU HAVEN'T DEFINE A COVER IMAGE FOR A CATEGORY IN THE LIST BELOW
  static const String randomCategoryThumbnail =
      "https://images.pexels.com/photos/1034940/pexels-photo-1034940.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";

  // ENTER CATERGORY ID AND ITS COVERS IMAGE
  static const Map categoryThumbnails = {
    // categoryID : 'category thumbnail url'
    //Cong nghe
    10: "https://images.pexels.com/photos/4145356/pexels-photo-4145356.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Doi song
    1: "https://images.pexels.com/photos/1153369/pexels-photo-1153369.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Meo vat
    4: "https://images.pexels.com/photos/163066/desk-terminplanung-control-newsletter-163066.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Ngam
    15: "https://images.pexels.com/photos/3243020/pexels-photo-3243020.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Showbiz
    7: "https://images.pexels.com/photos/1047442/pexels-photo-1047442.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Suc khoe
    6: "https://images.pexels.com/photos/3822583/pexels-photo-3822583.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Tam su
    5: "https://images.pexels.com/photos/4148842/pexels-photo-4148842.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //The gioi
    12: "https://images.pexels.com/photos/1586034/pexels-photo-1586034.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Bong da
    84: "https://images.pexels.com/photos/1884574/pexels-photo-1884574.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Thoi trang
    85: "https://images.pexels.com/photos/852860/pexels-photo-852860.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Tin tuc
    13: "https://images.pexels.com/photos/1369476/pexels-photo-1369476.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Phong thuy
    76: "https://images.pexels.com/photos/327483/pexels-photo-327483.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Kinh te
    80: "https://images.pexels.com/photos/3184287/pexels-photo-3184287.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Chom sao
    82: "https://images.pexels.com/photos/6658693/pexels-photo-6658693.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    //Me va be
    83: "https://images.pexels.com/photos/3875225/pexels-photo-3875225.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  };
}
