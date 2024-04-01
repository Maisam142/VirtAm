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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Create your VirtAm id`
  String get createYourVirtAm {
    return Intl.message(
      'Create your VirtAm id',
      name: 'createYourVirtAm',
      desc: '',
      args: [],
    );
  }

  /// `You will get 90 days free trial on creating new account.\n Make sure you use correct information`
  String get createYourVirtAmSmallText {
    return Intl.message(
      'You will get 90 days free trial on creating new account.\n Make sure you use correct information',
      name: 'createYourVirtAmSmallText',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email Already Exists`
  String get existEmail {
    return Intl.message(
      'Email Already Exists',
      name: 'existEmail',
      desc: '',
      args: [],
    );
  }

  /// `The email address you provided is already registered. Please use a different email address.`
  String get errorExistEmail {
    return Intl.message(
      'The email address you provided is already registered. Please use a different email address.',
      name: 'errorExistEmail',
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

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Re-write Password`
  String get rePassword {
    return Intl.message(
      'Re-write Password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `password should contain :`
  String get shouldContain {
    return Intl.message(
      'password should contain :',
      name: 'shouldContain',
      desc: '',
      args: [],
    );
  }

  /// `one letter at least`
  String get condition1 {
    return Intl.message(
      'one letter at least',
      name: 'condition1',
      desc: '',
      args: [],
    );
  }

  /// `one letter at least`
  String get condition2 {
    return Intl.message(
      'one letter at least',
      name: 'condition2',
      desc: '',
      args: [],
    );
  }

  /// `one letter at least`
  String get condition3 {
    return Intl.message(
      'one letter at least',
      name: 'condition3',
      desc: '',
      args: [],
    );
  }

  /// `one letter at least`
  String get condition4 {
    return Intl.message(
      'one letter at least',
      name: 'condition4',
      desc: '',
      args: [],
    );
  }

  /// `one letter at least`
  String get condition5 {
    return Intl.message(
      'one letter at least',
      name: 'condition5',
      desc: '',
      args: [],
    );
  }

  /// `The purpose of creating the account?`
  String get purpose {
    return Intl.message(
      'The purpose of creating the account?',
      name: 'purpose',
      desc: '',
      args: [],
    );
  }

  /// `Follow my personal data`
  String get purpose1 {
    return Intl.message(
      'Follow my personal data',
      name: 'purpose1',
      desc: '',
      args: [],
    );
  }

  /// `Follow up with my nutrition counselor`
  String get purpose2 {
    return Intl.message(
      'Follow up with my nutrition counselor',
      name: 'purpose2',
      desc: '',
      args: [],
    );
  }

  /// `Find a nutrition counselor in my area`
  String get purpose3 {
    return Intl.message(
      'Find a nutrition counselor in my area',
      name: 'purpose3',
      desc: '',
      args: [],
    );
  }

  /// `I agree to  the Terms and Privacy Policy`
  String get agree {
    return Intl.message(
      'I agree to  the Terms and Privacy Policy',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `By agreeing to the above terms, you are consenting that your personal information will be collected, stored, and processed `
  String get noteReg {
    return Intl.message(
      'By agreeing to the above terms, you are consenting that your personal information will be collected, stored, and processed ',
      name: 'noteReg',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your VirtAm ID`
  String get signWith {
    return Intl.message(
      'Sign in with your VirtAm ID',
      name: 'signWith',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email `
  String get enterValidEmail {
    return Intl.message(
      'Please enter a valid email ',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password `
  String get enterValidPass {
    return Intl.message(
      'Wrong Password ',
      name: 'enterValidPass',
      desc: '',
      args: [],
    );
  }

  /// `Forgot the password? `
  String get forgetPass {
    return Intl.message(
      'Forgot the password? ',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Email Or Password`
  String get wrongEmailPass {
    return Intl.message(
      'Wrong Email Or Password',
      name: 'wrongEmailPass',
      desc: '',
      args: [],
    );
  }

  /// `Please rewrite it to login Successfully `
  String get rewriteCorrect {
    return Intl.message(
      'Please rewrite it to login Successfully ',
      name: 'rewriteCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Your VirtAm account is now VirtAm ID. If you’ve signed\n into the app before, use the same credentials here.\n otherwise`
  String get signedAlready {
    return Intl.message(
      'Your VirtAm account is now VirtAm ID. If you’ve signed\n into the app before, use the same credentials here.\n otherwise',
      name: 'signedAlready',
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

  /// `Step 1/10`
  String get step1 {
    return Intl.message(
      'Step 1/10',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `What is your`
  String get whatIsYour {
    return Intl.message(
      'What is your',
      name: 'whatIsYour',
      desc: '',
      args: [],
    );
  }

  /// `age ?`
  String get age {
    return Intl.message(
      'age ?',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Weight ?`
  String get weight {
    return Intl.message(
      'Weight ?',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get kg {
    return Intl.message(
      'Kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Height ?`
  String get height {
    return Intl.message(
      'Height ?',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Cm`
  String get cm {
    return Intl.message(
      'Cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Step 2/10`
  String get step2 {
    return Intl.message(
      'Step 2/10',
      name: 'step2',
      desc: '',
      args: [],
    );
  }

  /// `Is he allergic to : `
  String get hasAllergic {
    return Intl.message(
      'Is he allergic to : ',
      name: 'hasAllergic',
      desc: '',
      args: [],
    );
  }

  /// `Eggs`
  String get eggs {
    return Intl.message(
      'Eggs',
      name: 'eggs',
      desc: '',
      args: [],
    );
  }

  /// `Milk`
  String get milk {
    return Intl.message(
      'Milk',
      name: 'milk',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get fish {
    return Intl.message(
      'Fish',
      name: 'fish',
      desc: '',
      args: [],
    );
  }

  /// `Step 3/10`
  String get step3 {
    return Intl.message(
      'Step 3/10',
      name: 'step3',
      desc: '',
      args: [],
    );
  }

  /// `When was the last time you had\n your thyroid checked?`
  String get thyroidCheckedTime {
    return Intl.message(
      'When was the last time you had\n your thyroid checked?',
      name: 'thyroidCheckedTime',
      desc: '',
      args: [],
    );
  }

  /// `Less than 90 days`
  String get lessThan90Days {
    return Intl.message(
      'Less than 90 days',
      name: 'lessThan90Days',
      desc: '',
      args: [],
    );
  }

  /// `last 3 months`
  String get last3Months {
    return Intl.message(
      'last 3 months',
      name: 'last3Months',
      desc: '',
      args: [],
    );
  }

  /// `last 6 months`
  String get last6Months {
    return Intl.message(
      'last 6 months',
      name: 'last6Months',
      desc: '',
      args: [],
    );
  }

  /// `more than 6 months`
  String get more6Months {
    return Intl.message(
      'more than 6 months',
      name: 'more6Months',
      desc: '',
      args: [],
    );
  }

  /// `Does he have thyroid problems?`
  String get thyroidProblems {
    return Intl.message(
      'Does he have thyroid problems?',
      name: 'thyroidProblems',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `I Don't Know`
  String get dontKnow {
    return Intl.message(
      'I Don\'t Know',
      name: 'dontKnow',
      desc: '',
      args: [],
    );
  }

  /// `Step 4/10`
  String get step4 {
    return Intl.message(
      'Step 4/10',
      name: 'step4',
      desc: '',
      args: [],
    );
  }

  /// `When did you last check the iron?`
  String get ironCheck {
    return Intl.message(
      'When did you last check the iron?',
      name: 'ironCheck',
      desc: '',
      args: [],
    );
  }

  /// `Does he/she have an iron deficiency?`
  String get ironDeficiency {
    return Intl.message(
      'Does he/she have an iron deficiency?',
      name: 'ironDeficiency',
      desc: '',
      args: [],
    );
  }

  /// `Step 5/10`
  String get step5 {
    return Intl.message(
      'Step 5/10',
      name: 'step5',
      desc: '',
      args: [],
    );
  }

  /// `When was the last time you checked \n your vitamin D?`
  String get vitaminDChecked {
    return Intl.message(
      'When was the last time you checked \n your vitamin D?',
      name: 'vitaminDChecked',
      desc: '',
      args: [],
    );
  }

  /// `Does he/she have a vitamin D deficiency?`
  String get vitaminDDeficiency {
    return Intl.message(
      'Does he/she have a vitamin D deficiency?',
      name: 'vitaminDDeficiency',
      desc: '',
      args: [],
    );
  }

  /// `Step 6/10`
  String get step6 {
    return Intl.message(
      'Step 6/10',
      name: 'step6',
      desc: '',
      args: [],
    );
  }

  /// `When was the last time you \n checked your vitamin B12?`
  String get vitaminB12Checked {
    return Intl.message(
      'When was the last time you \n checked your vitamin B12?',
      name: 'vitaminB12Checked',
      desc: '',
      args: [],
    );
  }

  /// `Does he have a vitamin B12 deficiency?`
  String get vitaminB12Deficiency {
    return Intl.message(
      'Does he have a vitamin B12 deficiency?',
      name: 'vitaminB12Deficiency',
      desc: '',
      args: [],
    );
  }

  /// `Step 7/10`
  String get step7 {
    return Intl.message(
      'Step 7/10',
      name: 'step7',
      desc: '',
      args: [],
    );
  }

  /// `Are you an employee/worker?`
  String get employeeWorker {
    return Intl.message(
      'Are you an employee/worker?',
      name: 'employeeWorker',
      desc: '',
      args: [],
    );
  }

  /// `Step 8/10`
  String get step8 {
    return Intl.message(
      'Step 8/10',
      name: 'step8',
      desc: '',
      args: [],
    );
  }

  /// `Nature of work?`
  String get work {
    return Intl.message(
      'Nature of work?',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Field`
  String get field {
    return Intl.message(
      'Field',
      name: 'field',
      desc: '',
      args: [],
    );
  }

  /// `Step 9/10`
  String get step9 {
    return Intl.message(
      'Step 9/10',
      name: 'step9',
      desc: '',
      args: [],
    );
  }

  /// `When do you wake up every day?`
  String get wakeUp {
    return Intl.message(
      'When do you wake up every day?',
      name: 'wakeUp',
      desc: '',
      args: [],
    );
  }

  /// `Step 10/10`
  String get step10 {
    return Intl.message(
      'Step 10/10',
      name: 'step10',
      desc: '',
      args: [],
    );
  }

  /// `When is your daily bedtime?`
  String get bedtime {
    return Intl.message(
      'When is your daily bedtime?',
      name: 'bedtime',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Complete Login`
  String get completeLogin {
    return Intl.message(
      'Complete Login',
      name: 'completeLogin',
      desc: '',
      args: [],
    );
  }

  /// `Name of the nutrition consultant \n you follow up with?`
  String get nutritionName {
    return Intl.message(
      'Name of the nutrition consultant \n you follow up with?',
      name: 'nutritionName',
      desc: '',
      args: [],
    );
  }

  /// `nutrition consultant name`
  String get consultantName {
    return Intl.message(
      'nutrition consultant name',
      name: 'consultantName',
      desc: '',
      args: [],
    );
  }

  /// `  Location Name  `
  String get locationName {
    return Intl.message(
      '  Location Name  ',
      name: 'locationName',
      desc: '',
      args: [],
    );
  }

  /// `Steps Goal: 10000`
  String get stepGoal {
    return Intl.message(
      'Steps Goal: 10000',
      name: 'stepGoal',
      desc: '',
      args: [],
    );
  }

  /// ` Calories`
  String get calories {
    return Intl.message(
      ' Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// ` date`
  String get date {
    return Intl.message(
      ' date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `  Time`
  String get time {
    return Intl.message(
      '  Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `  Distance`
  String get distance {
    return Intl.message(
      '  Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `During a fast, water is the only\n drink allowed.`
  String get duringFast {
    return Intl.message(
      'During a fast, water is the only\n drink allowed.',
      name: 'duringFast',
      desc: '',
      args: [],
    );
  }

  /// `Weight History`
  String get weightHistory {
    return Intl.message(
      'Weight History',
      name: 'weightHistory',
      desc: '',
      args: [],
    );
  }

  /// `remaining 603 ml`
  String get remainingMl {
    return Intl.message(
      'remaining 603 ml',
      name: 'remainingMl',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `  Exercise`
  String get exercise {
    return Intl.message(
      '  Exercise',
      name: 'exercise',
      desc: '',
      args: [],
    );
  }

  /// `Play Now`
  String get play {
    return Intl.message(
      'Play Now',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Calorie calculator`
  String get CalorieCalc {
    return Intl.message(
      'Calorie calculator',
      name: 'CalorieCalc',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message(
      'Remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Remaining: 2000`
  String get remaining200 {
    return Intl.message(
      'Remaining: 2000',
      name: 'remaining200',
      desc: '',
      args: [],
    );
  }

  /// `Proteina`
  String get proteina {
    return Intl.message(
      'Proteina',
      name: 'proteina',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrates`
  String get carbohydrates {
    return Intl.message(
      'Carbohydrates',
      name: 'carbohydrates',
      desc: '',
      args: [],
    );
  }

  /// `Fats`
  String get fast {
    return Intl.message(
      'Fats',
      name: 'fast',
      desc: '',
      args: [],
    );
  }

  /// ` Add Breakfast`
  String get addBreakFast {
    return Intl.message(
      ' Add Breakfast',
      name: 'addBreakFast',
      desc: '',
      args: [],
    );
  }

  /// ` recommended .767-1024`
  String get recommended {
    return Intl.message(
      ' recommended .767-1024',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// ` Add Lunch`
  String get addLunch {
    return Intl.message(
      ' Add Lunch',
      name: 'addLunch',
      desc: '',
      args: [],
    );
  }

  /// ` Add Dinner`
  String get addDinner {
    return Intl.message(
      ' Add Dinner',
      name: 'addDinner',
      desc: '',
      args: [],
    );
  }

  /// ` Add Snack`
  String get addSnack {
    return Intl.message(
      ' Add Snack',
      name: 'addSnack',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition and slimming centers`
  String get nutritionCenters {
    return Intl.message(
      'Nutrition and slimming centers',
      name: 'nutritionCenters',
      desc: '',
      args: [],
    );
  }

  /// ` Search`
  String get search {
    return Intl.message(
      ' Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// ` Popular Center`
  String get popularCenter {
    return Intl.message(
      ' Popular Center',
      name: 'popularCenter',
      desc: '',
      args: [],
    );
  }

  /// ` All Center`
  String get allCenter {
    return Intl.message(
      ' All Center',
      name: 'allCenter',
      desc: '',
      args: [],
    );
  }

  /// `Change Picture`
  String get changePic {
    return Intl.message(
      'Change Picture',
      name: 'changePic',
      desc: '',
      args: [],
    );
  }

  /// ` Update`
  String get update {
    return Intl.message(
      ' Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get updated {
    return Intl.message(
      'Profile updated successfully',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `Drink Water`
  String get drinkWater {
    return Intl.message(
      'Drink Water',
      name: 'drinkWater',
      desc: '',
      args: [],
    );
  }

  /// `custom water goal`
  String get customGoal {
    return Intl.message(
      'custom water goal',
      name: 'customGoal',
      desc: '',
      args: [],
    );
  }

  /// `The Target `
  String get target {
    return Intl.message(
      'The Target ',
      name: 'target',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `  Water Drinking Goal`
  String get waterGoal {
    return Intl.message(
      '  Water Drinking Goal',
      name: 'waterGoal',
      desc: '',
      args: [],
    );
  }

  /// `   Habit Settings`
  String get habitSetting {
    return Intl.message(
      '   Habit Settings',
      name: 'habitSetting',
      desc: '',
      args: [],
    );
  }

  /// `10 Hours`
  String get hours {
    return Intl.message(
      '10 Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `remaining: 13:00 h`
  String get remainingTime {
    return Intl.message(
      'remaining: 13:00 h',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get start {
    return Intl.message(
      'Start Time',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get end {
    return Intl.message(
      'End Time',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Instructions for when to fast`
  String get instructions {
    return Intl.message(
      'Instructions for when to fast',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Break Fast`
  String get breakFast {
    return Intl.message(
      'Break Fast',
      name: 'breakFast',
      desc: '',
      args: [],
    );
  }

  /// `Name - wight history`
  String get wightHistory {
    return Intl.message(
      'Name - wight history',
      name: 'wightHistory',
      desc: '',
      args: [],
    );
  }

  /// `Weight(kg)`
  String get wightKg {
    return Intl.message(
      'Weight(kg)',
      name: 'wightKg',
      desc: '',
      args: [],
    );
  }

  /// `Fat`
  String get fat {
    return Intl.message(
      'Fat',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Lorem`
  String get lorem {
    return Intl.message(
      'Lorem',
      name: 'lorem',
      desc: '',
      args: [],
    );
  }

  /// `Fitness`
  String get fitness {
    return Intl.message(
      'Fitness',
      name: 'fitness',
      desc: '',
      args: [],
    );
  }

  /// `  Calories Goal`
  String get caloriesGoal {
    return Intl.message(
      '  Calories Goal',
      name: 'caloriesGoal',
      desc: '',
      args: [],
    );
  }

  /// `  Meal Numbers`
  String get mealNum {
    return Intl.message(
      '  Meal Numbers',
      name: 'mealNum',
      desc: '',
      args: [],
    );
  }

  /// `  About VirAm`
  String get aboutVirAm {
    return Intl.message(
      '  About VirAm',
      name: 'aboutVirAm',
      desc: '',
      args: [],
    );
  }

  /// `  Terms and Conditions`
  String get termsCondition {
    return Intl.message(
      '  Terms and Conditions',
      name: 'termsCondition',
      desc: '',
      args: [],
    );
  }

  /// `   Subscription`
  String get subscription {
    return Intl.message(
      '   Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `5 JOD / Month `
  String get month5 {
    return Intl.message(
      '5 JOD / Month ',
      name: 'month5',
      desc: '',
      args: [],
    );
  }

  /// `5 JOD / Year `
  String get year5 {
    return Intl.message(
      '5 JOD / Year ',
      name: 'year5',
      desc: '',
      args: [],
    );
  }

  /// `virtAm is free for the first 90 days for every person`
  String get free {
    return Intl.message(
      'virtAm is free for the first 90 days for every person',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Reminder to drink water`
  String get reminderToDrink {
    return Intl.message(
      'Reminder to drink water',
      name: 'reminderToDrink',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Create New One!`
  String get createNewOne {
    return Intl.message(
      'Create New One!',
      name: 'createNewOne',
      desc: '',
      args: [],
    );
  }

  /// `GO`
  String get go {
    return Intl.message(
      'GO',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `AWAY`
  String get away {
    return Intl.message(
      'AWAY',
      name: 'away',
      desc: '',
      args: [],
    );
  }

  /// `Organization ID`
  String get organizationId {
    return Intl.message(
      'Organization ID',
      name: 'organizationId',
      desc: '',
      args: [],
    );
  }

  /// `Choose your status, please`
  String get chooseYourStatus {
    return Intl.message(
      'Choose your status, please',
      name: 'chooseYourStatus',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the trip ?`
  String get warningMsg {
    return Intl.message(
      'Are you sure you want to cancel the trip ?',
      name: 'warningMsg',
      desc: '',
      args: [],
    );
  }

  /// `Trip`
  String get trip {
    return Intl.message(
      'Trip',
      name: 'trip',
      desc: '',
      args: [],
    );
  }

  /// `Warning !`
  String get warning {
    return Intl.message(
      'Warning !',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Arrived`
  String get arrived {
    return Intl.message(
      'Arrived',
      name: 'arrived',
      desc: '',
      args: [],
    );
  }

  /// `Didn't come`
  String get didNotCome {
    return Intl.message(
      'Didn\'t come',
      name: 'didNotCome',
      desc: '',
      args: [],
    );
  }

  /// `Pick up the students`
  String get pickup {
    return Intl.message(
      'Pick up the students',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Please wait for 5 minutes...`
  String get wait {
    return Intl.message(
      'Please wait for 5 minutes...',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Keep Your Face On Left`
  String get keepYourFaceOnLeft {
    return Intl.message(
      'Keep Your Face On Left',
      name: 'keepYourFaceOnLeft',
      desc: '',
      args: [],
    );
  }

  /// `Try Login With Email`
  String get tryLoginWithEmail {
    return Intl.message(
      'Try Login With Email',
      name: 'tryLoginWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Organization ID or Email`
  String get organizationIdOrEmail {
    return Intl.message(
      'Organization ID or Email',
      name: 'organizationIdOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Keep me logged in`
  String get keepMeLoggedIn {
    return Intl.message(
      'Keep me logged in',
      name: 'keepMeLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password? `
  String get forgotPassword {
    return Intl.message(
      'Forgot Password? ',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Click Here`
  String get clickHere {
    return Intl.message(
      'Click Here',
      name: 'clickHere',
      desc: '',
      args: [],
    );
  }

  /// `already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Retype your email`
  String get retypeYourEmail {
    return Intl.message(
      'Retype your email',
      name: 'retypeYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Retype your password`
  String get retypeYourPassword {
    return Intl.message(
      'Retype your password',
      name: 'retypeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to accept our Privacy Policy and Terms of Service.`
  String get privacyPolicyAndTerms {
    return Intl.message(
      'By continuing, you agree to accept our Privacy Policy and Terms of Service.',
      name: 'privacyPolicyAndTerms',
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