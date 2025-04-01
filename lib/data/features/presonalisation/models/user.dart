class UserParams {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? photoURL;

  final String? uid;

  UserParams({
    required this.uid,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
    this.photoURL,
  });

  Map<String, dynamic> toMap() {

    return {
      "uid":uid,
      'email': email,
      'displayName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL ?? '',
    };
  }
}
