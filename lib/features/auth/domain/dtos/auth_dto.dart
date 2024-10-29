final class AuthDto {
  String? emailAddress;
  String? password;

  AuthDto({
    this.emailAddress,
    this.password,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) => AuthDto(
        emailAddress: json['emailAddress'],
        password: json['password'],
      );
}
