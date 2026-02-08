import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class MonitorRemoteDataSource {
  final ApiServices apiServices;

  MonitorRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getListOfFamilyConnections() async {
    return await apiServices.get(Endpoints.getListOfFamilyConnections);
  }

  Future<Map<String, dynamic>> showOneFamilyMedication({
    required int memberId,
  }) async {
    return await apiServices.get(Endpoints.showOneFamilyMedication(memberId));
  }

  Future<Map<String, dynamic>> inviteFamilyMember({
    required String phone,
    required String relationship,
  }) async {
    final Map<String, dynamic> inviteData = {
      'phone': phone,
      'relationship': relationship,
    };
    return await apiServices.post(Endpoints.inviteFamilyMember, inviteData);
  }

  Future<Map<String, dynamic>> addNewMember({
    required String name,
    required String phone,
    required String relationship,
  }) async {
    final Map<String, dynamic> memberData = {
      'name': name,
      'phone': phone,
      'relationship': relationship,
    };
    return await apiServices.post(Endpoints.addNewMember, memberData);
  }

  Future<Map<String, dynamic>> approveFamilyInvitation({
    required int invitationId,
  }) async {
    return await apiServices.post(
      Endpoints.approveFamilyInvitation(invitationId),
      {},
    );
  }
}
