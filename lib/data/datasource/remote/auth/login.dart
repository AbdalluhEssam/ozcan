import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData(String password, String email) async {
    var response = await crud.postData(AppLink.login, {
      "password": password.toString(),
      "email": email.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAccount(String token) async {
    var response = await crud.postData(AppLink.deleteAccount, {}, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
