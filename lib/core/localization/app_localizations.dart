import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @submitComplaint.
  ///
  /// In en, this message translates to:
  /// **'Submit Complaint/Inquiry'**
  String get submitComplaint;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Bahrain Chamber'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @complaints.
  ///
  /// In en, this message translates to:
  /// **'Complaints'**
  String get complaints;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @kingdomOfBahrain.
  ///
  /// In en, this message translates to:
  /// **'Kingdom of Bahrain'**
  String get kingdomOfBahrain;

  /// No description provided for @allRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Bahrain Chamber All Rights Reserved'**
  String get allRightsReserved;

  /// No description provided for @featureEntitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Multiple Government Entities'**
  String get featureEntitiesTitle;

  /// No description provided for @featureEntitiesDesc.
  ///
  /// In en, this message translates to:
  /// **'Joint coordination and cooperation with 25+ government and semi-government entities'**
  String get featureEntitiesDesc;

  /// No description provided for @featureSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert Support'**
  String get featureSupportTitle;

  /// No description provided for @featureSupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Dedicated team to follow up your case with relevant entities'**
  String get featureSupportDesc;

  /// No description provided for @featureTrackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time Tracking'**
  String get featureTrackingTitle;

  /// No description provided for @featureTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Track your case status with your reference number'**
  String get featureTrackingDesc;

  /// No description provided for @featureSolutionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Effective Solutions'**
  String get featureSolutionsTitle;

  /// No description provided for @featureSolutionsDesc.
  ///
  /// In en, this message translates to:
  /// **'We strive to resolve your issues as quickly as possible'**
  String get featureSolutionsDesc;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Bahrain Chamber All Rights Reserved'**
  String get copyright;

  /// No description provided for @trackCase.
  ///
  /// In en, this message translates to:
  /// **'Track Your Case'**
  String get trackCase;

  /// No description provided for @stepRequestType.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get stepRequestType;

  /// No description provided for @stepPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get stepPersonalInfo;

  /// No description provided for @stepCompanyInfo.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get stepCompanyInfo;

  /// No description provided for @stepCaseDetails.
  ///
  /// In en, this message translates to:
  /// **'Case Details'**
  String get stepCaseDetails;

  /// No description provided for @stepConsent.
  ///
  /// In en, this message translates to:
  /// **'Consent'**
  String get stepConsent;

  /// No description provided for @submissionType.
  ///
  /// In en, this message translates to:
  /// **'Submission Type'**
  String get submissionType;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @inquiry.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiry;

  /// No description provided for @complaint.
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get complaint;

  /// No description provided for @entity.
  ///
  /// In en, this message translates to:
  /// **'Entity'**
  String get entity;

  /// No description provided for @selectEntity.
  ///
  /// In en, this message translates to:
  /// **'Select Entity'**
  String get selectEntity;

  /// No description provided for @bahrainAirportCompany.
  ///
  /// In en, this message translates to:
  /// **'Bahrain Airport Company'**
  String get bahrainAirportCompany;

  /// No description provided for @bahrainChamber.
  ///
  /// In en, this message translates to:
  /// **'Bahrain Chamber of Commerce and Industry'**
  String get bahrainChamber;

  /// No description provided for @bahrainDevelopmentBank.
  ///
  /// In en, this message translates to:
  /// **'Bahrain Development Bank'**
  String get bahrainDevelopmentBank;

  /// No description provided for @capitalGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Capital Governorate'**
  String get capitalGovernorate;

  /// No description provided for @centralBankBahrain.
  ///
  /// In en, this message translates to:
  /// **'Central Bank of Bahrain'**
  String get centralBankBahrain;

  /// No description provided for @economicDevelopmentBoard.
  ///
  /// In en, this message translates to:
  /// **'Economic Development Board'**
  String get economicDevelopmentBoard;

  /// No description provided for @electricityWaterAuthority.
  ///
  /// In en, this message translates to:
  /// **'Electricity and Water Authority'**
  String get electricityWaterAuthority;

  /// No description provided for @generalOrganizationSeaPorts.
  ///
  /// In en, this message translates to:
  /// **'General Organization for Sea Ports'**
  String get generalOrganizationSeaPorts;

  /// No description provided for @labourMarketRegulatoryAuthority.
  ///
  /// In en, this message translates to:
  /// **'Labour Market Regulatory Authority'**
  String get labourMarketRegulatoryAuthority;

  /// No description provided for @ministryElectricityWaterAffairs.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Electricity and Water Affairs'**
  String get ministryElectricityWaterAffairs;

  /// No description provided for @ministryFinanceNationalEconomy.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Finance and National Economy'**
  String get ministryFinanceNationalEconomy;

  /// No description provided for @ministryHealth.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Health'**
  String get ministryHealth;

  /// No description provided for @ministryHousingUrbanPlanning.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Housing and Urban Planning'**
  String get ministryHousingUrbanPlanning;

  /// No description provided for @ministryIndustryCommerce.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Industry and Commerce'**
  String get ministryIndustryCommerce;

  /// No description provided for @ministryInterior.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Interior'**
  String get ministryInterior;

  /// No description provided for @ministryJusticeIslamicAffairsWaqf.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Justice, Islamic Affairs and Waqf'**
  String get ministryJusticeIslamicAffairsWaqf;

  /// No description provided for @ministryLabour.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Labour'**
  String get ministryLabour;

  /// No description provided for @ministryTransportationTelecommunication.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Transportation and Telecommunication'**
  String get ministryTransportationTelecommunication;

  /// No description provided for @ministryWorks.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Works'**
  String get ministryWorks;

  /// No description provided for @muharraqGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Muharraq Governorate'**
  String get muharraqGovernorate;

  /// No description provided for @nationalBureauRevenue.
  ///
  /// In en, this message translates to:
  /// **'National Bureau for Revenue'**
  String get nationalBureauRevenue;

  /// No description provided for @nationalHealthRegulatoryAuthority.
  ///
  /// In en, this message translates to:
  /// **'National Health Regulatory Authority'**
  String get nationalHealthRegulatoryAuthority;

  /// No description provided for @northernGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Northern Governorate'**
  String get northernGovernorate;

  /// No description provided for @socialInsuranceOrganizations.
  ///
  /// In en, this message translates to:
  /// **'Social Insurance Organizations'**
  String get socialInsuranceOrganizations;

  /// No description provided for @southernGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Southern Governorate'**
  String get southernGovernorate;

  /// No description provided for @surveyLandRegistrationBureau.
  ///
  /// In en, this message translates to:
  /// **'Survey and Land Registration Bureau'**
  String get surveyLandRegistrationBureau;

  /// No description provided for @takmeenLabourFund.
  ///
  /// In en, this message translates to:
  /// **'Takmeen (Labour Fund)'**
  String get takmeenLabourFund;

  /// No description provided for @telecommunicationsRegulatoryAuthority.
  ///
  /// In en, this message translates to:
  /// **'Telecommunications Regulatory Authority'**
  String get telecommunicationsRegulatoryAuthority;

  /// No description provided for @otherPleaseSpecify.
  ///
  /// In en, this message translates to:
  /// **'Other (Please Specify)'**
  String get otherPleaseSpecify;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterYourFullName;

  /// No description provided for @cprPassportNumber.
  ///
  /// In en, this message translates to:
  /// **'CPR / Passport Number'**
  String get cprPassportNumber;

  /// No description provided for @enterYourIdNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your ID number'**
  String get enterYourIdNumber;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @selectPosition.
  ///
  /// In en, this message translates to:
  /// **'Select Position'**
  String get selectPosition;

  /// No description provided for @businessOwner.
  ///
  /// In en, this message translates to:
  /// **'Business Owner'**
  String get businessOwner;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterCompanyName;

  /// No description provided for @crNumber.
  ///
  /// In en, this message translates to:
  /// **'CR Number'**
  String get crNumber;

  /// No description provided for @enterCrNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter CR number'**
  String get enterCrNumber;

  /// No description provided for @bcciMembershipNumber.
  ///
  /// In en, this message translates to:
  /// **'BCCI Membership Number'**
  String get bcciMembershipNumber;

  /// No description provided for @enterBcciMembership.
  ///
  /// In en, this message translates to:
  /// **'Enter BCCI Membership Number'**
  String get enterBcciMembership;

  /// No description provided for @caseDetails.
  ///
  /// In en, this message translates to:
  /// **'Case Details'**
  String get caseDetails;

  /// No description provided for @suggestionSummary.
  ///
  /// In en, this message translates to:
  /// **'Suggestion Summary'**
  String get suggestionSummary;

  /// No description provided for @suggestionSummaryHint.
  ///
  /// In en, this message translates to:
  /// **'Please describe your suggestion in detail...'**
  String get suggestionSummaryHint;

  /// No description provided for @requestedResolution.
  ///
  /// In en, this message translates to:
  /// **'Requested Resolution'**
  String get requestedResolution;

  /// No description provided for @requestedResolutionHint.
  ///
  /// In en, this message translates to:
  /// **'What do you request from the Chamber?'**
  String get requestedResolutionHint;

  /// No description provided for @uploadDocuments.
  ///
  /// In en, this message translates to:
  /// **'Upload Documents (Optional)'**
  String get uploadDocuments;

  /// No description provided for @dragAndDropFiles.
  ///
  /// In en, this message translates to:
  /// **'Drag and drop files here or'**
  String get dragAndDropFiles;

  /// No description provided for @browseFiles.
  ///
  /// In en, this message translates to:
  /// **'Browse Files'**
  String get browseFiles;

  /// No description provided for @uploadDocumentsHint.
  ///
  /// In en, this message translates to:
  /// **'Upload your supporting documents'**
  String get uploadDocumentsHint;

  /// No description provided for @uploadDocumentsInfo.
  ///
  /// In en, this message translates to:
  /// **'Maximum 3 files. Max size per file: 5 MB. Allowed types: PDF, Word (DOC, DOCX), Excel (XLS, XLSX), Images (JPG, PNG)'**
  String get uploadDocumentsInfo;

  /// No description provided for @consent.
  ///
  /// In en, this message translates to:
  /// **'Consent'**
  String get consent;

  /// No description provided for @consentConfirmation.
  ///
  /// In en, this message translates to:
  /// **'I confirm that the information provided in this complaint form is accurate and complete.'**
  String get consentConfirmation;

  /// No description provided for @consentRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm that the information provided is accurate and complete.'**
  String get consentRequired;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get requestType;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @companyInformation.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get invalidEmail;

  /// No description provided for @complaintSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Complaint Submitted Successfully'**
  String get complaintSubmittedSuccessfully;

  /// No description provided for @complaintSubmittedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your complaint has been submitted successfully.'**
  String get complaintSubmittedMessage;

  /// No description provided for @complaintId.
  ///
  /// In en, this message translates to:
  /// **'Complaint ID'**
  String get complaintId;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @invalidEmailOrMobile.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email or mobile number'**
  String get invalidEmailOrMobile;

  /// No description provided for @trackYourCase.
  ///
  /// In en, this message translates to:
  /// **'Track Your Case'**
  String get trackYourCase;

  /// No description provided for @trackCaseDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your case details to track the current status.'**
  String get trackCaseDescription;

  /// No description provided for @referenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference Number'**
  String get referenceNumber;

  /// No description provided for @enterReferenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter reference number'**
  String get enterReferenceNumber;

  /// No description provided for @emailOrMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Email or Mobile Number'**
  String get emailOrMobileNumber;

  /// No description provided for @enterEmailOrMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter email or mobile number'**
  String get enterEmailOrMobileNumber;

  /// No description provided for @crNumberOptional.
  ///
  /// In en, this message translates to:
  /// **'CR Number (Optional)'**
  String get crNumberOptional;

  /// No description provided for @verifyAndTrack.
  ///
  /// In en, this message translates to:
  /// **'Verify & Track'**
  String get verifyAndTrack;

  /// No description provided for @invalidCrNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid CR number'**
  String get invalidCrNumber;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted'**
  String get submitted;

  /// No description provided for @unableToFindCase.
  ///
  /// In en, this message translates to:
  /// **'Unable to find case.'**
  String get unableToFindCase;

  /// No description provided for @somethingWentWrongTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrongTryAgain;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
