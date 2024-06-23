import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';


class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String otp,String email, String password, String passwordConfirmation) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "otp": otp,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    return response.fold((l) => l, (r) => r);
  }
}
