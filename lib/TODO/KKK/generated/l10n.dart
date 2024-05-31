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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello_text {
    return Intl.message(
      'Hello',
      name: 'hello_text',
      desc: '',
      args: [],
    );
  }

  /// `Browse`
  String get tab_bar_menu {
    return Intl.message(
      'Browse',
      name: 'tab_bar_menu',
      desc: '',
      args: [],
    );
  }

  /// `Casino`
  String get tab_bar_ent {
    return Intl.message(
      'Casino',
      name: 'tab_bar_ent',
      desc: '',
      args: [],
    );
  }

  /// `Casino`
  String get tab_bar_ent_copy {
    return Intl.message(
      'Casino',
      name: 'tab_bar_ent_copy',
      desc: '',
      args: [],
    );
  }

  /// `Bets`
  String get tab_bar_order {
    return Intl.message(
      'Bets',
      name: 'tab_bar_order',
      desc: '',
      args: [],
    );
  }

  /// `Bet Slip`
  String get tab_bar_orders {
    return Intl.message(
      'Bet Slip',
      name: 'tab_bar_orders',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get tab_bar_sports {
    return Intl.message(
      'Sports',
      name: 'tab_bar_sports',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get tab_bar_chat_room {
    return Intl.message(
      'Chat',
      name: 'tab_bar_chat_room',
      desc: '',
      args: [],
    );
  }

  /// `Lobby`
  String get sport_tabbar_hall {
    return Intl.message(
      'Lobby',
      name: 'sport_tabbar_hall',
      desc: '',
      args: [],
    );
  }

  /// `My Bets`
  String get sport_tabbar_mybet {
    return Intl.message(
      'My Bets',
      name: 'sport_tabbar_mybet',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get sport_tabbar_favorites {
    return Intl.message(
      'Favourites',
      name: 'sport_tabbar_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Competition Ranking`
  String get sport_tabbar_rank {
    return Intl.message(
      'Competition Ranking',
      name: 'sport_tabbar_rank',
      desc: '',
      args: [],
    );
  }

  /// `Live Events`
  String get sport_tabbar_rolling {
    return Intl.message(
      'Live Events',
      name: 'sport_tabbar_rolling',
      desc: '',
      args: [],
    );
  }

  /// `Starting Soon`
  String get sport_tabbar_coming {
    return Intl.message(
      'Starting Soon',
      name: 'sport_tabbar_coming',
      desc: '',
      args: [],
    );
  }

  /// `Collect`
  String get sport_fav_hot_rolling {
    return Intl.message(
      'Collect',
      name: 'sport_fav_hot_rolling',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming hot event`
  String get sport_fav_comming_rolling {
    return Intl.message(
      'Upcoming hot event',
      name: 'sport_fav_comming_rolling',
      desc: '',
      args: [],
    );
  }

  /// `Popular Events`
  String get sport_bet_hot {
    return Intl.message(
      'Popular Events',
      name: 'sport_bet_hot',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get sport_bet_page {
    return Intl.message(
      'Home',
      name: 'sport_bet_page',
      desc: '',
      args: [],
    );
  }

  /// `Soccer`
  String get sport_bet_football {
    return Intl.message(
      'Soccer',
      name: 'sport_bet_football',
      desc: '',
      args: [],
    );
  }

  /// `Tennis`
  String get sport_bet_tennis {
    return Intl.message(
      'Tennis',
      name: 'sport_bet_tennis',
      desc: '',
      args: [],
    );
  }

  /// `Dota 2`
  String get sport_bet_dota2 {
    return Intl.message(
      'Dota 2',
      name: 'sport_bet_dota2',
      desc: '',
      args: [],
    );
  }

  /// `Volleyball`
  String get sport_bet_volleyball {
    return Intl.message(
      'Volleyball',
      name: 'sport_bet_volleyball',
      desc: '',
      args: [],
    );
  }

  /// `League of Legends`
  String get sport_bet_lol {
    return Intl.message(
      'League of Legends',
      name: 'sport_bet_lol',
      desc: '',
      args: [],
    );
  }

  /// `Ping pong`
  String get sport_bet_pingpong {
    return Intl.message(
      'Ping pong',
      name: 'sport_bet_pingpong',
      desc: '',
      args: [],
    );
  }

  /// `Ice hockey`
  String get sport_bet_puck {
    return Intl.message(
      'Ice hockey',
      name: 'sport_bet_puck',
      desc: '',
      args: [],
    );
  }

  /// `Load More`
  String get sport_add_more {
    return Intl.message(
      'Load More',
      name: 'sport_add_more',
      desc: '',
      args: [],
    );
  }

  /// `Winning Line`
  String get sport_bet_winning {
    return Intl.message(
      'Winning Line',
      name: 'sport_bet_winning',
      desc: '',
      args: [],
    );
  }

  /// `Handicap`
  String get sport_bet_handicap {
    return Intl.message(
      'Handicap',
      name: 'sport_bet_handicap',
      desc: '',
      args: [],
    );
  }

  /// `Total handicap`
  String get sport_bet_score {
    return Intl.message(
      'Total handicap',
      name: 'sport_bet_score',
      desc: '',
      args: [],
    );
  }

  /// `Rolling and upcoming match odds`
  String get sport_rolling_coming {
    return Intl.message(
      'Rolling and upcoming match odds',
      name: 'sport_rolling_coming',
      desc: '',
      args: [],
    );
  }

  /// `Outrights`
  String get sport_champion {
    return Intl.message(
      'Outrights',
      name: 'sport_champion',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get sport_all {
    return Intl.message(
      'All',
      name: 'sport_all',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get sport_nodata {
    return Intl.message(
      'No data',
      name: 'sport_nodata',
      desc: '',
      args: [],
    );
  }

  /// `Affiliate`
  String get alliance_program {
    return Intl.message(
      'Affiliate',
      name: 'alliance_program',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get alliance_summary {
    return Intl.message(
      'Overview',
      name: 'alliance_summary',
      desc: '',
      args: [],
    );
  }

  /// `Retention Plan`
  String get alliance_plan {
    return Intl.message(
      'Retention Plan',
      name: 'alliance_plan',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get alliance_commission {
    return Intl.message(
      'Commission',
      name: 'alliance_commission',
      desc: '',
      args: [],
    );
  }

  /// `Capital`
  String get alliance_capital {
    return Intl.message(
      'Capital',
      name: 'alliance_capital',
      desc: '',
      args: [],
    );
  }

  /// `Recommend users`
  String get alliance_recommendation {
    return Intl.message(
      'Recommend users',
      name: 'alliance_recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get alliance_activity {
    return Intl.message(
      'Activity',
      name: 'alliance_activity',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get alliance_game {
    return Intl.message(
      'Entertainment',
      name: 'alliance_game',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get alliance_sort {
    return Intl.message(
      'Sort by',
      name: 'alliance_sort',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw available commission`
  String get alliance_monery_takeout {
    return Intl.message(
      'Withdraw available commission',
      name: 'alliance_monery_takeout',
      desc: '',
      args: [],
    );
  }

  /// `Activity name`
  String get alliance_activity_name {
    return Intl.message(
      'Activity name',
      name: 'alliance_activity_name',
      desc: '',
      args: [],
    );
  }

  /// `Create activity`
  String get alliance_create_activity {
    return Intl.message(
      'Create activity',
      name: 'alliance_create_activity',
      desc: '',
      args: [],
    );
  }

  /// `Type your message`
  String get please_input_message {
    return Intl.message(
      'Type your message',
      name: 'please_input_message',
      desc: '',
      args: [],
    );
  }

  /// `Online: {number}`
  String chat_room_online_text(Object number) {
    return Intl.message(
      'Online: $number',
      name: 'chat_room_online_text',
      desc: '',
      args: [number],
    );
  }

  /// `Send`
  String get message_send_button_text {
    return Intl.message(
      'Send',
      name: 'message_send_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get tab_bar_title_data_statistics_text {
    return Intl.message(
      'Statistics',
      name: 'tab_bar_title_data_statistics_text',
      desc: '',
      args: [],
    );
  }

  /// `Trophy`
  String get tab_bar_title_trophy_text {
    return Intl.message(
      'Trophy',
      name: 'tab_bar_title_trophy_text',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get tab_bar_title_2fa_text {
    return Intl.message(
      'Security',
      name: 'tab_bar_title_2fa_text',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get tab_bar_title_2fa_textcopy2 {
    return Intl.message(
      'Security',
      name: 'tab_bar_title_2fa_textcopy2',
      desc: '',
      args: [],
    );
  }

  /// `Win`
  String get statistics_title_win_text {
    return Intl.message(
      'Win',
      name: 'statistics_title_win_text',
      desc: '',
      args: [],
    );
  }

  /// `Lose`
  String get statistics_title_lose_text {
    return Intl.message(
      'Lose',
      name: 'statistics_title_lose_text',
      desc: '',
      args: [],
    );
  }

  /// `Wagered`
  String get statistics_title_total_text {
    return Intl.message(
      'Wagered',
      name: 'statistics_title_total_text',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get button_save_text {
    return Intl.message(
      'Save',
      name: 'button_save_text',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number_text {
    return Intl.message(
      'Phone Number',
      name: 'phone_number_text',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get change_area_code_title_text {
    return Intl.message(
      'Country Code',
      name: 'change_area_code_title_text',
      desc: '',
      args: [],
    );
  }

  /// `We only service areas that are listed in the available country code list.`
  String get change_area_code_tips_text {
    return Intl.message(
      'We only service areas that are listed in the available country code list.',
      name: 'change_area_code_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get top_register {
    return Intl.message(
      'Register',
      name: 'top_register',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get top_login {
    return Intl.message(
      'Log in',
      name: 'top_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get top_login_copy {
    return Intl.message(
      'Sign In',
      name: 'top_login_copy',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Settings`
  String get top_wallet_setting {
    return Intl.message(
      'Wallet Settings',
      name: 'top_wallet_setting',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get login_text_field_account_tips {
    return Intl.message(
      'Email or Username',
      name: 'login_text_field_account_tips',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_text_field_password_tips {
    return Intl.message(
      'Password',
      name: 'login_text_field_password_tips',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get login_text_other_use {
    return Intl.message(
      'OR',
      name: 'login_text_other_use',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forget_password_text {
    return Intl.message(
      'Forgot Password',
      name: 'forget_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get no_account_tips_text {
    return Intl.message(
      'Don’t have an account? ',
      name: 'no_account_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Register an Account`
  String get register_an_account {
    return Intl.message(
      'Register an Account',
      name: 'register_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Stake`
  String get app_name_text {
    return Intl.message(
      'Stake',
      name: 'app_name_text',
      desc: '',
      args: [],
    );
  }

  /// `hCaptcha`
  String get hCaptcha_text {
    return Intl.message(
      'hCaptcha',
      name: 'hCaptcha_text',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy_text {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy_text',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service_text {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service_text',
      desc: '',
      args: [],
    );
  }

  /// `{app_name_text} is protected by {hCaptcha_text}, {hCaptcha_text}{privacy_policy_text} and {terms_of_service_text} apply`
  String login_bottom_protocol_text(Object app_name_text, Object hCaptcha_text,
      Object privacy_policy_text, Object terms_of_service_text) {
    return Intl.message(
      '$app_name_text is protected by $hCaptcha_text, $hCaptcha_text$privacy_policy_text and $terms_of_service_text apply',
      name: 'login_bottom_protocol_text',
      desc: '',
      args: [
        app_name_text,
        hCaptcha_text,
        privacy_policy_text,
        terms_of_service_text
      ],
    );
  }

  /// `Recover Password`
  String get recover_password_text {
    return Intl.message(
      'Recover Password',
      name: 'recover_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address_text {
    return Intl.message(
      'Email Address',
      name: 'email_address_text',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get recover_password_title_text {
    return Intl.message(
      'Reset password',
      name: 'recover_password_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resend_email_text {
    return Intl.message(
      'Resend Email',
      name: 'resend_email_text',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout_text {
    return Intl.message(
      'Logout',
      name: 'logout_text',
      desc: '',
      args: [],
    );
  }

  /// `Your token has expired`
  String get token_invalid_text {
    return Intl.message(
      'Your token has expired',
      name: 'token_invalid_text',
      desc: '',
      args: [],
    );
  }

  /// `Fill out your details`
  String get create_account_title {
    return Intl.message(
      'Fill out your details',
      name: 'create_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get text_field_user_name_tips {
    return Intl.message(
      'Username',
      name: 'text_field_user_name_tips',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get text_field_birthday_tips {
    return Intl.message(
      'Date of Birth',
      name: 'text_field_birthday_tips',
      desc: '',
      args: [],
    );
  }

  /// `Code (Optional)`
  String get check_box_input_code_tips {
    return Intl.message(
      'Code (Optional)',
      name: 'check_box_input_code_tips',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get create_account_title_text {
    return Intl.message(
      'Create an Account',
      name: 'create_account_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_an_account_text {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_an_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get register_protocol_title {
    return Intl.message(
      'Terms and conditions',
      name: 'register_protocol_title',
      desc: '',
      args: [],
    );
  }

  /// `Minimum {text_length} characters`
  String minimum_character_limit_text(Object text_length) {
    return Intl.message(
      'Minimum $text_length characters',
      name: 'minimum_character_limit_text',
      desc: '',
      args: [text_length],
    );
  }

  /// `Maximum {text_length} characters`
  String max_character_limit_text(Object text_length) {
    return Intl.message(
      'Maximum $text_length characters',
      name: 'max_character_limit_text',
      desc: '',
      args: [text_length],
    );
  }

  /// `The passwords entered twice are inconsistent`
  String get twice_password_error_text {
    return Intl.message(
      'The passwords entered twice are inconsistent',
      name: 'twice_password_error_text',
      desc: '',
      args: [],
    );
  }

  /// `The username contains invalid characters`
  String get user_name_error_tips {
    return Intl.message(
      'The username contains invalid characters',
      name: 'user_name_error_tips',
      desc: '',
      args: [],
    );
  }

  /// `The username cannot contain uppercase characters`
  String get user_name_uppercase_error_tips {
    return Intl.message(
      'The username cannot contain uppercase characters',
      name: 'user_name_uppercase_error_tips',
      desc: '',
      args: [],
    );
  }

  /// `This contains invalid email characters`
  String get email_error_tips {
    return Intl.message(
      'This contains invalid email characters',
      name: 'email_error_tips',
      desc: '',
      args: [],
    );
  }

  /// `Please add the ”@“ symbol to your email address`
  String get please_join_at_tips {
    return Intl.message(
      'Please add the ”@“ symbol to your email address',
      name: 'please_join_at_tips',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain at least 1 uppercase letter and 1 lowercase letter`
  String get password_contains_uppercase_and_lowercase_tips {
    return Intl.message(
      'The password must contain at least 1 uppercase letter and 1 lowercase letter',
      name: 'password_contains_uppercase_and_lowercase_tips',
      desc: '',
      args: [],
    );
  }

  /// `Your password must be at least {password_characters_length} characters long`
  String password_required_characters(Object password_characters_length) {
    return Intl.message(
      'Your password must be at least $password_characters_length characters long',
      name: 'password_required_characters',
      desc: '',
      args: [password_characters_length],
    );
  }

  /// `Must contain uppercase and lowercase letter`
  String get contains_alphabet_text {
    return Intl.message(
      'Must contain uppercase and lowercase letter',
      name: 'contains_alphabet_text',
      desc: '',
      args: [],
    );
  }

  /// `Contain at least 1 number`
  String get contains_one_more_number_text {
    return Intl.message(
      'Contain at least 1 number',
      name: 'contains_one_more_number_text',
      desc: '',
      args: [],
    );
  }

  /// `At least {character_number} characters`
  String least_character_text(Object character_number) {
    return Intl.message(
      'At least $character_number characters',
      name: 'least_character_text',
      desc: '',
      args: [character_number],
    );
  }

  /// `Month`
  String get monthly_text {
    return Intl.message(
      'Month',
      name: 'monthly_text',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the terms and conditions`
  String get agree_terms_text {
    return Intl.message(
      'I have read and agree to the terms and conditions',
      name: 'agree_terms_text',
      desc: '',
      args: [],
    );
  }

  /// `Please read the terms and conditions completely and scroll to the end to accept them`
  String get agree_terms_tips {
    return Intl.message(
      'Please read the terms and conditions completely and scroll to the end to accept them',
      name: 'agree_terms_tips',
      desc: '',
      args: [],
    );
  }

  /// `Play Now`
  String get start_game_text {
    return Intl.message(
      'Play Now',
      name: 'start_game_text',
      desc: '',
      args: [],
    );
  }

  /// `Friendly Reminder`
  String get snack_bar_normal_tips {
    return Intl.message(
      'Friendly Reminder',
      name: 'snack_bar_normal_tips',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_title_text {
    return Intl.message(
      'Error',
      name: 'error_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome_title_text {
    return Intl.message(
      'Welcome',
      name: 'welcome_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {user_name}`
  String welcome_body_text(Object user_name) {
    return Intl.message(
      'Welcome $user_name',
      name: 'welcome_body_text',
      desc: '',
      args: [user_name],
    );
  }

  /// `Please enter email address`
  String get please_input_email_tips {
    return Intl.message(
      'Please enter email address',
      name: 'please_input_email_tips',
      desc: '',
      args: [],
    );
  }

  /// `Please enter username`
  String get please_input_user_name_tips {
    return Intl.message(
      'Please enter username',
      name: 'please_input_user_name_tips',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get please_input_password_tips {
    return Intl.message(
      'Enter your password',
      name: 'please_input_password_tips',
      desc: '',
      args: [],
    );
  }

  /// `Please type your birthday`
  String get please_input_birthday_tips {
    return Intl.message(
      'Please type your birthday',
      name: 'please_input_birthday_tips',
      desc: '',
      args: [],
    );
  }

  /// `Type the account`
  String get please_input_account_tips {
    return Intl.message(
      'Type the account',
      name: 'please_input_account_tips',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get invalid_birthday_text {
    return Intl.message(
      'Invalid date',
      name: 'invalid_birthday_text',
      desc: '',
      args: [],
    );
  }

  /// `You must be over 18 years old`
  String get must_over_18_year_text {
    return Intl.message(
      'You must be over 18 years old',
      name: 'must_over_18_year_text',
      desc: '',
      args: [],
    );
  }

  /// `This username is already taken, please choose another username`
  String get username_already_exists_text {
    return Intl.message(
      'This username is already taken, please choose another username',
      name: 'username_already_exists_text',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use`
  String get email_already_exists_text {
    return Intl.message(
      'This email address is already in use',
      name: 'email_already_exists_text',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done_text {
    return Intl.message(
      'Done',
      name: 'done_text',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get tab_bar_title_contact_text {
    return Intl.message(
      'General',
      name: 'tab_bar_title_contact_text',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw information`
  String get tab_bar_title_withdrawal_info_text {
    return Intl.message(
      'Withdraw information',
      name: 'tab_bar_title_withdrawal_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get tab_bar_title_change_password_text {
    return Intl.message(
      'Change Password',
      name: 'tab_bar_title_change_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Privacy options`
  String get tab_bar_title_privacy_text {
    return Intl.message(
      'Privacy options',
      name: 'tab_bar_title_privacy_text',
      desc: '',
      args: [],
    );
  }

  /// `Login Record`
  String get tab_bar_title_login_log_text {
    return Intl.message(
      'Login Record',
      name: 'tab_bar_title_login_log_text',
      desc: '',
      args: [],
    );
  }

  /// `Blacklist`
  String get tab_bar_title_black_list_text {
    return Intl.message(
      'Blacklist',
      name: 'tab_bar_title_black_list_text',
      desc: '',
      args: [],
    );
  }

  /// `Google Authenticator`
  String get tab_bar_title_google_verification_text {
    return Intl.message(
      'Google Authenticator',
      name: 'tab_bar_title_google_verification_text',
      desc: '',
      args: [],
    );
  }

  /// `KYC Verification`
  String get tab_bar_kyc_text {
    return Intl.message(
      'KYC Verification',
      name: 'tab_bar_kyc_text',
      desc: '',
      args: [],
    );
  }

  /// `Discount exchange`
  String get tab_bar_exchange_text {
    return Intl.message(
      'Discount exchange',
      name: 'tab_bar_exchange_text',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_password_text {
    return Intl.message(
      'Old Password',
      name: 'old_password_text',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password_text {
    return Intl.message(
      'New Password',
      name: 'new_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password_text {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Disable Two Factor`
  String get s_2fa_body_title_text {
    return Intl.message(
      'Disable Two Factor',
      name: 's_2fa_body_title_text',
      desc: '',
      args: [],
    );
  }

  /// `To keep your account extra secure leave a two factor authentication enabled.`
  String get s_2fa_body_tips_text {
    return Intl.message(
      'To keep your account extra secure leave a two factor authentication enabled.',
      name: 's_2fa_body_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Two Factor Code`
  String get s_2fa_body_code_text {
    return Intl.message(
      'Two Factor Code',
      name: 's_2fa_body_code_text',
      desc: '',
      args: [],
    );
  }

  /// `Two Factor Code`
  String get s_2fa_body_code_text1 {
    return Intl.message(
      'Two Factor Code',
      name: 's_2fa_body_code_text1',
      desc: '',
      args: [],
    );
  }

  /// `You need to re-enter the secret key in the Authenticator after disabling it, and the old secret key will become invalid`
  String get s_2fa_body_warning_text {
    return Intl.message(
      'You need to re-enter the secret key in the Authenticator after disabling it, and the old secret key will become invalid',
      name: 's_2fa_body_warning_text',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy_body_title_text {
    return Intl.message(
      'Privacy',
      name: 'privacy_body_title_text',
      desc: '',
      args: [],
    );
  }

  /// `User privacy is one of our core values. These settings will allow you to be completely anonymous in front of other players.`
  String get privacy_body_tips_text {
    return Intl.message(
      'User privacy is one of our core values. These settings will allow you to be completely anonymous in front of other players.',
      name: 'privacy_body_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Enable incognito mode`
  String get privacy_body_stealth_switch_title_text {
    return Intl.message(
      'Enable incognito mode',
      name: 'privacy_body_stealth_switch_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Your bet will not appear in public betting feeds and bet previews`
  String get privacy_body_stealth_switch_tips_text {
    return Intl.message(
      'Your bet will not appear in public betting feeds and bet previews',
      name: 'privacy_body_stealth_switch_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Hide all statistics`
  String get privacy_body_statistics_switch_title_text {
    return Intl.message(
      'Hide all statistics',
      name: 'privacy_body_statistics_switch_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Other users cannot view your win, loss and betting statistics`
  String get privacy_body_statistics_switch_tips_text {
    return Intl.message(
      'Other users cannot view your win, loss and betting statistics',
      name: 'privacy_body_statistics_switch_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Other users will not be able to view your contest history`
  String get privacy_body_race_switch_tips_text {
    return Intl.message(
      'Other users will not be able to view your contest history',
      name: 'privacy_body_race_switch_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Please allow up to 30 seconds for the update to take effect`
  String get privacy_body_take_effect_tips_text {
    return Intl.message(
      'Please allow up to 30 seconds for the update to take effect',
      name: 'privacy_body_take_effect_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get privacy_body_community_title_text {
    return Intl.message(
      'Community',
      name: 'privacy_body_community_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Refuse to receive red envelope rain`
  String get privacy_body_switch_red_rain_title_text {
    return Intl.message(
      'Refuse to receive red envelope rain',
      name: 'privacy_body_switch_red_rain_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Prevent you from receiving red envelopes in chat rooms`
  String get privacy_body_switch_red_rain_tips_text {
    return Intl.message(
      'Prevent you from receiving red envelopes in chat rooms',
      name: 'privacy_body_switch_red_rain_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Receive marketing emails`
  String get privacy_body_switch_sale_title_text {
    return Intl.message(
      'Receive marketing emails',
      name: 'privacy_body_switch_sale_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Opt out of receiving emails or promotions`
  String get privacy_body_switch_sale_tips_text {
    return Intl.message(
      'Opt out of receiving emails or promotions',
      name: 'privacy_body_switch_sale_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Marketing`
  String get privacy_body_sale_title_text {
    return Intl.message(
      'Marketing',
      name: 'privacy_body_sale_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Search your game`
  String get search_game {
    return Intl.message(
      'Search your game',
      name: 'search_game',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get home_recent_games {
    return Intl.message(
      'Recent',
      name: 'home_recent_games',
      desc: '',
      args: [],
    );
  }

  /// `Challenge`
  String get home_challenge {
    return Intl.message(
      'Challenge',
      name: 'home_challenge',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get home_game {
    return Intl.message(
      'Game',
      name: 'home_game',
      desc: '',
      args: [],
    );
  }

  /// `You must verify your email address to make withdrawals`
  String get wallet_email_hint_auth {
    return Intl.message(
      'You must verify your email address to make withdrawals',
      name: 'wallet_email_hint_auth',
      desc: '',
      args: [],
    );
  }

  /// `Open Gmail`
  String get wallet_email_open {
    return Intl.message(
      'Open Gmail',
      name: 'wallet_email_open',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get wallet_deposit {
    return Intl.message(
      'Deposit',
      name: 'wallet_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get wallet_deposit_copy {
    return Intl.message(
      'Deposit',
      name: 'wallet_deposit_copy',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get wallet_withdraw_money {
    return Intl.message(
      'Withdraw',
      name: 'wallet_withdraw_money',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the fund password`
  String get wallet_pleaseEnterFundPassword {
    return Intl.message(
      'Please enter the fund password',
      name: 'wallet_pleaseEnterFundPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide Zero Balances`
  String get wallet_hideChangeBalance {
    return Intl.message(
      'Hide Zero Balances',
      name: 'wallet_hideChangeBalance',
      desc: '',
      args: [],
    );
  }

  /// `Your zero balances won't appear in your wallet`
  String get wallet_yourZeroBalanceWillNotBeDisplayedInWallet {
    return Intl.message(
      'Your zero balances won\'t appear in your wallet',
      name: 'wallet_yourZeroBalanceWillNotBeDisplayedInWallet',
      desc: '',
      args: [],
    );
  }

  /// `Fund Password`
  String get wallet_fundPassword {
    return Intl.message(
      'Fund Password',
      name: 'wallet_fundPassword',
      desc: '',
      args: [],
    );
  }

  /// `Fund Password`
  String get wallet_fundPasswordcopy2 {
    return Intl.message(
      'Fund Password',
      name: 'wallet_fundPasswordcopy2',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get wallet_cancel {
    return Intl.message(
      'Cancel',
      name: 'wallet_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm deletion`
  String get wallet_confirmDelete {
    return Intl.message(
      'Confirm deletion',
      name: 'wallet_confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Opening address`
  String get wallet_accountOpeningOutlets {
    return Intl.message(
      'Opening address',
      name: 'wallet_accountOpeningOutlets',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Amount`
  String get wallet_transferAmount {
    return Intl.message(
      'Transfer Amount',
      name: 'wallet_transferAmount',
      desc: '',
      args: [],
    );
  }

  /// `Bank Choice`
  String get wallet_bankSelection {
    return Intl.message(
      'Bank Choice',
      name: 'wallet_bankSelection',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the depositor's name`
  String get wallet_pleaseEnterNameDepositor {
    return Intl.message(
      'Please enter the depositor\'s name',
      name: 'wallet_pleaseEnterNameDepositor',
      desc: '',
      args: [],
    );
  }

  /// `PIX account`
  String get wallet_pixAccount {
    return Intl.message(
      'PIX account',
      name: 'wallet_pixAccount',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Bank Card`
  String get wallet_paymentBankCard {
    return Intl.message(
      'Withdraw Bank Card',
      name: 'wallet_paymentBankCard',
      desc: '',
      args: [],
    );
  }

  /// `Please bind the withdrawal method first before withdrawing`
  String get wallet_pleaseBindWithdrawalMethodBeforeMakingWithdrawal {
    return Intl.message(
      'Please bind the withdrawal method first before withdrawing',
      name: 'wallet_pleaseBindWithdrawalMethodBeforeMakingWithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Please select a PIX account`
  String get wallet_pleaseSelectPIXAccount {
    return Intl.message(
      'Please select a PIX account',
      name: 'wallet_pleaseSelectPIXAccount',
      desc: '',
      args: [],
    );
  }

  /// `For the safety of your funds, please set a fund password first`
  String get wallet_setFundPassword {
    return Intl.message(
      'For the safety of your funds, please set a fund password first',
      name: 'wallet_setFundPassword',
      desc: '',
      args: [],
    );
  }

  /// `Go to settings`
  String get wallet_goToSettings {
    return Intl.message(
      'Go to settings',
      name: 'wallet_goToSettings',
      desc: '',
      args: [],
    );
  }

  /// `Enter the fund password`
  String get wallet_enterFundPassword {
    return Intl.message(
      'Enter the fund password',
      name: 'wallet_enterFundPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your fund password contains {number} digits`
  String wallet_yourFundPasswordContainsDigit(Object number) {
    return Intl.message(
      'Your fund password contains $number digits',
      name: 'wallet_yourFundPasswordContainsDigit',
      desc: '',
      args: [number],
    );
  }

  /// `10.00-100000.00`
  String get wallet_pleaseEnterAmount {
    return Intl.message(
      '10.00-100000.00',
      name: 'wallet_pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `The amount cannot be {zero}`
  String wallet_amountCannotBe(Object zero) {
    return Intl.message(
      'The amount cannot be $zero',
      name: 'wallet_amountCannotBe',
      desc: '',
      args: [zero],
    );
  }

  /// `Withdraw application successful`
  String get wallet_successfulApplicationForPayment {
    return Intl.message(
      'Withdraw application successful',
      name: 'wallet_successfulApplicationForPayment',
      desc: '',
      args: [],
    );
  }

  /// `Minumum amount is`
  String get wallet_minimumAmountIs {
    return Intl.message(
      'Minumum amount is',
      name: 'wallet_minimumAmountIs',
      desc: '',
      args: [],
    );
  }

  /// `Maximum amount is`
  String get wallet_maximumAmountIs {
    return Intl.message(
      'Maximum amount is',
      name: 'wallet_maximumAmountIs',
      desc: '',
      args: [],
    );
  }

  /// `Please select the amount`
  String get wallet_pleaseSelectAmount {
    return Intl.message(
      'Please select the amount',
      name: 'wallet_pleaseSelectAmount',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get wallet_search {
    return Intl.message(
      'Search',
      name: 'wallet_search',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get wallet_currency {
    return Intl.message(
      'Currency',
      name: 'wallet_currency',
      desc: '',
      args: [],
    );
  }

  /// `Confirm deletion`
  String get wallet_deleteConfirmation {
    return Intl.message(
      'Confirm deletion',
      name: 'wallet_deleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Vault`
  String get vault {
    return Intl.message(
      'Vault',
      name: 'vault',
      desc: '',
      args: [],
    );
  }

  /// `Card Wallet`
  String get cardHolder {
    return Intl.message(
      'Card Wallet',
      name: 'cardHolder',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get vault_deposit {
    return Intl.message(
      'Deposit',
      name: 'vault_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get vault_take_out {
    return Intl.message(
      'Withdraw',
      name: 'vault_take_out',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get vault_amount {
    return Intl.message(
      'Amount',
      name: 'vault_amount',
      desc: '',
      args: [],
    );
  }

  /// `Deposit to Vault`
  String get vault_deposit_vault {
    return Intl.message(
      'Deposit to Vault',
      name: 'vault_deposit_vault',
      desc: '',
      args: [],
    );
  }

  /// `The maximum value is {amount}`
  String vault_minimum_amount_limit_text(Object amount) {
    return Intl.message(
      'The maximum value is $amount',
      name: 'vault_minimum_amount_limit_text',
      desc: '',
      args: [amount],
    );
  }

  /// `Safe Take Out`
  String get vault_takeout {
    return Intl.message(
      'Safe Take Out',
      name: 'vault_takeout',
      desc: '',
      args: [],
    );
  }

  /// `Safe currency`
  String get vault_currency {
    return Intl.message(
      'Safe currency',
      name: 'vault_currency',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get vault_max_value {
    return Intl.message(
      'Max',
      name: 'vault_max_value',
      desc: '',
      args: [],
    );
  }

  /// `Improve your account security with Two-Factor Authentication`
  String get vault_increase_your_account_security_with_double_verification {
    return Intl.message(
      'Improve your account security with Two-Factor Authentication',
      name: 'vault_increase_your_account_security_with_double_verification',
      desc: '',
      args: [],
    );
  }

  /// `Enable2FA`
  String get vault_turn_on_two_step_verification {
    return Intl.message(
      'Enable2FA',
      name: 'vault_turn_on_two_step_verification',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get vault_two_step_verification {
    return Intl.message(
      'Security',
      name: 'vault_two_step_verification',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment`
  String get vault_confirm_payment {
    return Intl.message(
      'Confirm Payment',
      name: 'vault_confirm_payment',
      desc: '',
      args: [],
    );
  }

  /// `Recharge Amount`
  String get vault_recharge_amount {
    return Intl.message(
      'Recharge Amount',
      name: 'vault_recharge_amount',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get vault_address {
    return Intl.message(
      'Address',
      name: 'vault_address',
      desc: '',
      args: [],
    );
  }

  /// `Please select the address`
  String get vault_this_field_is_required {
    return Intl.message(
      'Please select the address',
      name: 'vault_this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Minimum amount {minimal_amount}`
  String vault_the_minimal_amount_is(Object minimal_amount) {
    return Intl.message(
      'Minimum amount $minimal_amount',
      name: 'vault_the_minimal_amount_is',
      desc: '',
      args: [minimal_amount],
    );
  }

  /// `Withdraw`
  String get vault_withdraw_money {
    return Intl.message(
      'Withdraw',
      name: 'vault_withdraw_money',
      desc: '',
      args: [],
    );
  }

  /// `Transfer-to address`
  String get vault_transfer_to_address {
    return Intl.message(
      'Transfer-to address',
      name: 'vault_transfer_to_address',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm sending {currency} to this address. The recharge requires confirmation from the entire network before it can be credited. Thank you for your patience.`
  String vault_USDT_transfer_in_progress_Please_wait_for_confirmation(
      Object currency) {
    return Intl.message(
      'Please confirm sending $currency to this address. The recharge requires confirmation from the entire network before it can be credited. Thank you for your patience.',
      name: 'vault_USDT_transfer_in_progress_Please_wait_for_confirmation',
      desc: '',
      args: [currency],
    );
  }

  /// `Transfer amount {amount}`
  String vault_transfer_amount(Object amount) {
    return Intl.message(
      'Transfer amount $amount',
      name: 'vault_transfer_amount',
      desc: '',
      args: [amount],
    );
  }

  /// `Please confirm that the payment address is deposited with the full amount (excluding handling fees), otherwise it may result in the inability to increase points.`
  String
      get vault_Confirm_deposit_with_full_amount_excluding_fees_to_avoid_issues_with_crediting {
    return Intl.message(
      'Please confirm that the payment address is deposited with the full amount (excluding handling fees), otherwise it may result in the inability to increase points.',
      name:
          'vault_Confirm_deposit_with_full_amount_excluding_fees_to_avoid_issues_with_crediting',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Deposit Request`
  String get vault_Cancel_deposit_request {
    return Intl.message(
      'Cancel Deposit Request',
      name: 'vault_Cancel_deposit_request',
      desc: '',
      args: [],
    );
  }

  /// `Deposited`
  String get vault_have_deposited {
    return Intl.message(
      'Deposited',
      name: 'vault_have_deposited',
      desc: '',
      args: [],
    );
  }

  /// `The amount cannot exceed the limit`
  String get vault_amountCannotExceedMaximum {
    return Intl.message(
      'The amount cannot exceed the limit',
      name: 'vault_amountCannotExceedMaximum',
      desc: '',
      args: [],
    );
  }

  /// `Deposited`
  String get vault_successfullyStor {
    return Intl.message(
      'Deposited',
      name: 'vault_successfullyStor',
      desc: '',
      args: [],
    );
  }

  /// `Enter the safe`
  String get vault_enteringVault {
    return Intl.message(
      'Enter the safe',
      name: 'vault_enteringVault',
      desc: '',
      args: [],
    );
  }

  /// `Safe withdraw confirmed`
  String get vault_confirmedExtractionFromVault {
    return Intl.message(
      'Safe withdraw confirmed',
      name: 'vault_confirmedExtractionFromVault',
      desc: '',
      args: [],
    );
  }

  /// `Safe withdraw confirmed`
  String get vault_confirmedExtractionFromVaultcopy2 {
    return Intl.message(
      'Safe withdraw confirmed',
      name: 'vault_confirmedExtractionFromVaultcopy2',
      desc: '',
      args: [],
    );
  }

  /// `Deposit in the safe`
  String get vault_vaultDeposits {
    return Intl.message(
      'Deposit in the safe',
      name: 'vault_vaultDeposits',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the payment bank`
  String get fiat_currency_select_the_payment_bank {
    return Intl.message(
      'Please choose the payment bank',
      name: 'fiat_currency_select_the_payment_bank',
      desc: '',
      args: [],
    );
  }

  /// `Payment bank`
  String get fiat_currency_drawing_bank {
    return Intl.message(
      'Payment bank',
      name: 'fiat_currency_drawing_bank',
      desc: '',
      args: [],
    );
  }

  /// `Channel Choice`
  String get fiat_currency_channel_selection {
    return Intl.message(
      'Channel Choice',
      name: 'fiat_currency_channel_selection',
      desc: '',
      args: [],
    );
  }

  /// `Depositor’s Name`
  String get fiat_currency_Depositor_is_name {
    return Intl.message(
      'Depositor’s Name',
      name: 'fiat_currency_Depositor_is_name',
      desc: '',
      args: [],
    );
  }

  /// `In order to prevent deposit delays, please be sure to enter the correct name of the depositor and the deposit amount.`
  String get fiat_currency_deposit_hint {
    return Intl.message(
      'In order to prevent deposit delays, please be sure to enter the correct name of the depositor and the deposit amount.',
      name: 'fiat_currency_deposit_hint',
      desc: '',
      args: [],
    );
  }

  /// `Payee Name`
  String get fiat_currency_payee_name {
    return Intl.message(
      'Payee Name',
      name: 'fiat_currency_payee_name',
      desc: '',
      args: [],
    );
  }

  /// `The transfer amount must match with the order amount`
  String get fiat_currency_transfer_amount_must_match_the_order_amount {
    return Intl.message(
      'The transfer amount must match with the order amount',
      name: 'fiat_currency_transfer_amount_must_match_the_order_amount',
      desc: '',
      args: [],
    );
  }

  /// `In order to prevent delays in score, please confirm in time after the transfer is successful!`
  String
      get fiat_currency_confirm_promptly_after_successful_transfer_to_avoid_scoring_delays {
    return Intl.message(
      'In order to prevent delays in score, please confirm in time after the transfer is successful!',
      name:
          'fiat_currency_confirm_promptly_after_successful_transfer_to_avoid_scoring_delays',
      desc: '',
      args: [],
    );
  }

  /// `VIP`
  String get vip {
    return Intl.message(
      'VIP',
      name: 'vip',
      desc: '',
      args: [],
    );
  }

  /// `Progress level`
  String get vip_degree_of_progress {
    return Intl.message(
      'Progress level',
      name: 'vip_degree_of_progress',
      desc: '',
      args: [],
    );
  }

  /// `Benefit`
  String get vip_welfare {
    return Intl.message(
      'Benefit',
      name: 'vip_welfare',
      desc: '',
      args: [],
    );
  }

  /// `Deposit bonus`
  String get vip_recharge_bonus {
    return Intl.message(
      'Deposit bonus',
      name: 'vip_recharge_bonus',
      desc: '',
      args: [],
    );
  }

  /// `Your VIP Progress`
  String get vip_your_progress {
    return Intl.message(
      'Your VIP Progress',
      name: 'vip_your_progress',
      desc: '',
      args: [],
    );
  }

  /// `No classification`
  String get vip_level {
    return Intl.message(
      'No classification',
      name: 'vip_level',
      desc: '',
      args: [],
    );
  }

  /// `Copper`
  String get vip_level_copper {
    return Intl.message(
      'Copper',
      name: 'vip_level_copper',
      desc: '',
      args: [],
    );
  }

  /// `Get recharge bonus`
  String get vip_get_recharge_bonus {
    return Intl.message(
      'Get recharge bonus',
      name: 'vip_get_recharge_bonus',
      desc: '',
      args: [],
    );
  }

  /// `Next bonus available {nextTime}`
  String vip_next_collection_is_at(Object nextTime) {
    return Intl.message(
      'Next bonus available $nextTime',
      name: 'vip_next_collection_is_at',
      desc: '',
      args: [nextTime],
    );
  }

  /// `Recharge bonus valid until {time}`
  String vip_recharge_bonus_is_valid_until(Object time) {
    return Intl.message(
      'Recharge bonus valid until $time',
      name: 'vip_recharge_bonus_is_valid_until',
      desc: '',
      args: [time],
    );
  }

  /// `Select the bank`
  String get binding_bank_card_select_bank {
    return Intl.message(
      'Select the bank',
      name: 'binding_bank_card_select_bank',
      desc: '',
      args: [],
    );
  }

  /// `Account holder's full name`
  String get binding_bank_card_account_name {
    return Intl.message(
      'Account holder\'s full name',
      name: 'binding_bank_card_account_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter`
  String get binding_bank_card_please_enter {
    return Intl.message(
      'Please enter',
      name: 'binding_bank_card_please_enter',
      desc: '',
      args: [],
    );
  }

  /// `Bank card number`
  String get binding_bank_card_number {
    return Intl.message(
      'Bank card number',
      name: 'binding_bank_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Account bank address`
  String get binding_bank_card_account_opening_branch {
    return Intl.message(
      'Account bank address',
      name: 'binding_bank_card_account_opening_branch',
      desc: '',
      args: [],
    );
  }

  /// `Bind`
  String get binding_bank_card_binding {
    return Intl.message(
      'Bind',
      name: 'binding_bank_card_binding',
      desc: '',
      args: [],
    );
  }

  /// `Bind bank card`
  String get binding_bank_card {
    return Intl.message(
      'Bind bank card',
      name: 'binding_bank_card',
      desc: '',
      args: [],
    );
  }

  /// `All bound accounts`
  String get binding_bank_card_all_bound_accounts {
    return Intl.message(
      'All bound accounts',
      name: 'binding_bank_card_all_bound_accounts',
      desc: '',
      args: [],
    );
  }

  /// `The names must match`
  String get binding_bank_card_names_must_match {
    return Intl.message(
      'The names must match',
      name: 'binding_bank_card_names_must_match',
      desc: '',
      args: [],
    );
  }

  /// `Please check your name carefully before confirming`
  String get binding_bank_card_hint {
    return Intl.message(
      'Please check your name carefully before confirming',
      name: 'binding_bank_card_hint',
      desc: '',
      args: [],
    );
  }

  /// `Account holder's name`
  String get binding_tripartite_account_holder_name {
    return Intl.message(
      'Account holder\'s name',
      name: 'binding_tripartite_account_holder_name',
      desc: '',
      args: [],
    );
  }

  /// `Select the account type`
  String get binding_tripartite_account_type_please {
    return Intl.message(
      'Select the account type',
      name: 'binding_tripartite_account_type_please',
      desc: '',
      args: [],
    );
  }

  /// `Set as default card`
  String get binding_setAsDefaultCardNumber {
    return Intl.message(
      'Set as default card',
      name: 'binding_setAsDefaultCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `No changes allowed after bound`
  String get binding_cannotBeChangedAfterBind {
    return Intl.message(
      'No changes allowed after bound',
      name: 'binding_cannotBeChangedAfterBind',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of PIX account`
  String get binding_pleaseSelectPIXAccountType {
    return Intl.message(
      'Select the type of PIX account',
      name: 'binding_pleaseSelectPIXAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Type the third party account`
  String get binding_pleaseEnterThirdPartyAccount {
    return Intl.message(
      'Type the third party account',
      name: 'binding_pleaseEnterThirdPartyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bind PIX`
  String get binding_bindPIX {
    return Intl.message(
      'Bind PIX',
      name: 'binding_bindPIX',
      desc: '',
      args: [],
    );
  }

  /// `Select protocol`
  String get binding_selectAgreement {
    return Intl.message(
      'Select protocol',
      name: 'binding_selectAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Your {currencyName}`
  String binding_your(Object currencyName) {
    return Intl.message(
      'Your $currencyName',
      name: 'binding_your',
      desc: '',
      args: [currencyName],
    );
  }

  /// `Set as the default address`
  String get binding_setAsDefaultAddress {
    return Intl.message(
      'Set as the default address',
      name: 'binding_setAsDefaultAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm to delete the following withdrawal methods?`
  String get binding_confirmDeletion {
    return Intl.message(
      'Please confirm to delete the following withdrawal methods?',
      name: 'binding_confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Insert the correct bank card number`
  String get binding_pleaseEnterCorrectBankCardNumber {
    return Intl.message(
      'Insert the correct bank card number',
      name: 'binding_pleaseEnterCorrectBankCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter the bank card number`
  String get binding_pleaseEnterYourBankCardNumber {
    return Intl.message(
      'Enter the bank card number',
      name: 'binding_pleaseEnterYourBankCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct name and surname`
  String get binding_pleaseEnterCorrectName {
    return Intl.message(
      'Please enter correct name and surname',
      name: 'binding_pleaseEnterCorrectName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct bank card number consisting of {start_number} - {end_number} digits`
  String binding_pleaseEnterCorrect430DigitBankCardNumber(
      Object start_number, Object end_number) {
    return Intl.message(
      'Please enter the correct bank card number consisting of $start_number - $end_number digits',
      name: 'binding_pleaseEnterCorrect430DigitBankCardNumber',
      desc: '',
      args: [start_number, end_number],
    );
  }

  /// `Please enter the withdrawal address`
  String get binding_pleaseEnterWithdrawalAddress {
    return Intl.message(
      'Please enter the withdrawal address',
      name: 'binding_pleaseEnterWithdrawalAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct withdrawal address`
  String get binding_pleaseEnterCorrectWithdrawalAddress {
    return Intl.message(
      'Please enter the correct withdrawal address',
      name: 'binding_pleaseEnterCorrectWithdrawalAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get paymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Bind PIX account`
  String get bind_pix_account {
    return Intl.message(
      'Bind PIX account',
      name: 'bind_pix_account',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transaction_records {
    return Intl.message(
      'Transactions',
      name: 'transaction_records',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Gambling`
  String get responsible_gaming {
    return Intl.message(
      'Responsible Gambling',
      name: 'responsible_gaming',
      desc: '',
      args: [],
    );
  }

  /// `New release`
  String get notifs_new {
    return Intl.message(
      'New release',
      name: 'notifs_new',
      desc: '',
      args: [],
    );
  }

  /// `Mark All as Read`
  String get notifs_as_read {
    return Intl.message(
      'Mark All as Read',
      name: 'notifs_as_read',
      desc: '',
      args: [],
    );
  }

  /// `Deposit pending`
  String get notifs_title_deposit_pending {
    return Intl.message(
      'Deposit pending',
      name: 'notifs_title_deposit_pending',
      desc: '',
      args: [],
    );
  }

  /// `Deposit confirmed`
  String get notifs_title_deposit_confirmed {
    return Intl.message(
      'Deposit confirmed',
      name: 'notifs_title_deposit_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Your deposit of %s %s has been registered and is awaiting confirmation.`
  String get notifs_content_deposit_pending {
    return Intl.message(
      'Your deposit of %s %s has been registered and is awaiting confirmation.',
      name: 'notifs_content_deposit_pending',
      desc: '',
      args: [],
    );
  }

  /// `Your deposit of %s %s has been successfully processed.`
  String get notifs_content_deposit_confirmed {
    return Intl.message(
      'Your deposit of %s %s has been successfully processed.',
      name: 'notifs_content_deposit_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Casino bets`
  String get casino_bet {
    return Intl.message(
      'Casino bets',
      name: 'casino_bet',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get data_count_data {
    return Intl.message(
      'Statistics',
      name: 'data_count_data',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get data_count_datacopy2 {
    return Intl.message(
      'Statistics',
      name: 'data_count_datacopy2',
      desc: '',
      args: [],
    );
  }

  /// `Races`
  String get data_count_race {
    return Intl.message(
      'Races',
      name: 'data_count_race',
      desc: '',
      args: [],
    );
  }

  /// `Reward giving activity`
  String get data_count_activity {
    return Intl.message(
      'Reward giving activity',
      name: 'data_count_activity',
      desc: '',
      args: [],
    );
  }

  /// `Go to Casino`
  String get go_to_casino {
    return Intl.message(
      'Go to Casino',
      name: 'go_to_casino',
      desc: '',
      args: [],
    );
  }

  /// `Go to Sportsbook`
  String get go_to_sports_book {
    return Intl.message(
      'Go to Sportsbook',
      name: 'go_to_sports_book',
      desc: '',
      args: [],
    );
  }

  /// `Sports betting`
  String get sport_bet {
    return Intl.message(
      'Sports betting',
      name: 'sport_bet',
      desc: '',
      args: [],
    );
  }

  /// `Race Leaderboard`
  String get race_leaderboard {
    return Intl.message(
      'Race Leaderboard',
      name: 'race_leaderboard',
      desc: '',
      args: [],
    );
  }

  /// `The Leading Online Cryptocurrency Casino`
  String get casino_des_one {
    return Intl.message(
      'The Leading Online Cryptocurrency Casino',
      name: 'casino_des_one',
      desc: '',
      args: [],
    );
  }

  /// `Browse our wide range of casino games and let Stake provide you with an online gambling experience that is both fair and fun. Play slots, live casino, blackjack, baccarat, roulette and dozens more right from your browser Bet on thousands of classic casino games including your favorite Stake original games.`
  String get casino_des_two {
    return Intl.message(
      'Browse our wide range of casino games and let Stake provide you with an online gambling experience that is both fair and fun. Play slots, live casino, blackjack, baccarat, roulette and dozens more right from your browser Bet on thousands of classic casino games including your favorite Stake original games.',
      name: 'casino_des_two',
      desc: '',
      args: [],
    );
  }

  /// `The Best Cryptocurrency Online Sports Betting`
  String get sport_des_one {
    return Intl.message(
      'The Best Cryptocurrency Online Sports Betting',
      name: 'sport_des_one',
      desc: '',
      args: [],
    );
  }

  /// `Bet on sports teams, players and leagues from around the world with our sports betting platform. Enjoy an unparalleled sports betting experience by placing bets on a variety of betting options on MMA, basketball, football and many other sports, as well as on live markets.`
  String get sport_des_two {
    return Intl.message(
      'Bet on sports teams, players and leagues from around the world with our sports betting platform. Enjoy an unparalleled sports betting experience by placing bets on a variety of betting options on MMA, basketball, football and many other sports, as well as on live markets.',
      name: 'sport_des_two',
      desc: '',
      args: [],
    );
  }

  /// `No cryptocurrency? No problem`
  String get no_crypto {
    return Intl.message(
      'No cryptocurrency? No problem',
      name: 'no_crypto',
      desc: '',
      args: [],
    );
  }

  /// `Buy cryptocurrency`
  String get buy_crypto {
    return Intl.message(
      'Buy cryptocurrency',
      name: 'buy_crypto',
      desc: '',
      args: [],
    );
  }

  /// `VIP Club`
  String get vip_club {
    return Intl.message(
      'VIP Club',
      name: 'vip_club',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get home_blog {
    return Intl.message(
      'Blog',
      name: 'home_blog',
      desc: '',
      args: [],
    );
  }

  /// `Forum`
  String get home_forum {
    return Intl.message(
      'Forum',
      name: 'home_forum',
      desc: '',
      args: [],
    );
  }

  /// `Live Support`
  String get live_support {
    return Intl.message(
      'Live Support',
      name: 'live_support',
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

  /// `Message Center`
  String get notification {
    return Intl.message(
      'Message Center',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get promotions {
    return Intl.message(
      'Promotions',
      name: 'promotions',
      desc: '',
      args: [],
    );
  }

  /// `Sponsorships`
  String get sponsorships {
    return Intl.message(
      'Sponsorships',
      name: 'sponsorships',
      desc: '',
      args: [],
    );
  }

  /// `Top Sports`
  String get top_sports {
    return Intl.message(
      'Top Sports',
      name: 'top_sports',
      desc: '',
      args: [],
    );
  }

  /// `All esports`
  String get all_esports {
    return Intl.message(
      'All esports',
      name: 'all_esports',
      desc: '',
      args: [],
    );
  }

  /// `All Sports`
  String get all_sports {
    return Intl.message(
      'All Sports',
      name: 'all_sports',
      desc: '',
      args: [],
    );
  }

  /// `Welcome offer`
  String get offers_welcome_offer {
    return Intl.message(
      'Welcome offer',
      name: 'offers_welcome_offer',
      desc: '',
      args: [],
    );
  }

  /// `Welcome offer valid only for 24 hours after registration.`
  String get offers_welcome_offer_body {
    return Intl.message(
      'Welcome offer valid only for 24 hours after registration.',
      name: 'offers_welcome_offer_body',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get offers_code {
    return Intl.message(
      'Code',
      name: 'offers_code',
      desc: '',
      args: [],
    );
  }

  /// `Redeem AirDrop bonus`
  String get offerrs_redeem_bonus_drop {
    return Intl.message(
      'Redeem AirDrop bonus',
      name: 'offerrs_redeem_bonus_drop',
      desc: '',
      args: [],
    );
  }

  /// `Get AirDrop bonus codes on our social media such as Twitter and Telegram`
  String get offers_redeem_body {
    return Intl.message(
      'Get AirDrop bonus codes on our social media such as Twitter and Telegram',
      name: 'offers_redeem_body',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit_text {
    return Intl.message(
      'Submit',
      name: 'submit_text',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get offers {
    return Intl.message(
      'Discount',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Providers`
  String get game_supplier {
    return Intl.message(
      'Providers',
      name: 'game_supplier',
      desc: '',
      args: [],
    );
  }

  /// `There are no favorites yet, start using now`
  String get yulecheng_zanwushoucang {
    return Intl.message(
      'There are no favorites yet, start using now',
      name: 'yulecheng_zanwushoucang',
      desc: '',
      args: [],
    );
  }

  /// `Add game to favorites`
  String get yulecheng_savegame_tofavorite {
    return Intl.message(
      'Add game to favorites',
      name: 'yulecheng_savegame_tofavorite',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get yulecheng_prepage {
    return Intl.message(
      'Previous',
      name: 'yulecheng_prepage',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get yulecheng_nextpage {
    return Intl.message(
      'Next',
      name: 'yulecheng_nextpage',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Display Balance`
  String get yulecheng_selectShowBalance {
    return Intl.message(
      'Select Your Display Balance',
      name: 'yulecheng_selectShowBalance',
      desc: '',
      args: [],
    );
  }

  /// `Fun Play`
  String get yulecheng_trygame {
    return Intl.message(
      'Fun Play',
      name: 'yulecheng_trygame',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get yulecheng_hot_recoment {
    return Intl.message(
      'Recommended',
      name: 'yulecheng_hot_recoment',
      desc: '',
      args: [],
    );
  }

  /// `Slot`
  String get yulecheng_slot {
    return Intl.message(
      'Slot',
      name: 'yulecheng_slot',
      desc: '',
      args: [],
    );
  }

  /// `Live casino`
  String get yulecheng_casino {
    return Intl.message(
      'Live casino',
      name: 'yulecheng_casino',
      desc: '',
      args: [],
    );
  }

  /// `Featured slot`
  String get yulecheng_special_slot {
    return Intl.message(
      'Featured slot',
      name: 'yulecheng_special_slot',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get transactions_other {
    return Intl.message(
      'Other',
      name: 'transactions_other',
      desc: '',
      args: [],
    );
  }

  /// `Crypto`
  String get crypto_text {
    return Intl.message(
      'Crypto',
      name: 'crypto_text',
      desc: '',
      args: [],
    );
  }

  /// `Local Currency`
  String get banking_text {
    return Intl.message(
      'Local Currency',
      name: 'banking_text',
      desc: '',
      args: [],
    );
  }

  /// `Download all {title}`
  String download_all_text(Object title) {
    return Intl.message(
      'Download all $title',
      name: 'download_all_text',
      desc: '',
      args: [title],
    );
  }

  /// `Self exclusion`
  String get responsible_title_self_exclusion {
    return Intl.message(
      'Self exclusion',
      name: 'responsible_title_self_exclusion',
      desc: '',
      args: [],
    );
  }

  /// `Request self-exclusion`
  String get responsible_btn_request_self_exclusion {
    return Intl.message(
      'Request self-exclusion',
      name: 'responsible_btn_request_self_exclusion',
      desc: '',
      args: [],
    );
  }

  /// `Betting limits`
  String get responsible_tab_betting_limits {
    return Intl.message(
      'Betting limits',
      name: 'responsible_tab_betting_limits',
      desc: '',
      args: [],
    );
  }

  /// `Loss limits`
  String get responsible_label_loss_limits {
    return Intl.message(
      'Loss limits',
      name: 'responsible_label_loss_limits',
      desc: '',
      args: [],
    );
  }

  /// `Clear limit`
  String get responsible_btn_clear_limit {
    return Intl.message(
      'Clear limit',
      name: 'responsible_btn_clear_limit',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get single_bet {
    return Intl.message(
      'Single',
      name: 'single_bet',
      desc: '',
      args: [],
    );
  }

  /// `Multi`
  String get multiple_bet {
    return Intl.message(
      'Multi',
      name: 'multiple_bet',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active_bet {
    return Intl.message(
      'Active',
      name: 'active_bet',
      desc: '',
      args: [],
    );
  }

  /// `Settled`
  String get settled_bet {
    return Intl.message(
      'Settled',
      name: 'settled_bet',
      desc: '',
      args: [],
    );
  }

  /// `All Bets`
  String get all_bet {
    return Intl.message(
      'All Bets',
      name: 'all_bet',
      desc: '',
      args: [],
    );
  }

  /// `High Rollers`
  String get billboard {
    return Intl.message(
      'High Rollers',
      name: 'billboard',
      desc: '',
      args: [],
    );
  }

  /// `Social Media Account`
  String get social_account_text {
    return Intl.message(
      'Social Media Account',
      name: 'social_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get text_filed_tips_repeat_password_text {
    return Intl.message(
      'Repeat password',
      name: 'text_filed_tips_repeat_password_text',
      desc: '',
      args: [],
    );
  }

  /// `The fund password will be used to protect withdraws and make withdraws from the safe more secure`
  String get setup_pay_password_title_text {
    return Intl.message(
      'The fund password will be used to protect withdraws and make withdraws from the safe more secure',
      name: 'setup_pay_password_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get setup_pay_password_button_text {
    return Intl.message(
      'Email verification',
      name: 'setup_pay_password_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm_button_text {
    return Intl.message(
      'Confirm',
      name: 'confirm_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Welcome offer valid only for 24 hours after registration.`
  String get newcomer_discount_tips_text {
    return Intl.message(
      'Welcome offer valid only for 24 hours after registration.',
      name: 'newcomer_discount_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get redeem_code_text {
    return Intl.message(
      'Code',
      name: 'redeem_code_text',
      desc: '',
      args: [],
    );
  }

  /// `Redeem AirDrop bonus`
  String get redeem_bonus_text {
    return Intl.message(
      'Redeem AirDrop bonus',
      name: 'redeem_bonus_text',
      desc: '',
      args: [],
    );
  }

  /// `Get AirDrop bonus codes on our social media such as Twitter and Telegram`
  String get redeem_bonus_tips_text {
    return Intl.message(
      'Get AirDrop bonus codes on our social media such as Twitter and Telegram',
      name: 'redeem_bonus_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get back_list_action_text {
    return Intl.message(
      'Action',
      name: 'back_list_action_text',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get back_list_player_text {
    return Intl.message(
      'User',
      name: 'back_list_player_text',
      desc: '',
      args: [],
    );
  }

  /// `Level 1`
  String get kyc_level_number_one_text {
    return Intl.message(
      'Level 1',
      name: 'kyc_level_number_one_text',
      desc: '',
      args: [],
    );
  }

  /// `Level 2`
  String get kyc_level_number_two_text {
    return Intl.message(
      'Level 2',
      name: 'kyc_level_number_two_text',
      desc: '',
      args: [],
    );
  }

  /// `Level 3`
  String get kyc_level_number_three_text {
    return Intl.message(
      'Level 3',
      name: 'kyc_level_number_three_text',
      desc: '',
      args: [],
    );
  }

  /// `Level 4`
  String get kyc_level_number_four_text {
    return Intl.message(
      'Level 4',
      name: 'kyc_level_number_four_text',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get kyc_level_verify_title_text {
    return Intl.message(
      'Verify',
      name: 'kyc_level_verify_title_text',
      desc: '',
      args: [],
    );
  }

  /// `Level 1 verification can be updated in case your details change`
  String get kyc_level_one_tips_text {
    return Intl.message(
      'Level 1 verification can be updated in case your details change',
      name: 'kyc_level_one_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `All data will be securely stored and encrypted`
  String get kyc_security_tips_text {
    return Intl.message(
      'All data will be securely stored and encrypted',
      name: 'kyc_security_tips_text',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get kyc_given_name_text {
    return Intl.message(
      'Name',
      name: 'kyc_given_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get kyc_family_name_text {
    return Intl.message(
      'Last name',
      name: 'kyc_family_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get kyc_nationality_text {
    return Intl.message(
      'Country',
      name: 'kyc_nationality_text',
      desc: '',
      args: [],
    );
  }

  /// `Place of residence`
  String get kyc_live_place_text {
    return Intl.message(
      'Place of residence',
      name: 'kyc_live_place_text',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get kyc_city_text {
    return Intl.message(
      'City',
      name: 'kyc_city_text',
      desc: '',
      args: [],
    );
  }

  /// `Zip code`
  String get kyc_postal_code_text {
    return Intl.message(
      'Zip code',
      name: 'kyc_postal_code_text',
      desc: '',
      args: [],
    );
  }

  /// `Profession`
  String get kyc_job_text {
    return Intl.message(
      'Profession',
      name: 'kyc_job_text',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the level 1 verification`
  String get kyc_level_two_tips1_text {
    return Intl.message(
      'Please complete the level 1 verification',
      name: 'kyc_level_two_tips1_text',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible`
  String get kyc_level_two_tips2_text {
    return Intl.message(
      'Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible',
      name: 'kyc_level_two_tips2_text',
      desc: '',
      args: [],
    );
  }

  /// `Proof of ID`
  String get kyc_level_personal_id_text {
    return Intl.message(
      'Proof of ID',
      name: 'kyc_level_personal_id_text',
      desc: '',
      args: [],
    );
  }

  /// `Front`
  String get kyc_level_front_text {
    return Intl.message(
      'Front',
      name: 'kyc_level_front_text',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get kyc_level_reverse_text {
    return Intl.message(
      'Back',
      name: 'kyc_level_reverse_text',
      desc: '',
      args: [],
    );
  }

  /// `Accepted formats: png, jpg, pdf`
  String get kyc_type_support_text {
    return Intl.message(
      'Accepted formats: png, jpg, pdf',
      name: 'kyc_type_support_text',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the level 2 verification`
  String get kyc_level_there_tips1_text {
    return Intl.message(
      'Please complete the level 2 verification',
      name: 'kyc_level_there_tips1_text',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible`
  String get kyc_level_there_tips2_text {
    return Intl.message(
      'Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible',
      name: 'kyc_level_there_tips2_text',
      desc: '',
      args: [],
    );
  }

  /// `Proof of address`
  String get kyc_address_prove_text {
    return Intl.message(
      'Proof of address',
      name: 'kyc_address_prove_text',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the level 3 verification`
  String get kyc_level_four_tips1_text {
    return Intl.message(
      'Please complete the level 3 verification',
      name: 'kyc_level_four_tips1_text',
      desc: '',
      args: [],
    );
  }

  /// `Please upload proof of your source of funds. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible`
  String get kyc_level_four_tips2_text {
    return Intl.message(
      'Please upload proof of your source of funds. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible',
      name: 'kyc_level_four_tips2_text',
      desc: '',
      args: [],
    );
  }

  /// `Source of funds`
  String get kyc_level_money_source_text {
    return Intl.message(
      'Source of funds',
      name: 'kyc_level_money_source_text',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get bet_stop {
    return Intl.message(
      'Pause',
      name: 'bet_stop',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get bet_settled {
    return Intl.message(
      'Closed',
      name: 'bet_settled',
      desc: '',
      args: [],
    );
  }

  /// `Boules`
  String get bet_live {
    return Intl.message(
      'Boules',
      name: 'bet_live',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Payment`
  String get bet_pay {
    return Intl.message(
      'Estimated Payment',
      name: 'bet_pay',
      desc: '',
      args: [],
    );
  }

  /// `Total Bets`
  String get bet_pay_all {
    return Intl.message(
      'Total Bets',
      name: 'bet_pay_all',
      desc: '',
      args: [],
    );
  }

  /// `Your bet slip cannot contain suspended or closed bets`
  String get bet_submit_tips_one {
    return Intl.message(
      'Your bet slip cannot contain suspended or closed bets',
      name: 'bet_submit_tips_one',
      desc: '',
      args: [],
    );
  }

  /// `The odds have changed. You need to accept the odds change before betting.`
  String get bet_submit_tips_two {
    return Intl.message(
      'The odds have changed. You need to accept the odds change before betting.',
      name: 'bet_submit_tips_two',
      desc: '',
      args: [],
    );
  }

  /// `Place Single Bet`
  String get bet_submit {
    return Intl.message(
      'Place Single Bet',
      name: 'bet_submit',
      desc: '',
      args: [],
    );
  }

  /// `Place Multi Bet`
  String get bet_submit_two {
    return Intl.message(
      'Place Multi Bet',
      name: 'bet_submit_two',
      desc: '',
      args: [],
    );
  }

  /// `Accept the new odds`
  String get bet_agree_new_odds {
    return Intl.message(
      'Accept the new odds',
      name: 'bet_agree_new_odds',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get bet_all_clean {
    return Intl.message(
      'Clear All',
      name: 'bet_all_clean',
      desc: '',
      args: [],
    );
  }

  /// `Accept Any Odds`
  String get bet_accept_any_odds {
    return Intl.message(
      'Accept Any Odds',
      name: 'bet_accept_any_odds',
      desc: '',
      args: [],
    );
  }

  /// `Accept Only Higher Odds`
  String get bet_accept_only_higher_odds {
    return Intl.message(
      'Accept Only Higher Odds',
      name: 'bet_accept_only_higher_odds',
      desc: '',
      args: [],
    );
  }

  /// `No Odds Changes Accepted`
  String get no_odds_changes_accepted {
    return Intl.message(
      'No Odds Changes Accepted',
      name: 'no_odds_changes_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Total Odds`
  String get bet_total_odds {
    return Intl.message(
      'Total Odds',
      name: 'bet_total_odds',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Decimal`
  String get odds_decimal {
    return Intl.message(
      'Decimal',
      name: 'odds_decimal',
      desc: '',
      args: [],
    );
  }

  /// `Fractional`
  String get odds_fractional {
    return Intl.message(
      'Fractional',
      name: 'odds_fractional',
      desc: '',
      args: [],
    );
  }

  /// `American`
  String get odds_american {
    return Intl.message(
      'American',
      name: 'odds_american',
      desc: '',
      args: [],
    );
  }

  /// `Indonesian`
  String get odds_indonesian {
    return Intl.message(
      'Indonesian',
      name: 'odds_indonesian',
      desc: '',
      args: [],
    );
  }

  /// `Hong Kong`
  String get odds_hong_kong {
    return Intl.message(
      'Hong Kong',
      name: 'odds_hong_kong',
      desc: '',
      args: [],
    );
  }

  /// `Malaysian`
  String get odds_malaysian {
    return Intl.message(
      'Malaysian',
      name: 'odds_malaysian',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw method`
  String get withdraw_money_type {
    return Intl.message(
      'Withdraw method',
      name: 'withdraw_money_type',
      desc: '',
      args: [],
    );
  }

  /// `Don't let anyone see this!`
  String get prevent_other_people_look {
    return Intl.message(
      'Don\'t let anyone see this!',
      name: 'prevent_other_people_look',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `The fund passwords entered twice are inconsistent`
  String get fund_password_is_inconsistent {
    return Intl.message(
      'The fund passwords entered twice are inconsistent',
      name: 'fund_password_is_inconsistent',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications Available`
  String get notifs_available {
    return Intl.message(
      'No Notifications Available',
      name: 'notifs_available',
      desc: '',
      args: [],
    );
  }

  /// `Your interactions will be visible here`
  String get notifs_available_tip {
    return Intl.message(
      'Your interactions will be visible here',
      name: 'notifs_available_tip',
      desc: '',
      args: [],
    );
  }

  /// `Copy the code to your Authenticator App`
  String get copy_text_to_authenticator_app {
    return Intl.message(
      'Copy the code to your Authenticator App',
      name: 'copy_text_to_authenticator_app',
      desc: '',
      args: [],
    );
  }

  /// `Successfully suppressed total value`
  String get submit_bet_result {
    return Intl.message(
      'Successfully suppressed total value',
      name: 'submit_bet_result',
      desc: '',
      args: [],
    );
  }

  /// `{amount}`
  String submit_bet_result_amount(Object amount) {
    return Intl.message(
      '$amount',
      name: 'submit_bet_result_amount',
      desc: '',
      args: [amount],
    );
  }

  /// `View my bets`
  String get check_my_betlist {
    return Intl.message(
      'View my bets',
      name: 'check_my_betlist',
      desc: '',
      args: [],
    );
  }

  /// `Reuse bet slip`
  String get bet_again {
    return Intl.message(
      'Reuse bet slip',
      name: 'bet_again',
      desc: '',
      args: [],
    );
  }

  /// `Multiple bets from the same event cannot be combined into multiple bets.`
  String get bet_tips_three {
    return Intl.message(
      'Multiple bets from the same event cannot be combined into multiple bets.',
      name: 'bet_tips_three',
      desc: '',
      args: [],
    );
  }

  /// `Get Verification Code`
  String get get_verification_code {
    return Intl.message(
      'Get Verification Code',
      name: 'get_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Only supports 6-digit pure numbers`
  String get only_supports_6_digit_pure_numbers {
    return Intl.message(
      'Only supports 6-digit pure numbers',
      name: 'only_supports_6_digit_pure_numbers',
      desc: '',
      args: [],
    );
  }

  /// `The two password inputs are inconsistent`
  String get two_password_inputs_are_inconsistent {
    return Intl.message(
      'The two password inputs are inconsistent',
      name: 'two_password_inputs_are_inconsistent',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be blank`
  String get password_can_not_be_blank {
    return Intl.message(
      'Password cannot be blank',
      name: 'password_can_not_be_blank',
      desc: '',
      args: [],
    );
  }

  /// `Verification code cannot be blank`
  String get verification_code_must_be_filled {
    return Intl.message(
      'Verification code cannot be blank',
      name: 'verification_code_must_be_filled',
      desc: '',
      args: [],
    );
  }

  /// `Transaction password set successfully`
  String get transaction_password_set_successfully {
    return Intl.message(
      'Transaction password set successfully',
      name: 'transaction_password_set_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Transaction password`
  String get transaction_password {
    return Intl.message(
      'Transaction password',
      name: 'transaction_password',
      desc: '',
      args: [],
    );
  }

  /// `Get again`
  String get reacquire {
    return Intl.message(
      'Get again',
      name: 'reacquire',
      desc: '',
      args: [],
    );
  }

  /// `Change Fund Password`
  String get change_fund_password {
    return Intl.message(
      'Change Fund Password',
      name: 'change_fund_password',
      desc: '',
      args: [],
    );
  }

  /// `Set fund password`
  String get set_fund_password {
    return Intl.message(
      'Set fund password',
      name: 'set_fund_password',
      desc: '',
      args: [],
    );
  }

  /// `Previous Fund Password`
  String get original_fund_password {
    return Intl.message(
      'Previous Fund Password',
      name: 'original_fund_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Fund Password`
  String get confirm_fund_password {
    return Intl.message(
      'Confirm Fund Password',
      name: 'confirm_fund_password',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification Code`
  String get email_verification_code {
    return Intl.message(
      'Email Verification Code',
      name: 'email_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your fund password? Go to `
  String get forgot_your_fund_password_go_to {
    return Intl.message(
      'Forgot your fund password? Go to ',
      name: 'forgot_your_fund_password_go_to',
      desc: '',
      args: [],
    );
  }

  /// `Contact Customer Service`
  String get contact_customer_service {
    return Intl.message(
      'Contact Customer Service',
      name: 'contact_customer_service',
      desc: '',
      args: [],
    );
  }

  /// `You have not bound your email`
  String get you_have_not_bound_your_email {
    return Intl.message(
      'You have not bound your email',
      name: 'you_have_not_bound_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please bind your email first and then set the fund password`
  String get first_and_then_set_the_password {
    return Intl.message(
      'Please bind your email first and then set the fund password',
      name: 'first_and_then_set_the_password',
      desc: '',
      args: [],
    );
  }

  /// `Go to Binding`
  String get go_to_Binding {
    return Intl.message(
      'Go to Binding',
      name: 'go_to_Binding',
      desc: '',
      args: [],
    );
  }

  /// `Internal Message`
  String get notifs_site_message {
    return Intl.message(
      'Internal Message',
      name: 'notifs_site_message',
      desc: '',
      args: [],
    );
  }

  /// `Announcement`
  String get notifs_announcement {
    return Intl.message(
      'Announcement',
      name: 'notifs_announcement',
      desc: '',
      args: [],
    );
  }

  /// `News ticker`
  String get notifs_marquee {
    return Intl.message(
      'News ticker',
      name: 'notifs_marquee',
      desc: '',
      args: [],
    );
  }

  /// `Reward Feedback`
  String get notifs_rewarded_feedback {
    return Intl.message(
      'Reward Feedback',
      name: 'notifs_rewarded_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Create Feedback`
  String get notifs_insert_feedback {
    return Intl.message(
      'Create Feedback',
      name: 'notifs_insert_feedback',
      desc: '',
      args: [],
    );
  }

  /// `My Feedbacks`
  String get notifs_my_feedback {
    return Intl.message(
      'My Feedbacks',
      name: 'notifs_my_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Feedback Content`
  String get feedback_title_content {
    return Intl.message(
      'Feedback Content',
      name: 'feedback_title_content',
      desc: '',
      args: [],
    );
  }

  /// `Your opinion is very important to us. The most relevant suggestions will be adopted. Once adopted, different cash rewards will be given depending on the level of importance. Feel free to give your opinion!`
  String get feedback_content_sub {
    return Intl.message(
      'Your opinion is very important to us. The most relevant suggestions will be adopted. Once adopted, different cash rewards will be given depending on the level of importance. Feel free to give your opinion!',
      name: 'feedback_content_sub',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get feedback_title_img {
    return Intl.message(
      'Image',
      name: 'feedback_title_img',
      desc: '',
      args: [],
    );
  }

  /// `Can Only Upload: png/jpg format, up to 5 photos, maximum size per image 1M`
  String get feedback_img_sub {
    return Intl.message(
      'Can Only Upload: png/jpg format, up to 5 photos, maximum size per image 1M',
      name: 'feedback_img_sub',
      desc: '',
      args: [],
    );
  }

  /// `Bonus Rules`
  String get feedback_rule_title {
    return Intl.message(
      'Bonus Rules',
      name: 'feedback_rule_title',
      desc: '',
      args: [],
    );
  }

  /// `We have set up a huge bonus to collect feedback so that we can optimize the system and functions and give you a better experience! Once adopted, rewards will be given based on importance (except if not adopted)`
  String get feedback_rule_sub {
    return Intl.message(
      'We have set up a huge bonus to collect feedback so that we can optimize the system and functions and give you a better experience! Once adopted, rewards will be given based on importance (except if not adopted)',
      name: 'feedback_rule_sub',
      desc: '',
      args: [],
    );
  }

  /// `Bonus to be Claimed: `
  String get feedback_bonus_title {
    return Intl.message(
      'Bonus to be Claimed: ',
      name: 'feedback_bonus_title',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Feedback Status: `
  String get feedback_state_title {
    return Intl.message(
      'Feedback Status: ',
      name: 'feedback_state_title',
      desc: '',
      args: [],
    );
  }

  /// `Content: `
  String get feedback_content_title {
    return Intl.message(
      'Content: ',
      name: 'feedback_content_title',
      desc: '',
      args: [],
    );
  }

  /// `Waiting Process`
  String get state_pending {
    return Intl.message(
      'Waiting Process',
      name: 'state_pending',
      desc: '',
      args: [],
    );
  }

  /// `Processed`
  String get state_processed {
    return Intl.message(
      'Processed',
      name: 'state_processed',
      desc: '',
      args: [],
    );
  }

  /// `Unread`
  String get message_unread {
    return Intl.message(
      'Unread',
      name: 'message_unread',
      desc: '',
      args: [],
    );
  }

  /// `Seen`
  String get message_read {
    return Intl.message(
      'Seen',
      name: 'message_read',
      desc: '',
      args: [],
    );
  }

  /// `Return to the previous page`
  String get feedback_back_title {
    return Intl.message(
      'Return to the previous page',
      name: 'feedback_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Official customer service`
  String get feedback_customer_service {
    return Intl.message(
      'Official customer service',
      name: 'feedback_customer_service',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get feedback_transfer_received {
    return Intl.message(
      'Received',
      name: 'feedback_transfer_received',
      desc: '',
      args: [],
    );
  }

  /// `To be received`
  String get feedback_transfer_await {
    return Intl.message(
      'To be received',
      name: 'feedback_transfer_await',
      desc: '',
      args: [],
    );
  }

  /// `Customer service transferring`
  String get feedback_transfer_service {
    return Intl.message(
      'Customer service transferring',
      name: 'feedback_transfer_service',
      desc: '',
      args: [],
    );
  }

  /// `Claim Bonus`
  String get feedback_receive_title {
    return Intl.message(
      'Claim Bonus',
      name: 'feedback_receive_title',
      desc: '',
      args: [],
    );
  }

  /// `Your current amount to be received is:`
  String get feedback_receive_amount_1 {
    return Intl.message(
      'Your current amount to be received is:',
      name: 'feedback_receive_amount_1',
      desc: '',
      args: [],
    );
  }

  /// `You can choose which type of currency you wish to receive  `
  String get feedback_receive_amount_2 {
    return Intl.message(
      'You can choose which type of currency you wish to receive  ',
      name: 'feedback_receive_amount_2',
      desc: '',
      args: [],
    );
  }

  /// `Current exchange rate: {rate}`
  String feedback_rate(Object rate) {
    return Intl.message(
      'Current exchange rate: $rate',
      name: 'feedback_rate',
      desc: '',
      args: [rate],
    );
  }

  /// `Estimated amount to be received`
  String get feedback_expected_receive {
    return Intl.message(
      'Estimated amount to be received',
      name: 'feedback_expected_receive',
      desc: '',
      args: [],
    );
  }

  /// `Confirm receipt`
  String get feedback_confirm_receive {
    return Intl.message(
      'Confirm receipt',
      name: 'feedback_confirm_receive',
      desc: '',
      args: [],
    );
  }

  /// `Prize`
  String get transactions_other_bonus {
    return Intl.message(
      'Prize',
      name: 'transactions_other_bonus',
      desc: '',
      args: [],
    );
  }

  /// `Airdrop bonus`
  String get transactions_other_drop {
    return Intl.message(
      'Airdrop bonus',
      name: 'transactions_other_drop',
      desc: '',
      args: [],
    );
  }

  /// `Activity commission withdraw`
  String get transactions_other_campaign_withdrawal {
    return Intl.message(
      'Activity commission withdraw',
      name: 'transactions_other_campaign_withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Receive recharge bonus`
  String get transactions_other_reload_claim {
    return Intl.message(
      'Receive recharge bonus',
      name: 'transactions_other_reload_claim',
      desc: '',
      args: [],
    );
  }

  /// `Receive rain of red envelopes`
  String get transactions_other_rains_received {
    return Intl.message(
      'Receive rain of red envelopes',
      name: 'transactions_other_rains_received',
      desc: '',
      args: [],
    );
  }

  /// `No Entries.`
  String get no_entries {
    return Intl.message(
      'No Entries.',
      name: 'no_entries',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// ` Details`
  String get detailscopy1 {
    return Intl.message(
      ' Details',
      name: 'detailscopy1',
      desc: '',
      args: [],
    );
  }

  /// ` Details`
  String get detailscopy2 {
    return Intl.message(
      ' Details',
      name: 'detailscopy2',
      desc: '',
      args: [],
    );
  }

  /// `Go to {name}`
  String transactions_detail_play(Object name) {
    return Intl.message(
      'Go to $name',
      name: 'transactions_detail_play',
      desc: '',
      args: [name],
    );
  }

  /// `In case of need, please contact us for assistance.`
  String get transactions_detail_help {
    return Intl.message(
      'In case of need, please contact us for assistance.',
      name: 'transactions_detail_help',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Methods`
  String get transactions_detail_means {
    return Intl.message(
      'Transaction Methods',
      name: 'transactions_detail_means',
      desc: '',
      args: [],
    );
  }

  /// `Credit card`
  String get transactions_detail_card {
    return Intl.message(
      'Credit card',
      name: 'transactions_detail_card',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get transactions_detail_coin_type {
    return Intl.message(
      'Currency',
      name: 'transactions_detail_coin_type',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get transactions_detail_state {
    return Intl.message(
      'Status',
      name: 'transactions_detail_state',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get transactions_detail_state_confirming {
    return Intl.message(
      'Pending',
      name: 'transactions_detail_state_confirming',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get transactions_detail_state_confirmed {
    return Intl.message(
      'Confirmed',
      name: 'transactions_detail_state_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Order timeout`
  String get transactions_detail_state_time_out {
    return Intl.message(
      'Order timeout',
      name: 'transactions_detail_state_time_out',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get transactions_detail_state_fail {
    return Intl.message(
      'Failure',
      name: 'transactions_detail_state_fail',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Time`
  String get transactions_detail_time {
    return Intl.message(
      'Transaction Time',
      name: 'transactions_detail_time',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get transactions_detail_order_id {
    return Intl.message(
      'Order Number',
      name: 'transactions_detail_order_id',
      desc: '',
      args: [],
    );
  }

  /// `Receipt account:`
  String get transactions_detail_card_number {
    return Intl.message(
      'Receipt account:',
      name: 'transactions_detail_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Transaction protocol`
  String get transactions_detail_blockchan_protocol {
    return Intl.message(
      'Transaction protocol',
      name: 'transactions_detail_blockchan_protocol',
      desc: '',
      args: [],
    );
  }

  /// `Investor: {user_name}`
  String transactions_detail_player(Object user_name) {
    return Intl.message(
      'Investor: $user_name',
      name: 'transactions_detail_player',
      desc: '',
      args: [user_name],
    );
  }

  /// `Bet:`
  String get transactions_detail_bet {
    return Intl.message(
      'Bet:',
      name: 'transactions_detail_bet',
      desc: '',
      args: [],
    );
  }

  /// `Multiplier:`
  String get transactions_detail_odds {
    return Intl.message(
      'Multiplier:',
      name: 'transactions_detail_odds',
      desc: '',
      args: [],
    );
  }

  /// `Payment amount:`
  String get transactions_detail_pay {
    return Intl.message(
      'Payment amount:',
      name: 'transactions_detail_pay',
      desc: '',
      args: [],
    );
  }

  /// `points left before VIP {level} There are still {amount}`
  String vip_next_level(Object level, Object amount) {
    return Intl.message(
      'points left before VIP $level There are still $amount',
      name: 'vip_next_level',
      desc: '',
      args: [level, amount],
    );
  }

  /// `Get it with one click`
  String get vip_commission_receive {
    return Intl.message(
      'Get it with one click',
      name: 'vip_commission_receive',
      desc: '',
      args: [],
    );
  }

  /// `Cashback`
  String get vip_commission_history {
    return Intl.message(
      'Cashback',
      name: 'vip_commission_history',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get vip_tab_level {
    return Intl.message(
      'Level',
      name: 'vip_tab_level',
      desc: '',
      args: [],
    );
  }

  /// `Promotion experience`
  String get vip_tab_exp {
    return Intl.message(
      'Promotion experience',
      name: 'vip_tab_exp',
      desc: '',
      args: [],
    );
  }

  /// `Promotion Bonus`
  String get vip_tab_bouns {
    return Intl.message(
      'Promotion Bonus',
      name: 'vip_tab_bouns',
      desc: '',
      args: [],
    );
  }

  /// `Electronic`
  String get game_slots {
    return Intl.message(
      'Electronic',
      name: 'game_slots',
      desc: '',
      args: [],
    );
  }

  /// `Real People`
  String get game_live {
    return Intl.message(
      'Real People',
      name: 'game_live',
      desc: '',
      args: [],
    );
  }

  /// `Daily bonus`
  String get vip_tab_bouns_day {
    return Intl.message(
      'Daily bonus',
      name: 'vip_tab_bouns_day',
      desc: '',
      args: [],
    );
  }

  /// `Weekly bonus`
  String get vip_tab_bouns_week {
    return Intl.message(
      'Weekly bonus',
      name: 'vip_tab_bouns_week',
      desc: '',
      args: [],
    );
  }

  /// `Monthly bonus`
  String get vip_tab_bouns_month {
    return Intl.message(
      'Monthly bonus',
      name: 'vip_tab_bouns_month',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get vip_tab_turnover {
    return Intl.message(
      'Status',
      name: 'vip_tab_turnover',
      desc: '',
      args: [],
    );
  }

  /// `VIP Rules Description`
  String get vip_rule_title {
    return Intl.message(
      'VIP Rules Description',
      name: 'vip_rule_title',
      desc: '',
      args: [],
    );
  }

  /// `1. Promotion criteria: If you meet the VIP promotion requirements (that is, all code requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses;\n\n2 . Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00 am every day; \n\n3. Weekly salary: If you meet the weekly salary requirements corresponding to the VIP level, you can receive the corresponding weekly bonus. Reset every Monday at 12:00 am; \n\n4. Monthly salary: If the monthly recharge and coding meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00 am on the 1st of each month; \n \n5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will be automatically downgraded by one level; \n\n6. Audit instructions: The bonus given by VIP needs to be rolled over 1 times. (i.e. auditing, coding or valid betting) can be withdrawn, and coding is not limited to game platforms; \n\n7. Activity statement: This function is limited to the account owner for normal game betting. Rental accounts, risk-free betting (vs. betting, etc.) are prohibited. Once verified, this platform has the right to terminate member login, suspend member's use of the website, and the right to confiscate bonuses and improper profits without special notice; \n\n8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform retains The right of final interpretation of this event.`
  String get vip_rule_content {
    return Intl.message(
      '1. Promotion criteria: If you meet the VIP promotion requirements (that is, all code requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses;\n\n2 . Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00 am every day; \n\n3. Weekly salary: If you meet the weekly salary requirements corresponding to the VIP level, you can receive the corresponding weekly bonus. Reset every Monday at 12:00 am; \n\n4. Monthly salary: If the monthly recharge and coding meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00 am on the 1st of each month; \n \n5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will be automatically downgraded by one level; \n\n6. Audit instructions: The bonus given by VIP needs to be rolled over 1 times. (i.e. auditing, coding or valid betting) can be withdrawn, and coding is not limited to game platforms; \n\n7. Activity statement: This function is limited to the account owner for normal game betting. Rental accounts, risk-free betting (vs. betting, etc.) are prohibited. Once verified, this platform has the right to terminate member login, suspend member\'s use of the website, and the right to confiscate bonuses and improper profits without special notice; \n\n8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform retains The right of final interpretation of this event.',
      name: 'vip_rule_content',
      desc: '',
      args: [],
    );
  }

  /// `Total amount received`
  String get vip_bouns_total {
    return Intl.message(
      'Total amount received',
      name: 'vip_bouns_total',
      desc: '',
      args: [],
    );
  }

  /// `Receipt Time`
  String get vip_bouns_history_tab_time {
    return Intl.message(
      'Receipt Time',
      name: 'vip_bouns_history_tab_time',
      desc: '',
      args: [],
    );
  }

  /// `Type of Receipt`
  String get vip_bouns_history_tab_type {
    return Intl.message(
      'Type of Receipt',
      name: 'vip_bouns_history_tab_type',
      desc: '',
      args: [],
    );
  }

  /// `Receiving Amount`
  String get vip_bouns_history_tab_amount {
    return Intl.message(
      'Receiving Amount',
      name: 'vip_bouns_history_tab_amount',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get date_past_today {
    return Intl.message(
      'Today',
      name: 'date_past_today',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 days`
  String get date_past_week {
    return Intl.message(
      'Last 7 days',
      name: 'date_past_week',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 days`
  String get date_past_month {
    return Intl.message(
      'Last 30 days',
      name: 'date_past_month',
      desc: '',
      args: [],
    );
  }

  /// `Promotion Criteria: If you meet the requirements for VIP promotion (that is, all requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses.`
  String get viprule_content_copy1 {
    return Intl.message(
      'Promotion Criteria: If you meet the requirements for VIP promotion (that is, all requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses.',
      name: 'viprule_content_copy1',
      desc: '',
      args: [],
    );
  }

  /// `1. Promotion criteria: If you meet the requirements for VIP promotion (that is, all coding requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses`
  String get viprule_content1 {
    return Intl.message(
      '1. Promotion criteria: If you meet the requirements for VIP promotion (that is, all coding requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses',
      name: 'viprule_content1',
      desc: '',
      args: [],
    );
  }

  /// `2. Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, reset at 12:00 am every day`
  String get viprule_content2 {
    return Intl.message(
      '2. Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, reset at 12:00 am every day',
      name: 'viprule_content2',
      desc: '',
      args: [],
    );
  }

  /// `3. Weekly salary: If you reach the VIP level corresponding to the weekly salary requirement, you can receive the corresponding weekly bonus, which will be reset every Monday at 12:00 am`
  String get viprule_content3 {
    return Intl.message(
      '3. Weekly salary: If you reach the VIP level corresponding to the weekly salary requirement, you can receive the corresponding weekly bonus, which will be reset every Monday at 12:00 am',
      name: 'viprule_content3',
      desc: '',
      args: [],
    );
  }

  /// `4. Monthly salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus. It will be reset at 12:00 am on the 1st of each month.`
  String get viprule_content4 {
    return Intl.message(
      '4. Monthly salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus. It will be reset at 12:00 am on the 1st of each month.',
      name: 'viprule_content4',
      desc: '',
      args: [],
    );
  }

  /// `5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will automatically be downgraded by one level`
  String get viprule_content5 {
    return Intl.message(
      '5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will automatically be downgraded by one level',
      name: 'viprule_content5',
      desc: '',
      args: [],
    );
  }

  /// `6. Audit instructions: The bonus given by VIP requires 1 times rollover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform`
  String get viprule_content6 {
    return Intl.message(
      '6. Audit instructions: The bonus given by VIP requires 1 times rollover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform',
      name: 'viprule_content6',
      desc: '',
      args: [],
    );
  }

  /// `7. Activity statement: This function is limited to normal game betting by the account owner. It is prohibited to rent an account, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, and use of agreements , loopholes, interfaces, group control or other technical means, once verified to be true, this platform has the right to terminate member login, suspend members' use of the website, and confiscate bonuses and improper profits without special notice.`
  String get viprule_content7 {
    return Intl.message(
      '7. Activity statement: This function is limited to normal game betting by the account owner. It is prohibited to rent an account, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, and use of agreements , loopholes, interfaces, group control or other technical means, once verified to be true, this platform has the right to terminate member login, suspend members\' use of the website, and confiscate bonuses and improper profits without special notice.',
      name: 'viprule_content7',
      desc: '',
      args: [],
    );
  }

  /// `8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform reserves the final right to interpret this event`
  String get viprule_content8 {
    return Intl.message(
      '8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform reserves the final right to interpret this event',
      name: 'viprule_content8',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get chaKanQuanBu {
    return Intl.message(
      'View All',
      name: 'chaKanQuanBu',
      desc: '',
      args: [],
    );
  }

  /// `Platform name`
  String get casinoplatformName {
    return Intl.message(
      'Platform name',
      name: 'casinoplatformName',
      desc: '',
      args: [],
    );
  }

  /// `Balance In`
  String get game_detail_yue {
    return Intl.message(
      'Balance In',
      name: 'game_detail_yue',
      desc: '',
      args: [],
    );
  }

  /// `The search requires at least 3 characters`
  String get game_category_search_standards {
    return Intl.message(
      'The search requires at least 3 characters',
      name: 'game_category_search_standards',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get game_Category_no_results {
    return Intl.message(
      'No results',
      name: 'game_Category_no_results',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get game_category_recent_search {
    return Intl.message(
      'Recent Searches',
      name: 'game_category_recent_search',
      desc: '',
      args: [],
    );
  }

  /// `Clear Search (`
  String get game_category_clear_seach_results {
    return Intl.message(
      'Clear Search (',
      name: 'game_category_clear_seach_results',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get game_category_check_all {
    return Intl.message(
      'View all',
      name: 'game_category_check_all',
      desc: '',
      args: [],
    );
  }

  /// `Place in maintenance`
  String get game_category_repair {
    return Intl.message(
      'Place in maintenance',
      name: 'game_category_repair',
      desc: '',
      args: [],
    );
  }

  /// `Loading failed x_x`
  String get image_load_error {
    return Intl.message(
      'Loading failed x_x',
      name: 'image_load_error',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get sport_event_list_sort_hot {
    return Intl.message(
      'Popular',
      name: 'sport_event_list_sort_hot',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get sport_event_list_sort_ab {
    return Intl.message(
      'All',
      name: 'sport_event_list_sort_ab',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get sport_event_list_over {
    return Intl.message(
      'Finished',
      name: 'sport_event_list_over',
      desc: '',
      args: [],
    );
  }

  /// `Start time: 60 seconds later`
  String get sport_event_list_time_sec_after {
    return Intl.message(
      'Start time: 60 seconds later',
      name: 'sport_event_list_time_sec_after',
      desc: '',
      args: [],
    );
  }

  /// `Start time: 60 minutes later`
  String get sport_event_list_time_min_after {
    return Intl.message(
      'Start time: 60 minutes later',
      name: 'sport_event_list_time_min_after',
      desc: '',
      args: [],
    );
  }

  /// `Start time: 60 hours later`
  String get sport_event_list_time_hour_after {
    return Intl.message(
      'Start time: 60 hours later',
      name: 'sport_event_list_time_hour_after',
      desc: '',
      args: [],
    );
  }

  /// `Displaying {two} of {one} games`
  String showingContentNow(Object two, Object one) {
    return Intl.message(
      'Displaying $two of $one games',
      name: 'showingContentNow',
      desc: '',
      args: [two, one],
    );
  }

  /// `View all {one} {two}`
  String homeChaKanQuanBu(Object one, Object two) {
    return Intl.message(
      'View all $one $two',
      name: 'homeChaKanQuanBu',
      desc: '',
      args: [one, two],
    );
  }

  /// `Failed to bind`
  String get bind_fail {
    return Intl.message(
      'Failed to bind',
      name: 'bind_fail',
      desc: '',
      args: [],
    );
  }

  /// `Start Betting Now!`
  String get sport_betting_begin_bet {
    return Intl.message(
      'Start Betting Now!',
      name: 'sport_betting_begin_bet',
      desc: '',
      args: [],
    );
  }

  /// `Handicap blocked`
  String get sport_locked {
    return Intl.message(
      'Handicap blocked',
      name: 'sport_locked',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get sport_event_list_begin_time {
    return Intl.message(
      'Start time',
      name: 'sport_event_list_begin_time',
      desc: '',
      args: [],
    );
  }

  /// `Closed handicap`
  String get sport_lock {
    return Intl.message(
      'Closed handicap',
      name: 'sport_lock',
      desc: '',
      args: [],
    );
  }

  /// `Feedback ID: `
  String get feedbacl_id_title {
    return Intl.message(
      'Feedback ID: ',
      name: 'feedbacl_id_title',
      desc: '',
      args: [],
    );
  }

  /// `Copied!`
  String get successfullyCopi {
    return Intl.message(
      'Copied!',
      name: 'successfullyCopi',
      desc: '',
      args: [],
    );
  }

  /// `The password has been updated`
  String get password_has_been_updated {
    return Intl.message(
      'The password has been updated',
      name: 'password_has_been_updated',
      desc: '',
      args: [],
    );
  }

  /// `Odds`
  String get menu_odds {
    return Intl.message(
      'Odds',
      name: 'menu_odds',
      desc: '',
      args: [],
    );
  }

  /// `Not connected`
  String get sport_unlogin {
    return Intl.message(
      'Not connected',
      name: 'sport_unlogin',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success_pwd {
    return Intl.message(
      'Success',
      name: 'success_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get reg_next {
    return Intl.message(
      'Continue',
      name: 'reg_next',
      desc: '',
      args: [],
    );
  }

  /// `Please include the “@” symbol in your email address`
  String get random_text_fix1 {
    return Intl.message(
      'Please include the “@” symbol in your email address',
      name: 'random_text_fix1',
      desc: '',
      args: [],
    );
  }

  /// `The email for reseting the password was sent`
  String get random_text_fix2 {
    return Intl.message(
      'The email for reseting the password was sent',
      name: 'random_text_fix2',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to end your session and log out?`
  String get random_text_fix3 {
    return Intl.message(
      'Are you sure you want to end your session and log out?',
      name: 'random_text_fix3',
      desc: '',
      args: [],
    );
  }

  /// `An account recovery email has been sent to \n`
  String get random_text_1 {
    return Intl.message(
      'An account recovery email has been sent to \n',
      name: 'random_text_1',
      desc: '',
      args: [],
    );
  }

  /// `The day cannot exceed 31`
  String get random_text_3 {
    return Intl.message(
      'The day cannot exceed 31',
      name: 'random_text_3',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get random_text_4 {
    return Intl.message(
      'Loading',
      name: 'random_text_4',
      desc: '',
      args: [],
    );
  }

  /// `Successfully registered`
  String get random_text_5 {
    return Intl.message(
      'Successfully registered',
      name: 'random_text_5',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree`
  String get random_text_6 {
    return Intl.message(
      'I have read and agree',
      name: 'random_text_6',
      desc: '',
      args: [],
    );
  }

  /// `Step 1/2: `
  String get random_text_8 {
    return Intl.message(
      'Step 1/2: ',
      name: 'random_text_8',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get random_text_9 {
    return Intl.message(
      'January',
      name: 'random_text_9',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get random_text_10 {
    return Intl.message(
      'February',
      name: 'random_text_10',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get random_text_11 {
    return Intl.message(
      'March',
      name: 'random_text_11',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get random_text_12 {
    return Intl.message(
      'April',
      name: 'random_text_12',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get random_text_13 {
    return Intl.message(
      'May',
      name: 'random_text_13',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get random_text_14 {
    return Intl.message(
      'June',
      name: 'random_text_14',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get random_text_15 {
    return Intl.message(
      'July',
      name: 'random_text_15',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get random_text_16 {
    return Intl.message(
      'August',
      name: 'random_text_16',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get random_text_17 {
    return Intl.message(
      'September',
      name: 'random_text_17',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get random_text_18 {
    return Intl.message(
      'October',
      name: 'random_text_18',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get random_text_19 {
    return Intl.message(
      'November',
      name: 'random_text_19',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get random_text_20 {
    return Intl.message(
      'December',
      name: 'random_text_20',
      desc: '',
      args: [],
    );
  }

  /// `Step 2/2 :\t\t Read and agree to the terms and conditions`
  String get random_text_21 {
    return Intl.message(
      'Step 2/2 :\t\t Read and agree to the terms and conditions',
      name: 'random_text_21',
      desc: '',
      args: [],
    );
  }

  /// `Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive a commission.`
  String get random_text_28 {
    return Intl.message(
      'Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive a commission.',
      name: 'random_text_28',
      desc: '',
      args: [],
    );
  }

  /// `As a meibo.com affiliate, the commission earned will be based on the recommended users' total bets at casinos and sportsbooks. The difference from traditional affiliate programs is that it doesn't matter if users win or lose, you will receive commission either way!`
  String get random_text_29 {
    return Intl.message(
      'As a meibo.com affiliate, the commission earned will be based on the recommended users\' total bets at casinos and sportsbooks. The difference from traditional affiliate programs is that it doesn\'t matter if users win or lose, you will receive commission either way!',
      name: 'random_text_29',
      desc: '',
      args: [],
    );
  }

  /// `Recommended link`
  String get random_text_30 {
    return Intl.message(
      'Recommended link',
      name: 'random_text_30',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get random_text_31 {
    return Intl.message(
      'Copy',
      name: 'random_text_31',
      desc: '',
      args: [],
    );
  }

  /// `At meibo.com, player satisfaction has been - and always will be - a top priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward our players and achieve player satisfaction through exclusive programs and events.`
  String get random_text_32 {
    return Intl.message(
      'At meibo.com, player satisfaction has been - and always will be - a top priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward our players and achieve player satisfaction through exclusive programs and events.',
      name: 'random_text_32',
      desc: '',
      args: [],
    );
  }

  /// `These programs provide additional funds and incentives that not only provide players with a better gaming experience but also help increase overall affiliate commission revenue.`
  String get random_text_33 {
    return Intl.message(
      'These programs provide additional funds and incentives that not only provide players with a better gaming experience but also help increase overall affiliate commission revenue.',
      name: 'random_text_33',
      desc: '',
      args: [],
    );
  }

  /// `The plan includes`
  String get random_text_34 {
    return Intl.message(
      'The plan includes',
      name: 'random_text_34',
      desc: '',
      args: [],
    );
  }

  /// `Rebate`
  String get random_text_35 {
    return Intl.message(
      'Rebate',
      name: 'random_text_35',
      desc: '',
      args: [],
    );
  }

  /// `Weekly bonus`
  String get random_text_36 {
    return Intl.message(
      'Weekly bonus',
      name: 'random_text_36',
      desc: '',
      args: [],
    );
  }

  /// `Monthly bonus`
  String get random_text_37 {
    return Intl.message(
      'Monthly bonus',
      name: 'random_text_37',
      desc: '',
      args: [],
    );
  }

  /// `Hourly/day deposit bonus`
  String get random_text_38 {
    return Intl.message(
      'Hourly/day deposit bonus',
      name: 'random_text_38',
      desc: '',
      args: [],
    );
  }

  /// `VIP Level Bonuses`
  String get random_text_39 {
    return Intl.message(
      'VIP Level Bonuses',
      name: 'random_text_39',
      desc: '',
      args: [],
    );
  }

  /// `Using this unique approach, your commission is based on the house edge after realizing these costs. Depending on the extent to which players benefit, the house edge commission you will receive will be approximately 45% lower than any game advertises.`
  String get random_text_40 {
    return Intl.message(
      'Using this unique approach, your commission is based on the house edge after realizing these costs. Depending on the extent to which players benefit, the house edge commission you will receive will be approximately 45% lower than any game advertises.',
      name: 'random_text_40',
      desc: '',
      args: [],
    );
  }

  /// `If you would like a detailed breakdown of fee calculations, please feel free to contact your affiliate manager through support.`
  String get random_text_41 {
    return Intl.message(
      'If you would like a detailed breakdown of fee calculations, please feel free to contact your affiliate manager through support.',
      name: 'random_text_41',
      desc: '',
      args: [],
    );
  }

  /// `The retention plan allows your referrals to be used in sportsbooks and casinos. However, the cost of the retention plan is absorbed before the affiliate commission for sports betting is calculated, allowing us to set the default profit margin of 3%.`
  String get random_text_42 {
    return Intl.message(
      'The retention plan allows your referrals to be used in sportsbooks and casinos. However, the cost of the retention plan is absorbed before the affiliate commission for sports betting is calculated, allowing us to set the default profit margin of 3%.',
      name: 'random_text_42',
      desc: '',
      args: [],
    );
  }

  /// `(o deposit)`
  String get random_text_44 {
    return Intl.message(
      '(o deposit)',
      name: 'random_text_44',
      desc: '',
      args: [],
    );
  }

  /// `Number of deposits`
  String get random_text_46 {
    return Intl.message(
      'Number of deposits',
      name: 'random_text_46',
      desc: '',
      args: [],
    );
  }

  /// `Agent level`
  String get random_text_47 {
    return Intl.message(
      'Agent level',
      name: 'random_text_47',
      desc: '',
      args: [],
    );
  }

  /// `Promotion conditions`
  String get random_text_48 {
    return Intl.message(
      'Promotion conditions',
      name: 'random_text_48',
      desc: '',
      args: [],
    );
  }

  /// `Joining Time`
  String get random_text_49 {
    return Intl.message(
      'Joining Time',
      name: 'random_text_49',
      desc: '',
      args: [],
    );
  }

  /// `Valid Bets`
  String get random_text_51 {
    return Intl.message(
      'Valid Bets',
      name: 'random_text_51',
      desc: '',
      args: [],
    );
  }

  /// `Valid Bets`
  String get random_text_51copy2 {
    return Intl.message(
      'Valid Bets',
      name: 'random_text_51copy2',
      desc: '',
      args: [],
    );
  }

  /// `Total Win and Loss`
  String get random_text_52 {
    return Intl.message(
      'Total Win and Loss',
      name: 'random_text_52',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get random_text_53 {
    return Intl.message(
      'Account',
      name: 'random_text_53',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Tutorial`
  String get random_text_54 {
    return Intl.message(
      'Promotional Tutorial',
      name: 'random_text_54',
      desc: '',
      args: [],
    );
  }

  /// `My Promotions`
  String get random_text_55 {
    return Intl.message(
      'My Promotions',
      name: 'random_text_55',
      desc: '',
      args: [],
    );
  }

  /// `My Commission`
  String get random_text_56 {
    return Intl.message(
      'My Commission',
      name: 'random_text_56',
      desc: '',
      args: [],
    );
  }

  /// `My Performance`
  String get random_text_57 {
    return Intl.message(
      'My Performance',
      name: 'random_text_57',
      desc: '',
      args: [],
    );
  }

  /// `All Data`
  String get random_text_58 {
    return Intl.message(
      'All Data',
      name: 'random_text_58',
      desc: '',
      args: [],
    );
  }

  /// `Direct Finance`
  String get random_text_59 {
    return Intl.message(
      'Direct Finance',
      name: 'random_text_59',
      desc: '',
      args: [],
    );
  }

  /// `Direct Betting`
  String get random_text_60 {
    return Intl.message(
      'Direct Betting',
      name: 'random_text_60',
      desc: '',
      args: [],
    );
  }

  /// `Direct User`
  String get random_text_61 {
    return Intl.message(
      'Direct User',
      name: 'random_text_61',
      desc: '',
      args: [],
    );
  }

  /// `Receive Directly`
  String get random_text_62 {
    return Intl.message(
      'Receive Directly',
      name: 'random_text_62',
      desc: '',
      args: [],
    );
  }

  /// `Commission Rate`
  String get random_text_63 {
    return Intl.message(
      'Commission Rate',
      name: 'random_text_63',
      desc: '',
      args: [],
    );
  }

  /// `New subagent`
  String get random_text_64 {
    return Intl.message(
      'New subagent',
      name: 'random_text_64',
      desc: '',
      args: [],
    );
  }

  /// `Basketball`
  String get random_text_65 {
    return Intl.message(
      'Basketball',
      name: 'random_text_65',
      desc: '',
      args: [],
    );
  }

  /// `Baseball`
  String get random_text_68 {
    return Intl.message(
      'Baseball',
      name: 'random_text_68',
      desc: '',
      args: [],
    );
  }

  /// `Badminton`
  String get random_text_69 {
    return Intl.message(
      'Badminton',
      name: 'random_text_69',
      desc: '',
      args: [],
    );
  }

  /// `Account: `
  String get random_text_71 {
    return Intl.message(
      'Account: ',
      name: 'random_text_71',
      desc: '',
      args: [],
    );
  }

  /// `Upper level ID`
  String get random_text_72 {
    return Intl.message(
      'Upper level ID',
      name: 'random_text_72',
      desc: '',
      args: [],
    );
  }

  /// `Direct member 111111`
  String get random_text_73 {
    return Intl.message(
      'Direct member 111111',
      name: 'random_text_73',
      desc: '',
      args: [],
    );
  }

  /// `Collectible`
  String get random_text_74 {
    return Intl.message(
      'Collectible',
      name: 'random_text_74',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get random_text_76 {
    return Intl.message(
      'Record',
      name: 'random_text_76',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_77 {
    return Intl.message(
      '',
      name: 'random_text_77',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_78 {
    return Intl.message(
      '',
      name: 'random_text_78',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_79 {
    return Intl.message(
      '',
      name: 'random_text_79',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_80 {
    return Intl.message(
      '',
      name: 'random_text_80',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_81 {
    return Intl.message(
      '',
      name: 'random_text_81',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_82 {
    return Intl.message(
      '',
      name: 'random_text_82',
      desc: '',
      args: [],
    );
  }

  /// `Fishing`
  String get random_text_84 {
    return Intl.message(
      'Fishing',
      name: 'random_text_84',
      desc: '',
      args: [],
    );
  }

  /// `Chess`
  String get random_text_85 {
    return Intl.message(
      'Chess',
      name: 'random_text_85',
      desc: '',
      args: [],
    );
  }

  /// `Classification`
  String get random_text_88 {
    return Intl.message(
      'Classification',
      name: 'random_text_88',
      desc: '',
      args: [],
    );
  }

  /// `Rebate amount`
  String get random_text_89 {
    return Intl.message(
      'Rebate amount',
      name: 'random_text_89',
      desc: '',
      args: [],
    );
  }

  /// `Number of Contributors`
  String get random_text_92 {
    return Intl.message(
      'Number of Contributors',
      name: 'random_text_92',
      desc: '',
      args: [],
    );
  }

  /// `Commission received successfully`
  String get random_text_94 {
    return Intl.message(
      'Commission received successfully',
      name: 'random_text_94',
      desc: '',
      args: [],
    );
  }

  /// `To your account`
  String get random_text_95 {
    return Intl.message(
      'To your account',
      name: 'random_text_95',
      desc: '',
      args: [],
    );
  }

  /// `Successfully received`
  String get random_text_96 {
    return Intl.message(
      'Successfully received',
      name: 'random_text_96',
      desc: '',
      args: [],
    );
  }

  /// `Receive comission`
  String get random_text_97 {
    return Intl.message(
      'Receive comission',
      name: 'random_text_97',
      desc: '',
      args: [],
    );
  }

  /// `Your current commission can be received`
  String get random_text_98 {
    return Intl.message(
      'Your current commission can be received',
      name: 'random_text_98',
      desc: '',
      args: [],
    );
  }

  /// `You can choose the currency you want to receive`
  String get random_text_99 {
    return Intl.message(
      'You can choose the currency you want to receive',
      name: 'random_text_99',
      desc: '',
      args: [],
    );
  }

  /// `Type of currency`
  String get random_text_100 {
    return Intl.message(
      'Type of currency',
      name: 'random_text_100',
      desc: '',
      args: [],
    );
  }

  /// `Receipt estimate`
  String get random_text_101 {
    return Intl.message(
      'Receipt estimate',
      name: 'random_text_101',
      desc: '',
      args: [],
    );
  }

  /// `Commission wallet and balance`
  String get random_text_102 {
    return Intl.message(
      'Commission wallet and balance',
      name: 'random_text_102',
      desc: '',
      args: [],
    );
  }

  /// `Exchange rate of the total amount`
  String get random_text_103 {
    return Intl.message(
      'Exchange rate of the total amount',
      name: 'random_text_103',
      desc: '',
      args: [],
    );
  }

  /// `Statistical Time`
  String get random_text_105 {
    return Intl.message(
      'Statistical Time',
      name: 'random_text_105',
      desc: '',
      args: [],
    );
  }

  /// `Number of bet slips`
  String get random_text_106 {
    return Intl.message(
      'Number of bet slips',
      name: 'random_text_106',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Amount`
  String get random_text_107 {
    return Intl.message(
      'Deposit Amount',
      name: 'random_text_107',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Amount`
  String get random_text_107_copy {
    return Intl.message(
      'Deposit Amount',
      name: 'random_text_107_copy',
      desc: '',
      args: [],
    );
  }

  /// `(number of times)`
  String get random_text_108 {
    return Intl.message(
      '(number of times)',
      name: 'random_text_108',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Amount`
  String get random_text_109 {
    return Intl.message(
      'Withdraw Amount',
      name: 'random_text_109',
      desc: '',
      args: [],
    );
  }

  /// `Difference between deposits and withdrawals`
  String get random_text_110 {
    return Intl.message(
      'Difference between deposits and withdrawals',
      name: 'random_text_110',
      desc: '',
      args: [],
    );
  }

  /// `(current balance)`
  String get random_text_111 {
    return Intl.message(
      '(current balance)',
      name: 'random_text_111',
      desc: '',
      args: [],
    );
  }

  /// `Statistics Date`
  String get random_text_112 {
    return Intl.message(
      'Statistics Date',
      name: 'random_text_112',
      desc: '',
      args: [],
    );
  }

  /// `Receive Amount`
  String get random_text_113 {
    return Intl.message(
      'Receive Amount',
      name: 'random_text_113',
      desc: '',
      args: [],
    );
  }

  /// `Cashback`
  String get random_text_114 {
    return Intl.message(
      'Cashback',
      name: 'random_text_114',
      desc: '',
      args: [],
    );
  }

  /// `Agent Commission`
  String get random_text_115 {
    return Intl.message(
      'Agent Commission',
      name: 'random_text_115',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get random_text_116 {
    return Intl.message(
      'Yes',
      name: 'random_text_116',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get random_text_117 {
    return Intl.message(
      'No',
      name: 'random_text_117',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get random_text_118 {
    return Intl.message(
      'Online',
      name: 'random_text_118',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get random_text_119 {
    return Intl.message(
      'Offline',
      name: 'random_text_119',
      desc: '',
      args: [],
    );
  }

  /// `Times`
  String get random_text_120 {
    return Intl.message(
      'Times',
      name: 'random_text_120',
      desc: '',
      args: [],
    );
  }

  /// `Times`
  String get random_text_120_copy {
    return Intl.message(
      'Times',
      name: 'random_text_120_copy',
      desc: '',
      args: [],
    );
  }

  /// `Is This Your First Deposit`
  String get random_text_121 {
    return Intl.message(
      'Is This Your First Deposit',
      name: 'random_text_121',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get random_text_122 {
    return Intl.message(
      'Last Login',
      name: 'random_text_122',
      desc: '',
      args: [],
    );
  }

  /// `Online Status`
  String get random_text_123 {
    return Intl.message(
      'Online Status',
      name: 'random_text_123',
      desc: '',
      args: [],
    );
  }

  /// `Number of times`
  String get random_text_124 {
    return Intl.message(
      'Number of times',
      name: 'random_text_124',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get random_text_125 {
    return Intl.message(
      'Sports',
      name: 'random_text_125',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get random_text_126 {
    return Intl.message(
      'View',
      name: 'random_text_126',
      desc: '',
      args: [],
    );
  }

  /// `Settlement Time`
  String get random_text_127 {
    return Intl.message(
      'Settlement Time',
      name: 'random_text_127',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get random_text_128 {
    return Intl.message(
      'Type',
      name: 'random_text_128',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get random_text_129 {
    return Intl.message(
      'Performance',
      name: 'random_text_129',
      desc: '',
      args: [],
    );
  }

  /// `Next page`
  String get random_text_132 {
    return Intl.message(
      'Next page',
      name: 'random_text_132',
      desc: '',
      args: [],
    );
  }

  /// `Search for:`
  String get random_text_133 {
    return Intl.message(
      'Search for:',
      name: 'random_text_133',
      desc: '',
      args: [],
    );
  }

  /// `Number of Subordinates`
  String get random_text_134 {
    return Intl.message(
      'Number of Subordinates',
      name: 'random_text_134',
      desc: '',
      args: [],
    );
  }

  /// `Contribute Commission`
  String get random_text_135 {
    return Intl.message(
      'Contribute Commission',
      name: 'random_text_135',
      desc: '',
      args: [],
    );
  }

  /// `WeChat`
  String get random_text_136 {
    return Intl.message(
      'WeChat',
      name: 'random_text_136',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated Commission`
  String get random_text_137 {
    return Intl.message(
      'Accumulated Commission',
      name: 'random_text_137',
      desc: '',
      args: [],
    );
  }

  /// `Received Commission`
  String get random_text_138 {
    return Intl.message(
      'Received Commission',
      name: 'random_text_138',
      desc: '',
      args: [],
    );
  }

  /// `Last Commission`
  String get random_text_139 {
    return Intl.message(
      'Last Commission',
      name: 'random_text_139',
      desc: '',
      args: [],
    );
  }

  /// `Team Number`
  String get random_text_140 {
    return Intl.message(
      'Team Number',
      name: 'random_text_140',
      desc: '',
      args: [],
    );
  }

  /// `1 person`
  String get random_text_141 {
    return Intl.message(
      '1 person',
      name: 'random_text_141',
      desc: '',
      args: [],
    );
  }

  /// `Direct Members`
  String get random_text_142 {
    return Intl.message(
      'Direct Members',
      name: 'random_text_142',
      desc: '',
      args: [],
    );
  }

  /// `Other Members`
  String get random_text_143 {
    return Intl.message(
      'Other Members',
      name: 'random_text_143',
      desc: '',
      args: [],
    );
  }

  /// `Direct Performance`
  String get random_text_144 {
    return Intl.message(
      'Direct Performance',
      name: 'random_text_144',
      desc: '',
      args: [],
    );
  }

  /// `Other Performance`
  String get random_text_145 {
    return Intl.message(
      'Other Performance',
      name: 'random_text_145',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate bets`
  String get random_text_146 {
    return Intl.message(
      'Subordinate bets',
      name: 'random_text_146',
      desc: '',
      args: [],
    );
  }

  /// `Effective value of the bet`
  String get random_text_147 {
    return Intl.message(
      'Effective value of the bet',
      name: 'random_text_147',
      desc: '',
      args: [],
    );
  }

  /// `Total Bet Slips`
  String get random_text_148 {
    return Intl.message(
      'Total Bet Slips',
      name: 'random_text_148',
      desc: '',
      args: [],
    );
  }

  /// `999,999,999 orders`
  String get random_text_149 {
    return Intl.message(
      '999,999,999 orders',
      name: 'random_text_149',
      desc: '',
      args: [],
    );
  }

  /// `Total Loss/Win`
  String get random_text_150 {
    return Intl.message(
      'Total Loss/Win',
      name: 'random_text_150',
      desc: '',
      args: [],
    );
  }

  /// `Copied!`
  String get random_text_151 {
    return Intl.message(
      'Copied!',
      name: 'random_text_151',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Information`
  String get random_text_152 {
    return Intl.message(
      'Promotional Information',
      name: 'random_text_152',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get random_text_153 {
    return Intl.message(
      'More',
      name: 'random_text_153',
      desc: '',
      args: [],
    );
  }

  /// `Click to Save the QR Code`
  String get random_text_154 {
    return Intl.message(
      'Click to Save the QR Code',
      name: 'random_text_154',
      desc: '',
      args: [],
    );
  }

  /// `My link`
  String get random_text_155 {
    return Intl.message(
      'My link',
      name: 'random_text_155',
      desc: '',
      args: [],
    );
  }

  /// `Click here`
  String get random_text_156 {
    return Intl.message(
      'Click here',
      name: 'random_text_156',
      desc: '',
      args: [],
    );
  }

  /// `Total Performance`
  String get random_text_157 {
    return Intl.message(
      'Total Performance',
      name: 'random_text_157',
      desc: '',
      args: [],
    );
  }

  /// `1.01 million`
  String get random_text_158 {
    return Intl.message(
      '1.01 million',
      name: 'random_text_158',
      desc: '',
      args: [],
    );
  }

  /// `, general agent bonus`
  String get random_text_159 {
    return Intl.message(
      ', general agent bonus',
      name: 'random_text_159',
      desc: '',
      args: [],
    );
  }

  /// `160K`
  String get random_text_160 {
    return Intl.message(
      '160K',
      name: 'random_text_160',
      desc: '',
      args: [],
    );
  }

  /// `, contribution`
  String get random_text_161 {
    return Intl.message(
      ', contribution',
      name: 'random_text_161',
      desc: '',
      args: [],
    );
  }

  /// `850K`
  String get random_text_162 {
    return Intl.message(
      '850K',
      name: 'random_text_162',
      desc: '',
      args: [],
    );
  }

  /// `Direct under`
  String get random_text_163 {
    return Intl.message(
      'Direct under',
      name: 'random_text_163',
      desc: '',
      args: [],
    );
  }

  /// `Contribute to`
  String get random_text_164 {
    return Intl.message(
      'Contribute to',
      name: 'random_text_164',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get random_text_166 {
    return Intl.message(
      ' and ',
      name: 'random_text_166',
      desc: '',
      args: [],
    );
  }

  /// `Total performance of subordinates`
  String get random_text_167 {
    return Intl.message(
      'Total performance of subordinates',
      name: 'random_text_167',
      desc: '',
      args: [],
    );
  }

  /// `140K \n`
  String get random_text_168 {
    return Intl.message(
      '140K \n',
      name: 'random_text_168',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy`
  String get random_text_169 {
    return Intl.message(
      'Enjoy',
      name: 'random_text_169',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_170 {
    return Intl.message(
      '',
      name: 'random_text_170',
      desc: '',
      args: [],
    );
  }

  /// `B1 has a valid bet of 80K`
  String get random_text_171 {
    return Intl.message(
      'B1 has a valid bet of 80K',
      name: 'random_text_171',
      desc: '',
      args: [],
    );
  }

  /// `Examples as follows:`
  String get random_text_172 {
    return Intl.message(
      'Examples as follows:',
      name: 'random_text_172',
      desc: '',
      args: [],
    );
  }

  /// `Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3. A few days later, B1's effective bet was 80,000, B2's effective bet was 50,000, B3's effective bet was 30,000 and C1's effective bet is 100,000, C2's effective bet is 40,000, and C3's effective bet is 710,000, so B1's total performance comes from C1 and C2, which is 140,000, and the corresponding discount proportion is 80/10,000; B2's performance without subordinates is 0; the subordinate C3 of B3 is very powerful, with a total performance of 710,000, and the corresponding discount ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams, with a total performance of 1.01 million, and the corresponding discount rate is 1 million/10,000. Then the revenue between them is calculated as follows:`
  String get random_text_173 {
    return Intl.message(
      'Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3. A few days later, B1\'s effective bet was 80,000, B2\'s effective bet was 50,000, B3\'s effective bet was 30,000 and C1\'s effective bet is 100,000, C2\'s effective bet is 40,000, and C3\'s effective bet is 710,000, so B1\'s total performance comes from C1 and C2, which is 140,000, and the corresponding discount proportion is 80/10,000; B2\'s performance without subordinates is 0; the subordinate C3 of B3 is very powerful, with a total performance of 710,000, and the corresponding discount ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams, with a total performance of 1.01 million, and the corresponding discount rate is 1 million/10,000. Then the revenue between them is calculated as follows:',
      name: 'random_text_173',
      desc: '',
      args: [],
    );
  }

  /// `1. Direct team:`
  String get random_text_174 {
    return Intl.message(
      '1. Direct team:',
      name: 'random_text_174',
      desc: '',
      args: [],
    );
  }

  /// `Examples as follows: \n`
  String get random_text_175 {
    return Intl.message(
      'Examples as follows: \n',
      name: 'random_text_175',
      desc: '',
      args: [],
    );
  }

  /// `Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3.\nA few days later, B1's effective bet was 80K, B2's effective bet was 50K, B3's effective bet was of 30K and C1 My effective bet is 100K, C2's effective bet is 40K, C3's effective bet is 710K, so B1's total performance comes from C1 and C2 totaling 140K, and the corresponding discount ratio is 800K/10K ; B2 has no subordinates Performance is 0; B3's subordinate C3 is amazing, with a total performance of 710K, and the corresponding discount ratio is 1M/10K; A has 160K from the direct team and 850K from other teams, the total performance is 1.01 million and the corresponding discount ratio is 1M/10K.\nThen the income between them is calculated as follows:\n\n1,`
  String get random_text_176 {
    return Intl.message(
      'Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3.\nA few days later, B1\'s effective bet was 80K, B2\'s effective bet was 50K, B3\'s effective bet was of 30K and C1 My effective bet is 100K, C2\'s effective bet is 40K, C3\'s effective bet is 710K, so B1\'s total performance comes from C1 and C2 totaling 140K, and the corresponding discount ratio is 800K/10K ; B2 has no subordinates Performance is 0; B3\'s subordinate C3 is amazing, with a total performance of 710K, and the corresponding discount ratio is 1M/10K; A has 160K from the direct team and 850K from other teams, the total performance is 1.01 million and the corresponding discount ratio is 1M/10K.\nThen the income between them is calculated as follows:\n\n1,',
      name: 'random_text_176',
      desc: '',
      args: [],
    );
  }

  /// `Direct Team`
  String get random_text_177 {
    return Intl.message(
      'Direct Team',
      name: 'random_text_177',
      desc: '',
      args: [],
    );
  }

  /// `: \nRefers to vertically developed members, uniformly called direct teams.\n(1) B1, B2, B3 contribute to A: (80K+50K+30K)x1M/10K=1600.\n (2) C1 and C2 contributes to B1: (100K + 40K)x800K/10K=1120.\n(3) C3 contributes to B3: 710Kx1M/10K=7100.\n\n2,`
  String get random_text_178 {
    return Intl.message(
      ': \nRefers to vertically developed members, uniformly called direct teams.\n(1) B1, B2, B3 contribute to A: (80K+50K+30K)x1M/10K=1600.\n (2) C1 and C2 contributes to B1: (100K + 40K)x800K/10K=1120.\n(3) C3 contributes to B3: 710Kx1M/10K=7100.\n\n2,',
      name: 'random_text_178',
      desc: '',
      args: [],
    );
  }

  /// `Other Teams`
  String get random_text_179 {
    return Intl.message(
      'Other Teams',
      name: 'random_text_179',
      desc: '',
      args: [],
    );
  }

  /// `:\nRefers to members of subordinates, subordinates, subordinates, etc., who are collectively called other teams; Since this system can develop subordinates infinitely, for the convenience of explanation, this article only considers the 2-level structure as an example. .\n(1) From C1 and C2: Because B1 has a total performance of 140K and enjoys a discount rate of only 800K/10K, while A has a total performance of 1.01 million and enjoys a discount rate of 1 million/ten thousand, then the relationship between A and B1 The discount difference generated is: 100-80 = 20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100K+ 40K)×20/10K=280. \n(2) From C3: As B3 has total sales of 710K and enjoys a discount rate of 1 million/10 thousand, and A has total sales of 1.01 million and enjoys a discount rate of 1 million/10 thousand, then the discount difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710Kx0/10K=0.\n\n`
  String get random_text_180 {
    return Intl.message(
      ':\nRefers to members of subordinates, subordinates, subordinates, etc., who are collectively called other teams; Since this system can develop subordinates infinitely, for the convenience of explanation, this article only considers the 2-level structure as an example. .\n(1) From C1 and C2: Because B1 has a total performance of 140K and enjoys a discount rate of only 800K/10K, while A has a total performance of 1.01 million and enjoys a discount rate of 1 million/ten thousand, then the relationship between A and B1 The discount difference generated is: 100-80 = 20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100K+ 40K)×20/10K=280. \n(2) From C3: As B3 has total sales of 710K and enjoys a discount rate of 1 million/10 thousand, and A has total sales of 1.01 million and enjoys a discount rate of 1 million/10 thousand, then the discount difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710Kx0/10K=0.\n\n',
      name: 'random_text_180',
      desc: '',
      args: [],
    );
  }

  /// `3. Summary:\n`
  String get random_text_181 {
    return Intl.message(
      '3. Summary:\n',
      name: 'random_text_181',
      desc: '',
      args: [],
    );
  }

  /// `(1)C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all his performance.\n(2)B2 may be lazy and not develop subordinates, so there is no profit.\n(3) B3 although he joined late in the comparison and belongs to A's subordinate, but his subordinate C3 is powerful, allowing B3 to directly enjoy a higher commission rate. Therefore, it doesn't matter when B3 joins, who he is subordinate to, it doesn't matter At whatever level it is in effect, income will never be affected. No matter how much you suffer at the expense of other people's subordinates, your development will not be restricted.\n(4) This is an absolutely fair and just agency model, and no one will do it. being trampled on forever just because you came in late.`
  String get random_text_182 {
    return Intl.message(
      '(1)C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all his performance.\n(2)B2 may be lazy and not develop subordinates, so there is no profit.\n(3) B3 although he joined late in the comparison and belongs to A\'s subordinate, but his subordinate C3 is powerful, allowing B3 to directly enjoy a higher commission rate. Therefore, it doesn\'t matter when B3 joins, who he is subordinate to, it doesn\'t matter At whatever level it is in effect, income will never be affected. No matter how much you suffer at the expense of other people\'s subordinates, your development will not be restricted.\n(4) This is an absolutely fair and just agency model, and no one will do it. being trampled on forever just because you came in late.',
      name: 'random_text_182',
      desc: '',
      args: [],
    );
  }

  /// `Type member account number`
  String get random_text_183 {
    return Intl.message(
      'Type member account number',
      name: 'random_text_183',
      desc: '',
      args: [],
    );
  }

  /// `Submit registration`
  String get random_text_185 {
    return Intl.message(
      'Submit registration',
      name: 'random_text_185',
      desc: '',
      args: [],
    );
  }

  /// `Search by account`
  String get random_text_186 {
    return Intl.message(
      'Search by account',
      name: 'random_text_186',
      desc: '',
      args: [],
    );
  }

  /// `Select time`
  String get random_text_187 {
    return Intl.message(
      'Select time',
      name: 'random_text_187',
      desc: '',
      args: [],
    );
  }

  /// `All Types`
  String get random_text_188 {
    return Intl.message(
      'All Types',
      name: 'random_text_188',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated commission:`
  String get random_text_189 {
    return Intl.message(
      'Accumulated commission:',
      name: 'random_text_189',
      desc: '',
      args: [],
    );
  }

  /// `Page/`
  String get random_text_191 {
    return Intl.message(
      'Page/',
      name: 'random_text_191',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get random_text_192 {
    return Intl.message(
      'Page',
      name: 'random_text_192',
      desc: '',
      args: [],
    );
  }

  /// `Skip to`
  String get random_text_194 {
    return Intl.message(
      'Skip to',
      name: 'random_text_194',
      desc: '',
      args: [],
    );
  }

  /// `Content number`
  String get random_text_196 {
    return Intl.message(
      'Content number',
      name: 'random_text_196',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 3 characters`
  String get random_text_197 {
    return Intl.message(
      'Minimum 3 characters',
      name: 'random_text_197',
      desc: '',
      args: [],
    );
  }

  /// `Available commission:`
  String get random_text_198 {
    return Intl.message(
      'Available commission:',
      name: 'random_text_198',
      desc: '',
      args: [],
    );
  }

  /// `Activity clicks`
  String get random_text_199 {
    return Intl.message(
      'Activity clicks',
      name: 'random_text_199',
      desc: '',
      args: [],
    );
  }

  /// `Available Amount`
  String get random_text_200 {
    return Intl.message(
      'Available Amount',
      name: 'random_text_200',
      desc: '',
      args: [],
    );
  }

  /// `Financing available`
  String get random_text_201 {
    return Intl.message(
      'Financing available',
      name: 'random_text_201',
      desc: '',
      args: [],
    );
  }

  /// `All of our games come with different house edge percentages. You can use the following formula to calculate your commission:`
  String get random_text_203 {
    return Intl.message(
      'All of our games come with different house edge percentages. You can use the following formula to calculate your commission:',
      name: 'random_text_203',
      desc: '',
      args: [],
    );
  }

  /// `All sports bets are placed with a theoretical house edge of 3%. You can use the following formula to calculate your commission:`
  String get random_text_204 {
    return Intl.message(
      'All sports bets are placed with a theoretical house edge of 3%. You can use the following formula to calculate your commission:',
      name: 'random_text_204',
      desc: '',
      args: [],
    );
  }

  /// `If you are an affiliate with great influence and can reach a large number of people, or are in other special circumstances, please contact our outstanding support team. After discussion with the affiliate manager, we can try to customize an affiliate program for you. This may include higher commissions.`
  String get random_text_205 {
    return Intl.message(
      'If you are an affiliate with great influence and can reach a large number of people, or are in other special circumstances, please contact our outstanding support team. After discussion with the affiliate manager, we can try to customize an affiliate program for you. This may include higher commissions.',
      name: 'random_text_205',
      desc: '',
      args: [],
    );
  }

  /// `At meibo.com, player satisfaction has been - and always will be - the number one priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward and satisfy our players through exclusive programs and events.\nThese programs provide additional funds and rewards, which not only provide a better gaming experience for players, but also help increase affiliate commissions. Total Income.\nThe plan includes:\nDiscounts\nWeekly Bonuses\nMonthly Bonuses\nDaily/Hourly Reload Bonuses\nVIP Level Bonuses\nWith this unique method, your commission is to achieve these costs Based on the final house edge. Depending on the extent to which players receive benefits, the house edge commission you receive will be approximately less than 45% of the advertised house edge for any given game.\nIf you would like a detailed breakdown of fee calculations, please feel free to contact the affiliate manager through support.`
  String get random_text_206 {
    return Intl.message(
      'At meibo.com, player satisfaction has been - and always will be - the number one priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward and satisfy our players through exclusive programs and events.\nThese programs provide additional funds and rewards, which not only provide a better gaming experience for players, but also help increase affiliate commissions. Total Income.\nThe plan includes:\nDiscounts\nWeekly Bonuses\nMonthly Bonuses\nDaily/Hourly Reload Bonuses\nVIP Level Bonuses\nWith this unique method, your commission is to achieve these costs Based on the final house edge. Depending on the extent to which players receive benefits, the house edge commission you receive will be approximately less than 45% of the advertised house edge for any given game.\nIf you would like a detailed breakdown of fee calculations, please feel free to contact the affiliate manager through support.',
      name: 'random_text_206',
      desc: '',
      args: [],
    );
  }

  /// `Meow meow meow`
  String get random_text_207 {
    return Intl.message(
      'Meow meow meow',
      name: 'random_text_207',
      desc: '',
      args: [],
    );
  }

  /// `Total deposits`
  String get random_text_209 {
    return Intl.message(
      'Total deposits',
      name: 'random_text_209',
      desc: '',
      args: [],
    );
  }

  /// `Financing available \n2023-08-22`
  String get random_text_210 {
    return Intl.message(
      'Financing available \n2023-08-22',
      name: 'random_text_210',
      desc: '',
      args: [],
    );
  }

  /// `Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive an affiliate commission. \nAs an affiliate, the commission earned will be based on the recommended users' total bets on casino games and sports betting. The difference with traditional affiliate programs is that you can earn the same commission regardless of whether the referred user wins or loses!`
  String get random_text_211 {
    return Intl.message(
      'Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive an affiliate commission. \nAs an affiliate, the commission earned will be based on the recommended users\' total bets on casino games and sports betting. The difference with traditional affiliate programs is that you can earn the same commission regardless of whether the referred user wins or loses!',
      name: 'random_text_211',
      desc: '',
      args: [],
    );
  }

  /// `Download banner`
  String get random_text_212 {
    return Intl.message(
      'Download banner',
      name: 'random_text_212',
      desc: '',
      args: [],
    );
  }

  /// `There are no unsettled bets`
  String get random_text_216 {
    return Intl.message(
      'There are no unsettled bets',
      name: 'random_text_216',
      desc: '',
      args: [],
    );
  }

  /// `Start Betting Now!`
  String get random_text_217 {
    return Intl.message(
      'Start Betting Now!',
      name: 'random_text_217',
      desc: '',
      args: [],
    );
  }

  /// `Start the game now!`
  String get betting_casino_begin_game {
    return Intl.message(
      'Start the game now!',
      name: 'betting_casino_begin_game',
      desc: '',
      args: [],
    );
  }

  /// `No bets settled`
  String get random_text_218 {
    return Intl.message(
      'No bets settled',
      name: 'random_text_218',
      desc: '',
      args: [],
    );
  }

  /// `Payout`
  String get random_text_220 {
    return Intl.message(
      'Payout',
      name: 'random_text_220',
      desc: '',
      args: [],
    );
  }

  /// `Payout`
  String get random_text_220copy {
    return Intl.message(
      'Payout',
      name: 'random_text_220copy',
      desc: '',
      args: [],
    );
  }

  /// `There Are No Casino Bets Yet`
  String get random_text_221 {
    return Intl.message(
      'There Are No Casino Bets Yet',
      name: 'random_text_221',
      desc: '',
      args: [],
    );
  }

  /// `At the`
  String get random_text_223 {
    return Intl.message(
      'At the',
      name: 'random_text_223',
      desc: '',
      args: [],
    );
  }

  /// `Multiplier`
  String get random_text_224 {
    return Intl.message(
      'Multiplier',
      name: 'random_text_224',
      desc: '',
      args: [],
    );
  }

  /// `Play `
  String get random_text_225 {
    return Intl.message(
      'Play ',
      name: 'random_text_225',
      desc: '',
      args: [],
    );
  }

  /// `Bet Amount`
  String get random_text_227 {
    return Intl.message(
      'Bet Amount',
      name: 'random_text_227',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Payment`
  String get random_text_228 {
    return Intl.message(
      'Estimated Payment',
      name: 'random_text_228',
      desc: '',
      args: [],
    );
  }

  /// `Money`
  String get random_text_229 {
    return Intl.message(
      'Money',
      name: 'random_text_229',
      desc: '',
      args: [],
    );
  }

  /// `Draw`
  String get random_text_232 {
    return Intl.message(
      'Draw',
      name: 'random_text_232',
      desc: '',
      args: [],
    );
  }

  /// `Win half`
  String get random_text_233 {
    return Intl.message(
      'Win half',
      name: 'random_text_233',
      desc: '',
      args: [],
    );
  }

  /// `Lose half`
  String get random_text_234 {
    return Intl.message(
      'Lose half',
      name: 'random_text_234',
      desc: '',
      args: [],
    );
  }

  /// `Lose part`
  String get random_text_235 {
    return Intl.message(
      'Lose part',
      name: 'random_text_235',
      desc: '',
      args: [],
    );
  }

  /// `Place by:`
  String get random_text_237 {
    return Intl.message(
      'Place by:',
      name: 'random_text_237',
      desc: '',
      args: [],
    );
  }

  /// `Hidden`
  String get random_text_238 {
    return Intl.message(
      'Hidden',
      name: 'random_text_238',
      desc: '',
      args: [],
    );
  }

  /// `Register to place bets`
  String get random_text_239 {
    return Intl.message(
      'Register to place bets',
      name: 'random_text_239',
      desc: '',
      args: [],
    );
  }

  /// `Bet Slip is Empty`
  String get random_text_241 {
    return Intl.message(
      'Bet Slip is Empty',
      name: 'random_text_241',
      desc: '',
      args: [],
    );
  }

  /// `Amount between`
  String get random_text_243 {
    return Intl.message(
      'Amount between',
      name: 'random_text_243',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get random_text_244 {
    return Intl.message(
      'of',
      name: 'random_text_244',
      desc: '',
      args: [],
    );
  }

  /// `This game does not support the currency you selected`
  String get random_text_245 {
    return Intl.message(
      'This game does not support the currency you selected',
      name: 'random_text_245',
      desc: '',
      args: [],
    );
  }

  /// `You have a suspended bet`
  String get random_text_246 {
    return Intl.message(
      'You have a suspended bet',
      name: 'random_text_246',
      desc: '',
      args: [],
    );
  }

  /// `A maximum of 10 bets can be selected at the same time`
  String get random_text_247 {
    return Intl.message(
      'A maximum of 10 bets can be selected at the same time',
      name: 'random_text_247',
      desc: '',
      args: [],
    );
  }

  /// `You have closed bets`
  String get random_text_248 {
    return Intl.message(
      'You have closed bets',
      name: 'random_text_248',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient account balance`
  String get random_text_249 {
    return Intl.message(
      'Insufficient account balance',
      name: 'random_text_249',
      desc: '',
      args: [],
    );
  }

  /// `Failed to obtain betting information`
  String get random_text_250 {
    return Intl.message(
      'Failed to obtain betting information',
      name: 'random_text_250',
      desc: '',
      args: [],
    );
  }

  /// `You have bets that do not support multiple bets`
  String get random_text_251 {
    return Intl.message(
      'You have bets that do not support multiple bets',
      name: 'random_text_251',
      desc: '',
      args: [],
    );
  }

  /// `Multiple bets cannot be combined on the same event`
  String get random_text_252 {
    return Intl.message(
      'Multiple bets cannot be combined on the same event',
      name: 'random_text_252',
      desc: '',
      args: [],
    );
  }

  /// `Vietnam - Netherlands`
  String get random_text_253 {
    return Intl.message(
      'Vietnam - Netherlands',
      name: 'random_text_253',
      desc: '',
      args: [],
    );
  }

  /// `Win`
  String get random_text_254 {
    return Intl.message(
      'Win',
      name: 'random_text_254',
      desc: '',
      args: [],
    );
  }

  /// `Netherlands`
  String get random_text_255 {
    return Intl.message(
      'Netherlands',
      name: 'random_text_255',
      desc: '',
      args: [],
    );
  }

  /// `Wins/losses/draws`
  String get random_text_256 {
    return Intl.message(
      'Wins/losses/draws',
      name: 'random_text_256',
      desc: '',
      args: [],
    );
  }

  /// `Chat Rules`
  String get random_text_257 {
    return Intl.message(
      'Chat Rules',
      name: 'random_text_257',
      desc: '',
      args: [],
    );
  }

  /// `1. Do not spam chat and avoid using capital letters.\n2. Do not harass or offend other users and Stake staff. \n3. Do not share anything personal about yourself or other players' information (including social media accounts)\n4. Do not ask other users for money or loans, or send red envelopes or tips. \n5. Chatting using any account other than your main account is strictly prohibited. \n6. Suspected fraud behavior is not permitted. \n7. Do not engage in any form of advertising, negotiation, sale, purchase, provision of services, among others. \n8. Don't argue about streamers, Twitch or any other similar platform. \n9. Don't use shortened URLs. Make sure you send the full link. \n10. Do not share code, scripts or any bots for the Service. \n11. Chat only in the specified language in the chat room. \n12 . Discussion of political and religious topics is strictly prohibited.`
  String get random_text_258 {
    return Intl.message(
      '1. Do not spam chat and avoid using capital letters.\n2. Do not harass or offend other users and Stake staff. \n3. Do not share anything personal about yourself or other players\' information (including social media accounts)\n4. Do not ask other users for money or loans, or send red envelopes or tips. \n5. Chatting using any account other than your main account is strictly prohibited. \n6. Suspected fraud behavior is not permitted. \n7. Do not engage in any form of advertising, negotiation, sale, purchase, provision of services, among others. \n8. Don\'t argue about streamers, Twitch or any other similar platform. \n9. Don\'t use shortened URLs. Make sure you send the full link. \n10. Do not share code, scripts or any bots for the Service. \n11. Chat only in the specified language in the chat room. \n12 . Discussion of political and religious topics is strictly prohibited.',
      name: 'random_text_258',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get random_text_260 {
    return Intl.message(
      'Recent',
      name: 'random_text_260',
      desc: '',
      args: [],
    );
  }

  /// `1,000 playing`
  String get random_text_263 {
    return Intl.message(
      '1,000 playing',
      name: 'random_text_263',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get random_text_265 {
    return Intl.message(
      'Featured',
      name: 'random_text_265',
      desc: '',
      args: [],
    );
  }

  /// `Race Leaderboard`
  String get random_text_268 {
    return Intl.message(
      'Race Leaderboard',
      name: 'random_text_268',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_272 {
    return Intl.message(
      '',
      name: 'random_text_272',
      desc: '',
      args: [],
    );
  }

  /// `Big Wins`
  String get random_text_273 {
    return Intl.message(
      'Big Wins',
      name: 'random_text_273',
      desc: '',
      args: [],
    );
  }

  /// `Lucky Wins`
  String get random_text_274 {
    return Intl.message(
      'Lucky Wins',
      name: 'random_text_274',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no active challenges for Wanted Dead or Wild`
  String get random_text_275 {
    return Intl.message(
      'There are currently no active challenges for Wanted Dead or Wild',
      name: 'random_text_275',
      desc: '',
      args: [],
    );
  }

  /// `House Advantage:`
  String get random_text_276 {
    return Intl.message(
      'House Advantage:',
      name: 'random_text_276',
      desc: '',
      args: [],
    );
  }

  /// `Baccarat`
  String get random_text_277 {
    return Intl.message(
      'Baccarat',
      name: 'random_text_277',
      desc: '',
      args: [],
    );
  }

  /// `Table Games`
  String get random_text_279 {
    return Intl.message(
      'Table Games',
      name: 'random_text_279',
      desc: '',
      args: [],
    );
  }

  /// `$100k Race - 24 Hours`
  String get random_text_280 {
    return Intl.message(
      '\$100k Race - 24 Hours',
      name: 'random_text_280',
      desc: '',
      args: [],
    );
  }

  /// `End: in 8 hours`
  String get random_text_281 {
    return Intl.message(
      'End: in 8 hours',
      name: 'random_text_281',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get random_text_282 {
    return Intl.message(
      'Rank',
      name: 'random_text_282',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get random_text_286 {
    return Intl.message(
      'Event',
      name: 'random_text_286',
      desc: '',
      args: [],
    );
  }

  /// `Bet smarter`
  String get random_text_287 {
    return Intl.message(
      'Bet smarter',
      name: 'random_text_287',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get random_text_288 {
    return Intl.message(
      'Sign up now',
      name: 'random_text_288',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get random_text_290 {
    return Intl.message(
      'Welcome back',
      name: 'random_text_290',
      desc: '',
      args: [],
    );
  }

  /// `Weekly prizes of $ 75K`
  String get random_text_296 {
    return Intl.message(
      'Weekly prizes of \$ 75K',
      name: 'random_text_296',
      desc: '',
      args: [],
    );
  }

  /// `$100K contest - 24 hours`
  String get random_text_297 {
    return Intl.message(
      '\$100K contest - 24 hours',
      name: 'random_text_297',
      desc: '',
      args: [],
    );
  }

  /// `Pragmatic Airdrop Bonus`
  String get random_text_298 {
    return Intl.message(
      'Pragmatic Airdrop Bonus',
      name: 'random_text_298',
      desc: '',
      args: [],
    );
  }

  /// `Alfa Romeo F1 Team`
  String get random_text_300 {
    return Intl.message(
      'Alfa Romeo F1 Team',
      name: 'random_text_300',
      desc: '',
      args: [],
    );
  }

  /// `Everton F.C.`
  String get random_text_301 {
    return Intl.message(
      'Everton F.C.',
      name: 'random_text_301',
      desc: '',
      args: [],
    );
  }

  /// `Kun Agüero`
  String get random_text_302 {
    return Intl.message(
      'Kun Agüero',
      name: 'random_text_302',
      desc: '',
      args: [],
    );
  }

  /// `Israel Adesanya`
  String get random_text_303 {
    return Intl.message(
      'Israel Adesanya',
      name: 'random_text_303',
      desc: '',
      args: [],
    );
  }

  /// `Jailton Almeida`
  String get random_text_304 {
    return Intl.message(
      'Jailton Almeida',
      name: 'random_text_304',
      desc: '',
      args: [],
    );
  }

  /// `Volleyball Nations League`
  String get random_text_305 {
    return Intl.message(
      'Volleyball Nations League',
      name: 'random_text_305',
      desc: '',
      args: [],
    );
  }

  /// `: Chinese`
  String get random_text_306 {
    return Intl.message(
      ': Chinese',
      name: 'random_text_306',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get random_text_307 {
    return Intl.message(
      'Chinese',
      name: 'random_text_307',
      desc: '',
      args: [],
    );
  }

  /// `Club Friendlies`
  String get random_text_308 {
    return Intl.message(
      'Club Friendlies',
      name: 'random_text_308',
      desc: '',
      args: [],
    );
  }

  /// `FIFA Women's Football World Cup`
  String get random_text_309 {
    return Intl.message(
      'FIFA Women\'s Football World Cup',
      name: 'random_text_309',
      desc: '',
      args: [],
    );
  }

  /// `WTA Osaka singles`
  String get random_text_310 {
    return Intl.message(
      'WTA Osaka singles',
      name: 'random_text_310',
      desc: '',
      args: [],
    );
  }

  /// `Davis Cup Tennis Championship`
  String get random_text_311 {
    return Intl.message(
      'Davis Cup Tennis Championship',
      name: 'random_text_311',
      desc: '',
      args: [],
    );
  }

  /// `Major League Baseball`
  String get random_text_312 {
    return Intl.message(
      'Major League Baseball',
      name: 'random_text_312',
      desc: '',
      args: [],
    );
  }

  /// `KBO League`
  String get random_text_313 {
    return Intl.message(
      'KBO League',
      name: 'random_text_313',
      desc: '',
      args: [],
    );
  }

  /// `American football`
  String get random_text_314 {
    return Intl.message(
      'American football',
      name: 'random_text_314',
      desc: '',
      args: [],
    );
  }

  /// `NFL`
  String get random_text_315 {
    return Intl.message(
      'NFL',
      name: 'random_text_315',
      desc: '',
      args: [],
    );
  }

  /// `NCAA`
  String get random_text_316 {
    return Intl.message(
      'NCAA',
      name: 'random_text_316',
      desc: '',
      args: [],
    );
  }

  /// `WNBA`
  String get random_text_317 {
    return Intl.message(
      'WNBA',
      name: 'random_text_317',
      desc: '',
      args: [],
    );
  }

  /// `BBL Championship`
  String get random_text_318 {
    return Intl.message(
      'BBL Championship',
      name: 'random_text_318',
      desc: '',
      args: [],
    );
  }

  /// `Rainbow Six`
  String get random_text_319 {
    return Intl.message(
      'Rainbow Six',
      name: 'random_text_319',
      desc: '',
      args: [],
    );
  }

  /// `Overwatch`
  String get random_text_321 {
    return Intl.message(
      'Overwatch',
      name: 'random_text_321',
      desc: '',
      args: [],
    );
  }

  /// `Kings of Glory`
  String get random_text_322 {
    return Intl.message(
      'Kings of Glory',
      name: 'random_text_322',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Legends`
  String get random_text_323 {
    return Intl.message(
      'Mobile Legends',
      name: 'random_text_323',
      desc: '',
      args: [],
    );
  }

  /// `Valorant`
  String get random_text_324 {
    return Intl.message(
      'Valorant',
      name: 'random_text_324',
      desc: '',
      args: [],
    );
  }

  /// `3x3 basketball`
  String get random_text_326 {
    return Intl.message(
      '3x3 basketball',
      name: 'random_text_326',
      desc: '',
      args: [],
    );
  }

  /// `Australia men's national basketball team`
  String get random_text_327 {
    return Intl.message(
      'Australia men\'s national basketball team',
      name: 'random_text_327',
      desc: '',
      args: [],
    );
  }

  /// `Cricket`
  String get random_text_328 {
    return Intl.message(
      'Cricket',
      name: 'random_text_328',
      desc: '',
      args: [],
    );
  }

  /// `Ice hockey`
  String get random_text_329 {
    return Intl.message(
      'Ice hockey',
      name: 'random_text_329',
      desc: '',
      args: [],
    );
  }

  /// `Alpinism`
  String get random_text_330 {
    return Intl.message(
      'Alpinism',
      name: 'random_text_330',
      desc: '',
      args: [],
    );
  }

  /// `Darts`
  String get random_text_331 {
    return Intl.message(
      'Darts',
      name: 'random_text_331',
      desc: '',
      args: [],
    );
  }

  /// `Pesäpallo`
  String get random_text_332 {
    return Intl.message(
      'Pesäpallo',
      name: 'random_text_332',
      desc: '',
      args: [],
    );
  }

  /// `Stock car racing`
  String get random_text_333 {
    return Intl.message(
      'Stock car racing',
      name: 'random_text_333',
      desc: '',
      args: [],
    );
  }

  /// `Golf`
  String get random_text_334 {
    return Intl.message(
      'Golf',
      name: 'random_text_334',
      desc: '',
      args: [],
    );
  }

  /// `Odds: decimals`
  String get random_text_335 {
    return Intl.message(
      'Odds: decimals',
      name: 'random_text_335',
      desc: '',
      args: [],
    );
  }

  /// `Language: Chinese`
  String get random_text_336 {
    return Intl.message(
      'Language: Chinese',
      name: 'random_text_336',
      desc: '',
      args: [],
    );
  }

  /// `Search requires at least 3 characters.`
  String get random_text_337 {
    return Intl.message(
      'Search requires at least 3 characters.',
      name: 'random_text_337',
      desc: '',
      args: [],
    );
  }

  /// `APP update`
  String get random_text_343 {
    return Intl.message(
      'APP update',
      name: 'random_text_343',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get random_text_344 {
    return Intl.message(
      'Comments',
      name: 'random_text_344',
      desc: '',
      args: [],
    );
  }

  /// `Preparing to download...`
  String get random_text_345 {
    return Intl.message(
      'Preparing to download...',
      name: 'random_text_345',
      desc: '',
      args: [],
    );
  }

  /// `Download completed`
  String get random_text_346 {
    return Intl.message(
      'Download completed',
      name: 'random_text_346',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get random_text_347 {
    return Intl.message(
      'Notice',
      name: 'random_text_347',
      desc: '',
      args: [],
    );
  }

  /// `Download failed, make sure the network is open`
  String get random_text_348 {
    return Intl.message(
      'Download failed, make sure the network is open',
      name: 'random_text_348',
      desc: '',
      args: [],
    );
  }

  /// `Try again now`
  String get random_text_349 {
    return Intl.message(
      'Try again now',
      name: 'random_text_349',
      desc: '',
      args: [],
    );
  }

  /// `Try later`
  String get random_text_350 {
    return Intl.message(
      'Try later',
      name: 'random_text_350',
      desc: '',
      args: [],
    );
  }

  /// `Passing parameters between pages`
  String get random_text_351 {
    return Intl.message(
      'Passing parameters between pages',
      name: 'random_text_351',
      desc: '',
      args: [],
    );
  }

  /// `Competition details`
  String get random_text_352 {
    return Intl.message(
      'Competition details',
      name: 'random_text_352',
      desc: '',
      args: [],
    );
  }

  /// `The luckiest trophy 1`
  String get random_text_353 {
    return Intl.message(
      'The luckiest trophy 1',
      name: 'random_text_353',
      desc: '',
      args: [],
    );
  }

  /// `The luckiest trophy 2`
  String get random_text_354 {
    return Intl.message(
      'The luckiest trophy 2',
      name: 'random_text_354',
      desc: '',
      args: [],
    );
  }

  /// `The luckiest trophy 3`
  String get random_text_355 {
    return Intl.message(
      'The luckiest trophy 3',
      name: 'random_text_355',
      desc: '',
      args: [],
    );
  }

  /// `Join date: 07/01/2023`
  String get random_text_357 {
    return Intl.message(
      'Join date: 07/01/2023',
      name: 'random_text_357',
      desc: '',
      args: [],
    );
  }

  /// `Joined on: `
  String get random_text_357copy2 {
    return Intl.message(
      'Joined on: ',
      name: 'random_text_357copy2',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get random_text_358 {
    return Intl.message(
      'Date',
      name: 'random_text_358',
      desc: '',
      args: [],
    );
  }

  /// `Raffle tickets`
  String get random_text_359 {
    return Intl.message(
      'Raffle tickets',
      name: 'random_text_359',
      desc: '',
      args: [],
    );
  }

  /// `Lucky Trophy`
  String get random_text_360 {
    return Intl.message(
      'Lucky Trophy',
      name: 'random_text_360',
      desc: '',
      args: [],
    );
  }

  /// `Request statistics`
  String get random_text_362 {
    return Intl.message(
      'Request statistics',
      name: 'random_text_362',
      desc: '',
      args: [],
    );
  }

  /// `Requests for statistical data are limited to 5 times a day, 24 hours a day.`
  String get random_text_363 {
    return Intl.message(
      'Requests for statistical data are limited to 5 times a day, 24 hours a day.',
      name: 'random_text_363',
      desc: '',
      args: [],
    );
  }

  /// `Text 01`
  String get random_text_364 {
    return Intl.message(
      'Text 01',
      name: 'random_text_364',
      desc: '',
      args: [],
    );
  }

  /// `One day`
  String get random_text_365 {
    return Intl.message(
      'One day',
      name: 'random_text_365',
      desc: '',
      args: [],
    );
  }

  /// `One week`
  String get random_text_366 {
    return Intl.message(
      'One week',
      name: 'random_text_366',
      desc: '',
      args: [],
    );
  }

  /// `One month`
  String get random_text_367 {
    return Intl.message(
      'One month',
      name: 'random_text_367',
      desc: '',
      args: [],
    );
  }

  /// `Three months`
  String get random_text_368 {
    return Intl.message(
      'Three months',
      name: 'random_text_368',
      desc: '',
      args: [],
    );
  }

  /// `Six months`
  String get random_text_369 {
    return Intl.message(
      'Six months',
      name: 'random_text_369',
      desc: '',
      args: [],
    );
  }

  /// `One year`
  String get random_text_370 {
    return Intl.message(
      'One year',
      name: 'random_text_370',
      desc: '',
      args: [],
    );
  }

  /// `Permanent`
  String get random_text_371 {
    return Intl.message(
      'Permanent',
      name: 'random_text_371',
      desc: '',
      args: [],
    );
  }

  /// `Editable after 22:43`
  String get random_text_372 {
    return Intl.message(
      'Editable after 22:43',
      name: 'random_text_372',
      desc: '',
      args: [],
    );
  }

  /// `Bet limit`
  String get random_text_373 {
    return Intl.message(
      'Bet limit',
      name: 'random_text_373',
      desc: '',
      args: [],
    );
  }

  /// `The betting limit has been set to 1,000.00/day`
  String get random_text_374 {
    return Intl.message(
      'The betting limit has been set to 1,000.00/day',
      name: 'random_text_374',
      desc: '',
      args: [],
    );
  }

  /// `Control your games or bets using loss or bet limits. These limits allow you to control the maximum loss or bet amount within a set period of time. Any changes to these limits require a 24-hour cooling off period.`
  String get random_text_375 {
    return Intl.message(
      'Control your games or bets using loss or bet limits. These limits allow you to control the maximum loss or bet amount within a set period of time. Any changes to these limits require a 24-hour cooling off period.',
      name: 'random_text_375',
      desc: '',
      args: [],
    );
  }

  /// `Need a break from meibo.com? To begin the automated self-exclusion process, click the button below to receive confirmation instructions via email.`
  String get random_text_377 {
    return Intl.message(
      'Need a break from meibo.com? To begin the automated self-exclusion process, click the button below to receive confirmation instructions via email.',
      name: 'random_text_377',
      desc: '',
      args: [],
    );
  }

  /// `Your email address must be verified before self-exclusion can be activated.`
  String get random_text_378 {
    return Intl.message(
      'Your email address must be verified before self-exclusion can be activated.',
      name: 'random_text_378',
      desc: '',
      args: [],
    );
  }

  /// `Cooling off period 23:33:12`
  String get random_text_380 {
    return Intl.message(
      'Cooling off period 23:33:12',
      name: 'random_text_380',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get random_text_381 {
    return Intl.message(
      'Duration',
      name: 'random_text_381',
      desc: '',
      args: [],
    );
  }

  /// `Self-exclusion set`
  String get random_text_383 {
    return Intl.message(
      'Self-exclusion set',
      name: 'random_text_383',
      desc: '',
      args: [],
    );
  }

  /// `You have set your account to self-exclusion mode`
  String get random_text_384 {
    return Intl.message(
      'You have set your account to self-exclusion mode',
      name: 'random_text_384',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer: Any decision made hereunder is final and irreversible. Please withdraw any remaining balance in your account before submitting your self-exclusion request.`
  String get random_text_385 {
    return Intl.message(
      'Disclaimer: Any decision made hereunder is final and irreversible. Please withdraw any remaining balance in your account before submitting your self-exclusion request.',
      name: 'random_text_385',
      desc: '',
      args: [],
    );
  }

  /// `Learn more about`
  String get random_text_386 {
    return Intl.message(
      'Learn more about',
      name: 'random_text_386',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get random_text_387 {
    return Intl.message(
      'Message',
      name: 'random_text_387',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get random_text_388 {
    return Intl.message(
      'Title',
      name: 'random_text_388',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get random_text_389 {
    return Intl.message(
      'Message',
      name: 'random_text_389',
      desc: '',
      args: [],
    );
  }

  /// `Japan - Spain`
  String get random_text_390 {
    return Intl.message(
      'Japan - Spain',
      name: 'random_text_390',
      desc: '',
      args: [],
    );
  }

  /// `Victory equals defeat`
  String get random_text_391 {
    return Intl.message(
      'Victory equals defeat',
      name: 'random_text_391',
      desc: '',
      args: [],
    );
  }

  /// `Draw`
  String get random_text_392 {
    return Intl.message(
      'Draw',
      name: 'random_text_392',
      desc: '',
      args: [],
    );
  }

  /// `Second half`
  String get random_text_393 {
    return Intl.message(
      'Second half',
      name: 'random_text_393',
      desc: '',
      args: [],
    );
  }

  /// `Exchange 1.00000`
  String get random_text_394 {
    return Intl.message(
      'Exchange 1.00000',
      name: 'random_text_394',
      desc: '',
      args: [],
    );
  }

  /// `Investor: Mamama`
  String get random_text_395 {
    return Intl.message(
      'Investor: Mamama',
      name: 'random_text_395',
      desc: '',
      args: [],
    );
  }

  /// `at 17:50 on 08/07/2023`
  String get random_text_396 {
    return Intl.message(
      'at 17:50 on 08/07/2023',
      name: 'random_text_396',
      desc: '',
      args: [],
    );
  }

  /// `In a number:`
  String get random_text_397 {
    return Intl.message(
      'In a number:',
      name: 'random_text_397',
      desc: '',
      args: [],
    );
  }

  /// `Payment amount:`
  String get random_text_398 {
    return Intl.message(
      'Payment amount:',
      name: 'random_text_398',
      desc: '',
      args: [],
    );
  }

  /// `Cashback`
  String get random_text_403 {
    return Intl.message(
      'Cashback',
      name: 'random_text_403',
      desc: '',
      args: [],
    );
  }

  /// `Daily salary`
  String get random_text_404 {
    return Intl.message(
      'Daily salary',
      name: 'random_text_404',
      desc: '',
      args: [],
    );
  }

  /// `Weekly salary`
  String get random_text_405 {
    return Intl.message(
      'Weekly salary',
      name: 'random_text_405',
      desc: '',
      args: [],
    );
  }

  /// `Monthly salary`
  String get random_text_406 {
    return Intl.message(
      'Monthly salary',
      name: 'random_text_406',
      desc: '',
      args: [],
    );
  }

  /// `There is currently no activity gift money to claim`
  String get random_text_407 {
    return Intl.message(
      'There is currently no activity gift money to claim',
      name: 'random_text_407',
      desc: '',
      args: [],
    );
  }

  /// `Successfully received event bonus`
  String get random_text_408 {
    return Intl.message(
      'Successfully received event bonus',
      name: 'random_text_408',
      desc: '',
      args: [],
    );
  }

  /// `The highest level has been reached`
  String get random_text_409 {
    return Intl.message(
      'The highest level has been reached',
      name: 'random_text_409',
      desc: '',
      args: [],
    );
  }

  /// `Not received`
  String get random_text_410 {
    return Intl.message(
      'Not received',
      name: 'random_text_410',
      desc: '',
      args: [],
    );
  }

  /// `Upgraded`
  String get random_text_412 {
    return Intl.message(
      'Upgraded',
      name: 'random_text_412',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get random_text_413 {
    return Intl.message(
      'Available',
      name: 'random_text_413',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting upgrade`
  String get random_text_414 {
    return Intl.message(
      'Awaiting upgrade',
      name: 'random_text_414',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Bonuses`
  String get random_text_415 {
    return Intl.message(
      'Upgrade Bonuses',
      name: 'random_text_415',
      desc: '',
      args: [],
    );
  }

  /// `Booster Bonus`
  String get random_text_416 {
    return Intl.message(
      'Booster Bonus',
      name: 'random_text_416',
      desc: '',
      args: [],
    );
  }

  /// `You can expect weekly and monthly bonuses based on your playing volume. The more you play, the more bonuses you get.`
  String get random_text_417 {
    return Intl.message(
      'You can expect weekly and monthly bonuses based on your playing volume. The more you play, the more bonuses you get.',
      name: 'random_text_417',
      desc: '',
      args: [],
    );
  }

  /// `Recent Game Performance Bonuses`
  String get random_text_418 {
    return Intl.message(
      'Recent Game Performance Bonuses',
      name: 'random_text_418',
      desc: '',
      args: [],
    );
  }

  /// `Isn't luck very favorable? No problem! Stake provides additional funds based on your losses every time you level up.`
  String get random_text_419 {
    return Intl.message(
      'Isn\'t luck very favorable? No problem! Stake provides additional funds based on your losses every time you level up.',
      name: 'random_text_419',
      desc: '',
      args: [],
    );
  }

  /// `Dedicated VIP Service Representative`
  String get random_text_420 {
    return Intl.message(
      'Dedicated VIP Service Representative',
      name: 'random_text_420',
      desc: '',
      args: [],
    );
  }

  /// `Be assigned a dedicated VIP Service Representative who will support and cater to your betting needs.`
  String get random_text_421 {
    return Intl.message(
      'Be assigned a dedicated VIP Service Representative who will support and cater to your betting needs.',
      name: 'random_text_421',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade bonus`
  String get random_text_422 {
    return Intl.message(
      'Upgrade bonus',
      name: 'random_text_422',
      desc: '',
      args: [],
    );
  }

  /// `Get bonuses after reaching each next level. The higher the level reached, the greater the upgrade bonus.`
  String get random_text_423 {
    return Intl.message(
      'Get bonuses after reaching each next level. The higher the level reached, the greater the upgrade bonus.',
      name: 'random_text_423',
      desc: '',
      args: [],
    );
  }

  /// `Work with your dedicated VIP Service representative to tailor benefits to your betting needs.`
  String get random_text_424 {
    return Intl.message(
      'Work with your dedicated VIP Service representative to tailor benefits to your betting needs.',
      name: 'random_text_424',
      desc: '',
      args: [],
    );
  }

  /// `VIP level comparison`
  String get random_text_425 {
    return Intl.message(
      'VIP level comparison',
      name: 'random_text_425',
      desc: '',
      args: [],
    );
  }

  /// `Bet Amount`
  String get random_text_426 {
    return Intl.message(
      'Bet Amount',
      name: 'random_text_426',
      desc: '',
      args: [],
    );
  }

  /// `Monthly bonus`
  String get random_text_427 {
    return Intl.message(
      'Monthly bonus',
      name: 'random_text_427',
      desc: '',
      args: [],
    );
  }

  /// `Weekly bonus`
  String get random_text_428 {
    return Intl.message(
      'Weekly bonus',
      name: 'random_text_428',
      desc: '',
      args: [],
    );
  }

  /// `Daily Bonus \nReload Bonus`
  String get random_text_429 {
    return Intl.message(
      'Daily Bonus \nReload Bonus',
      name: 'random_text_429',
      desc: '',
      args: [],
    );
  }

  /// `Bonus growth`
  String get random_text_430 {
    return Intl.message(
      'Bonus growth',
      name: 'random_text_430',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive VIP Service Representative`
  String get random_text_431 {
    return Intl.message(
      'Exclusive VIP Service Representative',
      name: 'random_text_431',
      desc: '',
      args: [],
    );
  }

  /// `Ten thousand`
  String get random_text_432 {
    return Intl.message(
      'Ten thousand',
      name: 'random_text_432',
      desc: '',
      args: [],
    );
  }

  /// `Meibo VIP Experience`
  String get random_text_433 {
    return Intl.message(
      'Meibo VIP Experience',
      name: 'random_text_433',
      desc: '',
      args: [],
    );
  }

  /// `Unlock exclusive benefits and get bonuses that you can withdraw instantly with no strings attached.`
  String get random_text_434 {
    return Intl.message(
      'Unlock exclusive benefits and get bonuses that you can withdraw instantly with no strings attached.',
      name: 'random_text_434',
      desc: '',
      args: [],
    );
  }

  /// `View VIP Level Table`
  String get random_text_436 {
    return Intl.message(
      'View VIP Level Table',
      name: 'random_text_436',
      desc: '',
      args: [],
    );
  }

  /// `Manual for Beginners`
  String get random_text_437 {
    return Intl.message(
      'Manual for Beginners',
      name: 'random_text_437',
      desc: '',
      args: [],
    );
  }

  /// `Becoming a VIP is an easy and rewarding process`
  String get random_text_438 {
    return Intl.message(
      'Becoming a VIP is an easy and rewarding process',
      name: 'random_text_438',
      desc: '',
      args: [],
    );
  }

  /// `First Step`
  String get random_text_439 {
    return Intl.message(
      'First Step',
      name: 'random_text_439',
      desc: '',
      args: [],
    );
  }

  /// `Every bet you make affects your progress towards the VIP level. Reach the next level to unlock more benefits.`
  String get random_text_440 {
    return Intl.message(
      'Every bet you make affects your progress towards the VIP level. Reach the next level to unlock more benefits.',
      name: 'random_text_440',
      desc: '',
      args: [],
    );
  }

  /// `Step Two`
  String get random_text_441 {
    return Intl.message(
      'Step Two',
      name: 'random_text_441',
      desc: '',
      args: [],
    );
  }

  /// `Step Three`
  String get random_text_442 {
    return Intl.message(
      'Step Three',
      name: 'random_text_442',
      desc: '',
      args: [],
    );
  }

  /// `Claim your bonus now. Daily, weekly and monthly redemption in a simple and practical way.`
  String get random_text_443 {
    return Intl.message(
      'Claim your bonus now. Daily, weekly and monthly redemption in a simple and practical way.',
      name: 'random_text_443',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get random_text_444 {
    return Intl.message(
      'Experience',
      name: 'random_text_444',
      desc: '',
      args: [],
    );
  }

  /// `Prizes`
  String get random_text_445 {
    return Intl.message(
      'Prizes',
      name: 'random_text_445',
      desc: '',
      args: [],
    );
  }

  /// `You can get better rewards every time you upgrade`
  String get random_text_446 {
    return Intl.message(
      'You can get better rewards every time you upgrade',
      name: 'random_text_446',
      desc: '',
      args: [],
    );
  }

  /// `Alipay account`
  String get random_text_447 {
    return Intl.message(
      'Alipay account',
      name: 'random_text_447',
      desc: '',
      args: [],
    );
  }

  /// `Link Alipay`
  String get random_text_448 {
    return Intl.message(
      'Link Alipay',
      name: 'random_text_448',
      desc: '',
      args: [],
    );
  }

  /// `The minimum withdrawal amount is: 0.00020000`
  String get random_text_449 {
    return Intl.message(
      'The minimum withdrawal amount is: 0.00020000',
      name: 'random_text_449',
      desc: '',
      args: [],
    );
  }

  /// `We will deduct this from your balance`
  String get random_text_450 {
    return Intl.message(
      'We will deduct this from your balance',
      name: 'random_text_450',
      desc: '',
      args: [],
    );
  }

  /// `As a transaction fee for your withdrawal.`
  String get random_text_451 {
    return Intl.message(
      'As a transaction fee for your withdrawal.',
      name: 'random_text_451',
      desc: '',
      args: [],
    );
  }

  /// `Search Currencies`
  String get random_text_452 {
    return Intl.message(
      'Search Currencies',
      name: 'random_text_452',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the full verification code`
  String get random_text_453 {
    return Intl.message(
      'Please enter the full verification code',
      name: 'random_text_453',
      desc: '',
      args: [],
    );
  }

  /// `Set transaction password`
  String get random_text_455 {
    return Intl.message(
      'Set transaction password',
      name: 'random_text_455',
      desc: '',
      args: [],
    );
  }

  /// `To keep your account extra secure leave a two factor authentication enabled.`
  String get random_text_456 {
    return Intl.message(
      'To keep your account extra secure leave a two factor authentication enabled.',
      name: 'random_text_456',
      desc: '',
      args: [],
    );
  }

  /// `Copy This Code to Your Authenticator App`
  String get random_text_457 {
    return Intl.message(
      'Copy This Code to Your Authenticator App',
      name: 'random_text_457',
      desc: '',
      args: [],
    );
  }

  /// `Don't Let Anyone See This!`
  String get random_text_458 {
    return Intl.message(
      'Don\'t Let Anyone See This!',
      name: 'random_text_458',
      desc: '',
      args: [],
    );
  }

  /// `Remove from blacklist`
  String get random_text_461 {
    return Intl.message(
      'Remove from blacklist',
      name: 'random_text_461',
      desc: '',
      args: [],
    );
  }

  /// `Link Cryptocurrency Payment Address`
  String get random_text_462 {
    return Intl.message(
      'Link Cryptocurrency Payment Address',
      name: 'random_text_462',
      desc: '',
      args: [],
    );
  }

  /// `Link fiat currency payment address`
  String get random_text_463 {
    return Intl.message(
      'Link fiat currency payment address',
      name: 'random_text_463',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name of the account holder`
  String get random_text_464 {
    return Intl.message(
      'Please enter the name of the account holder',
      name: 'random_text_464',
      desc: '',
      args: [],
    );
  }

  /// `Once linked, it will not be possible to change. Only the account holder's payment method can be added.`
  String get random_text_465 {
    return Intl.message(
      'Once linked, it will not be possible to change. Only the account holder\'s payment method can be added.',
      name: 'random_text_465',
      desc: '',
      args: [],
    );
  }

  /// `Bank account`
  String get random_text_468 {
    return Intl.message(
      'Bank account',
      name: 'random_text_468',
      desc: '',
      args: [],
    );
  }

  /// `Each currency can be linked to 5 withdrawal methods`
  String get random_text_471 {
    return Intl.message(
      'Each currency can be linked to 5 withdrawal methods',
      name: 'random_text_471',
      desc: '',
      args: [],
    );
  }

  /// `Each cryptocurrency can be linked to up to 2 withdrawal addresses`
  String get random_text_472 {
    return Intl.message(
      'Each cryptocurrency can be linked to up to 2 withdrawal addresses',
      name: 'random_text_472',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get random_text_473 {
    return Intl.message(
      'New',
      name: 'random_text_473',
      desc: '',
      args: [],
    );
  }

  /// `Email sent to \n`
  String get random_text_474 {
    return Intl.message(
      'Email sent to \n',
      name: 'random_text_474',
      desc: '',
      args: [],
    );
  }

  /// `Email sent`
  String get random_text_475 {
    return Intl.message(
      'Email sent',
      name: 'random_text_475',
      desc: '',
      args: [],
    );
  }

  /// `Email address updated successfully`
  String get random_text_476 {
    return Intl.message(
      'Email address updated successfully',
      name: 'random_text_476',
      desc: '',
      args: [],
    );
  }

  /// `The confirmation email has been sent to \n`
  String get random_text_477 {
    return Intl.message(
      'The confirmation email has been sent to \n',
      name: 'random_text_477',
      desc: '',
      args: [],
    );
  }

  /// `Phone number successfully updated`
  String get random_text_478 {
    return Intl.message(
      'Phone number successfully updated',
      name: 'random_text_478',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number has been updated to `
  String get random_text_479 {
    return Intl.message(
      'Mobile number has been updated to ',
      name: 'random_text_479',
      desc: '',
      args: [],
    );
  }

  /// `Login Time`
  String get random_text_481 {
    return Intl.message(
      'Login Time',
      name: 'random_text_481',
      desc: '',
      args: [],
    );
  }

  /// `Browser`
  String get random_text_482 {
    return Intl.message(
      'Browser',
      name: 'random_text_482',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get random_text_483 {
    return Intl.message(
      'Area',
      name: 'random_text_483',
      desc: '',
      args: [],
    );
  }

  /// `Alipay`
  String get random_text_485 {
    return Intl.message(
      'Alipay',
      name: 'random_text_485',
      desc: '',
      args: [],
    );
  }

  /// `Pre-Handicap`
  String get random_text_486 {
    return Intl.message(
      'Pre-Handicap',
      name: 'random_text_486',
      desc: '',
      args: [],
    );
  }

  /// `Championship`
  String get random_text_487 {
    return Intl.message(
      'Championship',
      name: 'random_text_487',
      desc: '',
      args: [],
    );
  }

  /// `League`
  String get random_text_488 {
    return Intl.message(
      'League',
      name: 'random_text_488',
      desc: '',
      args: [],
    );
  }

  /// `All sports`
  String get random_text_489 {
    return Intl.message(
      'All sports',
      name: 'random_text_489',
      desc: '',
      args: [],
    );
  }

  /// `All matches`
  String get random_text_491 {
    return Intl.message(
      'All matches',
      name: 'random_text_491',
      desc: '',
      args: [],
    );
  }

  /// `First half`
  String get random_text_492 {
    return Intl.message(
      'First half',
      name: 'random_text_492',
      desc: '',
      args: [],
    );
  }

  /// `Sort alphabetically`
  String get random_text_493 {
    return Intl.message(
      'Sort alphabetically',
      name: 'random_text_493',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get random_text_494 {
    return Intl.message(
      'Test',
      name: 'random_text_494',
      desc: '',
      args: [],
    );
  }

  /// `Multiple Bets (2)`
  String get random_text_495 {
    return Intl.message(
      'Multiple Bets (2)',
      name: 'random_text_495',
      desc: '',
      args: [],
    );
  }

  /// `$100,000 Race - 24 Hours`
  String get random_text_496 {
    return Intl.message(
      '\$100,000 Race - 24 Hours',
      name: 'random_text_496',
      desc: '',
      args: [],
    );
  }

  /// `Search your event`
  String get random_text_500 {
    return Intl.message(
      'Search your event',
      name: 'random_text_500',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Gambling`
  String get responsible_for_gambling {
    return Intl.message(
      'Responsible Gambling',
      name: 'responsible_for_gambling',
      desc: '',
      args: [],
    );
  }

  /// `Fairness`
  String get fairness {
    return Intl.message(
      'Fairness',
      name: 'fairness',
      desc: '',
      args: [],
    );
  }

  /// `Sports Rules`
  String get sports_betting_rules {
    return Intl.message(
      'Sports Rules',
      name: 'sports_betting_rules',
      desc: '',
      args: [],
    );
  }

  /// `Version number`
  String get version {
    return Intl.message(
      'Version number',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Minimum character length is 3`
  String get random_text_501 {
    return Intl.message(
      'Minimum character length is 3',
      name: 'random_text_501',
      desc: '',
      args: [],
    );
  }

  /// `Minimum character length is 8`
  String get random_text_502 {
    return Intl.message(
      'Minimum character length is 8',
      name: 'random_text_502',
      desc: '',
      args: [],
    );
  }

  /// `Email domain not supported`
  String get random_text_503 {
    return Intl.message(
      'Email domain not supported',
      name: 'random_text_503',
      desc: '',
      args: [],
    );
  }

  /// `Please add the “.” symbol to your email address`
  String get random_text_504 {
    return Intl.message(
      'Please add the “.” symbol to your email address',
      name: 'random_text_504',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get random_text_505 {
    return Intl.message(
      'Please enter a valid email address',
      name: 'random_text_505',
      desc: '',
      args: [],
    );
  }

  /// `Your username must be at least 3 characters long`
  String get random_text_506 {
    return Intl.message(
      'Your username must be at least 3 characters long',
      name: 'random_text_506',
      desc: '',
      args: [],
    );
  }

  /// `Your username must be less than 14 characters long`
  String get random_text_507 {
    return Intl.message(
      'Your username must be less than 14 characters long',
      name: 'random_text_507',
      desc: '',
      args: [],
    );
  }

  /// `The year must be greater than or equal to 1900`
  String get random_text_508 {
    return Intl.message(
      'The year must be greater than or equal to 1900',
      name: 'random_text_508',
      desc: '',
      args: [],
    );
  }

  /// `Your age cannot exceed 120 years old`
  String get random_text_509 {
    return Intl.message(
      'Your age cannot exceed 120 years old',
      name: 'random_text_509',
      desc: '',
      args: [],
    );
  }

  /// `Date cannot exceed`
  String get random_text_510 {
    return Intl.message(
      'Date cannot exceed',
      name: 'random_text_510',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get random_text_511 {
    return Intl.message(
      'Number',
      name: 'random_text_511',
      desc: '',
      args: [],
    );
  }

  /// `Your username must be 3-14 characters long`
  String get random_text_512 {
    return Intl.message(
      'Your username must be 3-14 characters long',
      name: 'random_text_512',
      desc: '',
      args: [],
    );
  }

  /// `Add new subagent`
  String get random_text_513 {
    return Intl.message(
      'Add new subagent',
      name: 'random_text_513',
      desc: '',
      args: [],
    );
  }

  /// `All Currencies`
  String get random_text_514 {
    return Intl.message(
      'All Currencies',
      name: 'random_text_514',
      desc: '',
      args: [],
    );
  }

  /// `Superior: `
  String get random_text_515 {
    return Intl.message(
      'Superior: ',
      name: 'random_text_515',
      desc: '',
      args: [],
    );
  }

  /// `Commission Wallet`
  String get random_text_516 {
    return Intl.message(
      'Commission Wallet',
      name: 'random_text_516',
      desc: '',
      args: [],
    );
  }

  /// `Commission Record`
  String get random_text_517 {
    return Intl.message(
      'Commission Record',
      name: 'random_text_517',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get random_text_518 {
    return Intl.message(
      'Time',
      name: 'random_text_518',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get random_text_519 {
    return Intl.message(
      'Type',
      name: 'random_text_519',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get random_text_520 {
    return Intl.message(
      'Time',
      name: 'random_text_520',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get random_text_521 {
    return Intl.message(
      'Order Number',
      name: 'random_text_521',
      desc: '',
      args: [],
    );
  }

  /// `Type Selection`
  String get random_text_522 {
    return Intl.message(
      'Type Selection',
      name: 'random_text_522',
      desc: '',
      args: [],
    );
  }

  /// `Members Win or Lose`
  String get random_text_523 {
    return Intl.message(
      'Members Win or Lose',
      name: 'random_text_523',
      desc: '',
      args: [],
    );
  }

  /// `Cash Profit`
  String get random_text_524 {
    return Intl.message(
      'Cash Profit',
      name: 'random_text_524',
      desc: '',
      args: [],
    );
  }

  /// `Registration Time`
  String get random_text_525 {
    return Intl.message(
      'Registration Time',
      name: 'random_text_525',
      desc: '',
      args: [],
    );
  }

  /// `0 people`
  String get random_text_526 {
    return Intl.message(
      '0 people',
      name: 'random_text_526',
      desc: '',
      args: [],
    );
  }

  /// `Total Valid Bets`
  String get random_text_527 {
    return Intl.message(
      'Total Valid Bets',
      name: 'random_text_527',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get random_text_528 {
    return Intl.message(
      'People',
      name: 'random_text_528',
      desc: '',
      args: [],
    );
  }

  /// `Go to settings`
  String get random_text_529 {
    return Intl.message(
      'Go to settings',
      name: 'random_text_529',
      desc: '',
      args: [],
    );
  }

  /// `Access to the photo album is disabled, please go to settings to grant permission to access the photo album`
  String get random_text_530 {
    return Intl.message(
      'Access to the photo album is disabled, please go to settings to grant permission to access the photo album',
      name: 'random_text_530',
      desc: '',
      args: [],
    );
  }

  /// `Save successfully`
  String get random_text_531 {
    return Intl.message(
      'Save successfully',
      name: 'random_text_531',
      desc: '',
      args: [],
    );
  }

  /// `Save failed`
  String get random_text_532 {
    return Intl.message(
      'Save failed',
      name: 'random_text_532',
      desc: '',
      args: [],
    );
  }

  /// `My Link`
  String get random_text_533 {
    return Intl.message(
      'My Link',
      name: 'random_text_533',
      desc: '',
      args: [],
    );
  }

  /// `For Example`
  String get random_text_534 {
    return Intl.message(
      'For Example',
      name: 'random_text_534',
      desc: '',
      args: [],
    );
  }

  /// `The rebates on this site are based on valid bets, assuming the rebate ratio is shown in the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2. B2 had no subordinates, and B3 only developed the relatively powerful C3.\n\n A few days later, B1’s effective bet is 80,000, B2’s effective bet is 50,000, B3’s effective bet is 30,000, C1’s effective bet is 100,000, C2’s effective bet is 40,000, and C3 My effective bet reaches 710,000, then the total performance of B1 comes from C1 and C2, which is 140,000, and the corresponding rebate ratio is 80/10,000; the performance of B2 without subordinates is 0; the subordinate C3 of B3 is powerful, the total performance is 710,000, and the corresponding rebate is The ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams. The total performance is 1.01 million, and the corresponding rebate ratio is 1 million/10,000.\n\n Then the income between them is calculated as follows.`
  String get random_text_535 {
    return Intl.message(
      'The rebates on this site are based on valid bets, assuming the rebate ratio is shown in the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2. B2 had no subordinates, and B3 only developed the relatively powerful C3.\n\n A few days later, B1’s effective bet is 80,000, B2’s effective bet is 50,000, B3’s effective bet is 30,000, C1’s effective bet is 100,000, C2’s effective bet is 40,000, and C3 My effective bet reaches 710,000, then the total performance of B1 comes from C1 and C2, which is 140,000, and the corresponding rebate ratio is 80/10,000; the performance of B2 without subordinates is 0; the subordinate C3 of B3 is powerful, the total performance is 710,000, and the corresponding rebate is The ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams. The total performance is 1.01 million, and the corresponding rebate ratio is 1 million/10,000.\n\n Then the income between them is calculated as follows.',
      name: 'random_text_535',
      desc: '',
      args: [],
    );
  }

  /// `It refers to members who develop vertically and are collectively called direct teams. \n(1) B1, B2, and B3 contribute to A: (80,000 + 50,000 + 30,000) x 100/10,000 = 1,600. \n\n(2) C1 and C2 contribute to B1: (100,000+40,000)x80/10,000=1120. \n\n(3) C3 contributes to B3: 710,000 x 100/10,000 = 7100.`
  String get random_text_536 {
    return Intl.message(
      'It refers to members who develop vertically and are collectively called direct teams. \n(1) B1, B2, and B3 contribute to A: (80,000 + 50,000 + 30,000) x 100/10,000 = 1,600. \n\n(2) C1 and C2 contribute to B1: (100,000+40,000)x80/10,000=1120. \n\n(3) C3 contributes to B3: 710,000 x 100/10,000 = 7100.',
      name: 'random_text_536',
      desc: '',
      args: [],
    );
  }

  /// `It refers to the members who develop into subordinates, subordinates, subordinates, etc., and are collectively called other teams; because this system can develop subordinates infinitely, for the convenience of explanation, this article only takes the 2-level structure as an example. \n\n(1) From C1 and C2: Because B1 has a total performance of 140,000 and only enjoys a rebate ratio of 80/ten thousand, while A’s total performance is 1.01 million and enjoys a rebate ratio of 1 million/ten thousand, then there is a rebate between A and B1 The commission difference is: 100-80=20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100,000+40,000)×20/10,000=280. \n\n(2) From C3: Since B3 has a total performance of 710,000 and enjoys a rebate ratio of 1 million/10,000, and A has a total performance of 1.01 million and enjoys a rebate ratio of 1 million/10,000, then the rebate difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710,000x0/10,000=0.`
  String get random_text_537 {
    return Intl.message(
      'It refers to the members who develop into subordinates, subordinates, subordinates, etc., and are collectively called other teams; because this system can develop subordinates infinitely, for the convenience of explanation, this article only takes the 2-level structure as an example. \n\n(1) From C1 and C2: Because B1 has a total performance of 140,000 and only enjoys a rebate ratio of 80/ten thousand, while A’s total performance is 1.01 million and enjoys a rebate ratio of 1 million/ten thousand, then there is a rebate between A and B1 The commission difference is: 100-80=20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100,000+40,000)×20/10,000=280. \n\n(2) From C3: Since B3 has a total performance of 710,000 and enjoys a rebate ratio of 1 million/10,000, and A has a total performance of 1.01 million and enjoys a rebate ratio of 1 million/10,000, then the rebate difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710,000x0/10,000=0.',
      name: 'random_text_537',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get random_text_538 {
    return Intl.message(
      'Summary',
      name: 'random_text_538',
      desc: '',
      args: [],
    );
  }

  /// `(1) C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all its performance. \n\n(2) B2 may be lazy and will not benefit if he does not develop his subordinates. \n\n(3) Although B3 joined relatively late and is a subordinate of A, its subordinate C3 is very powerful, allowing B3 to directly enjoy a higher commission ratio. Therefore, no matter when B3 joins, whose subordinate he is, no matter what level he is in, Income will never be affected, you will no longer suffer from the losses of other people's subordinates, and your development will not be restricted. \n\n(4) This is an absolutely fair and just agency model, and no one will be stepped on forever just because they join late.`
  String get random_text_539 {
    return Intl.message(
      '(1) C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all its performance. \n\n(2) B2 may be lazy and will not benefit if he does not develop his subordinates. \n\n(3) Although B3 joined relatively late and is a subordinate of A, its subordinate C3 is very powerful, allowing B3 to directly enjoy a higher commission ratio. Therefore, no matter when B3 joins, whose subordinate he is, no matter what level he is in, Income will never be affected, you will no longer suffer from the losses of other people\'s subordinates, and your development will not be restricted. \n\n(4) This is an absolutely fair and just agency model, and no one will be stepped on forever just because they join late.',
      name: 'random_text_539',
      desc: '',
      args: [],
    );
  }

  /// `Email address cannot be empty`
  String get random_text_540 {
    return Intl.message(
      'Email address cannot be empty',
      name: 'random_text_540',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get random_text_541 {
    return Intl.message(
      'Username cannot be empty',
      name: 'random_text_541',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct email address`
  String get random_text_542 {
    return Intl.message(
      'Please enter the correct email address',
      name: 'random_text_542',
      desc: '',
      args: [],
    );
  }

  /// `Your username must be 3 - 14 characters long`
  String get random_text_543 {
    return Intl.message(
      'Your username must be 3 - 14 characters long',
      name: 'random_text_543',
      desc: '',
      args: [],
    );
  }

  /// `The password length must be greater than or equal to 8 characters`
  String get random_text_544 {
    return Intl.message(
      'The password length must be greater than or equal to 8 characters',
      name: 'random_text_544',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful!`
  String get random_text_545 {
    return Intl.message(
      'Registration successful!',
      name: 'random_text_545',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed!`
  String get random_text_546 {
    return Intl.message(
      'Registration failed!',
      name: 'random_text_546',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get random_text_547 {
    return Intl.message(
      'Email Address',
      name: 'random_text_547',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get random_text_548 {
    return Intl.message(
      'Username',
      name: 'random_text_548',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get random_text_549 {
    return Intl.message(
      'Password',
      name: 'random_text_549',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get random_text_550 {
    return Intl.message(
      'End time',
      name: 'random_text_550',
      desc: '',
      args: [],
    );
  }

  /// `Player ID`
  String get random_text_551 {
    return Intl.message(
      'Player ID',
      name: 'random_text_551',
      desc: '',
      args: [],
    );
  }

  /// `Keyword`
  String get random_text_552 {
    return Intl.message(
      'Keyword',
      name: 'random_text_552',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get random_text_553 {
    return Intl.message(
      'hours',
      name: 'random_text_553',
      desc: '',
      args: [],
    );
  }

  /// `minutes later`
  String get random_text_554 {
    return Intl.message(
      'minutes later',
      name: 'random_text_554',
      desc: '',
      args: [],
    );
  }

  /// `Put the above`
  String get random_text_555 {
    return Intl.message(
      'Put the above',
      name: 'random_text_555',
      desc: '',
      args: [],
    );
  }

  /// `Item bet, add it to my betting slip`
  String get random_text_556 {
    return Intl.message(
      'Item bet, add it to my betting slip',
      name: 'random_text_556',
      desc: '',
      args: [],
    );
  }

  /// `Complex betting ratio:`
  String get random_text_557 {
    return Intl.message(
      'Complex betting ratio:',
      name: 'random_text_557',
      desc: '',
      args: [],
    );
  }

  /// `The odds are less than`
  String get random_text_558 {
    return Intl.message(
      'The odds are less than',
      name: 'random_text_558',
      desc: '',
      args: [],
    );
  }

  /// `The betting items cannot be combined into multiple bets`
  String get random_text_559 {
    return Intl.message(
      'The betting items cannot be combined into multiple bets',
      name: 'random_text_559',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get random_text_560 {
    return Intl.message(
      'Currency',
      name: 'random_text_560',
      desc: '',
      args: [],
    );
  }

  /// `Amount of Bet`
  String get random_text_561 {
    return Intl.message(
      'Amount of Bet',
      name: 'random_text_561',
      desc: '',
      args: [],
    );
  }

  /// `Wins and Losses`
  String get random_text_562 {
    return Intl.message(
      'Wins and Losses',
      name: 'random_text_562',
      desc: '',
      args: [],
    );
  }

  /// `Emoji`
  String get random_text_563 {
    return Intl.message(
      'Emoji',
      name: 'random_text_563',
      desc: '',
      args: [],
    );
  }

  /// `1. Don't spam & don't use excessive capital letters when chatting.`
  String get random_text_564 {
    return Intl.message(
      '1. Don\'t spam & don\'t use excessive capital letters when chatting.',
      name: 'random_text_564',
      desc: '',
      args: [],
    );
  }

  /// `2. Don't harass or be offensive to other users or Meibo staff.`
  String get random_text_565 {
    return Intl.message(
      '2. Don\'t harass or be offensive to other users or Meibo staff.',
      name: 'random_text_565',
      desc: '',
      args: [],
    );
  }

  /// `3. Don't share any personal information (including socials) of you or other players.`
  String get random_text_566 {
    return Intl.message(
      '3. Don\'t share any personal information (including socials) of you or other players.',
      name: 'random_text_566',
      desc: '',
      args: [],
    );
  }

  /// `4. Don't beg or ask for loans, rains or tips.`
  String get random_text_567 {
    return Intl.message(
      '4. Don\'t beg or ask for loans, rains or tips.',
      name: 'random_text_567',
      desc: '',
      args: [],
    );
  }

  /// `5. Don't use alternative (alts) accounts on chat, that is strictly forbidden.`
  String get random_text_568 {
    return Intl.message(
      '5. Don\'t use alternative (alts) accounts on chat, that is strictly forbidden.',
      name: 'random_text_568',
      desc: '',
      args: [],
    );
  }

  /// `6. No suspicious behavior that can be seen as potential scams.`
  String get random_text_569 {
    return Intl.message(
      '6. No suspicious behavior that can be seen as potential scams.',
      name: 'random_text_569',
      desc: '',
      args: [],
    );
  }

  /// `7. Don't engage in any forms of advertising/trading/selling/buying or offering services.`
  String get random_text_570 {
    return Intl.message(
      '7. Don\'t engage in any forms of advertising/trading/selling/buying or offering services.',
      name: 'random_text_570',
      desc: '',
      args: [],
    );
  }

  /// `8. No discussion of streamers or Twitch or any other similar platforms.`
  String get random_text_571 {
    return Intl.message(
      '8. No discussion of streamers or Twitch or any other similar platforms.',
      name: 'random_text_571',
      desc: '',
      args: [],
    );
  }

  /// `9. Don't use URL shortening services. Always submit the full link.`
  String get random_text_572 {
    return Intl.message(
      '9. Don\'t use URL shortening services. Always submit the full link.',
      name: 'random_text_572',
      desc: '',
      args: [],
    );
  }

  /// `10. Don't share codes, scripts or any other bot service.`
  String get random_text_573 {
    return Intl.message(
      '10. Don\'t share codes, scripts or any other bot service.',
      name: 'random_text_573',
      desc: '',
      args: [],
    );
  }

  /// `11. Only use the language specified in the chat channel, potential abuse will be sanctioned.`
  String get random_text_574 {
    return Intl.message(
      '11. Only use the language specified in the chat channel, potential abuse will be sanctioned.',
      name: 'random_text_574',
      desc: '',
      args: [],
    );
  }

  /// `12. No politics & no religion talk in chat, this one is strictly forbidden.`
  String get random_text_575 {
    return Intl.message(
      '12. No politics & no religion talk in chat, this one is strictly forbidden.',
      name: 'random_text_575',
      desc: '',
      args: [],
    );
  }

  /// `Our full rules can be found on our `
  String get random_text_576 {
    return Intl.message(
      'Our full rules can be found on our ',
      name: 'random_text_576',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get random_text_577 {
    return Intl.message(
      '',
      name: 'random_text_577',
      desc: '',
      args: [],
    );
  }

  /// ` playing`
  String get random_text_578 {
    return Intl.message(
      ' playing',
      name: 'random_text_578',
      desc: '',
      args: [],
    );
  }

  /// `End in`
  String get random_text_579 {
    return Intl.message(
      'End in',
      name: 'random_text_579',
      desc: '',
      args: [],
    );
  }

  /// `1.Terms`
  String get random_text_580 {
    return Intl.message(
      '1.Terms',
      name: 'random_text_580',
      desc: '',
      args: [],
    );
  }

  /// `2.Terms`
  String get random_text_581 {
    return Intl.message(
      '2.Terms',
      name: 'random_text_581',
      desc: '',
      args: [],
    );
  }

  /// `Download updates`
  String get random_text_582 {
    return Intl.message(
      'Download updates',
      name: 'random_text_582',
      desc: '',
      args: [],
    );
  }

  /// `New version is downloading!`
  String get random_text_583 {
    return Intl.message(
      'New version is downloading!',
      name: 'random_text_583',
      desc: '',
      args: [],
    );
  }

  /// `The new version is being updated, please wait...`
  String get random_text_584 {
    return Intl.message(
      'The new version is being updated, please wait...',
      name: 'random_text_584',
      desc: '',
      args: [],
    );
  }

  /// `Current version number:`
  String get random_text_585 {
    return Intl.message(
      'Current version number:',
      name: 'random_text_585',
      desc: '',
      args: [],
    );
  }

  /// `Latest version number:`
  String get random_text_586 {
    return Intl.message(
      'Latest version number:',
      name: 'random_text_586',
      desc: '',
      args: [],
    );
  }

  /// `It is the latest version number`
  String get random_text_587 {
    return Intl.message(
      'It is the latest version number',
      name: 'random_text_587',
      desc: '',
      args: [],
    );
  }

  /// `Download the latest APP`
  String get random_text_588 {
    return Intl.message(
      'Download the latest APP',
      name: 'random_text_588',
      desc: '',
      args: [],
    );
  }

  /// `Payment address:`
  String get random_text_589 {
    return Intl.message(
      'Payment address:',
      name: 'random_text_589',
      desc: '',
      args: [],
    );
  }

  /// `Account type:`
  String get random_text_590 {
    return Intl.message(
      'Account type:',
      name: 'random_text_590',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary bank:`
  String get random_text_591 {
    return Intl.message(
      'Beneficiary bank:',
      name: 'random_text_591',
      desc: '',
      args: [],
    );
  }

  /// `No Deposits Yet`
  String get random_text_592 {
    return Intl.message(
      'No Deposits Yet',
      name: 'random_text_592',
      desc: '',
      args: [],
    );
  }

  /// `No Withdrawals`
  String get random_text_593 {
    return Intl.message(
      'No Withdrawals',
      name: 'random_text_593',
      desc: '',
      args: [],
    );
  }

  /// `No Banking Deposits`
  String get random_text_594 {
    return Intl.message(
      'No Banking Deposits',
      name: 'random_text_594',
      desc: '',
      args: [],
    );
  }

  /// `No Banking Withdrawals`
  String get random_text_595 {
    return Intl.message(
      'No Banking Withdrawals',
      name: 'random_text_595',
      desc: '',
      args: [],
    );
  }

  /// `Amount: `
  String get random_text_596 {
    return Intl.message(
      'Amount: ',
      name: 'random_text_596',
      desc: '',
      args: [],
    );
  }

  /// `The maximum value is:`
  String get random_text_597 {
    return Intl.message(
      'The maximum value is:',
      name: 'random_text_597',
      desc: '',
      args: [],
    );
  }

  /// `Learn more about Vault`
  String get random_text_598 {
    return Intl.message(
      'Learn more about Vault',
      name: 'random_text_598',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a 6-digit password`
  String get random_text_599 {
    return Intl.message(
      'Please enter a 6-digit password',
      name: 'random_text_599',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated Bonus`
  String get random_text_600 {
    return Intl.message(
      'Accumulated Bonus',
      name: 'random_text_600',
      desc: '',
      args: [],
    );
  }

  /// `Promotion Criteria`
  String get random_text_601 {
    return Intl.message(
      'Promotion Criteria',
      name: 'random_text_601',
      desc: '',
      args: [],
    );
  }

  /// `Relegation Criteria`
  String get random_text_602 {
    return Intl.message(
      'Relegation Criteria',
      name: 'random_text_602',
      desc: '',
      args: [],
    );
  }

  /// `Daily Salary Bonus`
  String get random_text_603 {
    return Intl.message(
      'Daily Salary Bonus',
      name: 'random_text_603',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Salary Bonus`
  String get random_text_604 {
    return Intl.message(
      'Weekly Salary Bonus',
      name: 'random_text_604',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Salary Bonus`
  String get random_text_605 {
    return Intl.message(
      'Monthly Salary Bonus',
      name: 'random_text_605',
      desc: '',
      args: [],
    );
  }

  /// `Level maintenance instructions`
  String get random_text_606 {
    return Intl.message(
      'Level maintenance instructions',
      name: 'random_text_606',
      desc: '',
      args: [],
    );
  }

  /// `Audit Instructions`
  String get random_text_607 {
    return Intl.message(
      'Audit Instructions',
      name: 'random_text_607',
      desc: '',
      args: [],
    );
  }

  /// `Activity Statement`
  String get random_text_608 {
    return Intl.message(
      'Activity Statement',
      name: 'random_text_608',
      desc: '',
      args: [],
    );
  }

  /// `Explanation Instructions`
  String get random_text_609 {
    return Intl.message(
      'Explanation Instructions',
      name: 'random_text_609',
      desc: '',
      args: [],
    );
  }

  /// `If you meet the requirements for VIP promotion (that is, you meet the requirements for all codes), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all the promotion bonuses; 2. Daily salary: Meet the daily salary requirements corresponding to the VIP level , you can receive the bonus for the corresponding day, which will be reset at 00:00 every day;`
  String get random_text_610 {
    return Intl.message(
      'If you meet the requirements for VIP promotion (that is, you meet the requirements for all codes), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all the promotion bonuses; 2. Daily salary: Meet the daily salary requirements corresponding to the VIP level , you can receive the bonus for the corresponding day, which will be reset at 00:00 every day;',
      name: 'random_text_610',
      desc: '',
      args: [],
    );
  }

  /// `If you meet the relegation requirements within 90 days after being promoted or downgraded (that is, all code requirements are met), you can retain your current VIP level. If the coding demand cannot be met within 90 days, the VIP level will be lowered.`
  String get random_text_611 {
    return Intl.message(
      'If you meet the relegation requirements within 90 days after being promoted or downgraded (that is, all code requirements are met), you can retain your current VIP level. If the coding demand cannot be met within 90 days, the VIP level will be lowered.',
      name: 'random_text_611',
      desc: '',
      args: [],
    );
  }

  /// `Daily Salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00am every day.`
  String get random_text_612 {
    return Intl.message(
      'Daily Salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00am every day.',
      name: 'random_text_612',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Salary: If you reach the VIP level corresponding to the weekly salary requirements, you can receive the corresponding weekly bonus, which is reset every Monday at 12:00am.`
  String get random_text_613 {
    return Intl.message(
      'Weekly Salary: If you reach the VIP level corresponding to the weekly salary requirements, you can receive the corresponding weekly bonus, which is reset every Monday at 12:00am.',
      name: 'random_text_613',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00am on the 1st of each month.`
  String get random_text_614 {
    return Intl.message(
      'Monthly Salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00am on the 1st of each month.',
      name: 'random_text_614',
      desc: '',
      args: [],
    );
  }

  /// `After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the level maintenance requirements, the member will automatically be downgraded by one level;`
  String get random_text_615 {
    return Intl.message(
      'After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the level maintenance requirements, the member will automatically be downgraded by one level;',
      name: 'random_text_615',
      desc: '',
      args: [],
    );
  }

  /// `Audit Instructions: The bonus given by VIP requires 1 times of turnover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform.`
  String get random_text_616 {
    return Intl.message(
      'Audit Instructions: The bonus given by VIP requires 1 times of turnover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform.',
      name: 'random_text_616',
      desc: '',
      args: [],
    );
  }

  /// `Activity Statement: This function is limited to normal game betting by the account owner. Renting accounts, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, exploitation of protocols, loopholes, interfaces, If group control or other technical means are involved, and once verified to be true, the platform has the right to terminate members' login, suspend members' use of the website, and confiscate bonuses and improper profits without prior notice.`
  String get random_text_617 {
    return Intl.message(
      'Activity Statement: This function is limited to normal game betting by the account owner. Renting accounts, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, exploitation of protocols, loopholes, interfaces, If group control or other technical means are involved, and once verified to be true, the platform has the right to terminate members\' login, suspend members\' use of the website, and confiscate bonuses and improper profits without prior notice.',
      name: 'random_text_617',
      desc: '',
      args: [],
    );
  }

  /// `Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguities in textual understanding, the platform reserves the right to final interpretation of this event.`
  String get random_text_618 {
    return Intl.message(
      'Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguities in textual understanding, the platform reserves the right to final interpretation of this event.',
      name: 'random_text_618',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get random_text_619 {
    return Intl.message(
      'Points',
      name: 'random_text_619',
      desc: '',
      args: [],
    );
  }

  /// `Relegation Points`
  String get random_text_620 {
    return Intl.message(
      'Relegation Points',
      name: 'random_text_620',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 Days`
  String get random_text_621 {
    return Intl.message(
      'Last 7 Days',
      name: 'random_text_621',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 Days`
  String get random_text_622 {
    return Intl.message(
      'Last 30 Days',
      name: 'random_text_622',
      desc: '',
      args: [],
    );
  }

  /// `Last 90 Days`
  String get random_text_623 {
    return Intl.message(
      'Last 90 Days',
      name: 'random_text_623',
      desc: '',
      args: [],
    );
  }

  /// `VIP Points`
  String get random_text_624 {
    return Intl.message(
      'VIP Points',
      name: 'random_text_624',
      desc: '',
      args: [],
    );
  }

  /// `VIP points will be calculated based on your valid bets.`
  String get random_text_625 {
    return Intl.message(
      'VIP points will be calculated based on your valid bets.',
      name: 'random_text_625',
      desc: '',
      args: [],
    );
  }

  /// `1. The exchange rate will be synchronized in real time according to market fluctuations`
  String get random_text_626 {
    return Intl.message(
      '1. The exchange rate will be synchronized in real time according to market fluctuations',
      name: 'random_text_626',
      desc: '',
      args: [],
    );
  }

  /// `2. The exchange rate will prevail when your bet is settled`
  String get random_text_627 {
    return Intl.message(
      '2. The exchange rate will prevail when your bet is settled',
      name: 'random_text_627',
      desc: '',
      args: [],
    );
  }

  /// `3. Valid bets that have been counted will not be affected by subsequent exchange rates`
  String get random_text_628 {
    return Intl.message(
      '3. Valid bets that have been counted will not be affected by subsequent exchange rates',
      name: 'random_text_628',
      desc: '',
      args: [],
    );
  }

  /// `4. Betting on different venues will result in different accumulation of VIP points. For details, please see the picture below`
  String get random_text_629 {
    return Intl.message(
      '4. Betting on different venues will result in different accumulation of VIP points. For details, please see the picture below',
      name: 'random_text_629',
      desc: '',
      args: [],
    );
  }

  /// `Betting Currency`
  String get random_text_630 {
    return Intl.message(
      'Betting Currency',
      name: 'random_text_630',
      desc: '',
      args: [],
    );
  }

  /// `Stadium Points`
  String get random_text_631 {
    return Intl.message(
      'Stadium Points',
      name: 'random_text_631',
      desc: '',
      args: [],
    );
  }

  /// `Live Venue Points`
  String get random_text_632 {
    return Intl.message(
      'Live Venue Points',
      name: 'random_text_632',
      desc: '',
      args: [],
    );
  }

  /// `Electronic venue points`
  String get random_text_633 {
    return Intl.message(
      'Electronic venue points',
      name: 'random_text_633',
      desc: '',
      args: [],
    );
  }

  /// `Fishing venue points`
  String get random_text_634 {
    return Intl.message(
      'Fishing venue points',
      name: 'random_text_634',
      desc: '',
      args: [],
    );
  }

  /// `Activity Bonus`
  String get random_text_635 {
    return Intl.message(
      'Activity Bonus',
      name: 'random_text_635',
      desc: '',
      args: [],
    );
  }

  /// `With`
  String get random_text_636 {
    return Intl.message(
      'With',
      name: 'random_text_636',
      desc: '',
      args: [],
    );
  }

  /// `Settlement`
  String get random_text_637 {
    return Intl.message(
      'Settlement',
      name: 'random_text_637',
      desc: '',
      args: [],
    );
  }

  /// `Please check the address carefully. If the address is incorrect, funds will not be received.`
  String get random_text_638 {
    return Intl.message(
      'Please check the address carefully. If the address is incorrect, funds will not be received.',
      name: 'random_text_638',
      desc: '',
      args: [],
    );
  }

  /// `Please select the country`
  String get random_text_639 {
    return Intl.message(
      'Please select the country',
      name: 'random_text_639',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the city`
  String get random_text_640 {
    return Intl.message(
      'Please fill in the city',
      name: 'random_text_640',
      desc: '',
      args: [],
    );
  }

  /// `PIX account type`
  String get random_text_641 {
    return Intl.message(
      'PIX account type',
      name: 'random_text_641',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get random_text_642 {
    return Intl.message(
      'Country',
      name: 'random_text_642',
      desc: '',
      args: [],
    );
  }

  /// `Protocol`
  String get random_text_643 {
    return Intl.message(
      'Protocol',
      name: 'random_text_643',
      desc: '',
      args: [],
    );
  }

  /// `Virtual currency address`
  String get random_text_644 {
    return Intl.message(
      'Virtual currency address',
      name: 'random_text_644',
      desc: '',
      args: [],
    );
  }

  /// `Please Bind Withdrawal Information\n1. Each currency can only bind 3 payment information\n2. If you need to bind more, please delete the infrequently used ones first`
  String get random_text_645 {
    return Intl.message(
      'Please Bind Withdrawal Information\n1. Each currency can only bind 3 payment information\n2. If you need to bind more, please delete the infrequently used ones first',
      name: 'random_text_645',
      desc: '',
      args: [],
    );
  }

  /// `Bind Payment Account Number`
  String get random_text_646 {
    return Intl.message(
      'Bind Payment Account Number',
      name: 'random_text_646',
      desc: '',
      args: [],
    );
  }

  /// `Bind Payment Account Number`
  String get random_text_647 {
    return Intl.message(
      'Bind Payment Account Number',
      name: 'random_text_647',
      desc: '',
      args: [],
    );
  }

  /// `Bind Payment Account Number`
  String get random_text_648 {
    return Intl.message(
      'Bind Payment Account Number',
      name: 'random_text_648',
      desc: '',
      args: [],
    );
  }

  /// `Each currency can only be bound to 3 payment information. If you need to bind more, please delete the infrequently used ones first.`
  String get random_text_649 {
    return Intl.message(
      'Each currency can only be bound to 3 payment information. If you need to bind more, please delete the infrequently used ones first.',
      name: 'random_text_649',
      desc: '',
      args: [],
    );
  }

  /// `Exchange `
  String get random_text_650 {
    return Intl.message(
      'Exchange ',
      name: 'random_text_650',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get random_text_651 {
    return Intl.message(
      'Pay',
      name: 'random_text_651',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Rate: `
  String get random_text_652 {
    return Intl.message(
      'Exchange Rate: ',
      name: 'random_text_652',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get random_text_653 {
    return Intl.message(
      'Payment Method',
      name: 'random_text_653',
      desc: '',
      args: [],
    );
  }

  /// `Please scroll down to select the recharge amount`
  String get random_text_654 {
    return Intl.message(
      'Please scroll down to select the recharge amount',
      name: 'random_text_654',
      desc: '',
      args: [],
    );
  }

  /// `You do not have payment information for this currency yet \n. Please go to the card package to bind payment information`
  String get random_text_655 {
    return Intl.message(
      'You do not have payment information for this currency yet \n. Please go to the card package to bind payment information',
      name: 'random_text_655',
      desc: '',
      args: [],
    );
  }

  /// `Go to My Cards`
  String get random_text_656 {
    return Intl.message(
      'Go to My Cards',
      name: 'random_text_656',
      desc: '',
      args: [],
    );
  }

  /// `Please bind your bank card first`
  String get random_text_657 {
    return Intl.message(
      'Please bind your bank card first',
      name: 'random_text_657',
      desc: '',
      args: [],
    );
  }

  /// `This is your first time to withdraw money, you need to set a fund password first`
  String get random_text_658 {
    return Intl.message(
      'This is your first time to withdraw money, you need to set a fund password first',
      name: 'random_text_658',
      desc: '',
      args: [],
    );
  }

  /// `This is your first withdrawal; you need to set up two-factor authentication first.`
  String get random_text_659 {
    return Intl.message(
      'This is your first withdrawal; you need to set up two-factor authentication first.',
      name: 'random_text_659',
      desc: '',
      args: [],
    );
  }

  /// `Mark`
  String get random_text_660 {
    return Intl.message(
      'Mark',
      name: 'random_text_660',
      desc: '',
      args: [],
    );
  }

  /// `Memo`
  String get random_text_661 {
    return Intl.message(
      'Memo',
      name: 'random_text_661',
      desc: '',
      args: [],
    );
  }

  /// `Please bind the address first`
  String get random_text_662 {
    return Intl.message(
      'Please bind the address first',
      name: 'random_text_662',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get random_text_663 {
    return Intl.message(
      'Network',
      name: 'random_text_663',
      desc: '',
      args: [],
    );
  }

  /// `Deposit currency`
  String get random_text_664 {
    return Intl.message(
      'Deposit currency',
      name: 'random_text_664',
      desc: '',
      args: [],
    );
  }

  /// `Balance:`
  String get random_text_665 {
    return Intl.message(
      'Balance:',
      name: 'random_text_665',
      desc: '',
      args: [],
    );
  }

  /// `Collapse`
  String get random_text_666 {
    return Intl.message(
      'Collapse',
      name: 'random_text_666',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no deposit channels for this currency, \n Please try again later or contact customer service`
  String get random_text_667 {
    return Intl.message(
      'There are currently no deposit channels for this currency, \n Please try again later or contact customer service',
      name: 'random_text_667',
      desc: '',
      args: [],
    );
  }

  /// `Your password must be at least 8 characters long`
  String get random_text_668 {
    return Intl.message(
      'Your password must be at least 8 characters long',
      name: 'random_text_668',
      desc: '',
      args: [],
    );
  }

  /// `Your verification code must be 6 digits`
  String get random_text_669 {
    return Intl.message(
      'Your verification code must be 6 digits',
      name: 'random_text_669',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get random_text_670 {
    return Intl.message(
      'Password',
      name: 'random_text_670',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get random_text_671 {
    return Intl.message(
      'Submit',
      name: 'random_text_671',
      desc: '',
      args: [],
    );
  }

  /// `Verification email has been resent to`
  String get random_text_672 {
    return Intl.message(
      'Verification email has been resent to',
      name: 'random_text_672',
      desc: '',
      args: [],
    );
  }

  /// `Mail sent`
  String get random_text_673 {
    return Intl.message(
      'Mail sent',
      name: 'random_text_673',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation email address has been sent to`
  String get random_text_674 {
    return Intl.message(
      'Confirmation email address has been sent to',
      name: 'random_text_674',
      desc: '',
      args: [],
    );
  }

  /// `The password Must contain at least 1 number`
  String get random_text_675 {
    return Intl.message(
      'The password Must contain at least 1 number',
      name: 'random_text_675',
      desc: '',
      args: [],
    );
  }

  /// `Your password must be at least 8 characters long`
  String get random_text_676 {
    return Intl.message(
      'Your password must be at least 8 characters long',
      name: 'random_text_676',
      desc: '',
      args: [],
    );
  }

  /// `Passwords are inconsistent`
  String get random_text_677 {
    return Intl.message(
      'Passwords are inconsistent',
      name: 'random_text_677',
      desc: '',
      args: [],
    );
  }

  /// `You haven't bound your email address yet! Please bind your email address first and then set your fund password`
  String get random_text_678 {
    return Intl.message(
      'You haven\'t bound your email address yet! Please bind your email address first and then set your fund password',
      name: 'random_text_678',
      desc: '',
      args: [],
    );
  }

  /// `Additional time`
  String get random_text_679 {
    return Intl.message(
      'Additional time',
      name: 'random_text_679',
      desc: '',
      args: [],
    );
  }

  /// `Virtual Sports`
  String get random_text_680 {
    return Intl.message(
      'Virtual Sports',
      name: 'random_text_680',
      desc: '',
      args: [],
    );
  }

  /// `No Active Bets`
  String get random_text_681 {
    return Intl.message(
      'No Active Bets',
      name: 'random_text_681',
      desc: '',
      args: [],
    );
  }

  /// `Handicap type`
  String get random_text_682 {
    return Intl.message(
      'Handicap type',
      name: 'random_text_682',
      desc: '',
      args: [],
    );
  }

  /// `No Odds Available Yet`
  String get random_text_683 {
    return Intl.message(
      'No Odds Available Yet',
      name: 'random_text_683',
      desc: '',
      args: [],
    );
  }

  /// `There are no favorite events yet`
  String get random_text_684 {
    return Intl.message(
      'There are no favorite events yet',
      name: 'random_text_684',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get random_text_685 {
    return Intl.message(
      'Done',
      name: 'random_text_685',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get random_text_686 {
    return Intl.message(
      'Processing',
      name: 'random_text_686',
      desc: '',
      args: [],
    );
  }

  /// `Please Bind Withdrawal Information`
  String get random_text_645c1 {
    return Intl.message(
      'Please Bind Withdrawal Information',
      name: 'random_text_645c1',
      desc: '',
      args: [],
    );
  }

  /// `1. Each currency can only bind 3 payment information`
  String get random_text_645c2 {
    return Intl.message(
      '1. Each currency can only bind 3 payment information',
      name: 'random_text_645c2',
      desc: '',
      args: [],
    );
  }

  /// `2. If you need to bind more, please delete the infrequently used ones first`
  String get random_text_645c3 {
    return Intl.message(
      '2. If you need to bind more, please delete the infrequently used ones first',
      name: 'random_text_645c3',
      desc: '',
      args: [],
    );
  }

  /// `You have no payment information for this currency yet`
  String get random_text_655c1 {
    return Intl.message(
      'You have no payment information for this currency yet',
      name: 'random_text_655c1',
      desc: '',
      args: [],
    );
  }

  /// `Please go to my cards to bind payment information.`
  String get random_text_655c2 {
    return Intl.message(
      'Please go to my cards to bind payment information.',
      name: 'random_text_655c2',
      desc: '',
      args: [],
    );
  }

  /// `Activity 1`
  String get random_text_687 {
    return Intl.message(
      'Activity 1',
      name: 'random_text_687',
      desc: '',
      args: [],
    );
  }

  /// `Activity 2`
  String get random_text_688 {
    return Intl.message(
      'Activity 2',
      name: 'random_text_688',
      desc: '',
      args: [],
    );
  }

  /// `Activity 3`
  String get random_text_689 {
    return Intl.message(
      'Activity 3',
      name: 'random_text_689',
      desc: '',
      args: [],
    );
  }

  /// `Activity 4`
  String get random_text_690 {
    return Intl.message(
      'Activity 4',
      name: 'random_text_690',
      desc: '',
      args: [],
    );
  }

  /// `Do Not Show Me Again Today`
  String get random_text_691 {
    return Intl.message(
      'Do Not Show Me Again Today',
      name: 'random_text_691',
      desc: '',
      args: [],
    );
  }

  /// `Announcement`
  String get random_text_692 {
    return Intl.message(
      'Announcement',
      name: 'random_text_692',
      desc: '',
      args: [],
    );
  }

  /// `VIP-Exclusive Cashback Offer`
  String get random_text_693 {
    return Intl.message(
      'VIP-Exclusive Cashback Offer',
      name: 'random_text_693',
      desc: '',
      args: [],
    );
  }

  /// `After each of your bets, you will receive a cashback offer based on your VIP level.`
  String get random_text_694 {
    return Intl.message(
      'After each of your bets, you will receive a cashback offer based on your VIP level.',
      name: 'random_text_694',
      desc: '',
      args: [],
    );
  }

  /// `Failed to collect`
  String get random_text_695 {
    return Intl.message(
      'Failed to collect',
      name: 'random_text_695',
      desc: '',
      args: [],
    );
  }

  /// `Claim Successful`
  String get random_text_696 {
    return Intl.message(
      'Claim Successful',
      name: 'random_text_696',
      desc: '',
      args: [],
    );
  }

  /// `Promotion Bonus Claim`
  String get random_text_697 {
    return Intl.message(
      'Promotion Bonus Claim',
      name: 'random_text_697',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Claimed Promotion Bonus`
  String get random_text_698 {
    return Intl.message(
      'Successfully Claimed Promotion Bonus',
      name: 'random_text_698',
      desc: '',
      args: [],
    );
  }

  /// `You have reached the maximum VIP level`
  String get random_text_699 {
    return Intl.message(
      'You have reached the maximum VIP level',
      name: 'random_text_699',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now to start betting at the casino or sports markets`
  String get random_text_700 {
    return Intl.message(
      'Sign up now to start betting at the casino or sports markets',
      name: 'random_text_700',
      desc: '',
      args: [],
    );
  }

  /// `Claim your winnings immediately. The process of claiming daily, weekly and monthly bonuses is simple and easy.`
  String get random_text_701 {
    return Intl.message(
      'Claim your winnings immediately. The process of claiming daily, weekly and monthly bonuses is simple and easy.',
      name: 'random_text_701',
      desc: '',
      args: [],
    );
  }

  /// `Meibo provides a unique and unparalleled experience through continuous bonus giveaways.`
  String get random_text_702 {
    return Intl.message(
      'Meibo provides a unique and unparalleled experience through continuous bonus giveaways.',
      name: 'random_text_702',
      desc: '',
      args: [],
    );
  }

  /// `Instructions for Receiving: The bonuses for this event are all issued in USDT; you can choose the currency you want to receive, and the exchange rate between currencies adopts the real-time market exchange rate.`
  String get random_text_703 {
    return Intl.message(
      'Instructions for Receiving: The bonuses for this event are all issued in USDT; you can choose the currency you want to receive, and the exchange rate between currencies adopts the real-time market exchange rate.',
      name: 'random_text_703',
      desc: '',
      args: [],
    );
  }

  /// `Please check the card number carefully. If the card number is incorrect, funds will not be available.`
  String get random_text_704 {
    return Intl.message(
      'Please check the card number carefully. If the card number is incorrect, funds will not be available.',
      name: 'random_text_704',
      desc: '',
      args: [],
    );
  }

  /// `Set account as default`
  String get random_text_705 {
    return Intl.message(
      'Set account as default',
      name: 'random_text_705',
      desc: '',
      args: [],
    );
  }

  /// `Please check your account carefully. If the card number is incorrect, funds will not be available.`
  String get random_text_706 {
    return Intl.message(
      'Please check your account carefully. If the card number is incorrect, funds will not be available.',
      name: 'random_text_706',
      desc: '',
      args: [],
    );
  }

  /// `Exchange `
  String get random_text_707 {
    return Intl.message(
      'Exchange ',
      name: 'random_text_707',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get random_text_708 {
    return Intl.message(
      'To',
      name: 'random_text_708',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get random_text_709 {
    return Intl.message(
      'Pay',
      name: 'random_text_709',
      desc: '',
      args: [],
    );
  }

  /// `Pay in {type7}`
  String random_text_709c1(Object type7) {
    return Intl.message(
      'Pay in $type7',
      name: 'random_text_709c1',
      desc: '',
      args: [type7],
    );
  }

  /// `Confirm Withdrawal`
  String get random_text_710 {
    return Intl.message(
      'Confirm Withdrawal',
      name: 'random_text_710',
      desc: '',
      args: [],
    );
  }

  /// `Available Withdrawal Amount`
  String get random_text_711 {
    return Intl.message(
      'Available Withdrawal Amount',
      name: 'random_text_711',
      desc: '',
      args: [],
    );
  }

  /// `\n Total turnover required for full withdrawal`
  String get random_text_712 {
    return Intl.message(
      '\n Total turnover required for full withdrawal',
      name: 'random_text_712',
      desc: '',
      args: [],
    );
  }

  /// `No deposit channels available for this currency,`
  String get random_text_713 {
    return Intl.message(
      'No deposit channels available for this currency,',
      name: 'random_text_713',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later or contact customer support`
  String get random_text_714 {
    return Intl.message(
      'Please try again later or contact customer support',
      name: 'random_text_714',
      desc: '',
      args: [],
    );
  }

  /// `Successfully changed fund password`
  String get random_text_715 {
    return Intl.message(
      'Successfully changed fund password',
      name: 'random_text_715',
      desc: '',
      args: [],
    );
  }

  /// `Fund password set successfully`
  String get random_text_716 {
    return Intl.message(
      'Fund password set successfully',
      name: 'random_text_716',
      desc: '',
      args: [],
    );
  }

  /// `The sports venue is under maintenance...`
  String get random_text_717 {
    return Intl.message(
      'The sports venue is under maintenance...',
      name: 'random_text_717',
      desc: '',
      args: [],
    );
  }

  /// `Under maintenance`
  String get random_text_718 {
    return Intl.message(
      'Under maintenance',
      name: 'random_text_718',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get random_text_719 {
    return Intl.message(
      'to',
      name: 'random_text_719',
      desc: '',
      args: [],
    );
  }

  /// `Return to home page`
  String get random_text_720 {
    return Intl.message(
      'Return to home page',
      name: 'random_text_720',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get random_text_721 {
    return Intl.message(
      'No Data',
      name: 'random_text_721',
      desc: '',
      args: [],
    );
  }

  /// `Shoot`
  String get random_text_722 {
    return Intl.message(
      'Shoot',
      name: 'random_text_722',
      desc: '',
      args: [],
    );
  }

  /// `Album`
  String get random_text_723 {
    return Intl.message(
      'Album',
      name: 'random_text_723',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get random_text_724 {
    return Intl.message(
      'Close',
      name: 'random_text_724',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get random_text_725 {
    return Intl.message(
      'Verified',
      name: 'random_text_725',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get random_text_726 {
    return Intl.message(
      'Reload',
      name: 'random_text_726',
      desc: '',
      args: [],
    );
  }

  /// `No More Data`
  String get random_text_727 {
    return Intl.message(
      'No More Data',
      name: 'random_text_727',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get random_text_728 {
    return Intl.message(
      'Description',
      name: 'random_text_728',
      desc: '',
      args: [],
    );
  }

  /// `Live streaming`
  String get random_text_729 {
    return Intl.message(
      'Live streaming',
      name: 'random_text_729',
      desc: '',
      args: [],
    );
  }

  /// `Real-time statistics`
  String get random_text_730 {
    return Intl.message(
      'Real-time statistics',
      name: 'random_text_730',
      desc: '',
      args: [],
    );
  }

  /// `Disappear`
  String get random_text_731 {
    return Intl.message(
      'Disappear',
      name: 'random_text_731',
      desc: '',
      args: [],
    );
  }

  /// `Spread`
  String get random_text_732 {
    return Intl.message(
      'Spread',
      name: 'random_text_732',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get random_text_733 {
    return Intl.message(
      'Minutes',
      name: 'random_text_733',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get random_text_734 {
    return Intl.message(
      'Seconds',
      name: 'random_text_734',
      desc: '',
      args: [],
    );
  }

  /// `Start Time:`
  String get random_text_735 {
    return Intl.message(
      'Start Time:',
      name: 'random_text_735',
      desc: '',
      args: [],
    );
  }

  /// `Scoreboard`
  String get random_text_736 {
    return Intl.message(
      'Scoreboard',
      name: 'random_text_736',
      desc: '',
      args: [],
    );
  }

  /// `Loading failed; please retry.`
  String get random_text_737 {
    return Intl.message(
      'Loading failed; please retry.',
      name: 'random_text_737',
      desc: '',
      args: [],
    );
  }

  /// `Loading anomaly`
  String get random_text_738 {
    return Intl.message(
      'Loading anomaly',
      name: 'random_text_738',
      desc: '',
      args: [],
    );
  }

  /// `Service loading anomaly`
  String get random_text_739 {
    return Intl.message(
      'Service loading anomaly',
      name: 'random_text_739',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get random_text_740 {
    return Intl.message(
      'Loading',
      name: 'random_text_740',
      desc: '',
      args: [],
    );
  }

  /// `Current download status: Not started yet`
  String get random_text_741 {
    return Intl.message(
      'Current download status: Not started yet',
      name: 'random_text_741',
      desc: '',
      args: [],
    );
  }

  /// `Update now`
  String get random_text_742 {
    return Intl.message(
      'Update now',
      name: 'random_text_742',
      desc: '',
      args: [],
    );
  }

  /// `Skip update`
  String get random_text_743 {
    return Intl.message(
      'Skip update',
      name: 'random_text_743',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get random_text_744 {
    return Intl.message(
      'Enter first name',
      name: 'random_text_744',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get random_text_745 {
    return Intl.message(
      'Enter last name',
      name: 'random_text_745',
      desc: '',
      args: [],
    );
  }

  /// `Enter city`
  String get random_text_746 {
    return Intl.message(
      'Enter city',
      name: 'random_text_746',
      desc: '',
      args: [],
    );
  }

  /// `Enter detailed address`
  String get random_text_747 {
    return Intl.message(
      'Enter detailed address',
      name: 'random_text_747',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct PIX account`
  String get random_text_748 {
    return Intl.message(
      'Enter correct PIX account',
      name: 'random_text_748',
      desc: '',
      args: [],
    );
  }

  /// `Commission conversion`
  String get random_text_749 {
    return Intl.message(
      'Commission conversion',
      name: 'random_text_749',
      desc: '',
      args: [],
    );
  }

  /// `Your current commission wallet amount is approximately equivalent to:`
  String get random_text_750 {
    return Intl.message(
      'Your current commission wallet amount is approximately equivalent to:',
      name: 'random_text_750',
      desc: '',
      args: [],
    );
  }

  /// `You can choose to convert to your desired currency`
  String get random_text_751 {
    return Intl.message(
      'You can choose to convert to your desired currency',
      name: 'random_text_751',
      desc: '',
      args: [],
    );
  }

  /// `Converted currency`
  String get random_text_752 {
    return Intl.message(
      'Converted currency',
      name: 'random_text_752',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Total Accumulated`
  String get random_text_753 {
    return Intl.message(
      'Estimated Total Accumulated',
      name: 'random_text_753',
      desc: '',
      args: [],
    );
  }

  /// `Confirm conversion`
  String get random_text_754 {
    return Intl.message(
      'Confirm conversion',
      name: 'random_text_754',
      desc: '',
      args: [],
    );
  }

  /// `Commission Transfer`
  String get random_text_755 {
    return Intl.message(
      'Commission Transfer',
      name: 'random_text_755',
      desc: '',
      args: [],
    );
  }

  /// `Commission withdrawal successful`
  String get random_text_756 {
    return Intl.message(
      'Commission withdrawal successful',
      name: 'random_text_756',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw available commission`
  String get random_text_757 {
    return Intl.message(
      'Withdraw available commission',
      name: 'random_text_757',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to Wallet`
  String get random_text_758 {
    return Intl.message(
      'Transfer to Wallet',
      name: 'random_text_758',
      desc: '',
      args: [],
    );
  }

  /// `After transferring to the wallet,  you need 1 time rollover the valid bet before you can withdraw it.`
  String get random_text_759 {
    return Intl.message(
      'After transferring to the wallet,  you need 1 time rollover the valid bet before you can withdraw it.',
      name: 'random_text_759',
      desc: '',
      args: [],
    );
  }

  /// `Total approximately:`
  String get random_text_760 {
    return Intl.message(
      'Total approximately:',
      name: 'random_text_760',
      desc: '',
      args: [],
    );
  }

  /// `Currency conversion commission`
  String get random_text_761 {
    return Intl.message(
      'Currency conversion commission',
      name: 'random_text_761',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get random_text_762 {
    return Intl.message(
      'Transfer',
      name: 'random_text_762',
      desc: '',
      args: [],
    );
  }

  /// `This week`
  String get random_text_763 {
    return Intl.message(
      'This week',
      name: 'random_text_763',
      desc: '',
      args: [],
    );
  }

  /// `This month`
  String get random_text_764 {
    return Intl.message(
      'This month',
      name: 'random_text_764',
      desc: '',
      args: [],
    );
  }

  /// `This quarter`
  String get random_text_765 {
    return Intl.message(
      'This quarter',
      name: 'random_text_765',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get random_text_766 {
    return Intl.message(
      'Back',
      name: 'random_text_766',
      desc: '',
      args: [],
    );
  }

  /// `Vault Explained`
  String get random_text_767 {
    return Intl.message(
      'Vault Explained',
      name: 'random_text_767',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Deposit Amount`
  String get random_text_768 {
    return Intl.message(
      'Minimum Deposit Amount',
      name: 'random_text_768',
      desc: '',
      args: [],
    );
  }

  /// `Annual Interest Rate`
  String get random_text_769 {
    return Intl.message(
      'Annual Interest Rate',
      name: 'random_text_769',
      desc: '',
      args: [],
    );
  }

  /// `You must verify your email address to make a deposit`
  String get random_text_770 {
    return Intl.message(
      'You must verify your email address to make a deposit',
      name: 'random_text_770',
      desc: '',
      args: [],
    );
  }

  /// `years ago`
  String get random_text_771 {
    return Intl.message(
      'years ago',
      name: 'random_text_771',
      desc: '',
      args: [],
    );
  }

  /// `months ago`
  String get random_text_772 {
    return Intl.message(
      'months ago',
      name: 'random_text_772',
      desc: '',
      args: [],
    );
  }

  /// ` Days Ago`
  String get random_text_773 {
    return Intl.message(
      ' Days Ago',
      name: 'random_text_773',
      desc: '',
      args: [],
    );
  }

  /// `A Day Ago`
  String get random_text_773copy2 {
    return Intl.message(
      'A Day Ago',
      name: 'random_text_773copy2',
      desc: '',
      args: [],
    );
  }

  /// `hours ago`
  String get random_text_774 {
    return Intl.message(
      'hours ago',
      name: 'random_text_774',
      desc: '',
      args: [],
    );
  }

  /// `minutes ago`
  String get random_text_775 {
    return Intl.message(
      'minutes ago',
      name: 'random_text_775',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get random_text_776 {
    return Intl.message(
      'Just now',
      name: 'random_text_776',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Currency`
  String get random_text_777 {
    return Intl.message(
      'Exchange Currency',
      name: 'random_text_777',
      desc: '',
      args: [],
    );
  }

  /// `withdraw failed`
  String get random_text_778 {
    return Intl.message(
      'withdraw failed',
      name: 'random_text_778',
      desc: '',
      args: [],
    );
  }

  /// `Currency Exchange Successful`
  String get random_text_779 {
    return Intl.message(
      'Currency Exchange Successful',
      name: 'random_text_779',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get random_text_780 {
    return Intl.message(
      'Send',
      name: 'random_text_780',
      desc: '',
      args: [],
    );
  }

  /// `IP`
  String get random_text_781 {
    return Intl.message(
      'IP',
      name: 'random_text_781',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal successful`
  String get random_text_782 {
    return Intl.message(
      'Withdrawal successful',
      name: 'random_text_782',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal failed`
  String get random_text_783 {
    return Intl.message(
      'Withdrawal failed',
      name: 'random_text_783',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Success`
  String get random_text_784 {
    return Intl.message(
      'Deposit Success',
      name: 'random_text_784',
      desc: '',
      args: [],
    );
  }

  /// `deposit failed`
  String get random_text_785 {
    return Intl.message(
      'deposit failed',
      name: 'random_text_785',
      desc: '',
      args: [],
    );
  }

  /// `Deposit in Process`
  String get random_text_786 {
    return Intl.message(
      'Deposit in Process',
      name: 'random_text_786',
      desc: '',
      args: [],
    );
  }

  /// `Your `
  String get random_text_787 {
    return Intl.message(
      'Your ',
      name: 'random_text_787',
      desc: '',
      args: [],
    );
  }

  /// `withdraw success`
  String get random_text_788 {
    return Intl.message(
      'withdraw success',
      name: 'random_text_788',
      desc: '',
      args: [],
    );
  }

  /// `withdraw in process`
  String get random_text_789 {
    return Intl.message(
      'withdraw in process',
      name: 'random_text_789',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal processed`
  String get random_text_790 {
    return Intl.message(
      'Withdrawal processed',
      name: 'random_text_790',
      desc: '',
      args: [],
    );
  }

  /// `Deposit in Process`
  String get random_text_791 {
    return Intl.message(
      'Deposit in Process',
      name: 'random_text_791',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal has arrived`
  String get random_text_792 {
    return Intl.message(
      'Withdrawal has arrived',
      name: 'random_text_792',
      desc: '',
      args: [],
    );
  }

  /// `Cash withdrawal in progress`
  String get random_text_793 {
    return Intl.message(
      'Cash withdrawal in progress',
      name: 'random_text_793',
      desc: '',
      args: [],
    );
  }

  /// `There are no settled bets yet`
  String get random_text_794 {
    return Intl.message(
      'There are no settled bets yet',
      name: 'random_text_794',
      desc: '',
      args: [],
    );
  }

  /// `No withdrawal channels available for this currency,`
  String get random_text_795 {
    return Intl.message(
      'No withdrawal channels available for this currency,',
      name: 'random_text_795',
      desc: '',
      args: [],
    );
  }

  /// `Yours`
  String get random_text_796 {
    return Intl.message(
      'Yours',
      name: 'random_text_796',
      desc: '',
      args: [],
    );
  }

  /// `on `
  String get random_text_797 {
    return Intl.message(
      'on ',
      name: 'random_text_797',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get random_text_798 {
    return Intl.message(
      'of',
      name: 'random_text_798',
      desc: '',
      args: [],
    );
  }

  /// `Copied!`
  String get random_text_799 {
    return Intl.message(
      'Copied!',
      name: 'random_text_799',
      desc: '',
      args: [],
    );
  }

  /// `Copied, share online!`
  String get random_text_800 {
    return Intl.message(
      'Copied, share online!',
      name: 'random_text_800',
      desc: '',
      args: [],
    );
  }

  /// `Target`
  String get random_text_801 {
    return Intl.message(
      'Target',
      name: 'random_text_801',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get random_text_802 {
    return Intl.message(
      'Result',
      name: 'random_text_802',
      desc: '',
      args: [],
    );
  }

  /// `Risk`
  String get random_text_803 {
    return Intl.message(
      'Risk',
      name: 'random_text_803',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get random_text_804 {
    return Intl.message(
      'Medium',
      name: 'random_text_804',
      desc: '',
      args: [],
    );
  }

  /// `Rows`
  String get random_text_805 {
    return Intl.message(
      'Rows',
      name: 'random_text_805',
      desc: '',
      args: [],
    );
  }

  /// `Banker`
  String get random_text_806 {
    return Intl.message(
      'Banker',
      name: 'random_text_806',
      desc: '',
      args: [],
    );
  }

  /// `Player`
  String get random_text_807 {
    return Intl.message(
      'Player',
      name: 'random_text_807',
      desc: '',
      args: [],
    );
  }

  /// `Roll less than`
  String get random_text_808 {
    return Intl.message(
      'Roll less than',
      name: 'random_text_808',
      desc: '',
      args: [],
    );
  }

  /// `Winning probability`
  String get random_text_809 {
    return Intl.message(
      'Winning probability',
      name: 'random_text_809',
      desc: '',
      args: [],
    );
  }

  /// `Provably Fair`
  String get random_text_810 {
    return Intl.message(
      'Provably Fair',
      name: 'random_text_810',
      desc: '',
      args: [],
    );
  }

  /// `Server Seed`
  String get random_text_811 {
    return Intl.message(
      'Server Seed',
      name: 'random_text_811',
      desc: '',
      args: [],
    );
  }

  /// `Seed not revealed yet`
  String get random_text_812 {
    return Intl.message(
      'Seed not revealed yet',
      name: 'random_text_812',
      desc: '',
      args: [],
    );
  }

  /// `Server Seed (Hashed)`
  String get random_text_813 {
    return Intl.message(
      'Server Seed (Hashed)',
      name: 'random_text_813',
      desc: '',
      args: [],
    );
  }

  /// `Client Seed`
  String get random_text_814 {
    return Intl.message(
      'Client Seed',
      name: 'random_text_814',
      desc: '',
      args: [],
    );
  }

  /// `Real sign`
  String get random_text_815 {
    return Intl.message(
      'Real sign',
      name: 'random_text_815',
      desc: '',
      args: [],
    );
  }

  /// `Rotate your seed pairings to verify this bet`
  String get random_text_816 {
    return Intl.message(
      'Rotate your seed pairings to verify this bet',
      name: 'random_text_816',
      desc: '',
      args: [],
    );
  }

  /// `What is provably fair?`
  String get random_text_817 {
    return Intl.message(
      'What is provably fair?',
      name: 'random_text_817',
      desc: '',
      args: [],
    );
  }

  /// `Hash`
  String get random_text_818 {
    return Intl.message(
      'Hash',
      name: 'random_text_818',
      desc: '',
      args: [],
    );
  }

  /// `Seeds`
  String get random_text_819 {
    return Intl.message(
      'Seeds',
      name: 'random_text_819',
      desc: '',
      args: [],
    );
  }

  /// `Verify bet`
  String get random_text_820 {
    return Intl.message(
      'Verify bet',
      name: 'random_text_820',
      desc: '',
      args: [],
    );
  }

  /// `Feedback submited successfully!`
  String get random_text_821 {
    return Intl.message(
      'Feedback submited successfully!',
      name: 'random_text_821',
      desc: '',
      args: [],
    );
  }

  /// `This currency cannot be used`
  String get random_text_822 {
    return Intl.message(
      'This currency cannot be used',
      name: 'random_text_822',
      desc: '',
      args: [],
    );
  }

  /// `System error`
  String get random_text_823 {
    return Intl.message(
      'System error',
      name: 'random_text_823',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Successful`
  String get random_text_824 {
    return Intl.message(
      'Exchange Successful',
      name: 'random_text_824',
      desc: '',
      args: [],
    );
  }

  /// `Please read the terms and conditions in full and scroll to the end to accept them.`
  String get random_text_825 {
    return Intl.message(
      'Please read the terms and conditions in full and scroll to the end to accept them.',
      name: 'random_text_825',
      desc: '',
      args: [],
    );
  }

  /// `Sports Betting`
  String get random_text_826 {
    return Intl.message(
      'Sports Betting',
      name: 'random_text_826',
      desc: '',
      args: [],
    );
  }

  /// `Latest Promotions`
  String get random_text_827 {
    return Intl.message(
      'Latest Promotions',
      name: 'random_text_827',
      desc: '',
      args: [],
    );
  }

  /// `Ends In `
  String get random_text_828 {
    return Intl.message(
      'Ends In ',
      name: 'random_text_828',
      desc: '',
      args: [],
    );
  }

  /// `Get 100 coins for free`
  String get random_text_829 {
    return Intl.message(
      'Get 100 coins for free',
      name: 'random_text_829',
      desc: '',
      args: [],
    );
  }

  /// `Full Name (same as the account)`
  String get random_text_830 {
    return Intl.message(
      'Full Name (same as the account)',
      name: 'random_text_830',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get random_text_831 {
    return Intl.message(
      'Report',
      name: 'random_text_831',
      desc: '',
      args: [],
    );
  }

  /// `My Invitations`
  String get random_text_832 {
    return Intl.message(
      'My Invitations',
      name: 'random_text_832',
      desc: '',
      args: [],
    );
  }

  /// `Rules`
  String get random_text_833 {
    return Intl.message(
      'Rules',
      name: 'random_text_833',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends to help with withdrawal`
  String get random_text_834 {
    return Intl.message(
      'Invite friends to help with withdrawal',
      name: 'random_text_834',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to wallet still requires`
  String get random_text_835 {
    return Intl.message(
      'Transfer to wallet still requires',
      name: 'random_text_835',
      desc: '',
      args: [],
    );
  }

  /// `Share with friends`
  String get random_text_836 {
    return Intl.message(
      'Share with friends',
      name: 'random_text_836',
      desc: '',
      args: [],
    );
  }

  /// `Give up`
  String get random_text_837 {
    return Intl.message(
      'Give up',
      name: 'random_text_837',
      desc: '',
      args: [],
    );
  }

  /// `BRL withdraw`
  String get random_text_838 {
    return Intl.message(
      'BRL withdraw',
      name: 'random_text_838',
      desc: '',
      args: [],
    );
  }

  /// `Get coins for free`
  String get random_text_839 {
    return Intl.message(
      'Get coins for free',
      name: 'random_text_839',
      desc: '',
      args: [],
    );
  }

  /// `Quick withdrawal`
  String get random_text_840 {
    return Intl.message(
      'Quick withdrawal',
      name: 'random_text_840',
      desc: '',
      args: [],
    );
  }

  /// `Spin for free and win real money`
  String get random_text_841 {
    return Intl.message(
      'Spin for free and win real money',
      name: 'random_text_841',
      desc: '',
      args: [],
    );
  }

  /// `Raffle`
  String get random_text_842 {
    return Intl.message(
      'Raffle',
      name: 'random_text_842',
      desc: '',
      args: [],
    );
  }

  /// `You still need`
  String get random_text_843 {
    return Intl.message(
      'You still need',
      name: 'random_text_843',
      desc: '',
      args: [],
    );
  }

  /// `to withdraw to wallet`
  String get random_text_844 {
    return Intl.message(
      'to withdraw to wallet',
      name: 'random_text_844',
      desc: '',
      args: [],
    );
  }

  /// `{number} Expires in days`
  String random_text_845(Object number) {
    return Intl.message(
      '$number Expires in days',
      name: 'random_text_845',
      desc: '',
      args: [number],
    );
  }

  /// `Bet Now`
  String get random_text_846 {
    return Intl.message(
      'Bet Now',
      name: 'random_text_846',
      desc: '',
      args: [],
    );
  }

  /// `Just Received`
  String get random_text_847 {
    return Intl.message(
      'Just Received',
      name: 'random_text_847',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends to help withdraw`
  String get random_text_848 {
    return Intl.message(
      'Invite friends to help withdraw',
      name: 'random_text_848',
      desc: '',
      args: [],
    );
  }

  /// `2. Send help invitations to random players`
  String get random_text_849 {
    return Intl.message(
      '2. Send help invitations to random players',
      name: 'random_text_849',
      desc: '',
      args: [],
    );
  }

  /// `Send via WhatsApp`
  String get random_text_850 {
    return Intl.message(
      'Send via WhatsApp',
      name: 'random_text_850',
      desc: '',
      args: [],
    );
  }

  /// `Send via SMS`
  String get random_text_851 {
    return Intl.message(
      'Send via SMS',
      name: 'random_text_851',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations on your luck, you won`
  String get random_text_852 {
    return Intl.message(
      'Congratulations on your luck, you won',
      name: 'random_text_852',
      desc: '',
      args: [],
    );
  }

  /// `To withdraw to Pix still requires`
  String get random_text_853 {
    return Intl.message(
      'To withdraw to Pix still requires',
      name: 'random_text_853',
      desc: '',
      args: [],
    );
  }

  /// `Request more cash`
  String get random_text_854 {
    return Intl.message(
      'Request more cash',
      name: 'random_text_854',
      desc: '',
      args: [],
    );
  }

  /// `You'll be able to withdraw soon`
  String get random_text_855 {
    return Intl.message(
      'You\'ll be able to withdraw soon',
      name: 'random_text_855',
      desc: '',
      args: [],
    );
  }

  /// `Total amount to be paid soon`
  String get random_text_856 {
    return Intl.message(
      'Total amount to be paid soon',
      name: 'random_text_856',
      desc: '',
      args: [],
    );
  }

  /// `Payment request submitted`
  String get random_text_857 {
    return Intl.message(
      'Payment request submitted',
      name: 'random_text_857',
      desc: '',
      args: [],
    );
  }

  /// `You still need`
  String get random_text_858 {
    return Intl.message(
      'You still need',
      name: 'random_text_858',
      desc: '',
      args: [],
    );
  }

  /// `to withdraw to wallet`
  String get random_text_859 {
    return Intl.message(
      'to withdraw to wallet',
      name: 'random_text_859',
      desc: '',
      args: [],
    );
  }

  /// `Will be deposited into your wallet account`
  String get random_text_860 {
    return Intl.message(
      'Will be deposited into your wallet account',
      name: 'random_text_860',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends to help with withdrawal`
  String get random_text_861 {
    return Intl.message(
      'Invite friends to help with withdrawal',
      name: 'random_text_861',
      desc: '',
      args: [],
    );
  }

  /// `Please enable permissions`
  String get random_text_862 {
    return Intl.message(
      'Please enable permissions',
      name: 'random_text_862',
      desc: '',
      args: [],
    );
  }

  /// `Get it for free`
  String get random_text_863 {
    return Intl.message(
      'Get it for free',
      name: 'random_text_863',
      desc: '',
      args: [],
    );
  }

  /// `Coin`
  String get random_text_864 {
    return Intl.message(
      'Coin',
      name: 'random_text_864',
      desc: '',
      args: [],
    );
  }

  /// `Collect within 1 hour`
  String get random_text_865 {
    return Intl.message(
      'Collect within 1 hour',
      name: 'random_text_865',
      desc: '',
      args: [],
    );
  }

  /// `Not available in your region`
  String get random_text_866 {
    return Intl.message(
      'Not available in your region',
      name: 'random_text_866',
      desc: '',
      args: [],
    );
  }

  /// `Just cashed out`
  String get random_text_867 {
    return Intl.message(
      'Just cashed out',
      name: 'random_text_867',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get random_text_868 {
    return Intl.message(
      'Monday',
      name: 'random_text_868',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get random_text_869 {
    return Intl.message(
      'Tuesday',
      name: 'random_text_869',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get random_text_870 {
    return Intl.message(
      'Wednesday',
      name: 'random_text_870',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get random_text_871 {
    return Intl.message(
      'Thursday',
      name: 'random_text_871',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get random_text_872 {
    return Intl.message(
      'Friday',
      name: 'random_text_872',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get random_text_873 {
    return Intl.message(
      'Saturday',
      name: 'random_text_873',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get random_text_874 {
    return Intl.message(
      'Sunday',
      name: 'random_text_874',
      desc: '',
      args: [],
    );
  }

  /// `You're so lucky!`
  String get random_text_875 {
    return Intl.message(
      'You\'re so lucky!',
      name: 'random_text_875',
      desc: '',
      args: [],
    );
  }

  /// `All Currencies`
  String get random_text_876 {
    return Intl.message(
      'All Currencies',
      name: 'random_text_876',
      desc: '',
      args: [],
    );
  }

  /// `New Fund Password`
  String get random_text_877 {
    return Intl.message(
      'New Fund Password',
      name: 'random_text_877',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent successfully`
  String get random_text_878 {
    return Intl.message(
      'Verification code sent successfully',
      name: 'random_text_878',
      desc: '',
      args: [],
    );
  }

  /// `Request transfer to wallet`
  String get random_text_879 {
    return Intl.message(
      'Request transfer to wallet',
      name: 'random_text_879',
      desc: '',
      args: [],
    );
  }

  /// `You can transfer to wallet`
  String get random_text_880 {
    return Intl.message(
      'You can transfer to wallet',
      name: 'random_text_880',
      desc: '',
      args: [],
    );
  }

  /// `Request now`
  String get random_text_881 {
    return Intl.message(
      'Request now',
      name: 'random_text_881',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to wallet now`
  String get random_text_882 {
    return Intl.message(
      'Transfer to wallet now',
      name: 'random_text_882',
      desc: '',
      args: [],
    );
  }

  /// `All Activities`
  String get random_text_883 {
    return Intl.message(
      'All Activities',
      name: 'random_text_883',
      desc: '',
      args: [],
    );
  }

  /// `Pending review`
  String get random_text_884 {
    return Intl.message(
      'Pending review',
      name: 'random_text_884',
      desc: '',
      args: [],
    );
  }

  /// `Current Points: `
  String get random_text_885 {
    return Intl.message(
      'Current Points: ',
      name: 'random_text_885',
      desc: '',
      args: [],
    );
  }

  /// `Progress `
  String get random_text_886 {
    return Intl.message(
      'Progress ',
      name: 'random_text_886',
      desc: '',
      args: [],
    );
  }

  /// `Remaining for relegation`
  String get random_text_887 {
    return Intl.message(
      'Remaining for relegation',
      name: 'random_text_887',
      desc: '',
      args: [],
    );
  }

  /// `S`
  String get random_text_888 {
    return Intl.message(
      'S',
      name: 'random_text_888',
      desc: '',
      args: [],
    );
  }

  /// `All currencies you bet with will be standardized to tournament currency`
  String get random_text_889 {
    return Intl.message(
      'All currencies you bet with will be standardized to tournament currency',
      name: 'random_text_889',
      desc: '',
      args: [],
    );
  }

  /// `Please click to retry`
  String get random_text_890 {
    return Intl.message(
      'Please click to retry',
      name: 'random_text_890',
      desc: '',
      args: [],
    );
  }

  /// `Originals`
  String get random_text_891 {
    return Intl.message(
      'Originals',
      name: 'random_text_891',
      desc: '',
      args: [],
    );
  }

  /// `Hello 👋`
  String get random_text_892 {
    return Intl.message(
      'Hello 👋',
      name: 'random_text_892',
      desc: '',
      args: [],
    );
  }

  /// `How can we help?`
  String get random_text_893 {
    return Intl.message(
      'How can we help?',
      name: 'random_text_893',
      desc: '',
      args: [],
    );
  }

  /// `24/7 Online Customer Service`
  String get random_text_894 {
    return Intl.message(
      '24/7 Online Customer Service',
      name: 'random_text_894',
      desc: '',
      args: [],
    );
  }

  /// `Customer service is available to help resolve issues and answer questions`
  String get random_text_895 {
    return Intl.message(
      'Customer service is available to help resolve issues and answer questions',
      name: 'random_text_895',
      desc: '',
      args: [],
    );
  }

  /// `Activity Details`
  String get random_text_896 {
    return Intl.message(
      'Activity Details',
      name: 'random_text_896',
      desc: '',
      args: [],
    );
  }

  /// `12% Cashback`
  String get random_text_897 {
    return Intl.message(
      '12% Cashback',
      name: 'random_text_897',
      desc: '',
      args: [],
    );
  }

  /// `Maximum: 25%`
  String get random_text_898 {
    return Intl.message(
      'Maximum: 25%',
      name: 'random_text_898',
      desc: '',
      args: [],
    );
  }

  /// `5000 Bets to Level 2`
  String get random_text_899 {
    return Intl.message(
      '5000 Bets to Level 2',
      name: 'random_text_899',
      desc: '',
      args: [],
    );
  }

  /// `Your Cashback This Week`
  String get random_text_900 {
    return Intl.message(
      'Your Cashback This Week',
      name: 'random_text_900',
      desc: '',
      args: [],
    );
  }

  /// `You will receive ??? cashback for playing games this week.`
  String get random_text_901 {
    return Intl.message(
      'You will receive ??? cashback for playing games this week.',
      name: 'random_text_901',
      desc: '',
      args: [],
    );
  }

  /// `Statistical Time:`
  String get random_text_902 {
    return Intl.message(
      'Statistical Time:',
      name: 'random_text_902',
      desc: '',
      args: [],
    );
  }

  /// `Distribution Time:`
  String get random_text_903 {
    return Intl.message(
      'Distribution Time:',
      name: 'random_text_903',
      desc: '',
      args: [],
    );
  }

  /// `Claim Now`
  String get random_text_904 {
    return Intl.message(
      'Claim Now',
      name: 'random_text_904',
      desc: '',
      args: [],
    );
  }

  /// `Claim Time:`
  String get random_text_905 {
    return Intl.message(
      'Claim Time:',
      name: 'random_text_905',
      desc: '',
      args: [],
    );
  }

  /// `Cashback Level`
  String get random_text_906 {
    return Intl.message(
      'Cashback Level',
      name: 'random_text_906',
      desc: '',
      args: [],
    );
  }

  /// `Cashback Ratio`
  String get random_text_907 {
    return Intl.message(
      'Cashback Ratio',
      name: 'random_text_907',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Rules`
  String get random_text_908 {
    return Intl.message(
      'Terms and Rules',
      name: 'random_text_908',
      desc: '',
      args: [],
    );
  }

  /// `Cashback provided weekly as a reward.`
  String get random_text_909 {
    return Intl.message(
      'Cashback provided weekly as a reward.',
      name: 'random_text_909',
      desc: '',
      args: [],
    );
  }

  /// `The weekly cashback calculation period is from Monday 00:00 to Sunday 23:59.`
  String get random_text_910 {
    return Intl.message(
      'The weekly cashback calculation period is from Monday 00:00 to Sunday 23:59.',
      name: 'random_text_910',
      desc: '',
      args: [],
    );
  }

  /// `Cashback application period: From next Monday 06:00 to Friday 23:59, expired claims will not be accepted.`
  String get random_text_911 {
    return Intl.message(
      'Cashback application period: From next Monday 06:00 to Friday 23:59, expired claims will not be accepted.',
      name: 'random_text_911',
      desc: '',
      args: [],
    );
  }

  /// `Multiply the actual loss amount by the cashback ratio to get this week's cashback amount.`
  String get random_text_912 {
    return Intl.message(
      'Multiply the actual loss amount by the cashback ratio to get this week\'s cashback amount.',
      name: 'random_text_912',
      desc: '',
      args: [],
    );
  }

  /// `If you haven't placed any bets during the cashback activity period, or if your earnings or total earnings from last week exceed your losses, you will not receive cashback.`
  String get random_text_913 {
    return Intl.message(
      'If you haven\'t placed any bets during the cashback activity period, or if your earnings or total earnings from last week exceed your losses, you will not receive cashback.',
      name: 'random_text_913',
      desc: '',
      args: [],
    );
  }

  /// `The maximum weekly cashback reward per person is 10,000 BRL`
  String get random_text_914 {
    return Intl.message(
      'The maximum weekly cashback reward per person is 10,000 BRL',
      name: 'random_text_914',
      desc: '',
      args: [],
    );
  }

  /// `Cashback amount can be withdrawn directly or used to continue gaming.`
  String get random_text_915 {
    return Intl.message(
      'Cashback amount can be withdrawn directly or used to continue gaming.',
      name: 'random_text_915',
      desc: '',
      args: [],
    );
  }

  /// `Join Now!`
  String get random_text_916 {
    return Intl.message(
      'Join Now!',
      name: 'random_text_916',
      desc: '',
      args: [],
    );
  }

  /// `Invitation Details`
  String get random_text_917 {
    return Intl.message(
      'Invitation Details',
      name: 'random_text_917',
      desc: '',
      args: [],
    );
  }

  /// `Valid`
  String get random_text_918 {
    return Intl.message(
      'Valid',
      name: 'random_text_918',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get random_text_919 {
    return Intl.message(
      'Invalid',
      name: 'random_text_919',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate Cumulative Recharge`
  String get random_text_920 {
    return Intl.message(
      'Subordinate Cumulative Recharge',
      name: 'random_text_920',
      desc: '',
      args: [],
    );
  }

  /// `or above`
  String get random_text_921 {
    return Intl.message(
      'or above',
      name: 'random_text_921',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate Cumulative Betting`
  String get random_text_922 {
    return Intl.message(
      'Subordinate Cumulative Betting',
      name: 'random_text_922',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate Cumulative Recharge Frequency`
  String get random_text_923 {
    return Intl.message(
      'Subordinate Cumulative Recharge Frequency',
      name: 'random_text_923',
      desc: '',
      args: [],
    );
  }

  /// `2 times or more`
  String get random_text_924 {
    return Intl.message(
      '2 times or more',
      name: 'random_text_924',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate Cumulative Recharge Days`
  String get random_text_925 {
    return Intl.message(
      'Subordinate Cumulative Recharge Days',
      name: 'random_text_925',
      desc: '',
      args: [],
    );
  }

  /// `Try Making a Deposit`
  String get random_text_926 {
    return Intl.message(
      'Try Making a Deposit',
      name: 'random_text_926',
      desc: '',
      args: [],
    );
  }

  /// `Promotion Activity`
  String get random_text_927 {
    return Intl.message(
      'Promotion Activity',
      name: 'random_text_927',
      desc: '',
      args: [],
    );
  }

  /// `Quick Share`
  String get random_text_928 {
    return Intl.message(
      'Quick Share',
      name: 'random_text_928',
      desc: '',
      args: [],
    );
  }

  /// `0 Valid Referrals`
  String get random_text_929 {
    return Intl.message(
      '0 Valid Referrals',
      name: 'random_text_929',
      desc: '',
      args: [],
    );
  }

  /// `What is a valid referral? (meeting the following conditions)`
  String get random_text_930 {
    return Intl.message(
      'What is a valid referral? (meeting the following conditions)',
      name: 'random_text_930',
      desc: '',
      args: [],
    );
  }

  /// `Activity Requirements`
  String get random_text_931 {
    return Intl.message(
      'Activity Requirements',
      name: 'random_text_931',
      desc: '',
      args: [],
    );
  }

  /// `Cumulative recharge meets activity requirements, reset daily at 00:00`
  String get random_text_932 {
    return Intl.message(
      'Cumulative recharge meets activity requirements, reset daily at 00:00',
      name: 'random_text_932',
      desc: '',
      args: [],
    );
  }

  /// `Designated Deposit`
  String get random_text_933 {
    return Intl.message(
      'Designated Deposit',
      name: 'random_text_933',
      desc: '',
      args: [],
    );
  }

  /// `Total Deposit`
  String get random_text_934 {
    return Intl.message(
      'Total Deposit',
      name: 'random_text_934',
      desc: '',
      args: [],
    );
  }

  /// `Activity Content`
  String get random_text_935 {
    return Intl.message(
      'Activity Content',
      name: 'random_text_935',
      desc: '',
      args: [],
    );
  }

  /// `1.  Daily cumulative deposits entitle you to rewards at different levels. The more you deposit, the larger the rewards, up to a maximum of 0.02. \n\n2.  During the event period, the accumulated recharge amount will be reset to zero at 00:00 each day, and you can continue to recharge to receive rewards. \n\n3.  Rewards can only be claimed the next day and can only be manually claimed on the iOS, Android, H5, and PC platforms. Unclaimed rewards will be invalid.  \n\n4.  The bonus for this event (excluding the principal) must be wagered at least once to withdraw. Wagering is not limited to any gaming platform.  \n\n5.  This event is only available for account owners who engage in manual operations, leasing, use of cheating software, bots, collusion between different accounts, manipulation, arbitrage, API, agreements, exploitation of vulnerabilities, group control, or other technical means are prohibited. Otherwise, rewards may be canceled, deducted, or the account may be frozen or even blacklisted. \n\n6.  In order to avoid differences in interpretation, the platform reserves the right to interpret this event.`
  String get random_text_936 {
    return Intl.message(
      '1.  Daily cumulative deposits entitle you to rewards at different levels. The more you deposit, the larger the rewards, up to a maximum of 0.02. \n\n2.  During the event period, the accumulated recharge amount will be reset to zero at 00:00 each day, and you can continue to recharge to receive rewards. \n\n3.  Rewards can only be claimed the next day and can only be manually claimed on the iOS, Android, H5, and PC platforms. Unclaimed rewards will be invalid.  \n\n4.  The bonus for this event (excluding the principal) must be wagered at least once to withdraw. Wagering is not limited to any gaming platform.  \n\n5.  This event is only available for account owners who engage in manual operations, leasing, use of cheating software, bots, collusion between different accounts, manipulation, arbitrage, API, agreements, exploitation of vulnerabilities, group control, or other technical means are prohibited. Otherwise, rewards may be canceled, deducted, or the account may be frozen or even blacklisted. \n\n6.  In order to avoid differences in interpretation, the platform reserves the right to interpret this event.',
      name: 'random_text_936',
      desc: '',
      args: [],
    );
  }

  /// `Try depositing to see if you can receive a bonus.`
  String get random_text_937 {
    return Intl.message(
      'Try depositing to see if you can receive a bonus.',
      name: 'random_text_937',
      desc: '',
      args: [],
    );
  }

  /// `Relegation reminder`
  String get random_text_938 {
    return Intl.message(
      'Relegation reminder',
      name: 'random_text_938',
      desc: '',
      args: [],
    );
  }

  /// `Claim cashback`
  String get random_text_939 {
    return Intl.message(
      'Claim cashback',
      name: 'random_text_939',
      desc: '',
      args: [],
    );
  }

  /// `Claim Now`
  String get random_text_939copy2 {
    return Intl.message(
      'Claim Now',
      name: 'random_text_939copy2',
      desc: '',
      args: [],
    );
  }

  /// `Birthday Bonus`
  String get random_text_940 {
    return Intl.message(
      'Birthday Bonus',
      name: 'random_text_940',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get random_text_941 {
    return Intl.message(
      'Platform',
      name: 'random_text_941',
      desc: '',
      args: [],
    );
  }

  /// `Ratio`
  String get random_text_942 {
    return Intl.message(
      'Ratio',
      name: 'random_text_942',
      desc: '',
      args: [],
    );
  }

  /// `Relegation recharge still required:`
  String get random_text_943 {
    return Intl.message(
      'Relegation recharge still required:',
      name: 'random_text_943',
      desc: '',
      args: [],
    );
  }

  /// `Relegation wagering still required:`
  String get random_text_944 {
    return Intl.message(
      'Relegation wagering still required:',
      name: 'random_text_944',
      desc: '',
      args: [],
    );
  }

  /// `Red envelope event`
  String get random_text_945 {
    return Intl.message(
      'Red envelope event',
      name: 'random_text_945',
      desc: '',
      args: [],
    );
  }

  /// `Each red envelope is 100,000,`
  String get random_text_946 {
    return Intl.message(
      'Each red envelope is 100,000,',
      name: 'random_text_946',
      desc: '',
      args: [],
    );
  }

  /// `, with a maximum red envelope of 8888`
  String get random_text_947 {
    return Intl.message(
      ', with a maximum red envelope of 8888',
      name: 'random_text_947',
      desc: '',
      args: [],
    );
  }

  /// `1. Each red envelope rain distributes 100,000 reais for free.`
  String get random_text_948 {
    return Intl.message(
      '1. Each red envelope rain distributes 100,000 reais for free.',
      name: 'random_text_948',
      desc: '',
      args: [],
    );
  }

  /// `2. Maximum cash drop: each red envelope is distributed for free.`
  String get random_text_949 {
    return Intl.message(
      '2. Maximum cash drop: each red envelope is distributed for free.',
      name: 'random_text_949',
      desc: '',
      args: [],
    );
  }

  /// `3. Members who have already recharged can claim for free.`
  String get random_text_950 {
    return Intl.message(
      '3. Members who have already recharged can claim for free.',
      name: 'random_text_950',
      desc: '',
      args: [],
    );
  }

  /// `4. The cash received can be used for gaming or withdrawn directly.`
  String get random_text_951 {
    return Intl.message(
      '4. The cash received can be used for gaming or withdrawn directly.',
      name: 'random_text_951',
      desc: '',
      args: [],
    );
  }

  /// `5. The higher the VIP membership level, the more cash you receive.`
  String get random_text_952 {
    return Intl.message(
      '5. The higher the VIP membership level, the more cash you receive.',
      name: 'random_text_952',
      desc: '',
      args: [],
    );
  }

  /// `6. To avoid differences in textual interpretation, the platform reserves the final interpretation right for this event.`
  String get random_text_953 {
    return Intl.message(
      '6. To avoid differences in textual interpretation, the platform reserves the final interpretation right for this event.',
      name: 'random_text_953',
      desc: '',
      args: [],
    );
  }

  /// `Money falls like rain six times a day.`
  String get random_text_954 {
    return Intl.message(
      'Money falls like rain six times a day.',
      name: 'random_text_954',
      desc: '',
      args: [],
    );
  }

  /// `Money falls like rain \n Unpacking is rewarded`
  String get random_text_955 {
    return Intl.message(
      'Money falls like rain \n Unpacking is rewarded',
      name: 'random_text_955',
      desc: '',
      args: [],
    );
  }

  /// `Six times a day`
  String get random_text_956 {
    return Intl.message(
      'Six times a day',
      name: 'random_text_956',
      desc: '',
      args: [],
    );
  }

  /// `1st to 7th of each month`
  String get random_text_957 {
    return Intl.message(
      '1st to 7th of each month',
      name: 'random_text_957',
      desc: '',
      args: [],
    );
  }

  /// `Every Friday, Saturday, and Sunday`
  String get random_text_958 {
    return Intl.message(
      'Every Friday, Saturday, and Sunday',
      name: 'random_text_958',
      desc: '',
      args: [],
    );
  }

  /// `Three times a day`
  String get random_text_959 {
    return Intl.message(
      'Three times a day',
      name: 'random_text_959',
      desc: '',
      args: [],
    );
  }

  /// `Other times`
  String get random_text_960 {
    return Intl.message(
      'Other times',
      name: 'random_text_960',
      desc: '',
      args: [],
    );
  }

  /// `Next red envelope event`
  String get random_text_961 {
    return Intl.message(
      'Next red envelope event',
      name: 'random_text_961',
      desc: '',
      args: [],
    );
  }

  /// `Lucky bonus`
  String get random_text_962 {
    return Intl.message(
      'Lucky bonus',
      name: 'random_text_962',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get random_text_963 {
    return Intl.message(
      'Ongoing',
      name: 'random_text_963',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get random_text_964 {
    return Intl.message(
      'Disabled',
      name: 'random_text_964',
      desc: '',
      args: [],
    );
  }

  /// `Deposit + Betting (reset after 7 consecutive days)`
  String get random_text_965 {
    return Intl.message(
      'Deposit + Betting (reset after 7 consecutive days)',
      name: 'random_text_965',
      desc: '',
      args: [],
    );
  }

  /// `Subordinate's first recharge`
  String get random_text_966 {
    return Intl.message(
      'Subordinate\'s first recharge',
      name: 'random_text_966',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get random_text_967 {
    return Intl.message(
      'Days',
      name: 'random_text_967',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get random_text_967_copy {
    return Intl.message(
      'Days',
      name: 'random_text_967_copy',
      desc: '',
      args: [],
    );
  }

  /// `Effective promotion count`
  String get random_text_968 {
    return Intl.message(
      'Effective promotion count',
      name: 'random_text_968',
      desc: '',
      args: [],
    );
  }

  /// `people`
  String get random_text_969 {
    return Intl.message(
      'people',
      name: 'random_text_969',
      desc: '',
      args: [],
    );
  }

  /// `/23 people`
  String get random_text_970 {
    return Intl.message(
      '/23 people',
      name: 'random_text_970',
      desc: '',
      args: [],
    );
  }

  /// `Total recharge`
  String get random_text_971 {
    return Intl.message(
      'Total recharge',
      name: 'random_text_971',
      desc: '',
      args: [],
    );
  }

  /// `Direct recharge`
  String get random_text_972 {
    return Intl.message(
      'Direct recharge',
      name: 'random_text_972',
      desc: '',
      args: [],
    );
  }

  /// `Other recharge`
  String get random_text_973 {
    return Intl.message(
      'Other recharge',
      name: 'random_text_973',
      desc: '',
      args: [],
    );
  }

  /// `Current Points: `
  String get random_text_974 {
    return Intl.message(
      'Current Points: ',
      name: 'random_text_974',
      desc: '',
      args: [],
    );
  }

  /// `Recharge`
  String get random_text_975 {
    return Intl.message(
      'Recharge',
      name: 'random_text_975',
      desc: '',
      args: [],
    );
  }

  /// `Rollover`
  String get random_text_976 {
    return Intl.message(
      'Rollover',
      name: 'random_text_976',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully claimed`
  String get random_text_977 {
    return Intl.message(
      'You have successfully claimed',
      name: 'random_text_977',
      desc: '',
      args: [],
    );
  }

  /// `No available cashback to claim`
  String get random_text_978 {
    return Intl.message(
      'No available cashback to claim',
      name: 'random_text_978',
      desc: '',
      args: [],
    );
  }

  /// `Venue`
  String get random_text_979 {
    return Intl.message(
      'Venue',
      name: 'random_text_979',
      desc: '',
      args: [],
    );
  }

  /// `1. All betting currency amounts will be automatically converted to USDT`
  String get random_text_980 {
    return Intl.message(
      '1. All betting currency amounts will be automatically converted to USDT',
      name: 'random_text_980',
      desc: '',
      args: [],
    );
  }

  /// `2. The exchange rate will be based on the market rate at the time of settlement`
  String get random_text_981 {
    return Intl.message(
      '2. The exchange rate will be based on the market rate at the time of settlement',
      name: 'random_text_981',
      desc: '',
      args: [],
    );
  }

  /// `3. Valid bets already counted will not be affected by subsequent exchange rate changes`
  String get random_text_982 {
    return Intl.message(
      '3. Valid bets already counted will not be affected by subsequent exchange rate changes',
      name: 'random_text_982',
      desc: '',
      args: [],
    );
  }

  /// `1. All deposited currencies will be converted based on the real-time market rate`
  String get random_text_983 {
    return Intl.message(
      '1. All deposited currencies will be converted based on the real-time market rate',
      name: 'random_text_983',
      desc: '',
      args: [],
    );
  }

  /// `2. The exchange rate will be based on the market rate at the time of successful deposit`
  String get random_text_984 {
    return Intl.message(
      '2. The exchange rate will be based on the market rate at the time of successful deposit',
      name: 'random_text_984',
      desc: '',
      args: [],
    );
  }

  /// `Turnover will be calculated based on your valid betting amount`
  String get random_text_985 {
    return Intl.message(
      'Turnover will be calculated based on your valid betting amount',
      name: 'random_text_985',
      desc: '',
      args: [],
    );
  }

  /// `Deposits will be converted to USDT based on the market rate`
  String get random_text_986 {
    return Intl.message(
      'Deposits will be converted to USDT based on the market rate',
      name: 'random_text_986',
      desc: '',
      args: [],
    );
  }

  /// `Per month`
  String get random_text_987 {
    return Intl.message(
      'Per month',
      name: 'random_text_987',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get random_text_988 {
    return Intl.message(
      'Day',
      name: 'random_text_988',
      desc: '',
      args: [],
    );
  }

  /// `{month} {day}`
  String random_text_988cpoy2(Object month, Object day) {
    return Intl.message(
      '$month $day',
      name: 'random_text_988cpoy2',
      desc: '',
      args: [month, day],
    );
  }

  /// `Monday`
  String get random_text_989 {
    return Intl.message(
      'Monday',
      name: 'random_text_989',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get random_text_990 {
    return Intl.message(
      'Tuesday',
      name: 'random_text_990',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get random_text_991 {
    return Intl.message(
      'Wednesday',
      name: 'random_text_991',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get random_text_992 {
    return Intl.message(
      'Thursday',
      name: 'random_text_992',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get random_text_993 {
    return Intl.message(
      'Friday',
      name: 'random_text_993',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get random_text_994 {
    return Intl.message(
      'Saturday',
      name: 'random_text_994',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get random_text_995 {
    return Intl.message(
      'Sunday',
      name: 'random_text_995',
      desc: '',
      args: [],
    );
  }

  /// `Every `
  String get random_text_996 {
    return Intl.message(
      'Every ',
      name: 'random_text_996',
      desc: '',
      args: [],
    );
  }

  /// `Exchange failed`
  String get random_text_997 {
    return Intl.message(
      'Exchange failed',
      name: 'random_text_997',
      desc: '',
      args: [],
    );
  }

  /// `Claim and exchange`
  String get random_text_998 {
    return Intl.message(
      'Claim and exchange',
      name: 'random_text_998',
      desc: '',
      args: [],
    );
  }

  /// `Each red envelope`
  String get random_text_999 {
    return Intl.message(
      'Each red envelope',
      name: 'random_text_999',
      desc: '',
      args: [],
    );
  }

  /// `, maximum red envelope`
  String get random_text_1000 {
    return Intl.message(
      ', maximum red envelope',
      name: 'random_text_1000',
      desc: '',
      args: [],
    );
  }

  /// `Sorry`
  String get random_text_1001 {
    return Intl.message(
      'Sorry',
      name: 'random_text_1001',
      desc: '',
      args: [],
    );
  }

  /// `This red envelope session has been fully claimed`
  String get random_text_1002 {
    return Intl.message(
      'This red envelope session has been fully claimed',
      name: 'random_text_1002',
      desc: '',
      args: [],
    );
  }

  /// `This red envelope session has already been participated in`
  String get random_text_1003 {
    return Intl.message(
      'This red envelope session has already been participated in',
      name: 'random_text_1003',
      desc: '',
      args: [],
    );
  }

  /// `Activity hasn't started yet, please try again later`
  String get random_text_1004 {
    return Intl.message(
      'Activity hasn\'t started yet, please try again later',
      name: 'random_text_1004',
      desc: '',
      args: [],
    );
  }

  /// `Activity reminder`
  String get random_text_1005 {
    return Intl.message(
      'Activity reminder',
      name: 'random_text_1005',
      desc: '',
      args: [],
    );
  }

  /// `Every day`
  String get random_text_1006 {
    return Intl.message(
      'Every day',
      name: 'random_text_1006',
      desc: '',
      args: [],
    );
  }

  /// `Each time`
  String get random_text_1007 {
    return Intl.message(
      'Each time',
      name: 'random_text_1007',
      desc: '',
      args: [],
    );
  }

  /// `Minimum withdrawal of 100.00`
  String get random_text_1008 {
    return Intl.message(
      'Minimum withdrawal of 100.00',
      name: 'random_text_1008',
      desc: '',
      args: [],
    );
  }

  /// `Send invitations to random players`
  String get random_text_1009 {
    return Intl.message(
      'Send invitations to random players',
      name: 'random_text_1009',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS`
  String get random_text_1010 {
    return Intl.message(
      'Send SMS',
      name: 'random_text_1010',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal progress`
  String get random_text_1011 {
    return Intl.message(
      'Withdrawal progress',
      name: 'random_text_1011',
      desc: '',
      args: [],
    );
  }

  /// `Email Address/Phone Number`
  String get random_text_1012 {
    return Intl.message(
      'Email Address/Phone Number',
      name: 'random_text_1012',
      desc: '',
      args: [],
    );
  }

  /// `Not bound to email or phone, please `
  String get random_text_1013 {
    return Intl.message(
      'Not bound to email or phone, please ',
      name: 'random_text_1013',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get random_text_1014 {
    return Intl.message(
      'Please enter phone number',
      name: 'random_text_1014',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get random_text_1015 {
    return Intl.message(
      'Invalid phone number',
      name: 'random_text_1015',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get random_text_1016 {
    return Intl.message(
      'Email or Username',
      name: 'random_text_1016',
      desc: '',
      args: [],
    );
  }

  /// `Phone login`
  String get random_text_1017 {
    return Intl.message(
      'Phone login',
      name: 'random_text_1017',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get random_text_1018 {
    return Intl.message(
      'Forgot Password?',
      name: 'random_text_1018',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet? `
  String get random_text_1019 {
    return Intl.message(
      'Don’t have an account yet? ',
      name: 'random_text_1019',
      desc: '',
      args: [],
    );
  }

  /// `Register an Account`
  String get random_text_1020 {
    return Intl.message(
      'Register an Account',
      name: 'random_text_1020',
      desc: '',
      args: [],
    );
  }

  /// `Or use`
  String get random_text_1021 {
    return Intl.message(
      'Or use',
      name: 'random_text_1021',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get random_text_1022 {
    return Intl.message(
      'Email',
      name: 'random_text_1022',
      desc: '',
      args: [],
    );
  }

  /// `Username 3-14 characters`
  String get random_text_1023 {
    return Intl.message(
      'Username 3-14 characters',
      name: 'random_text_1023',
      desc: '',
      args: [],
    );
  }

  /// `Enter referral code`
  String get random_text_1024 {
    return Intl.message(
      'Enter referral code',
      name: 'random_text_1024',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get random_text_1025 {
    return Intl.message(
      'I agree to',
      name: 'random_text_1025',
      desc: '',
      args: [],
    );
  }

  /// ` User Agreement `
  String get random_text_1026 {
    return Intl.message(
      ' User Agreement ',
      name: 'random_text_1026',
      desc: '',
      args: [],
    );
  }

  /// `and confirm that I am at least 18 years old`
  String get random_text_1027 {
    return Intl.message(
      'and confirm that I am at least 18 years old',
      name: 'random_text_1027',
      desc: '',
      args: [],
    );
  }

  /// `Please agree and check the User Agreement`
  String get random_text_1028 {
    return Intl.message(
      'Please agree and check the User Agreement',
      name: 'random_text_1028',
      desc: '',
      args: [],
    );
  }

  /// `I agree to receive Win6 marketing promotions`
  String get random_text_1029 {
    return Intl.message(
      'I agree to receive Win6 marketing promotions',
      name: 'random_text_1029',
      desc: '',
      args: [],
    );
  }

  /// `Register OAuth`
  String get random_text_1030 {
    return Intl.message(
      'Register OAuth',
      name: 'random_text_1030',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your detailed information`
  String get random_text_1031 {
    return Intl.message(
      'Please fill in your detailed information',
      name: 'random_text_1031',
      desc: '',
      args: [],
    );
  }

  /// `User Agreement`
  String get random_text_1032 {
    return Intl.message(
      'User Agreement',
      name: 'random_text_1032',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get random_text_1033 {
    return Intl.message(
      'Email verification',
      name: 'random_text_1033',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit verification code sent to justin888@gmail.com, which is valid for 5 minutes.`
  String get random_text_1034 {
    return Intl.message(
      'Please enter the 6-digit verification code sent to justin888@gmail.com, which is valid for 5 minutes.',
      name: 'random_text_1034',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive the code?`
  String get random_text_1035 {
    return Intl.message(
      'Didn’t receive the code?',
      name: 'random_text_1035',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get random_text_1036 {
    return Intl.message(
      'Phone verification',
      name: 'random_text_1036',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit verification code sent to +86 18988888888, which is valid for 5 minutes.`
  String get random_text_1037 {
    return Intl.message(
      'Please enter the 6-digit verification code sent to +86 18988888888, which is valid for 5 minutes.',
      name: 'random_text_1037',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get random_text_1038 {
    return Intl.message(
      'Email',
      name: 'random_text_1038',
      desc: '',
      args: [],
    );
  }

  /// `SMS sent to your Phone, if you still haven't received the verification code after multiple attempts.`
  String get random_text_1039 {
    return Intl.message(
      'SMS sent to your Phone, if you still haven\'t received the verification code after multiple attempts.',
      name: 'random_text_1039',
      desc: '',
      args: [],
    );
  }

  /// `SMS has been sent to your email, if you still haven't received the verification code after multiple attempts,`
  String get random_text_1040 {
    return Intl.message(
      'SMS has been sent to your email, if you still haven\'t received the verification code after multiple attempts,',
      name: 'random_text_1040',
      desc: '',
      args: [],
    );
  }

  /// `1. Check if your phone is out of service.`
  String get random_text_1041 {
    return Intl.message(
      '1. Check if your phone is out of service.',
      name: 'random_text_1041',
      desc: '',
      args: [],
    );
  }

  /// `1. Check if your email is correct.`
  String get random_text_1042 {
    return Intl.message(
      '1. Check if your email is correct.',
      name: 'random_text_1042',
      desc: '',
      args: [],
    );
  }

  /// `2. Check if the SMS is in the spam folder.`
  String get random_text_1043 {
    return Intl.message(
      '2. Check if the SMS is in the spam folder.',
      name: 'random_text_1043',
      desc: '',
      args: [],
    );
  }

  /// `2. Check if the email is in the spam folder.`
  String get random_text_1044 {
    return Intl.message(
      '2. Check if the email is in the spam folder.',
      name: 'random_text_1044',
      desc: '',
      args: [],
    );
  }

  /// `3. This message may be delayed for a few minutes, please try again after 10 minutes.`
  String get random_text_1045 {
    return Intl.message(
      '3. This message may be delayed for a few minutes, please try again after 10 minutes.',
      name: 'random_text_1045',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code`
  String get random_text_1046 {
    return Intl.message(
      'Please enter the verification code',
      name: 'random_text_1046',
      desc: '',
      args: [],
    );
  }

  /// `Phone Verification`
  String get random_text_1047 {
    return Intl.message(
      'Phone Verification',
      name: 'random_text_1047',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit verification code sent to`
  String get random_text_1048 {
    return Intl.message(
      'Please enter the 6-digit verification code sent to',
      name: 'random_text_1048',
      desc: '',
      args: [],
    );
  }

  /// `, which is valid for 5 minutes.`
  String get random_text_1049 {
    return Intl.message(
      ', which is valid for 5 minutes.',
      name: 'random_text_1049',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get random_text_1050 {
    return Intl.message(
      'Resend',
      name: 'random_text_1050',
      desc: '',
      args: [],
    );
  }

  /// `Your password must contain at least 8 characters`
  String get random_text_1051 {
    return Intl.message(
      'Your password must contain at least 8 characters',
      name: 'random_text_1051',
      desc: '',
      args: [],
    );
  }

  /// `, which is valid for 5 minutes.`
  String get random_text_1052 {
    return Intl.message(
      ', which is valid for 5 minutes.',
      name: 'random_text_1052',
      desc: '',
      args: [],
    );
  }

  /// `Submitted successfully`
  String get random_text_1053 {
    return Intl.message(
      'Submitted successfully',
      name: 'random_text_1053',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get random_text_1054 {
    return Intl.message(
      'Approved',
      name: 'random_text_1054',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get random_text_1055 {
    return Intl.message(
      'Rejected',
      name: 'random_text_1055',
      desc: '',
      args: [],
    );
  }

  /// `The activity has not started yet, please try again later...`
  String get random_text_1056 {
    return Intl.message(
      'The activity has not started yet, please try again later...',
      name: 'random_text_1056',
      desc: '',
      args: [],
    );
  }

  /// `You currently do not meet the requirements for receiving`
  String get random_text_1057 {
    return Intl.message(
      'You currently do not meet the requirements for receiving',
      name: 'random_text_1057',
      desc: '',
      args: [],
    );
  }

  /// `Applying`
  String get random_text_1058 {
    return Intl.message(
      'Applying',
      name: 'random_text_1058',
      desc: '',
      args: [],
    );
  }

  /// `Your cashback is currently being applied for`
  String get random_text_1059 {
    return Intl.message(
      'Your cashback is currently being applied for',
      name: 'random_text_1059',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get random_text_1060 {
    return Intl.message(
      'Unknown error',
      name: 'random_text_1060',
      desc: '',
      args: [],
    );
  }

  /// `Current level`
  String get random_text_1061 {
    return Intl.message(
      'Current level',
      name: 'random_text_1061',
      desc: '',
      args: [],
    );
  }

  /// `Still need to reach the next level:`
  String get random_text_1062 {
    return Intl.message(
      'Still need to reach the next level:',
      name: 'random_text_1062',
      desc: '',
      args: [],
    );
  }

  /// `Negative profit cashback`
  String get random_text_1063 {
    return Intl.message(
      'Negative profit cashback',
      name: 'random_text_1063',
      desc: '',
      args: [],
    );
  }

  /// `You will receive up to the highest cashback for playing games this week`
  String get random_text_1064 {
    return Intl.message(
      'You will receive up to the highest cashback for playing games this week',
      name: 'random_text_1064',
      desc: '',
      args: [],
    );
  }

  /// `% cashback`
  String get random_text_1065 {
    return Intl.message(
      '% cashback',
      name: 'random_text_1065',
      desc: '',
      args: [],
    );
  }

  /// `After settlement`
  String get random_text_1066 {
    return Intl.message(
      'After settlement',
      name: 'random_text_1066',
      desc: '',
      args: [],
    );
  }

  /// `Days to claim`
  String get random_text_1067 {
    return Intl.message(
      'Days to claim',
      name: 'random_text_1067',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get random_text_1068 {
    return Intl.message(
      'Total',
      name: 'random_text_1068',
      desc: '',
      args: [],
    );
  }

  /// `Roll greater than`
  String get random_text_1069 {
    return Intl.message(
      'Roll greater than',
      name: 'random_text_1069',
      desc: '',
      args: [],
    );
  }

  /// `Low level`
  String get random_text_1070 {
    return Intl.message(
      'Low level',
      name: 'random_text_1070',
      desc: '',
      args: [],
    );
  }

  /// `High level`
  String get random_text_1071 {
    return Intl.message(
      'High level',
      name: 'random_text_1071',
      desc: '',
      args: [],
    );
  }

  /// `The amount has been sent to your corresponding currency wallet`
  String get random_text_1072 {
    return Intl.message(
      'The amount has been sent to your corresponding currency wallet',
      name: 'random_text_1072',
      desc: '',
      args: [],
    );
  }

  /// `No cashback available to claim at the moment`
  String get random_text_1073 {
    return Intl.message(
      'No cashback available to claim at the moment',
      name: 'random_text_1073',
      desc: '',
      args: [],
    );
  }

  /// `Meet the points requirement for VIP promotion to advance to the corresponding VIP level and receive the corresponding promotion bonus. If you continuously advance multiple levels, you can claim all level advancement bonuses;`
  String get random_text_1074 {
    return Intl.message(
      'Meet the points requirement for VIP promotion to advance to the corresponding VIP level and receive the corresponding promotion bonus. If you continuously advance multiple levels, you can claim all level advancement bonuses;',
      name: 'random_text_1074',
      desc: '',
      args: [],
    );
  }

  /// `Meet the points requirement for maintaining the current VIP level within the last 90 days to retain the current VIP level. If unable to meet the maintenance points requirement within 90 days, the VIP level will be lowered by one level;`
  String get random_text_1075 {
    return Intl.message(
      'Meet the points requirement for maintaining the current VIP level within the last 90 days to retain the current VIP level. If unable to meet the maintenance points requirement within 90 days, the VIP level will be lowered by one level;',
      name: 'random_text_1075',
      desc: '',
      args: [],
    );
  }

  /// `Current level has reached the maximum`
  String get random_text_1076 {
    return Intl.message(
      'Current level has reached the maximum',
      name: 'random_text_1076',
      desc: '',
      args: [],
    );
  }

  /// `Keep current level requires`
  String get random_text_1077 {
    return Intl.message(
      'Keep current level requires',
      name: 'random_text_1077',
      desc: '',
      args: [],
    );
  }

  /// `Promotion description: The bonuses claimed in this promotion will be delivered according to the currency you choose. After the first successful claim, the system will use the currency you claimed as the fixed.`
  String get random_text_1078 {
    return Intl.message(
      'Promotion description: The bonuses claimed in this promotion will be delivered according to the currency you choose. After the first successful claim, the system will use the currency you claimed as the fixed.',
      name: 'random_text_1078',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get random_text_1079 {
    return Intl.message(
      'Email Address',
      name: 'random_text_1079',
      desc: '',
      args: [],
    );
  }

  /// `Phone area code`
  String get random_text_1080 {
    return Intl.message(
      'Phone area code',
      name: 'random_text_1080',
      desc: '',
      args: [],
    );
  }

  /// `Get more chances`
  String get random_text_1081 {
    return Intl.message(
      'Get more chances',
      name: 'random_text_1081',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' total deposits`
  String get random_text_1082 {
    return Intl.message(
      'Subordinates\' total deposits',
      name: 'random_text_1082',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' total turnover`
  String get random_text_1083 {
    return Intl.message(
      'Subordinates\' total turnover',
      name: 'random_text_1083',
      desc: '',
      args: [],
    );
  }

  /// `Number of subordinates' first deposits`
  String get random_text_1084 {
    return Intl.message(
      'Number of subordinates\' first deposits',
      name: 'random_text_1084',
      desc: '',
      args: [],
    );
  }

  /// `Number of subordinates' turnovers`
  String get random_text_1085 {
    return Intl.message(
      'Number of subordinates\' turnovers',
      name: 'random_text_1085',
      desc: '',
      args: [],
    );
  }

  /// `Own total deposits`
  String get random_text_1086 {
    return Intl.message(
      'Own total deposits',
      name: 'random_text_1086',
      desc: '',
      args: [],
    );
  }

  /// `Own total turnover`
  String get random_text_1087 {
    return Intl.message(
      'Own total turnover',
      name: 'random_text_1087',
      desc: '',
      args: [],
    );
  }

  /// `Number of own deposits`
  String get random_text_1088 {
    return Intl.message(
      'Number of own deposits',
      name: 'random_text_1088',
      desc: '',
      args: [],
    );
  }

  /// `Invite`
  String get random_text_1089 {
    return Intl.message(
      'Invite',
      name: 'random_text_1089',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get random_text_1090 {
    return Intl.message(
      'Friends',
      name: 'random_text_1090',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' first deposit`
  String get random_text_1091 {
    return Intl.message(
      'Subordinates\' first deposit',
      name: 'random_text_1091',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' turnover`
  String get random_text_1092 {
    return Intl.message(
      'Subordinates\' turnover',
      name: 'random_text_1092',
      desc: '',
      args: [],
    );
  }

  /// `Total deposits`
  String get random_text_1093 {
    return Intl.message(
      'Total deposits',
      name: 'random_text_1093',
      desc: '',
      args: [],
    );
  }

  /// `Total turnover`
  String get random_text_1094 {
    return Intl.message(
      'Total turnover',
      name: 'random_text_1094',
      desc: '',
      args: [],
    );
  }

  /// `Invited`
  String get random_text_1095 {
    return Intl.message(
      'Invited',
      name: 'random_text_1095',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' deposited`
  String get random_text_1096 {
    return Intl.message(
      'Subordinates\' deposited',
      name: 'random_text_1096',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' turnovers`
  String get random_text_1097 {
    return Intl.message(
      'Subordinates\' turnovers',
      name: 'random_text_1097',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' first deposits`
  String get random_text_1098 {
    return Intl.message(
      'Subordinates\' first deposits',
      name: 'random_text_1098',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' turnover participants`
  String get random_text_1099 {
    return Intl.message(
      'Subordinates\' turnover participants',
      name: 'random_text_1099',
      desc: '',
      args: [],
    );
  }

  /// `Total deposits`
  String get random_text_1100 {
    return Intl.message(
      'Total deposits',
      name: 'random_text_1100',
      desc: '',
      args: [],
    );
  }

  /// `Total turnover`
  String get random_text_1101 {
    return Intl.message(
      'Total turnover',
      name: 'random_text_1101',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated invitations`
  String get random_text_1102 {
    return Intl.message(
      'Accumulated invitations',
      name: 'random_text_1102',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' accumulated deposits`
  String get random_text_1103 {
    return Intl.message(
      'Subordinates\' accumulated deposits',
      name: 'random_text_1103',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' accumulated turnover`
  String get random_text_1104 {
    return Intl.message(
      'Subordinates\' accumulated turnover',
      name: 'random_text_1104',
      desc: '',
      args: [],
    );
  }

  /// `Subordinates' accumulated first deposits`
  String get random_text_1105 {
    return Intl.message(
      'Subordinates\' accumulated first deposits',
      name: 'random_text_1105',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated deposits`
  String get random_text_1106 {
    return Intl.message(
      'Accumulated deposits',
      name: 'random_text_1106',
      desc: '',
      args: [],
    );
  }

  /// `Accumulated turnover`
  String get random_text_1107 {
    return Intl.message(
      'Accumulated turnover',
      name: 'random_text_1107',
      desc: '',
      args: [],
    );
  }

  /// `, reward`
  String get random_text_1108 {
    return Intl.message(
      ', reward',
      name: 'random_text_1108',
      desc: '',
      args: [],
    );
  }

  /// `Draw times`
  String get random_text_1109 {
    return Intl.message(
      'Draw times',
      name: 'random_text_1109',
      desc: '',
      args: [],
    );
  }

  /// `, rewarded`
  String get random_text_1110 {
    return Intl.message(
      ', rewarded',
      name: 'random_text_1110',
      desc: '',
      args: [],
    );
  }

  /// `Statistical data not displayed for this user`
  String get random_text_1111 {
    return Intl.message(
      'Statistical data not displayed for this user',
      name: 'random_text_1111',
      desc: '',
      args: [],
    );
  }

  /// `Safe`
  String get random_text_1112 {
    return Intl.message(
      'Safe',
      name: 'random_text_1112',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get random_text_1113 {
    return Intl.message(
      'Normal',
      name: 'random_text_1113',
      desc: '',
      args: [],
    );
  }

  /// `High Risk`
  String get random_text_1114 {
    return Intl.message(
      'High Risk',
      name: 'random_text_1114',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get random_text_1115 {
    return Intl.message(
      'Verification Code',
      name: 'random_text_1115',
      desc: '',
      args: [],
    );
  }

  /// `No Phone? `
  String get random_text_1116 {
    return Intl.message(
      'No Phone? ',
      name: 'random_text_1116',
      desc: '',
      args: [],
    );
  }

  /// `No Email? `
  String get random_text_1117 {
    return Intl.message(
      'No Email? ',
      name: 'random_text_1117',
      desc: '',
      args: [],
    );
  }

  /// `Use Email`
  String get random_text_1118 {
    return Intl.message(
      'Use Email',
      name: 'random_text_1118',
      desc: '',
      args: [],
    );
  }

  /// `Use Phone`
  String get random_text_1119 {
    return Intl.message(
      'Use Phone',
      name: 'random_text_1119',
      desc: '',
      args: [],
    );
  }

  /// `Bonus Points`
  String get random_text_1120 {
    return Intl.message(
      'Bonus Points',
      name: 'random_text_1120',
      desc: '',
      args: [],
    );
  }

  /// `Promotion`
  String get random_text_1121 {
    return Intl.message(
      'Promotion',
      name: 'random_text_1121',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get random_text_1122 {
    return Intl.message(
      'Full Name',
      name: 'random_text_1122',
      desc: '',
      args: [],
    );
  }

  /// `Bank Card`
  String get random_text_1123 {
    return Intl.message(
      'Bank Card',
      name: 'random_text_1123',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get random_text_1124 {
    return Intl.message(
      'Full Name',
      name: 'random_text_1124',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Account`
  String get random_text_1125 {
    return Intl.message(
      'Withdrawal Account',
      name: 'random_text_1125',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Address`
  String get random_text_1126 {
    return Intl.message(
      'Wallet Address',
      name: 'random_text_1126',
      desc: '',
      args: [],
    );
  }

  /// `Bind Crypto Currency`
  String get random_text_1127 {
    return Intl.message(
      'Bind Crypto Currency',
      name: 'random_text_1127',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get random_text_1128 {
    return Intl.message(
      'Branch',
      name: 'random_text_1128',
      desc: '',
      args: [],
    );
  }

  /// `CPF Number`
  String get random_text_1129 {
    return Intl.message(
      'CPF Number',
      name: 'random_text_1129',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Currency`
  String get random_text_1130 {
    return Intl.message(
      'Deposit Currency',
      name: 'random_text_1130',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Currency`
  String get random_text_1131 {
    return Intl.message(
      'Withdrawal Currency',
      name: 'random_text_1131',
      desc: '',
      args: [],
    );
  }

  /// `Gift +`
  String get random_text_1132 {
    return Intl.message(
      'Gift +',
      name: 'random_text_1132',
      desc: '',
      args: [],
    );
  }

  /// `Icon`
  String get random_text_1133 {
    return Intl.message(
      'Icon',
      name: 'random_text_1133',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the depositor’s name`
  String get random_text_1134 {
    return Intl.message(
      'Please enter the depositor’s name',
      name: 'random_text_1134',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get random_text_1135 {
    return Intl.message(
      'Select Bank',
      name: 'random_text_1135',
      desc: '',
      args: [],
    );
  }

  /// `Select Network`
  String get random_text_1136 {
    return Intl.message(
      'Select Network',
      name: 'random_text_1136',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank`
  String get random_text_1137 {
    return Intl.message(
      'Select Bank',
      name: 'random_text_1137',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get random_text_1138 {
    return Intl.message(
      'Show More',
      name: 'random_text_1138',
      desc: '',
      args: [],
    );
  }

  /// `Fiat Currency`
  String get random_text_1139 {
    return Intl.message(
      'Fiat Currency',
      name: 'random_text_1139',
      desc: '',
      args: [],
    );
  }

  /// `Please bind the receiving information first`
  String get random_text_1140 {
    return Intl.message(
      'Please bind the receiving information first',
      name: 'random_text_1140',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Address`
  String get random_text_1141 {
    return Intl.message(
      'Withdrawal Address',
      name: 'random_text_1141',
      desc: '',
      args: [],
    );
  }

  /// `Add Receipt Account`
  String get random_text_1142 {
    return Intl.message(
      'Add Receipt Account',
      name: 'random_text_1142',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Bank`
  String get random_text_1143 {
    return Intl.message(
      'Withdrawal Bank',
      name: 'random_text_1143',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Amount`
  String get random_text_1144 {
    return Intl.message(
      'Withdrawal Amount',
      name: 'random_text_1144',
      desc: '',
      args: [],
    );
  }

  /// `Mobile phone number is not registered`
  String get random_text_1145 {
    return Intl.message(
      'Mobile phone number is not registered',
      name: 'random_text_1145',
      desc: '',
      args: [],
    );
  }

  /// `Email is not registered`
  String get random_text_1146 {
    return Intl.message(
      'Email is not registered',
      name: 'random_text_1146',
      desc: '',
      args: [],
    );
  }

  /// `Please agree and check the User Agreement`
  String get random_text_1147 {
    return Intl.message(
      'Please agree and check the User Agreement',
      name: 'random_text_1147',
      desc: '',
      args: [],
    );
  }

  /// `Your phone verification code contains 6 digits`
  String get random_text_1148 {
    return Intl.message(
      'Your phone verification code contains 6 digits',
      name: 'random_text_1148',
      desc: '',
      args: [],
    );
  }

  /// `Correct verification code`
  String get random_text_1149 {
    return Intl.message(
      'Correct verification code',
      name: 'random_text_1149',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get random_text_1150 {
    return Intl.message(
      'Password changed successfully',
      name: 'random_text_1150',
      desc: '',
      args: [],
    );
  }

  /// `It refers to the vertically developed members and are collectively called direct teams. (1) B1, B2, B3 contribute to A, (80,000 + 50,000 + 30,000) x 0.10 = 1600. \n\n(2) C1, C2 contribute to B1, (100,000 + 40,000) x 0.08 = 1120. \n\n(3) C3 contributes to B3, 610,000 x 0.10 = 6100.`
  String get random_text_1151 {
    return Intl.message(
      'It refers to the vertically developed members and are collectively called direct teams. (1) B1, B2, B3 contribute to A, (80,000 + 50,000 + 30,000) x 0.10 = 1600. \n\n(2) C1, C2 contribute to B1, (100,000 + 40,000) x 0.08 = 1120. \n\n(3) C3 contributes to B3, 610,000 x 0.10 = 6100.',
      name: 'random_text_1151',
      desc: '',
      args: [],
    );
  }

  /// `It refers to the members developed at lower levels, such as subordinates, sub-subordinates, etc., called uniformly from other teams. Our platform can develop subordinates indefinitely, with a two-tier structure as an example. (1) coming from C1, C2 due to B1's total performance of 140,000, taking advantage of only 0.08 of commission rate, while a's total performance is 1,010,000, taking advantage of 0.10 of commission rate, so the commission difference between A and B1 is: 0.10-0.08 = 0.02, this difference is the part that C1 and C2 contribute to A, so C1 and C2: (100,000 + 40,000) × 0.02 = 280. (2) coming from C3 due to B3's total performance of 710,000, taking advantage of 0.10 of the commission rate, A's total performance is 1,010,000, taking advantage of 0.10 of the commission rate, so the commission difference between A and B3 is: 0.10 - 0.10 = 0, C3 contributes to A: 610,000 x 0/000 = 0.`
  String get random_text_1152 {
    return Intl.message(
      'It refers to the members developed at lower levels, such as subordinates, sub-subordinates, etc., called uniformly from other teams. Our platform can develop subordinates indefinitely, with a two-tier structure as an example. (1) coming from C1, C2 due to B1\'s total performance of 140,000, taking advantage of only 0.08 of commission rate, while a\'s total performance is 1,010,000, taking advantage of 0.10 of commission rate, so the commission difference between A and B1 is: 0.10-0.08 = 0.02, this difference is the part that C1 and C2 contribute to A, so C1 and C2: (100,000 + 40,000) × 0.02 = 280. (2) coming from C3 due to B3\'s total performance of 710,000, taking advantage of 0.10 of the commission rate, A\'s total performance is 1,010,000, taking advantage of 0.10 of the commission rate, so the commission difference between A and B3 is: 0.10 - 0.10 = 0, C3 contributes to A: 610,000 x 0/000 = 0.',
      name: 'random_text_1152',
      desc: '',
      args: [],
    );
  }

  /// ` (1) C3 is so powerful that A receives a higher commission rate for the entire performance. \n\n (2) B2 may not be diligent and not develop a team. at all, it is not profitable. \n\n (3) although B3 participates relatively slowly and is A team of A, C3 performs well, giving B3 a higher commission ratio directly. therefore, no matter when B3 participates or who is a team. regardless of his level, income will not be affected, and development will not be limited. (4) This is an absolutely fair and just agency model. Whoever joins late will never be stepped on.`
  String get random_text_1153 {
    return Intl.message(
      ' (1) C3 is so powerful that A receives a higher commission rate for the entire performance. \n\n (2) B2 may not be diligent and not develop a team. at all, it is not profitable. \n\n (3) although B3 participates relatively slowly and is A team of A, C3 performs well, giving B3 a higher commission ratio directly. therefore, no matter when B3 participates or who is a team. regardless of his level, income will not be affected, and development will not be limited. (4) This is an absolutely fair and just agency model. Whoever joins late will never be stepped on.',
      name: 'random_text_1153',
      desc: '',
      args: [],
    );
  }

  /// `The commission rate table is as follows`
  String get random_text_1154 {
    return Intl.message(
      'The commission rate table is as follows',
      name: 'random_text_1154',
      desc: '',
      args: [],
    );
  }

  /// `Must reach`
  String get random_text_1155 {
    return Intl.message(
      'Must reach',
      name: 'random_text_1155',
      desc: '',
      args: [],
    );
  }

  /// `Unlock the chat function`
  String get random_text_1156 {
    return Intl.message(
      'Unlock the chat function',
      name: 'random_text_1156',
      desc: '',
      args: [],
    );
  }

  /// `Sending failed`
  String get random_text_1157 {
    return Intl.message(
      'Sending failed',
      name: 'random_text_1157',
      desc: '',
      args: [],
    );
  }

  /// `Original`
  String get random_text_1158 {
    return Intl.message(
      'Original',
      name: 'random_text_1158',
      desc: '',
      args: [],
    );
  }

  /// `You currently have no bonus to claim`
  String get random_text_1159 {
    return Intl.message(
      'You currently have no bonus to claim',
      name: 'random_text_1159',
      desc: '',
      args: [],
    );
  }

  /// `You currently have no cashback to receive`
  String get random_text_1160 {
    return Intl.message(
      'You currently have no cashback to receive',
      name: 'random_text_1160',
      desc: '',
      args: [],
    );
  }

  /// `You must verify your mobile phone number to make a withdrawal`
  String get random_text_1161 {
    return Intl.message(
      'You must verify your mobile phone number to make a withdrawal',
      name: 'random_text_1161',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get random_text_1162 {
    return Intl.message(
      'Verification Code',
      name: 'random_text_1162',
      desc: '',
      args: [],
    );
  }

  /// `The current currency exchange will be based on the real-time market exchange rate`
  String get random_text_1163 {
    return Intl.message(
      'The current currency exchange will be based on the real-time market exchange rate',
      name: 'random_text_1163',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get random_text_1164 {
    return Intl.message(
      'Country Code',
      name: 'random_text_1164',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends 1-10 People`
  String get random_text_1165 {
    return Intl.message(
      'Invite Friends 1-10 People',
      name: 'random_text_1165',
      desc: '',
      args: [],
    );
  }

  /// `Send 15/ person`
  String get random_text_1166 {
    return Intl.message(
      'Send 15/ person',
      name: 'random_text_1166',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get random_text_1167 {
    return Intl.message(
      'Share',
      name: 'random_text_1167',
      desc: '',
      args: [],
    );
  }

  /// `Bet ID`
  String get random_text_1168 {
    return Intl.message(
      'Bet ID',
      name: 'random_text_1168',
      desc: '',
      args: [],
    );
  }

  /// `Please enter feedback content`
  String get random_text_1169 {
    return Intl.message(
      'Please enter feedback content',
      name: 'random_text_1169',
      desc: '',
      args: [],
    );
  }

  /// `Message Center`
  String get random_text_1170 {
    return Intl.message(
      'Message Center',
      name: 'random_text_1170',
      desc: '',
      args: [],
    );
  }

  /// `PIX Type`
  String get random_text_1171 {
    return Intl.message(
      'PIX Type',
      name: 'random_text_1171',
      desc: '',
      args: [],
    );
  }

  /// `Please start with an English letter`
  String get random_text_1172 {
    return Intl.message(
      'Please start with an English letter',
      name: 'random_text_1172',
      desc: '',
      args: [],
    );
  }

  /// `Minimum character length is`
  String get random_text_1173 {
    return Intl.message(
      'Minimum character length is',
      name: 'random_text_1173',
      desc: '',
      args: [],
    );
  }

  /// `Handicap`
  String get random_text_1174 {
    return Intl.message(
      'Handicap',
      name: 'random_text_1174',
      desc: '',
      args: [],
    );
  }

  /// `DD`
  String get random_text_1175 {
    return Intl.message(
      'DD',
      name: 'random_text_1175',
      desc: '',
      args: [],
    );
  }

  /// `Meibo Safe`
  String get random_text_1176 {
    return Intl.message(
      'Meibo Safe',
      name: 'random_text_1176',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends`
  String get random_text_1177 {
    return Intl.message(
      'Invite friends',
      name: 'random_text_1177',
      desc: '',
      args: [],
    );
  }

  /// `No feedback yet`
  String get random_text_1178 {
    return Intl.message(
      'No feedback yet',
      name: 'random_text_1178',
      desc: '',
      args: [],
    );
  }

  /// `MM/dd`
  String get random_text_1179 {
    return Intl.message(
      'MM/dd',
      name: 'random_text_1179',
      desc: '',
      args: [],
    );
  }

  /// `Please carefully check the payment address. After completing the payment, please click "Paid"`
  String get random_text_1180 {
    return Intl.message(
      'Please carefully check the payment address. After completing the payment, please click "Paid"',
      name: 'random_text_1180',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get random_text_1181 {
    return Intl.message(
      'Network',
      name: 'random_text_1181',
      desc: '',
      args: [],
    );
  }

  /// `Payment address`
  String get random_text_1182 {
    return Intl.message(
      'Payment address',
      name: 'random_text_1182',
      desc: '',
      args: [],
    );
  }

  /// `Payment amount`
  String get random_text_1183 {
    return Intl.message(
      'Payment amount',
      name: 'random_text_1183',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Deposit Request`
  String get random_text_1184 {
    return Intl.message(
      'Cancel Deposit Request',
      name: 'random_text_1184',
      desc: '',
      args: [],
    );
  }

  /// `I have paid`
  String get random_text_1185 {
    return Intl.message(
      'I have paid',
      name: 'random_text_1185',
      desc: '',
      args: [],
    );
  }

  /// `Bank name`
  String get random_text_1186 {
    return Intl.message(
      'Bank name',
      name: 'random_text_1186',
      desc: '',
      args: [],
    );
  }

  /// `Bank account`
  String get random_text_1187 {
    return Intl.message(
      'Bank account',
      name: 'random_text_1187',
      desc: '',
      args: [],
    );
  }

  /// `Please select PIX type`
  String get random_text_1188 {
    return Intl.message(
      'Please select PIX type',
      name: 'random_text_1188',
      desc: '',
      args: [],
    );
  }

  /// `Please select bank name`
  String get random_text_1189 {
    return Intl.message(
      'Please select bank name',
      name: 'random_text_1189',
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
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
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
