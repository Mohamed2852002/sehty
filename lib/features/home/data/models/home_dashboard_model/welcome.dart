import 'package:sehty/features/home/domain/entities/welcome_entity.dart';

class Welcome {
  String? greeting;
  String? name;
  String? message;

  Welcome({this.greeting, this.name, this.message});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    greeting: json['greeting'] as String?,
    name: json['name'] as String?,
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'greeting': greeting,
    'name': name,
    'message': message,
  };

  WelcomeEntity toEntity() => WelcomeEntity(
    greeting: greeting ?? '',
    name: name ?? '',
    message: message ?? '',
  );
}
