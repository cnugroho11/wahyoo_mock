const String url = 'https://pos.vantura.id/api';
const String ftp = 'https://pos.vantura.id/images/';
const String google = "https://people.googleapis.com/v1/people/me/connections?requestMask.includeField=person.names";

const String getProductAll = url+"/category/product/all?outlet_id=";
const String getCategories = url+'/category';
const String getPromotionAll = url+'/promo?shop_id=';
const String login = url+'/auth/login';
const String register = url+'/auth/register';
const String order = url+'/order/create';
const String getHistory = url+'/order';
const String checkPhoneNumber = url+'/auth/checkphone';
const String checkEmail = "/auth/checkemail?email=";
const String updateUser = url+'/user/updateaccount';
const String updatePassword = url+'/user/updatepassword';