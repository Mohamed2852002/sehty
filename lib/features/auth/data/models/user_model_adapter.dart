import 'package:hive/hive.dart';
import 'package:sehty/features/auth/data/models/user_model.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      id: reader.readInt(),
      name: reader.readString(),
      phone: reader.readString(),
      patientCode: reader.readString(),
      age: reader.readInt(),
      gender: reader.readString(),
      weight: reader.readDouble(),
      governorate: reader.readString(),
      district: reader.readString(),
      dataSharingConsent: reader.readBool(),
      createdAt: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.phone);
    writer.writeString(obj.patientCode);
    writer.writeInt(obj.age);
    writer.writeString(obj.gender);
    writer.writeDouble(obj.weight);
    writer.writeString(obj.governorate);
    writer.writeString(obj.district);
    writer.writeBool(obj.dataSharingConsent);
    writer.writeString(obj.createdAt.toIso8601String());
  }
}
