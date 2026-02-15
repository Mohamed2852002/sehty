import 'package:equatable/equatable.dart';

class WelcomeEntity extends Equatable {
  final String greeting;
  final String name;
  final String message;

  const WelcomeEntity({
    required this.greeting,
    required this.name,
    required this.message,
  });

  @override
  List<Object?> get props => [greeting, name, message];
}
