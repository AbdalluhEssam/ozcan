import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';


class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username, String password, String email, String phone, String gender) async {
    var response = await crud.postData(AppLink.signUp, {
      "name": username.toString(),
      "email": email.toString(),
      "phone": phone.toString(),
      "gender": gender.toString(),
      "password": password.toString(),
      "password_confirmation": password.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
