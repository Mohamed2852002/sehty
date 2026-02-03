import 'package:flutter/material.dart';
import 'package:sehty/generated/l10n.dart';

class AppStrings {
  static late S _localizations;

  static void load(BuildContext context) {
    _localizations = S.of(context);
  }
  // Notes
  static String get note => _localizations.note;
  static String get prescriptionDoctorNote =>
      _localizations.prescriptionDoctorNote;
  static String get analysisLabNote => _localizations.analysisLabNote;
  static String get xrayNote => _localizations.xrayNote;

  // Welcome & Registration
  static String get welcomeTitle => _localizations.welcomeTitle;
  static String get registerSubtitle => _localizations.registerSubtitle;

  // Personal Info
  static String get personalInfo => _localizations.personalInfo;
  static String get fullName => _localizations.fullName;
  static String get gender => _localizations.gender;
  static String get weightKg => _localizations.weightKg;
  static String get age => _localizations.age;
  static String get male => _localizations.male;
  static String get district => _localizations.district;
  static String get governorate => _localizations.governorate;
  static String get mobileNumber => _localizations.mobileNumber;
  static String get phoneNumber => _localizations.phoneNumber;
  static String get weight => _localizations.weight;
  static String get yearsOld => _localizations.yearsOld;
  static String get kg => _localizations.kg;

  // Verification
  static String get sendVerificationCode => _localizations.sendVerificationCode;
  static String get enterVerificationCode =>
      _localizations.enterVerificationCode;
  static String get verificationCodeNote => _localizations.verificationCodeNote;
  static String get sendCode => _localizations.sendCode;

  // Chronic Diseases
  static String get chronicDiseases => _localizations.chronicDiseases;
  static String get bloodPressure => _localizations.bloodPressure;
  static String get diabetes => _localizations.diabetes;
  static String get kidney => _localizations.kidney;
  static String get heart => _localizations.heart;
  static String get asthma => _localizations.asthma;
  static String get liver => _localizations.liver;
  static String get thyroid => _localizations.thyroid;
  static String get arthritis => _localizations.arthritis;

  // Data Consent
  static String get dataConsentTitle => _localizations.dataConsentTitle;
  static String get dataConsentDescription =>
      _localizations.dataConsentDescription;
  static String get nextConfirmPhone => _localizations.nextConfirmPhone;

  // Profile
  static String get profile => _localizations.profile;
  static String get personalMedicalInfo => _localizations.personalMedicalInfo;
  static String get patientCode => _localizations.patientCode;
  static String get useCodeNote => _localizations.useCodeNote;
  static String get basicInfo => _localizations.basicInfo;
  static String get address => _localizations.address;
  static String get privacyImportant => _localizations.privacyImportant;
  static String get privacyNote => _localizations.privacyNote;
  static String get edit => _localizations.edit;

  // Actions
  static String get cancel => _localizations.cancel;
  static String get save => _localizations.save;
  static String get add => _localizations.add;
  static String get download => _localizations.download;
  static String get share => _localizations.share;
  static String get reject => _localizations.reject;
  static String get accept => _localizations.accept;

  // Navigation
  static String get familyTracking => _localizations.familyTracking;
  static String get medications => _localizations.medications;
  static String get medicalRecord => _localizations.medicalRecord;
  static String get home => _localizations.home;

  // Family Tracking
  static String get reassureLovedOnes => _localizations.reassureLovedOnes;
  static String get searchPatient => _localizations.searchPatient;
  static String get pending => _localizations.pending;
  static String get connected => _localizations.connected;
  static String get addPatientForTracking =>
      _localizations.addPatientForTracking;
  static String get addPatientNote => _localizations.addPatientNote;
  static String get pendingRequests => _localizations.pendingRequests;
  static String get patientNameLabel => _localizations.patientNameLabel;
  static String get waitingAcceptance => _localizations.waitingAcceptance;
  static String get personalUseNote => _localizations.personalUseNote;
  static String get patientPhoneNumber => _localizations.patientPhoneNumber;
  static String get patientsUnderCare => _localizations.patientsUnderCare;
  static String get relationOptional => _localizations.relationOptional;
  static String get phoneVerifyNote => _localizations.phoneVerifyNote;
  static String get sendRequest => _localizations.sendRequest;
  static String get fatherMohamed => _localizations.fatherMohamed;
  static String get motherFatima => _localizations.motherFatima;
  static String get fatherExample => _localizations.fatherExample;
  static String get relationExample => _localizations.relationExample;
  static String get father => _localizations.father;
  static String get sharedDataNote => _localizations.sharedDataNote;
  static String get sharedDataNoteAlt => _localizations.sharedDataNoteAlt;

  // Medication Tracking
  static String get today => _localizations.today;
  static String get medicationsOfDay => _localizations.medicationsOfDay;
  static String get weeklyCommitment => _localizations.weeklyCommitment;
  static String get viewMedicationDetails =>
      _localizations.viewMedicationDetails;
  static String get todayComplianceRate => _localizations.todayComplianceRate;
  static String get needsFollowUp => _localizations.needsFollowUp;
  static String get ofMedications => _localizations.ofMedications;
  static String get takenAt => _localizations.takenAt;
  static String get scheduledAt => _localizations.scheduledAt;
  static String get medicationNotConfirmed =>
      _localizations.medicationNotConfirmed;

  // Medications
  static String get aspirin => _localizations.aspirin;
  static String get metformin => _localizations.metformin;
  static String get amlodipine => _localizations.amlodipine;
  static String get panadol => _localizations.panadol;
  static String get mg100 => _localizations.mg100;
  static String get mg500 => _localizations.mg500;
  static String get mg5 => _localizations.mg5;

  // Home Screen
  static String get helloUser => _localizations.helloUser;
  static String get hello => _localizations.hello;
  static String get wishYouHealth => _localizations.wishYouHealth;
  static String get noFamilyFollower => _localizations.noFamilyFollower;
  static String get addFamilyMember => _localizations.addFamilyMember;
  static String get todaySummary => _localizations.todaySummary;
  static String get medicationsNotTaken => _localizations.medicationsNotTaken;
  static String get complianceStatus => _localizations.complianceStatus;
  static String get medicineForToday => _localizations.medicineForToday;
  static String get confirmTaking => _localizations.confirmTaking;
  static String get addMedicine => _localizations.addMedicine;

  // Medical Records
  static String get medicalFilesSecure => _localizations.medicalFilesSecure;
  static String get filesSecurityNote => _localizations.filesSecurityNote;
  static String get filesSecurityTitle => _localizations.filesSecurityTitle;
  static String get prescriptions => _localizations.prescriptions;
  static String get reports => _localizations.reports;
  static String get xrays => _localizations.xrays;
  static String get analyses => _localizations.analyses;
  static String get all => _localizations.all;
  static String get medicalQrCode => _localizations.medicalQrCode;
  static String get sugarAnalysis => _localizations.sugarAnalysis;
  static String get qrCodeNote => _localizations.qrCodeNote;
  static String get bloodSugarAnalysis => _localizations.bloodSugarAnalysis;
  static String get chestXray => _localizations.chestXray;
  static String get doctorReport => _localizations.doctorReport;
  static String get shareCodeWarning => _localizations.shareCodeWarning;
  static String get shareSecurely => _localizations.shareSecurely;
  static String get shareSecurelyNote => _localizations.shareSecurelyNote;
  static String get linkValid24Hours => _localizations.linkValid24Hours;
  static String get cancelShareAnytime => _localizations.cancelShareAnytime;

  // Upload Files
  static String get uploadMedicalFile => _localizations.uploadMedicalFile;
  static String get fileName => _localizations.fileName;
  static String get category => _localizations.category;
  static String get analysis => _localizations.analysis;
  static String get labName => _localizations.labName;
  static String get file => _localizations.file;
  static String get clickToSelectFile => _localizations.clickToSelectFile;
  static String get pdfOrImage => _localizations.pdfOrImage;
  static String get fileEncryptionNote => _localizations.fileEncryptionNote;
  static String get uploadFile => _localizations.uploadFile;
  static String get fastingSugarAnalysis => _localizations.fastingSugarAnalysis;

  // Medication Management
  static String get manageMedications => _localizations.manageMedications;
  static String get rememberNote => _localizations.rememberNote;
  static String get medicationReminder => _localizations.medicationReminder;
  static String get addNewMedication => _localizations.addNewMedication;
  static String get medicationReminderNote =>
      _localizations.medicationReminderNote;
  static String get schedules => _localizations.schedules;
  static String get duration => _localizations.duration;
  static String get days30 => _localizations.days30;
  static String get days60 => _localizations.days60;
  static String get days90 => _localizations.days90;
  static String get treatmentStart => _localizations.treatmentStart;
  static String get complianceRate => _localizations.complianceRate;
  static String get medicineName => _localizations.medicineName;
  static String get medicineNameExample => _localizations.medicineNameExample;
  static String get dose => _localizations.dose;
  static String get doseExample => _localizations.doseExample;
  static String get takingSchedules => _localizations.takingSchedules;
  static String get addAnotherSchedule => _localizations.addAnotherSchedule;
  static String get startDate => _localizations.startDate;
  static String get daysCount => _localizations.daysCount;
  static String get addMedication => _localizations.addMedication;

  // Family Tips
  static String get familyTip => _localizations.familyTip;
  static String get familyTipNote => _localizations.familyTipNote;

  // Add Family Follower
  static String get addFamilyFollower => _localizations.addFamilyFollower;
  static String get addFamilyFollowerNote =>
      _localizations.addFamilyFollowerNote;
  static String get relationType => _localizations.relationType;
  static String get invitationNote => _localizations.invitationNote;
  static String get sendInvitation => _localizations.sendInvitation;

  // Notifications
  static String get notifications => _localizations.notifications;
  static String get newNotifications => _localizations.newNotifications;
  static String get medicationTime => _localizations.medicationTime;
  static String get familyTrackingRequest =>
      _localizations.familyTrackingRequest;
  static String get wantsToCheckOnYou => _localizations.wantsToCheckOnYou;
  static String get minutesAgo => _localizations.minutesAgo;
  static String get hourAgo => _localizations.hourAgo;
  static String get hoursAgo => _localizations.hoursAgo;
  static String get threeHoursAgo => _localizations.threeHoursAgo;
  static String get medicationConfirmed => _localizations.medicationConfirmed;
  static String get medicationRemind => _localizations.medicationRemind;
  static String get medicalFileAdded => _localizations.medicalFileAdded;
  static String get bloodSugarUploaded => _localizations.bloodSugarUploaded;
  static String get yesterday => _localizations.yesterday;
  static String get invitationAccepted => _localizations.invitationAccepted;
  static String get acceptedFamilyInvitation =>
      _localizations.acceptedFamilyInvitation;
  static String get twoDaysAgo => _localizations.twoDaysAgo;
  static String get markAllAsRead => _localizations.markAllAsRead;
}
