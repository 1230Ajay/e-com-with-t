class SignInParams{
  final String username;
  final String password;

  SignInParams({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

}