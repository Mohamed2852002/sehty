class Endpoints {
  static const String baseUrl = "http://192.168.1.61:8000/";

  // auth endpoints
  static const String login = "${baseUrl}api/login";
  static const String register = "${baseUrl}api/register";
  static const String logout = "${baseUrl}api/logout";

  // profile endpoints
  static const String getProfile = "${baseUrl}api/profile";
  static const String updateProfile = "${baseUrl}api/profile";
  static const String addSurgery = "${baseUrl}api/profile/surgeries";
  static const String getListOfChronicDiseases =
      "${baseUrl}api/chronic-diseases";

  // medications endpoints
  static const String getListOfMedications = "${baseUrl}api/medications";
  static const String getTodayMedications = "${baseUrl}api/medications/today";
  static const String addMedication = "${baseUrl}api/medications";
  static String confirmMedicationTaken(int medicineId) =>
      "${baseUrl}api/medications/$medicineId/confirm";

  // monitor endpoints
  static const String getListOfFamilyConnections = "${baseUrl}api/family";
  static String showOneFamilyMedication(int memberId) =>
      "${baseUrl}api/family/members/$memberId";
  static const inviteFamilyMember = "${baseUrl}api/family/invite";
  static const addNewMember = "${baseUrl}api/family/add-member";
  static String approveFamilyInvitation(int invitationId) =>
      "${baseUrl}api/family/$invitationId/approve";

  // records endpoints
  static const String getListOfMedicalRecords = "${baseUrl}api/medical-records";
  static const String uploadMedicalRecord = "${baseUrl}api/medical-records";
  static String shareMedicalRecord(int recordId) =>
      "${baseUrl}api/medical-records/$recordId/share";

  // notifications endpoints
  static const String getListOfNotifications = "${baseUrl}api/notifications";
  static const String registerDeviceToken =
      "${baseUrl}api/notifications/device-token";
}
