class UserModel {
  String? email;
  String? password;
  String address;

  UserModel(this.email, this.password, this.address);

}

mixin ApiService {
  void signIn(UserModel userModel);
}

class ApiServiceImp with ApiService {
  @override
  void signIn(UserModel userModel) {
    print(userModel.toString());
  }

}

class Repository {
  ApiServiceImp _apiServiceImp;

  Repository(this._apiServiceImp);

  void signIn(UserModel userModel){
    _apiServiceImp.signIn(userModel);
  }
}