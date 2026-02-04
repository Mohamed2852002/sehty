// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Note`
  String get note {
    return Intl.message('Note', name: 'note', desc: '', args: []);
  }

  /// `When selecting prescription category, a field to enter the doctor's name will open`
  String get prescriptionDoctorNote {
    return Intl.message(
      'When selecting prescription category, a field to enter the doctor\'s name will open',
      name: 'prescriptionDoctorNote',
      desc: '',
      args: [],
    );
  }

  /// `When selecting analysis category, a field to enter the lab name will open`
  String get analysisLabNote {
    return Intl.message(
      'When selecting analysis category, a field to enter the lab name will open',
      name: 'analysisLabNote',
      desc: '',
      args: [],
    );
  }

  /// `When selecting x-ray category, a field to enter the center name will open`
  String get xrayNote {
    return Intl.message(
      'When selecting x-ray category, a field to enter the center name will open',
      name: 'xrayNote',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeTitle {
    return Intl.message('Welcome', name: 'welcomeTitle', desc: '', args: []);
  }

  /// `Register with us to start your health care journey`
  String get registerSubtitle {
    return Intl.message(
      'Register with us to start your health care journey',
      name: 'registerSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Weight (kg)`
  String get weightKg {
    return Intl.message('Weight (kg)', name: 'weightKg', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `District`
  String get district {
    return Intl.message('District', name: 'district', desc: '', args: []);
  }

  /// `Governorate`
  String get governorate {
    return Intl.message('Governorate', name: 'governorate', desc: '', args: []);
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a verification code via SMS`
  String get sendVerificationCode {
    return Intl.message(
      'We will send you a verification code via SMS',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code sent to`
  String get enterVerificationCode {
    return Intl.message(
      'Enter the verification code sent to',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `💡 The code may take up to one minute to arrive`
  String get verificationCodeNote {
    return Intl.message(
      '💡 The code may take up to one minute to arrive',
      name: 'verificationCodeNote',
      desc: '',
      args: [],
    );
  }

  /// `Chronic Diseases`
  String get chronicDiseases {
    return Intl.message(
      'Chronic Diseases',
      name: 'chronicDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Blood Pressure`
  String get bloodPressure {
    return Intl.message(
      'Blood Pressure',
      name: 'bloodPressure',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message('Diabetes', name: 'diabetes', desc: '', args: []);
  }

  /// `Kidney`
  String get kidney {
    return Intl.message('Kidney', name: 'kidney', desc: '', args: []);
  }

  /// `Heart`
  String get heart {
    return Intl.message('Heart', name: 'heart', desc: '', args: []);
  }

  /// `Asthma`
  String get asthma {
    return Intl.message('Asthma', name: 'asthma', desc: '', args: []);
  }

  /// `Liver`
  String get liver {
    return Intl.message('Liver', name: 'liver', desc: '', args: []);
  }

  /// `Thyroid`
  String get thyroid {
    return Intl.message('Thyroid', name: 'thyroid', desc: '', args: []);
  }

  /// `Arthritis`
  String get arthritis {
    return Intl.message('Arthritis', name: 'arthritis', desc: '', args: []);
  }

  /// `Data Sharing Consent`
  String get dataConsentTitle {
    return Intl.message(
      'Data Sharing Consent',
      name: 'dataConsentTitle',
      desc: '',
      args: [],
    );
  }

  /// `I agree to share my medical data with certified healthcare providers to improve the quality of service and healthcare provided to me`
  String get dataConsentDescription {
    return Intl.message(
      'I agree to share my medical data with certified healthcare providers to improve the quality of service and healthcare provided to me',
      name: 'dataConsentDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next - Confirm Phone Number`
  String get nextConfirmPhone {
    return Intl.message(
      'Next - Confirm Phone Number',
      name: 'nextConfirmPhone',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Your personal and medical information`
  String get personalMedicalInfo {
    return Intl.message(
      'Your personal and medical information',
      name: 'personalMedicalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Patient Code`
  String get patientCode {
    return Intl.message(
      'Patient Code',
      name: 'patientCode',
      desc: '',
      args: [],
    );
  }

  /// `Use this code when visiting the doctor or in emergencies`
  String get useCodeNote {
    return Intl.message(
      'Use this code when visiting the doctor or in emergencies',
      name: 'useCodeNote',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get basicInfo {
    return Intl.message(
      'Basic Information',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Your privacy matters:`
  String get privacyImportant {
    return Intl.message(
      'Your privacy matters:',
      name: 'privacyImportant',
      desc: '',
      args: [],
    );
  }

  /// `All your information is securely stored and encrypted. No data is shared without your consent`
  String get privacyNote {
    return Intl.message(
      'All your information is securely stored and encrypted. No data is shared without your consent',
      name: 'privacyNote',
      desc: '',
      args: [],
    );
  }

  /// `Family Tracking`
  String get familyTracking {
    return Intl.message(
      'Family Tracking',
      name: 'familyTracking',
      desc: '',
      args: [],
    );
  }

  /// `Medications`
  String get medications {
    return Intl.message('Medications', name: 'medications', desc: '', args: []);
  }

  /// `Medical Record`
  String get medicalRecord {
    return Intl.message(
      'Medical Record',
      name: 'medicalRecord',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `years`
  String get yearsOld {
    return Intl.message('years', name: 'yearsOld', desc: '', args: []);
  }

  /// `kg`
  String get kg {
    return Intl.message('kg', name: 'kg', desc: '', args: []);
  }

  /// `Check on your loved ones and track their medication adherence`
  String get reassureLovedOnes {
    return Intl.message(
      'Check on your loved ones and track their medication adherence',
      name: 'reassureLovedOnes',
      desc: '',
      args: [],
    );
  }

  /// `Search for patient by name or phone...`
  String get searchPatient {
    return Intl.message(
      'Search for patient by name or phone...',
      name: 'searchPatient',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Connected`
  String get connected {
    return Intl.message('Connected', name: 'connected', desc: '', args: []);
  }

  /// `Add Patient for Tracking`
  String get addPatientForTracking {
    return Intl.message(
      'Add Patient for Tracking',
      name: 'addPatientForTracking',
      desc: '',
      args: [],
    );
  }

  /// `A tracking request will be sent to the patient. After acceptance, you can check on their medication adherence status`
  String get addPatientNote {
    return Intl.message(
      'A tracking request will be sent to the patient. After acceptance, you can check on their medication adherence status',
      name: 'addPatientNote',
      desc: '',
      args: [],
    );
  }

  /// `Pending Requests`
  String get pendingRequests {
    return Intl.message(
      'Pending Requests',
      name: 'pendingRequests',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name (as you want it to appear)`
  String get patientNameLabel {
    return Intl.message(
      'Patient Name (as you want it to appear)',
      name: 'patientNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Acceptance`
  String get waitingAcceptance {
    return Intl.message(
      'Waiting for Acceptance',
      name: 'waitingAcceptance',
      desc: '',
      args: [],
    );
  }

  /// `This name is for personal use only`
  String get personalUseNote {
    return Intl.message(
      'This name is for personal use only',
      name: 'personalUseNote',
      desc: '',
      args: [],
    );
  }

  /// `Patient Phone Number`
  String get patientPhoneNumber {
    return Intl.message(
      'Patient Phone Number',
      name: 'patientPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Patients Under Care`
  String get patientsUnderCare {
    return Intl.message(
      'Patients Under Care',
      name: 'patientsUnderCare',
      desc: '',
      args: [],
    );
  }

  /// `Relationship (optional)`
  String get relationOptional {
    return Intl.message(
      'Relationship (optional)',
      name: 'relationOptional',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Today's Medications`
  String get medicationsOfDay {
    return Intl.message(
      'Today\'s Medications',
      name: 'medicationsOfDay',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ Make sure the phone number is correct - the tracking request will be sent immediately`
  String get phoneVerifyNote {
    return Intl.message(
      '⚠️ Make sure the phone number is correct - the tracking request will be sent immediately',
      name: 'phoneVerifyNote',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Adherence:`
  String get weeklyCommitment {
    return Intl.message(
      'Weekly Adherence:',
      name: 'weeklyCommitment',
      desc: '',
      args: [],
    );
  }

  /// `View Medication Details`
  String get viewMedicationDetails {
    return Intl.message(
      'View Medication Details',
      name: 'viewMedicationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Send Request`
  String get sendRequest {
    return Intl.message(
      'Send Request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `My Father - Mohamed`
  String get fatherMohamed {
    return Intl.message(
      'My Father - Mohamed',
      name: 'fatherMohamed',
      desc: '',
      args: [],
    );
  }

  /// `My Mother - Fatima`
  String get motherFatima {
    return Intl.message(
      'My Mother - Fatima',
      name: 'motherFatima',
      desc: '',
      args: [],
    );
  }

  /// `Example: My Father - Mohamed`
  String get fatherExample {
    return Intl.message(
      'Example: My Father - Mohamed',
      name: 'fatherExample',
      desc: '',
      args: [],
    );
  }

  /// `Example: Father, Mother, Brother...`
  String get relationExample {
    return Intl.message(
      'Example: Father, Mother, Brother...',
      name: 'relationExample',
      desc: '',
      args: [],
    );
  }

  /// `Father`
  String get father {
    return Intl.message('Father', name: 'father', desc: '', args: []);
  }

  /// `Today's Compliance Rate`
  String get todayComplianceRate {
    return Intl.message(
      'Today\'s Compliance Rate',
      name: 'todayComplianceRate',
      desc: '',
      args: [],
    );
  }

  /// `Needs Follow-up`
  String get needsFollowUp {
    return Intl.message(
      'Needs Follow-up',
      name: 'needsFollowUp',
      desc: '',
      args: [],
    );
  }

  /// `of 3 medications`
  String get ofMedications {
    return Intl.message(
      'of 3 medications',
      name: 'ofMedications',
      desc: '',
      args: [],
    );
  }

  /// `Aspirin`
  String get aspirin {
    return Intl.message('Aspirin', name: 'aspirin', desc: '', args: []);
  }

  /// `Metformin`
  String get metformin {
    return Intl.message('Metformin', name: 'metformin', desc: '', args: []);
  }

  /// `Amlodipine`
  String get amlodipine {
    return Intl.message('Amlodipine', name: 'amlodipine', desc: '', args: []);
  }

  /// `100 mg`
  String get mg100 {
    return Intl.message('100 mg', name: 'mg100', desc: '', args: []);
  }

  /// `500 mg`
  String get mg500 {
    return Intl.message('500 mg', name: 'mg500', desc: '', args: []);
  }

  /// `5 mg`
  String get mg5 {
    return Intl.message('5 mg', name: 'mg5', desc: '', args: []);
  }

  /// `Taken at:`
  String get takenAt {
    return Intl.message('Taken at:', name: 'takenAt', desc: '', args: []);
  }

  /// `Scheduled:`
  String get scheduledAt {
    return Intl.message('Scheduled:', name: 'scheduledAt', desc: '', args: []);
  }

  /// `💙 Medication not confirmed yet`
  String get medicationNotConfirmed {
    return Intl.message(
      '💙 Medication not confirmed yet',
      name: 'medicationNotConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `This person shared their data with you for reassurance. You can only view without editing`
  String get sharedDataNote {
    return Intl.message(
      'This person shared their data with you for reassurance. You can only view without editing',
      name: 'sharedDataNote',
      desc: '',
      args: [],
    );
  }

  /// `This person shared their data so you can check on them. You can only view without editing`
  String get sharedDataNoteAlt {
    return Intl.message(
      'This person shared their data so you can check on them. You can only view without editing',
      name: 'sharedDataNoteAlt',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Ali Abdelaziz`
  String get helloUser {
    return Intl.message(
      'Hello, Ali Abdelaziz',
      name: 'helloUser',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `We wish you a day full of health and wellness`
  String get wishYouHealth {
    return Intl.message(
      'We wish you a day full of health and wellness',
      name: 'wishYouHealth',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `You haven't added any family follower yet`
  String get noFamilyFollower {
    return Intl.message(
      'You haven\'t added any family follower yet',
      name: 'noFamilyFollower',
      desc: '',
      args: [],
    );
  }

  /// `Add a family member to check on you`
  String get addFamilyMember {
    return Intl.message(
      'Add a family member to check on you',
      name: 'addFamilyMember',
      desc: '',
      args: [],
    );
  }

  /// `Today's Summary`
  String get todaySummary {
    return Intl.message(
      'Today\'s Summary',
      name: 'todaySummary',
      desc: '',
      args: [],
    );
  }

  /// `There are medications not taken`
  String get medicationsNotTaken {
    return Intl.message(
      'There are medications not taken',
      name: 'medicationsNotTaken',
      desc: '',
      args: [],
    );
  }

  /// `Compliance Status`
  String get complianceStatus {
    return Intl.message(
      'Compliance Status',
      name: 'complianceStatus',
      desc: '',
      args: [],
    );
  }

  /// `medicine for today`
  String get medicineForToday {
    return Intl.message(
      'medicine for today',
      name: 'medicineForToday',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Taking`
  String get confirmTaking {
    return Intl.message(
      'Confirm Taking',
      name: 'confirmTaking',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get addMedicine {
    return Intl.message(
      'Add Medicine',
      name: 'addMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Your medical files in one secure place`
  String get medicalFilesSecure {
    return Intl.message(
      'Your medical files in one secure place',
      name: 'medicalFilesSecure',
      desc: '',
      args: [],
    );
  }

  /// `All your medical files are encrypted and stored with the highest security standards. You can share them securely with your doctor`
  String get filesSecurityNote {
    return Intl.message(
      'All your medical files are encrypted and stored with the highest security standards. You can share them securely with your doctor',
      name: 'filesSecurityNote',
      desc: '',
      args: [],
    );
  }

  /// `Your files security:`
  String get filesSecurityTitle {
    return Intl.message(
      'Your files security:',
      name: 'filesSecurityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Prescriptions`
  String get prescriptions {
    return Intl.message(
      'Prescriptions',
      name: 'prescriptions',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `X-rays`
  String get xrays {
    return Intl.message('X-rays', name: 'xrays', desc: '', args: []);
  }

  /// `Analyses`
  String get analyses {
    return Intl.message('Analyses', name: 'analyses', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Medical QR Code`
  String get medicalQrCode {
    return Intl.message(
      'Medical QR Code',
      name: 'medicalQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Sugar Analysis`
  String get sugarAnalysis {
    return Intl.message(
      'Sugar Analysis',
      name: 'sugarAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Use this code for quick access to your medical record in emergencies`
  String get qrCodeNote {
    return Intl.message(
      'Use this code for quick access to your medical record in emergencies',
      name: 'qrCodeNote',
      desc: '',
      args: [],
    );
  }

  /// `Blood Sugar Analysis`
  String get bloodSugarAnalysis {
    return Intl.message(
      'Blood Sugar Analysis',
      name: 'bloodSugarAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Chest X-ray`
  String get chestXray {
    return Intl.message('Chest X-ray', name: 'chestXray', desc: '', args: []);
  }

  /// `Doctor's Report`
  String get doctorReport {
    return Intl.message(
      'Doctor\'s Report',
      name: 'doctorReport',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ Only share this code with certified healthcare providers`
  String get shareCodeWarning {
    return Intl.message(
      '⚠️ Only share this code with certified healthcare providers',
      name: 'shareCodeWarning',
      desc: '',
      args: [],
    );
  }

  /// `💡 How to share your files securely?`
  String get shareSecurely {
    return Intl.message(
      '💡 How to share your files securely?',
      name: 'shareSecurely',
      desc: '',
      args: [],
    );
  }

  /// `Click on "Share" to create a secure temporary link`
  String get shareSecurelyNote {
    return Intl.message(
      'Click on "Share" to create a secure temporary link',
      name: 'shareSecurelyNote',
      desc: '',
      args: [],
    );
  }

  /// `The link is valid for 24 hours only`
  String get linkValid24Hours {
    return Intl.message(
      'The link is valid for 24 hours only',
      name: 'linkValid24Hours',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel sharing at any time`
  String get cancelShareAnytime {
    return Intl.message(
      'You can cancel sharing at any time',
      name: 'cancelShareAnytime',
      desc: '',
      args: [],
    );
  }

  /// `Upload Medical File`
  String get uploadMedicalFile {
    return Intl.message(
      'Upload Medical File',
      name: 'uploadMedicalFile',
      desc: '',
      args: [],
    );
  }

  /// `File Name`
  String get fileName {
    return Intl.message('File Name', name: 'fileName', desc: '', args: []);
  }

  /// `Example: Fasting Sugar Analysis`
  String get fileNameExample {
    return Intl.message(
      'Example: Fasting Sugar Analysis',
      name: 'fileNameExample',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Analysis`
  String get analysis {
    return Intl.message('Analysis', name: 'analysis', desc: '', args: []);
  }

  /// `Laboratory Name`
  String get labName {
    return Intl.message('Laboratory Name', name: 'labName', desc: '', args: []);
  }

  /// `Example: Al Borg Lab`
  String get labNameExample {
    return Intl.message(
      'Example: Al Borg Lab',
      name: 'labNameExample',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message('File', name: 'file', desc: '', args: []);
  }

  /// `Click to select a file`
  String get clickToSelectFile {
    return Intl.message(
      'Click to select a file',
      name: 'clickToSelectFile',
      desc: '',
      args: [],
    );
  }

  /// `or image (up to 10 MB) PDF`
  String get orImagePdfNote {
    return Intl.message(
      'or image (up to 10 MB) PDF',
      name: 'orImagePdfNote',
      desc: '',
      args: [],
    );
  }

  /// `The file will be encrypted and saved securely. You can share it with your doctor when needed`
  String get fileSecurityNote {
    return Intl.message(
      'The file will be encrypted and saved securely. You can share it with your doctor when needed',
      name: 'fileSecurityNote',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get uploadFile {
    return Intl.message('Upload File', name: 'uploadFile', desc: '', args: []);
  }

  /// `Manage your medications and schedules`
  String get manageMedications {
    return Intl.message(
      'Manage your medications and schedules',
      name: 'manageMedications',
      desc: '',
      args: [],
    );
  }

  /// `💙 Remember:`
  String get rememberNote {
    return Intl.message(
      '💙 Remember:',
      name: 'rememberNote',
      desc: '',
      args: [],
    );
  }

  /// `Sticking to medication schedules helps you feel better faster. Take your time and don't worry if you forget once, just continue calmly`
  String get medicationReminder {
    return Intl.message(
      'Sticking to medication schedules helps you feel better faster. Take your time and don\'t worry if you forget once, just continue calmly',
      name: 'medicationReminder',
      desc: '',
      args: [],
    );
  }

  /// `Add New Medication`
  String get addNewMedication {
    return Intl.message(
      'Add New Medication',
      name: 'addNewMedication',
      desc: '',
      args: [],
    );
  }

  /// `We'll send you a gentle reminder at medication times. Don't worry if you forget, we're with you`
  String get medicationReminderNote {
    return Intl.message(
      'We\'ll send you a gentle reminder at medication times. Don\'t worry if you forget, we\'re with you',
      name: 'medicationReminderNote',
      desc: '',
      args: [],
    );
  }

  /// `Schedules:`
  String get schedules {
    return Intl.message('Schedules:', name: 'schedules', desc: '', args: []);
  }

  /// `Duration:`
  String get duration {
    return Intl.message('Duration:', name: 'duration', desc: '', args: []);
  }

  /// `30 days`
  String get days30 {
    return Intl.message('30 days', name: 'days30', desc: '', args: []);
  }

  /// `60 days`
  String get days60 {
    return Intl.message('60 days', name: 'days60', desc: '', args: []);
  }

  /// `90 days`
  String get days90 {
    return Intl.message('90 days', name: 'days90', desc: '', args: []);
  }

  /// `Treatment Start:`
  String get treatmentStart {
    return Intl.message(
      'Treatment Start:',
      name: 'treatmentStart',
      desc: '',
      args: [],
    );
  }

  /// `compliance with schedules rate`
  String get complianceRate {
    return Intl.message(
      'compliance with schedules rate',
      name: 'complianceRate',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Name`
  String get medicineName {
    return Intl.message(
      'Medicine Name',
      name: 'medicineName',
      desc: '',
      args: [],
    );
  }

  /// `Example: Aspirin`
  String get medicineNameExample {
    return Intl.message(
      'Example: Aspirin',
      name: 'medicineNameExample',
      desc: '',
      args: [],
    );
  }

  /// `Dose`
  String get dose {
    return Intl.message('Dose', name: 'dose', desc: '', args: []);
  }

  /// `Example: 100 mg`
  String get doseExample {
    return Intl.message(
      'Example: 100 mg',
      name: 'doseExample',
      desc: '',
      args: [],
    );
  }

  /// `Taking Schedules`
  String get takingSchedules {
    return Intl.message(
      'Taking Schedules',
      name: 'takingSchedules',
      desc: '',
      args: [],
    );
  }

  /// `Add Another Schedule`
  String get addAnotherSchedule {
    return Intl.message(
      'Add Another Schedule',
      name: 'addAnotherSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `Number of Days`
  String get daysCount {
    return Intl.message(
      'Number of Days',
      name: 'daysCount',
      desc: '',
      args: [],
    );
  }

  /// `Add Medication`
  String get addMedication {
    return Intl.message(
      'Add Medication',
      name: 'addMedication',
      desc: '',
      args: [],
    );
  }

  /// `💙Tip:`
  String get familyTip {
    return Intl.message('💙Tip:', name: 'familyTip', desc: '', args: []);
  }

  /// `Communicate with your loved ones regularly and ask about their health. Emotional and psychological support is as important as medication adherence`
  String get familyTipNote {
    return Intl.message(
      'Communicate with your loved ones regularly and ask about their health. Emotional and psychological support is as important as medication adherence',
      name: 'familyTipNote',
      desc: '',
      args: [],
    );
  }

  /// `Add Family Follower`
  String get addFamilyFollower {
    return Intl.message(
      'Add Family Follower',
      name: 'addFamilyFollower',
      desc: '',
      args: [],
    );
  }

  /// `The family follower will only be able to check on medication adherence status, without the ability to modify any data`
  String get addFamilyFollowerNote {
    return Intl.message(
      'The family follower will only be able to check on medication adherence status, without the ability to modify any data',
      name: 'addFamilyFollowerNote',
      desc: '',
      args: [],
    );
  }

  /// `Relationship Type`
  String get relationType {
    return Intl.message(
      'Relationship Type',
      name: 'relationType',
      desc: '',
      args: [],
    );
  }

  /// `An invitation will be sent to this number, and the follower will be able to check on you after accepting the invitation`
  String get invitationNote {
    return Intl.message(
      'An invitation will be sent to this number, and the follower will be able to check on you after accepting the invitation',
      name: 'invitationNote',
      desc: '',
      args: [],
    );
  }

  /// `Send Invitation`
  String get sendInvitation {
    return Intl.message(
      'Send Invitation',
      name: 'sendInvitation',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `You have 2 new notifications`
  String get newNotifications {
    return Intl.message(
      'You have 2 new notifications',
      name: 'newNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Medication Time`
  String get medicationTime {
    return Intl.message(
      'Medication Time',
      name: 'medicationTime',
      desc: '',
      args: [],
    );
  }

  /// `Family Tracking Request`
  String get familyTrackingRequest {
    return Intl.message(
      'Family Tracking Request',
      name: 'familyTrackingRequest',
      desc: '',
      args: [],
    );
  }

  /// `wants to check on you`
  String get wantsToCheckOnYou {
    return Intl.message(
      'wants to check on you',
      name: 'wantsToCheckOnYou',
      desc: '',
      args: [],
    );
  }

  /// `5 minutes ago`
  String get minutesAgo {
    return Intl.message(
      '5 minutes ago',
      name: 'minutesAgo',
      desc: '',
      args: [],
    );
  }

  /// `an hour ago`
  String get hourAgo {
    return Intl.message('an hour ago', name: 'hourAgo', desc: '', args: []);
  }

  /// `2 hours ago`
  String get hoursAgo {
    return Intl.message('2 hours ago', name: 'hoursAgo', desc: '', args: []);
  }

  /// `3 hours ago`
  String get threeHoursAgo {
    return Intl.message(
      '3 hours ago',
      name: 'threeHoursAgo',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Medication Confirmed`
  String get medicationConfirmed {
    return Intl.message(
      'Medication Confirmed',
      name: 'medicationConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Medication Reminder`
  String get medicationRemind {
    return Intl.message(
      'Medication Reminder',
      name: 'medicationRemind',
      desc: '',
      args: [],
    );
  }

  /// `Medical File Added`
  String get medicalFileAdded {
    return Intl.message(
      'Medical File Added',
      name: 'medicalFileAdded',
      desc: '',
      args: [],
    );
  }

  /// `Blood sugar analysis uploaded successfully`
  String get bloodSugarUploaded {
    return Intl.message(
      'Blood sugar analysis uploaded successfully',
      name: 'bloodSugarUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `Invitation Accepted`
  String get invitationAccepted {
    return Intl.message(
      'Invitation Accepted',
      name: 'invitationAccepted',
      desc: '',
      args: [],
    );
  }

  /// `accepted the family tracking invitation`
  String get acceptedFamilyInvitation {
    return Intl.message(
      'accepted the family tracking invitation',
      name: 'acceptedFamilyInvitation',
      desc: '',
      args: [],
    );
  }

  /// `2 days ago`
  String get twoDaysAgo {
    return Intl.message('2 days ago', name: 'twoDaysAgo', desc: '', args: []);
  }

  /// `Mark All as Read`
  String get markAllAsRead {
    return Intl.message(
      'Mark All as Read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Fasting Sugar Analysis`
  String get fastingSugarAnalysis {
    return Intl.message(
      'Fasting Sugar Analysis',
      name: 'fastingSugarAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Panadol`
  String get panadol {
    return Intl.message('Panadol', name: 'panadol', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Phone Input`
  String get phoneInput {
    return Intl.message('Phone Input', name: 'phoneInput', desc: '', args: []);
  }

  /// `Password Input`
  String get passwordInput {
    return Intl.message(
      'Password Input',
      name: 'passwordInput',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have an Account?`
  String get noAccount {
    return Intl.message(
      'Don\'t Have an Account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
