class Endpoints {
  static const String baseUrl = "https://se7aty.com/api/";

  // auth endpoints
  static const String login = "login";
  static const String register = "register";
  static const String logout = "logout";

  // home endpoints
  static const String homeDashboard = 'home';

  // profile endpoints
  static const String getProfile = "profile";
  static const String updateProfile = "profile";
  static const String addSurgery = "profile/surgeries";
  static const String getListOfChronicDiseases = "chronic-diseases";

  // medications endpoints
  static const String getListOfMedications = "medications";
  static const String getTodayMedications = "medications/today";
  static const String addMedication = "medications";
  static String confirmMedicationTaken(int medicineId) =>
      "medications/$medicineId/confirm";

  // monitor endpoints
  static const String getListOfFamilyConnections = "family";
  static String showOneFamilyMedication(int memberId) =>
      "family/members/$memberId";
  static const inviteFamilyMember = "family/invite";
  static const addNewMember = "family/add-member";
  static String approveFamilyInvitation(int invitationId) =>
      "family/$invitationId/approve";

  // records endpoints
  static const String getListOfMedicalRecords = "medical-records";
  static const String uploadMedicalRecord = "medical-records";
  static String shareMedicalRecord(int recordId) =>
      "medical-records/$recordId/share";
  static String getSharedMedicalRecord(String shareToken) =>
      "shared/records/$shareToken";

  // notifications endpoints
  static const String getListOfNotifications = "notifications";
  static const String registerDeviceToken = "notifications/device-token";
}
