class EmailParams{
 final String email;

  EmailParams({required this.email});

  Map<String,dynamic> toMap(EmailParams data) {
    return {
      "email":data.email
    };
  }

}