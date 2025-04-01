class SignUpParams {

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? photoURL;

  SignUpParams({

    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
    this.photoURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'displayName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL ?? '',
    };
  }
}
