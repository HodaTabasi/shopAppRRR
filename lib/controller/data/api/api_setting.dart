class APISetting {
  static String BASE_URL = "http://rrrstore103.com/api/";
  static String IMAGE_BASE_URL = "http://rrrstore103.com/";
  static String get_all_product = "${BASE_URL}products/get_all_products";
  static String get_new_product = "${BASE_URL}products/get_products/new_product";
  static String get_product_details = "${BASE_URL}products/get_product/{product_id}";
  static String get_sub_category = "${BASE_URL}categories/get_sub_categories/{sub_cat}";
  static String get_all_category = "${BASE_URL}categories/get_all_categories";
  static String get_all_product_by_category = "${BASE_URL}products/get_product_by_category_id/{id}";
  static String get_all_product_by_subcategory = "${BASE_URL}products/get_product_by_subcategory_id/{id}/{sub_id}";
  static String get_sliders = "${BASE_URL}sliders/get_sliders";
  static String get_orders = "${BASE_URL}orders/get_orders/{status_id}";
  static String add_order = "${BASE_URL}orders/add_order";
  static String login = "${BASE_URL}customers/login";
  static String register = "${BASE_URL}customers/register";
  static String update_user = "${BASE_URL}customers/update";

}