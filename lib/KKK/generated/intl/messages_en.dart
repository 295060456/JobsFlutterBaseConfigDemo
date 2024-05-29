// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(start_number, end_number) =>
      "Please enter the correct bank card number consisting of ${start_number} - ${end_number} digits";

  static String m1(currencyName) => "Your ${currencyName}";

  static String m2(number) => "Online: ${number}";

  static String m3(title) => "Download all ${title}";

  static String m4(rate) => "Current exchange rate: ${rate}";

  static String m5(one, two) => "View all ${one} ${two}";

  static String m6(character_number) =>
      "At least ${character_number} characters";

  static String m7(app_name_text, hCaptcha_text, privacy_policy_text,
          terms_of_service_text) =>
      "${app_name_text} is protected by ${hCaptcha_text}, ${hCaptcha_text}${privacy_policy_text} and ${terms_of_service_text} apply";

  static String m8(text_length) => "Maximum ${text_length} characters";

  static String m9(text_length) => "Minimum ${text_length} characters";

  static String m10(password_characters_length) =>
      "Your password must be at least ${password_characters_length} characters long";

  static String m11(type7) => "Pay in ${type7}";

  static String m12(number) => "${number} Expires in days";

  static String m13(month, day) => "${month} ${day}";

  static String m14(two, one) => "Displaying ${two} of ${one} games";

  static String m15(amount) => "${amount}";

  static String m16(name) => "Go to ${name}";

  static String m17(user_name) => "Investor: ${user_name}";

  static String m18(currency) =>
      "Please confirm sending ${currency} to this address. The recharge requires confirmation from the entire network before it can be credited. Thank you for your patience.";

  static String m19(amount) => "The maximum value is ${amount}";

  static String m20(minimal_amount) => "Minimum amount ${minimal_amount}";

  static String m21(amount) => "Transfer amount ${amount}";

  static String m22(nextTime) => "Next bonus available ${nextTime}";

  static String m23(level, amount) =>
      "points left before VIP ${level} There are still ${amount}";

  static String m24(time) => "Recharge bonus valid until ${time}";

  static String m25(zero) => "The amount cannot be ${zero}";

  static String m26(number) => "Your fund password contains ${number} digits";

  static String m27(user_name) => "Welcome ${user_name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_us": MessageLookupByLibrary.simpleMessage("About Us"),
        "active_bet": MessageLookupByLibrary.simpleMessage("Active"),
        "agree_terms_text": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the terms and conditions"),
        "agree_terms_tips": MessageLookupByLibrary.simpleMessage(
            "Please read the terms and conditions completely and scroll to the end to accept them"),
        "all_bet": MessageLookupByLibrary.simpleMessage("All Bets"),
        "all_esports": MessageLookupByLibrary.simpleMessage("All esports"),
        "all_sports": MessageLookupByLibrary.simpleMessage("All Sports"),
        "alliance_activity": MessageLookupByLibrary.simpleMessage("Activity"),
        "alliance_activity_name":
            MessageLookupByLibrary.simpleMessage("Activity name"),
        "alliance_capital": MessageLookupByLibrary.simpleMessage("Capital"),
        "alliance_commission":
            MessageLookupByLibrary.simpleMessage("Commission"),
        "alliance_create_activity":
            MessageLookupByLibrary.simpleMessage("Create activity"),
        "alliance_game": MessageLookupByLibrary.simpleMessage("Entertainment"),
        "alliance_monery_takeout": MessageLookupByLibrary.simpleMessage(
            "Withdraw available commission"),
        "alliance_plan": MessageLookupByLibrary.simpleMessage("Retention Plan"),
        "alliance_program": MessageLookupByLibrary.simpleMessage("Affiliate"),
        "alliance_recommendation":
            MessageLookupByLibrary.simpleMessage("Recommend users"),
        "alliance_sort": MessageLookupByLibrary.simpleMessage("Sort by"),
        "alliance_summary": MessageLookupByLibrary.simpleMessage("Overview"),
        "already_have_an_account_text":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "app_name_text": MessageLookupByLibrary.simpleMessage("Stake"),
        "back_list_action_text": MessageLookupByLibrary.simpleMessage("Action"),
        "back_list_player_text": MessageLookupByLibrary.simpleMessage("User"),
        "banking_text": MessageLookupByLibrary.simpleMessage("Local Currency"),
        "bet_accept_any_odds":
            MessageLookupByLibrary.simpleMessage("Accept Any Odds"),
        "bet_accept_only_higher_odds":
            MessageLookupByLibrary.simpleMessage("Accept Only Higher Odds"),
        "bet_again": MessageLookupByLibrary.simpleMessage("Reuse bet slip"),
        "bet_agree_new_odds":
            MessageLookupByLibrary.simpleMessage("Accept the new odds"),
        "bet_all_clean": MessageLookupByLibrary.simpleMessage("Clear All"),
        "bet_live": MessageLookupByLibrary.simpleMessage("Boules"),
        "bet_pay": MessageLookupByLibrary.simpleMessage("Estimated Payment"),
        "bet_pay_all": MessageLookupByLibrary.simpleMessage("Total Bets"),
        "bet_settled": MessageLookupByLibrary.simpleMessage("Closed"),
        "bet_stop": MessageLookupByLibrary.simpleMessage("Pause"),
        "bet_submit": MessageLookupByLibrary.simpleMessage("Place Single Bet"),
        "bet_submit_tips_one": MessageLookupByLibrary.simpleMessage(
            "Your bet slip cannot contain suspended or closed bets"),
        "bet_submit_tips_two": MessageLookupByLibrary.simpleMessage(
            "The odds have changed. You need to accept the odds change before betting."),
        "bet_submit_two":
            MessageLookupByLibrary.simpleMessage("Place Multi Bet"),
        "bet_tips_three": MessageLookupByLibrary.simpleMessage(
            "Multiple bets from the same event cannot be combined into multiple bets."),
        "bet_total_odds": MessageLookupByLibrary.simpleMessage("Total Odds"),
        "betting_casino_begin_game":
            MessageLookupByLibrary.simpleMessage("Start the game now!"),
        "billboard": MessageLookupByLibrary.simpleMessage("High Rollers"),
        "bind_fail": MessageLookupByLibrary.simpleMessage("Failed to bind"),
        "bind_pix_account":
            MessageLookupByLibrary.simpleMessage("Bind PIX account"),
        "binding_bank_card":
            MessageLookupByLibrary.simpleMessage("Bind bank card"),
        "binding_bank_card_account_name":
            MessageLookupByLibrary.simpleMessage("Account holder\'s full name"),
        "binding_bank_card_account_opening_branch":
            MessageLookupByLibrary.simpleMessage("Account bank address"),
        "binding_bank_card_all_bound_accounts":
            MessageLookupByLibrary.simpleMessage("All bound accounts"),
        "binding_bank_card_binding":
            MessageLookupByLibrary.simpleMessage("Bind"),
        "binding_bank_card_hint": MessageLookupByLibrary.simpleMessage(
            "Please check your name carefully before confirming"),
        "binding_bank_card_names_must_match":
            MessageLookupByLibrary.simpleMessage("The names must match"),
        "binding_bank_card_number":
            MessageLookupByLibrary.simpleMessage("Bank card number"),
        "binding_bank_card_please_enter":
            MessageLookupByLibrary.simpleMessage("Please enter"),
        "binding_bank_card_select_bank":
            MessageLookupByLibrary.simpleMessage("Select the bank"),
        "binding_bindPIX": MessageLookupByLibrary.simpleMessage("Bind PIX"),
        "binding_cannotBeChangedAfterBind":
            MessageLookupByLibrary.simpleMessage(
                "No changes allowed after bound"),
        "binding_confirmDeletion": MessageLookupByLibrary.simpleMessage(
            "Please confirm to delete the following withdrawal methods?"),
        "binding_pleaseEnterCorrect430DigitBankCardNumber": m0,
        "binding_pleaseEnterCorrectBankCardNumber":
            MessageLookupByLibrary.simpleMessage(
                "Insert the correct bank card number"),
        "binding_pleaseEnterCorrectName": MessageLookupByLibrary.simpleMessage(
            "Please enter correct name and surname"),
        "binding_pleaseEnterCorrectWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the correct withdrawal address"),
        "binding_pleaseEnterThirdPartyAccount":
            MessageLookupByLibrary.simpleMessage(
                "Type the third party account"),
        "binding_pleaseEnterWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the withdrawal address"),
        "binding_pleaseEnterYourBankCardNumber":
            MessageLookupByLibrary.simpleMessage("Enter the bank card number"),
        "binding_pleaseSelectPIXAccountType":
            MessageLookupByLibrary.simpleMessage(
                "Select the type of PIX account"),
        "binding_selectAgreement":
            MessageLookupByLibrary.simpleMessage("Select protocol"),
        "binding_setAsDefaultAddress":
            MessageLookupByLibrary.simpleMessage("Set as the default address"),
        "binding_setAsDefaultCardNumber":
            MessageLookupByLibrary.simpleMessage("Set as default card"),
        "binding_tripartite_account_holder_name":
            MessageLookupByLibrary.simpleMessage("Account holder\'s name"),
        "binding_tripartite_account_type_please":
            MessageLookupByLibrary.simpleMessage("Select the account type"),
        "binding_your": m1,
        "button_save_text": MessageLookupByLibrary.simpleMessage("Save"),
        "buy_crypto":
            MessageLookupByLibrary.simpleMessage("Buy cryptocurrency"),
        "cardHolder": MessageLookupByLibrary.simpleMessage("Card Wallet"),
        "casino_bet": MessageLookupByLibrary.simpleMessage("Casino bets"),
        "casino_des_one": MessageLookupByLibrary.simpleMessage(
            "The Leading Online Cryptocurrency Casino"),
        "casino_des_two": MessageLookupByLibrary.simpleMessage(
            "Browse our wide range of casino games and let Stake provide you with an online gambling experience that is both fair and fun. Play slots, live casino, blackjack, baccarat, roulette and dozens more right from your browser Bet on thousands of classic casino games including your favorite Stake original games."),
        "casinoplatformName":
            MessageLookupByLibrary.simpleMessage("Platform name"),
        "chaKanQuanBu": MessageLookupByLibrary.simpleMessage("View All"),
        "change_area_code_tips_text": MessageLookupByLibrary.simpleMessage(
            "We only service areas that are listed in the available country code list."),
        "change_area_code_title_text":
            MessageLookupByLibrary.simpleMessage("Country Code"),
        "change_fund_password":
            MessageLookupByLibrary.simpleMessage("Change Fund Password"),
        "chat_room_online_text": m2,
        "check_box_input_code_tips":
            MessageLookupByLibrary.simpleMessage("Code (Optional)"),
        "check_my_betlist":
            MessageLookupByLibrary.simpleMessage("View my bets"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirm_button_text": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirm_fund_password":
            MessageLookupByLibrary.simpleMessage("Confirm Fund Password"),
        "confirm_new_password_text":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "contact_customer_service":
            MessageLookupByLibrary.simpleMessage("Contact Customer Service"),
        "contains_alphabet_text": MessageLookupByLibrary.simpleMessage(
            "Must contain uppercase and lowercase letter"),
        "contains_one_more_number_text":
            MessageLookupByLibrary.simpleMessage("Contain at least 1 number"),
        "copy_text_to_authenticator_app": MessageLookupByLibrary.simpleMessage(
            "Copy the code to your Authenticator App"),
        "create_account_title":
            MessageLookupByLibrary.simpleMessage("Fill out your details"),
        "create_account_title_text":
            MessageLookupByLibrary.simpleMessage("Create an Account"),
        "crypto_text": MessageLookupByLibrary.simpleMessage("Crypto"),
        "data_count_activity":
            MessageLookupByLibrary.simpleMessage("Reward giving activity"),
        "data_count_data": MessageLookupByLibrary.simpleMessage("Statistics"),
        "data_count_datacopy2":
            MessageLookupByLibrary.simpleMessage("Statistics"),
        "data_count_race": MessageLookupByLibrary.simpleMessage("Races"),
        "date_past_month": MessageLookupByLibrary.simpleMessage("Last 30 days"),
        "date_past_today": MessageLookupByLibrary.simpleMessage("Today"),
        "date_past_week": MessageLookupByLibrary.simpleMessage("Last 7 days"),
        "details": MessageLookupByLibrary.simpleMessage("Details"),
        "detailscopy1": MessageLookupByLibrary.simpleMessage(" Details"),
        "detailscopy2": MessageLookupByLibrary.simpleMessage(" Details"),
        "done_text": MessageLookupByLibrary.simpleMessage("Done"),
        "download_all_text": m3,
        "email_address_text":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "email_already_exists_text": MessageLookupByLibrary.simpleMessage(
            "This email address is already in use"),
        "email_error_tips": MessageLookupByLibrary.simpleMessage(
            "This contains invalid email characters"),
        "email_verification_code":
            MessageLookupByLibrary.simpleMessage("Email Verification Code"),
        "error_title_text": MessageLookupByLibrary.simpleMessage("Error"),
        "fairness": MessageLookupByLibrary.simpleMessage("Fairness"),
        "feedback_back_title":
            MessageLookupByLibrary.simpleMessage("Return to the previous page"),
        "feedback_bonus_title":
            MessageLookupByLibrary.simpleMessage("Bonus to be Claimed: "),
        "feedback_confirm_receive":
            MessageLookupByLibrary.simpleMessage("Confirm receipt"),
        "feedback_content_sub": MessageLookupByLibrary.simpleMessage(
            "Your opinion is very important to us. The most relevant suggestions will be adopted. Once adopted, different cash rewards will be given depending on the level of importance. Feel free to give your opinion!"),
        "feedback_content_title":
            MessageLookupByLibrary.simpleMessage("Content: "),
        "feedback_customer_service":
            MessageLookupByLibrary.simpleMessage("Official customer service"),
        "feedback_expected_receive": MessageLookupByLibrary.simpleMessage(
            "Estimated amount to be received"),
        "feedback_img_sub": MessageLookupByLibrary.simpleMessage(
            "Can Only Upload: png/jpg format, up to 5 photos, maximum size per image 1M"),
        "feedback_rate": m4,
        "feedback_receive_amount_1": MessageLookupByLibrary.simpleMessage(
            "Your current amount to be received is:"),
        "feedback_receive_amount_2": MessageLookupByLibrary.simpleMessage(
            "You can choose which type of currency you wish to receive  "),
        "feedback_receive_title":
            MessageLookupByLibrary.simpleMessage("Claim Bonus"),
        "feedback_rule_sub": MessageLookupByLibrary.simpleMessage(
            "We have set up a huge bonus to collect feedback so that we can optimize the system and functions and give you a better experience! Once adopted, rewards will be given based on importance (except if not adopted)"),
        "feedback_rule_title":
            MessageLookupByLibrary.simpleMessage("Bonus Rules"),
        "feedback_state_title":
            MessageLookupByLibrary.simpleMessage("Feedback Status: "),
        "feedback_title_content":
            MessageLookupByLibrary.simpleMessage("Feedback Content"),
        "feedback_title_img": MessageLookupByLibrary.simpleMessage("Image"),
        "feedback_transfer_await":
            MessageLookupByLibrary.simpleMessage("To be received"),
        "feedback_transfer_received":
            MessageLookupByLibrary.simpleMessage("Received"),
        "feedback_transfer_service": MessageLookupByLibrary.simpleMessage(
            "Customer service transferring"),
        "feedbacl_id_title":
            MessageLookupByLibrary.simpleMessage("Feedback ID: "),
        "fiat_currency_Depositor_is_name":
            MessageLookupByLibrary.simpleMessage("Depositor’s Name"),
        "fiat_currency_channel_selection":
            MessageLookupByLibrary.simpleMessage("Channel Choice"),
        "fiat_currency_confirm_promptly_after_successful_transfer_to_avoid_scoring_delays":
            MessageLookupByLibrary.simpleMessage(
                "In order to prevent delays in score, please confirm in time after the transfer is successful!"),
        "fiat_currency_deposit_hint": MessageLookupByLibrary.simpleMessage(
            "In order to prevent deposit delays, please be sure to enter the correct name of the depositor and the deposit amount."),
        "fiat_currency_drawing_bank":
            MessageLookupByLibrary.simpleMessage("Payment bank"),
        "fiat_currency_payee_name":
            MessageLookupByLibrary.simpleMessage("Payee Name"),
        "fiat_currency_select_the_payment_bank":
            MessageLookupByLibrary.simpleMessage(
                "Please choose the payment bank"),
        "fiat_currency_transfer_amount_must_match_the_order_amount":
            MessageLookupByLibrary.simpleMessage(
                "The transfer amount must match with the order amount"),
        "first_and_then_set_the_password": MessageLookupByLibrary.simpleMessage(
            "Please bind your email first and then set the fund password"),
        "forget_password_text":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "forgot_your_fund_password_go_to": MessageLookupByLibrary.simpleMessage(
            "Forgot your fund password? Go to "),
        "fund_password_is_inconsistent": MessageLookupByLibrary.simpleMessage(
            "The fund passwords entered twice are inconsistent"),
        "game_Category_no_results":
            MessageLookupByLibrary.simpleMessage("No results"),
        "game_category_check_all":
            MessageLookupByLibrary.simpleMessage("View all"),
        "game_category_clear_seach_results":
            MessageLookupByLibrary.simpleMessage("Clear Search ("),
        "game_category_recent_search":
            MessageLookupByLibrary.simpleMessage("Recent Searches"),
        "game_category_repair":
            MessageLookupByLibrary.simpleMessage("Place in maintenance"),
        "game_category_search_standards": MessageLookupByLibrary.simpleMessage(
            "The search requires at least 3 characters"),
        "game_detail_yue": MessageLookupByLibrary.simpleMessage("Balance In"),
        "game_live": MessageLookupByLibrary.simpleMessage("Real People"),
        "game_slots": MessageLookupByLibrary.simpleMessage("Electronic"),
        "game_supplier": MessageLookupByLibrary.simpleMessage("Providers"),
        "get_verification_code":
            MessageLookupByLibrary.simpleMessage("Get Verification Code"),
        "go_to_Binding": MessageLookupByLibrary.simpleMessage("Go to Binding"),
        "go_to_casino": MessageLookupByLibrary.simpleMessage("Go to Casino"),
        "go_to_sports_book":
            MessageLookupByLibrary.simpleMessage("Go to Sportsbook"),
        "hCaptcha_text": MessageLookupByLibrary.simpleMessage("hCaptcha"),
        "hello_text": MessageLookupByLibrary.simpleMessage("Hello"),
        "homeChaKanQuanBu": m5,
        "home_blog": MessageLookupByLibrary.simpleMessage("Blog"),
        "home_challenge": MessageLookupByLibrary.simpleMessage("Challenge"),
        "home_forum": MessageLookupByLibrary.simpleMessage("Forum"),
        "home_game": MessageLookupByLibrary.simpleMessage("Game"),
        "home_recent_games": MessageLookupByLibrary.simpleMessage("Recent"),
        "image_load_error":
            MessageLookupByLibrary.simpleMessage("Loading failed x_x"),
        "invalid_birthday_text":
            MessageLookupByLibrary.simpleMessage("Invalid date"),
        "kyc_address_prove_text":
            MessageLookupByLibrary.simpleMessage("Proof of address"),
        "kyc_city_text": MessageLookupByLibrary.simpleMessage("City"),
        "kyc_family_name_text":
            MessageLookupByLibrary.simpleMessage("Last name"),
        "kyc_given_name_text": MessageLookupByLibrary.simpleMessage("Name"),
        "kyc_job_text": MessageLookupByLibrary.simpleMessage("Profession"),
        "kyc_level_four_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Please complete the level 3 verification"),
        "kyc_level_four_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Please upload proof of your source of funds. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible"),
        "kyc_level_front_text": MessageLookupByLibrary.simpleMessage("Front"),
        "kyc_level_money_source_text":
            MessageLookupByLibrary.simpleMessage("Source of funds"),
        "kyc_level_number_four_text":
            MessageLookupByLibrary.simpleMessage("Level 4"),
        "kyc_level_number_one_text":
            MessageLookupByLibrary.simpleMessage("Level 1"),
        "kyc_level_number_three_text":
            MessageLookupByLibrary.simpleMessage("Level 3"),
        "kyc_level_number_two_text":
            MessageLookupByLibrary.simpleMessage("Level 2"),
        "kyc_level_one_tips_text": MessageLookupByLibrary.simpleMessage(
            "Level 1 verification can be updated in case your details change"),
        "kyc_level_personal_id_text":
            MessageLookupByLibrary.simpleMessage("Proof of ID"),
        "kyc_level_reverse_text": MessageLookupByLibrary.simpleMessage("Back"),
        "kyc_level_there_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Please complete the level 2 verification"),
        "kyc_level_there_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible"),
        "kyc_level_two_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Please complete the level 1 verification"),
        "kyc_level_two_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Please upload your identification first. All documents must be placed on a flat surface with all four corners within the frame, and all information should be clearly legible"),
        "kyc_level_verify_title_text":
            MessageLookupByLibrary.simpleMessage("Verify"),
        "kyc_live_place_text":
            MessageLookupByLibrary.simpleMessage("Place of residence"),
        "kyc_nationality_text": MessageLookupByLibrary.simpleMessage("Country"),
        "kyc_postal_code_text":
            MessageLookupByLibrary.simpleMessage("Zip code"),
        "kyc_security_tips_text": MessageLookupByLibrary.simpleMessage(
            "All data will be securely stored and encrypted"),
        "kyc_type_support_text": MessageLookupByLibrary.simpleMessage(
            "Accepted formats: png, jpg, pdf"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "least_character_text": m6,
        "live_support": MessageLookupByLibrary.simpleMessage("Live Support"),
        "login_bottom_protocol_text": m7,
        "login_text_field_account_tips":
            MessageLookupByLibrary.simpleMessage("Email or Username"),
        "login_text_field_password_tips":
            MessageLookupByLibrary.simpleMessage("Password"),
        "login_text_other_use": MessageLookupByLibrary.simpleMessage("OR"),
        "logout_text": MessageLookupByLibrary.simpleMessage("Logout"),
        "max_character_limit_text": m8,
        "menu_odds": MessageLookupByLibrary.simpleMessage("Odds"),
        "message_read": MessageLookupByLibrary.simpleMessage("Seen"),
        "message_send_button_text":
            MessageLookupByLibrary.simpleMessage("Send"),
        "message_unread": MessageLookupByLibrary.simpleMessage("Unread"),
        "minimum_character_limit_text": m9,
        "monthly_text": MessageLookupByLibrary.simpleMessage("Month"),
        "multiple_bet": MessageLookupByLibrary.simpleMessage("Multi"),
        "must_over_18_year_text": MessageLookupByLibrary.simpleMessage(
            "You must be over 18 years old"),
        "new_password_text":
            MessageLookupByLibrary.simpleMessage("New Password"),
        "newcomer_discount_tips_text": MessageLookupByLibrary.simpleMessage(
            "Welcome offer valid only for 24 hours after registration."),
        "no_account_tips_text":
            MessageLookupByLibrary.simpleMessage("Don’t have an account? "),
        "no_crypto": MessageLookupByLibrary.simpleMessage(
            "No cryptocurrency? No problem"),
        "no_entries": MessageLookupByLibrary.simpleMessage("No Entries."),
        "no_odds_changes_accepted":
            MessageLookupByLibrary.simpleMessage("No Odds Changes Accepted"),
        "notification": MessageLookupByLibrary.simpleMessage("Message Center"),
        "notifs_announcement":
            MessageLookupByLibrary.simpleMessage("Announcement"),
        "notifs_as_read":
            MessageLookupByLibrary.simpleMessage("Mark All as Read"),
        "notifs_available":
            MessageLookupByLibrary.simpleMessage("No Notifications Available"),
        "notifs_available_tip": MessageLookupByLibrary.simpleMessage(
            "Your interactions will be visible here"),
        "notifs_content_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage(
                "Your deposit of %s %s has been successfully processed."),
        "notifs_content_deposit_pending": MessageLookupByLibrary.simpleMessage(
            "Your deposit of %s %s has been registered and is awaiting confirmation."),
        "notifs_insert_feedback":
            MessageLookupByLibrary.simpleMessage("Create Feedback"),
        "notifs_marquee": MessageLookupByLibrary.simpleMessage("News ticker"),
        "notifs_my_feedback":
            MessageLookupByLibrary.simpleMessage("My Feedbacks"),
        "notifs_new": MessageLookupByLibrary.simpleMessage("New release"),
        "notifs_rewarded_feedback":
            MessageLookupByLibrary.simpleMessage("Reward Feedback"),
        "notifs_site_message":
            MessageLookupByLibrary.simpleMessage("Internal Message"),
        "notifs_title_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage("Deposit confirmed"),
        "notifs_title_deposit_pending":
            MessageLookupByLibrary.simpleMessage("Deposit pending"),
        "odds_american": MessageLookupByLibrary.simpleMessage("American"),
        "odds_decimal": MessageLookupByLibrary.simpleMessage("Decimal"),
        "odds_fractional": MessageLookupByLibrary.simpleMessage("Fractional"),
        "odds_hong_kong": MessageLookupByLibrary.simpleMessage("Hong Kong"),
        "odds_indonesian": MessageLookupByLibrary.simpleMessage("Indonesian"),
        "odds_malaysian": MessageLookupByLibrary.simpleMessage("Malaysian"),
        "offerrs_redeem_bonus_drop":
            MessageLookupByLibrary.simpleMessage("Redeem AirDrop bonus"),
        "offers": MessageLookupByLibrary.simpleMessage("Discount"),
        "offers_code": MessageLookupByLibrary.simpleMessage("Code"),
        "offers_redeem_body": MessageLookupByLibrary.simpleMessage(
            "Get AirDrop bonus codes on our social media such as Twitter and Telegram"),
        "offers_welcome_offer":
            MessageLookupByLibrary.simpleMessage("Welcome offer"),
        "offers_welcome_offer_body": MessageLookupByLibrary.simpleMessage(
            "Welcome offer valid only for 24 hours after registration."),
        "old_password_text":
            MessageLookupByLibrary.simpleMessage("Old Password"),
        "only_supports_6_digit_pure_numbers":
            MessageLookupByLibrary.simpleMessage(
                "Only supports 6-digit pure numbers"),
        "original_fund_password":
            MessageLookupByLibrary.simpleMessage("Previous Fund Password"),
        "password_can_not_be_blank":
            MessageLookupByLibrary.simpleMessage("Password cannot be blank"),
        "password_contains_uppercase_and_lowercase_tips":
            MessageLookupByLibrary.simpleMessage(
                "The password must contain at least 1 uppercase letter and 1 lowercase letter"),
        "password_has_been_updated": MessageLookupByLibrary.simpleMessage(
            "The password has been updated"),
        "password_required_characters": m10,
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Payment Details"),
        "phone_number_text":
            MessageLookupByLibrary.simpleMessage("Phone Number"),
        "please_input_account_tips":
            MessageLookupByLibrary.simpleMessage("Type the account"),
        "please_input_birthday_tips":
            MessageLookupByLibrary.simpleMessage("Please type your birthday"),
        "please_input_email_tips":
            MessageLookupByLibrary.simpleMessage("Please enter email address"),
        "please_input_message":
            MessageLookupByLibrary.simpleMessage("Type your message"),
        "please_input_password_tips":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "please_input_user_name_tips":
            MessageLookupByLibrary.simpleMessage("Please enter username"),
        "please_join_at_tips": MessageLookupByLibrary.simpleMessage(
            "Please add the ”@“ symbol to your email address"),
        "prevent_other_people_look":
            MessageLookupByLibrary.simpleMessage("Don\'t let anyone see this!"),
        "privacy_body_community_title_text":
            MessageLookupByLibrary.simpleMessage("Community"),
        "privacy_body_race_switch_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Other users will not be able to view your contest history"),
        "privacy_body_sale_title_text":
            MessageLookupByLibrary.simpleMessage("Marketing"),
        "privacy_body_statistics_switch_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Other users cannot view your win, loss and betting statistics"),
        "privacy_body_statistics_switch_title_text":
            MessageLookupByLibrary.simpleMessage("Hide all statistics"),
        "privacy_body_stealth_switch_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Your bet will not appear in public betting feeds and bet previews"),
        "privacy_body_stealth_switch_title_text":
            MessageLookupByLibrary.simpleMessage("Enable incognito mode"),
        "privacy_body_switch_red_rain_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Prevent you from receiving red envelopes in chat rooms"),
        "privacy_body_switch_red_rain_title_text":
            MessageLookupByLibrary.simpleMessage(
                "Refuse to receive red envelope rain"),
        "privacy_body_switch_sale_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Opt out of receiving emails or promotions"),
        "privacy_body_switch_sale_title_text":
            MessageLookupByLibrary.simpleMessage("Receive marketing emails"),
        "privacy_body_take_effect_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Please allow up to 30 seconds for the update to take effect"),
        "privacy_body_tips_text": MessageLookupByLibrary.simpleMessage(
            "User privacy is one of our core values. These settings will allow you to be completely anonymous in front of other players."),
        "privacy_body_title_text":
            MessageLookupByLibrary.simpleMessage("Privacy"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "privacy_policy_text":
            MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "promotions": MessageLookupByLibrary.simpleMessage("Promotions"),
        "race_leaderboard":
            MessageLookupByLibrary.simpleMessage("Race Leaderboard"),
        "random_text_1": MessageLookupByLibrary.simpleMessage(
            "An account recovery email has been sent to \n"),
        "random_text_10": MessageLookupByLibrary.simpleMessage("February"),
        "random_text_100":
            MessageLookupByLibrary.simpleMessage("Type of currency"),
        "random_text_1000":
            MessageLookupByLibrary.simpleMessage(", maximum red envelope"),
        "random_text_1001": MessageLookupByLibrary.simpleMessage("Sorry"),
        "random_text_1002": MessageLookupByLibrary.simpleMessage(
            "This red envelope session has been fully claimed"),
        "random_text_1003": MessageLookupByLibrary.simpleMessage(
            "This red envelope session has already been participated in"),
        "random_text_1004": MessageLookupByLibrary.simpleMessage(
            "Activity hasn\'t started yet, please try again later"),
        "random_text_1005":
            MessageLookupByLibrary.simpleMessage("Activity reminder"),
        "random_text_1006": MessageLookupByLibrary.simpleMessage("Every day"),
        "random_text_1007": MessageLookupByLibrary.simpleMessage("Each time"),
        "random_text_1008": MessageLookupByLibrary.simpleMessage(
            "Minimum withdrawal of 100.00"),
        "random_text_1009": MessageLookupByLibrary.simpleMessage(
            "Send invitations to random players"),
        "random_text_101":
            MessageLookupByLibrary.simpleMessage("Receipt estimate"),
        "random_text_1010": MessageLookupByLibrary.simpleMessage("Send SMS"),
        "random_text_1011":
            MessageLookupByLibrary.simpleMessage("Withdrawal progress"),
        "random_text_1012":
            MessageLookupByLibrary.simpleMessage("Email Address/Phone Number"),
        "random_text_1013": MessageLookupByLibrary.simpleMessage(
            "Not bound to email or phone, please "),
        "random_text_1014":
            MessageLookupByLibrary.simpleMessage("Please enter phone number"),
        "random_text_1015":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "random_text_1016":
            MessageLookupByLibrary.simpleMessage("Email or Username"),
        "random_text_1017": MessageLookupByLibrary.simpleMessage("Phone login"),
        "random_text_1018":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "random_text_1019":
            MessageLookupByLibrary.simpleMessage("Don’t have an account yet? "),
        "random_text_102": MessageLookupByLibrary.simpleMessage(
            "Commission wallet and balance"),
        "random_text_1020":
            MessageLookupByLibrary.simpleMessage("Register an Account"),
        "random_text_1021": MessageLookupByLibrary.simpleMessage("Or use"),
        "random_text_1022": MessageLookupByLibrary.simpleMessage("Email"),
        "random_text_1023":
            MessageLookupByLibrary.simpleMessage("Username 3-14 characters"),
        "random_text_1024":
            MessageLookupByLibrary.simpleMessage("Enter referral code"),
        "random_text_1025": MessageLookupByLibrary.simpleMessage("I agree to"),
        "random_text_1026":
            MessageLookupByLibrary.simpleMessage(" User Agreement "),
        "random_text_1027": MessageLookupByLibrary.simpleMessage(
            "and confirm that I am at least 18 years old"),
        "random_text_1028": MessageLookupByLibrary.simpleMessage(
            "Please agree and check the User Agreement"),
        "random_text_1029": MessageLookupByLibrary.simpleMessage(
            "I agree to receive Win6 marketing promotions"),
        "random_text_103": MessageLookupByLibrary.simpleMessage(
            "Exchange rate of the total amount"),
        "random_text_1030":
            MessageLookupByLibrary.simpleMessage("Register OAuth"),
        "random_text_1031": MessageLookupByLibrary.simpleMessage(
            "Please fill in your detailed information"),
        "random_text_1032":
            MessageLookupByLibrary.simpleMessage("User Agreement"),
        "random_text_1033":
            MessageLookupByLibrary.simpleMessage("Email verification"),
        "random_text_1034": MessageLookupByLibrary.simpleMessage(
            "Please enter the 6-digit verification code sent to justin888@gmail.com, which is valid for 5 minutes."),
        "random_text_1035":
            MessageLookupByLibrary.simpleMessage("Didn’t receive the code?"),
        "random_text_1036":
            MessageLookupByLibrary.simpleMessage("Phone verification"),
        "random_text_1037": MessageLookupByLibrary.simpleMessage(
            "Please enter the 6-digit verification code sent to +86 18988888888, which is valid for 5 minutes."),
        "random_text_1038": MessageLookupByLibrary.simpleMessage("Email"),
        "random_text_1039": MessageLookupByLibrary.simpleMessage(
            "SMS sent to your Phone, if you still haven\'t received the verification code after multiple attempts."),
        "random_text_1040": MessageLookupByLibrary.simpleMessage(
            "SMS has been sent to your email, if you still haven\'t received the verification code after multiple attempts,"),
        "random_text_1041": MessageLookupByLibrary.simpleMessage(
            "1. Check if your phone is out of service."),
        "random_text_1042": MessageLookupByLibrary.simpleMessage(
            "1. Check if your email is correct."),
        "random_text_1043": MessageLookupByLibrary.simpleMessage(
            "2. Check if the SMS is in the spam folder."),
        "random_text_1044": MessageLookupByLibrary.simpleMessage(
            "2. Check if the email is in the spam folder."),
        "random_text_1045": MessageLookupByLibrary.simpleMessage(
            "3. This message may be delayed for a few minutes, please try again after 10 minutes."),
        "random_text_1046": MessageLookupByLibrary.simpleMessage(
            "Please enter the verification code"),
        "random_text_1047":
            MessageLookupByLibrary.simpleMessage("Phone Verification"),
        "random_text_1048": MessageLookupByLibrary.simpleMessage(
            "Please enter the 6-digit verification code sent to"),
        "random_text_1049": MessageLookupByLibrary.simpleMessage(
            ", which is valid for 5 minutes."),
        "random_text_105":
            MessageLookupByLibrary.simpleMessage("Statistical Time"),
        "random_text_1050": MessageLookupByLibrary.simpleMessage("Resend"),
        "random_text_1051": MessageLookupByLibrary.simpleMessage(
            "Your password must contain at least 8 characters"),
        "random_text_1052": MessageLookupByLibrary.simpleMessage(
            ", which is valid for 5 minutes."),
        "random_text_1053":
            MessageLookupByLibrary.simpleMessage("Submitted successfully"),
        "random_text_1054": MessageLookupByLibrary.simpleMessage("Approved"),
        "random_text_1055": MessageLookupByLibrary.simpleMessage("Rejected"),
        "random_text_1056": MessageLookupByLibrary.simpleMessage(
            "The activity has not started yet, please try again later..."),
        "random_text_1057": MessageLookupByLibrary.simpleMessage(
            "You currently do not meet the requirements for receiving"),
        "random_text_1058": MessageLookupByLibrary.simpleMessage("Applying"),
        "random_text_1059": MessageLookupByLibrary.simpleMessage(
            "Your cashback is currently being applied for"),
        "random_text_106":
            MessageLookupByLibrary.simpleMessage("Number of bet slips"),
        "random_text_1060":
            MessageLookupByLibrary.simpleMessage("Unknown error"),
        "random_text_1061":
            MessageLookupByLibrary.simpleMessage("Current level"),
        "random_text_1062": MessageLookupByLibrary.simpleMessage(
            "Still need to reach the next level:"),
        "random_text_1063":
            MessageLookupByLibrary.simpleMessage("Negative profit cashback"),
        "random_text_1064": MessageLookupByLibrary.simpleMessage(
            "You will receive up to the highest cashback for playing games this week"),
        "random_text_1065": MessageLookupByLibrary.simpleMessage("% cashback"),
        "random_text_1066":
            MessageLookupByLibrary.simpleMessage("After settlement"),
        "random_text_1067":
            MessageLookupByLibrary.simpleMessage("Days to claim"),
        "random_text_1068": MessageLookupByLibrary.simpleMessage("Total"),
        "random_text_1069":
            MessageLookupByLibrary.simpleMessage("Roll greater than"),
        "random_text_107":
            MessageLookupByLibrary.simpleMessage("Deposit Amount"),
        "random_text_1070": MessageLookupByLibrary.simpleMessage("Low level"),
        "random_text_1071": MessageLookupByLibrary.simpleMessage("High level"),
        "random_text_1072": MessageLookupByLibrary.simpleMessage(
            "The amount has been sent to your corresponding currency wallet"),
        "random_text_1073": MessageLookupByLibrary.simpleMessage(
            "No cashback available to claim at the moment"),
        "random_text_1074": MessageLookupByLibrary.simpleMessage(
            "Meet the points requirement for VIP promotion to advance to the corresponding VIP level and receive the corresponding promotion bonus. If you continuously advance multiple levels, you can claim all level advancement bonuses;"),
        "random_text_1075": MessageLookupByLibrary.simpleMessage(
            "Meet the points requirement for maintaining the current VIP level within the last 90 days to retain the current VIP level. If unable to meet the maintenance points requirement within 90 days, the VIP level will be lowered by one level;"),
        "random_text_1076": MessageLookupByLibrary.simpleMessage(
            "Current level has reached the maximum"),
        "random_text_1077":
            MessageLookupByLibrary.simpleMessage("Keep current level requires"),
        "random_text_1078": MessageLookupByLibrary.simpleMessage(
            "Promotion description: The bonuses claimed in this promotion will be delivered according to the currency you choose. After the first successful claim, the system will use the currency you claimed as the fixed."),
        "random_text_1079":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "random_text_107_copy":
            MessageLookupByLibrary.simpleMessage("Deposit Amount"),
        "random_text_108":
            MessageLookupByLibrary.simpleMessage("(number of times)"),
        "random_text_1080":
            MessageLookupByLibrary.simpleMessage("Phone area code"),
        "random_text_1081":
            MessageLookupByLibrary.simpleMessage("Get more chances"),
        "random_text_1082": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' total deposits"),
        "random_text_1083": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' total turnover"),
        "random_text_1084": MessageLookupByLibrary.simpleMessage(
            "Number of subordinates\' first deposits"),
        "random_text_1085": MessageLookupByLibrary.simpleMessage(
            "Number of subordinates\' turnovers"),
        "random_text_1086":
            MessageLookupByLibrary.simpleMessage("Own total deposits"),
        "random_text_1087":
            MessageLookupByLibrary.simpleMessage("Own total turnover"),
        "random_text_1088":
            MessageLookupByLibrary.simpleMessage("Number of own deposits"),
        "random_text_1089": MessageLookupByLibrary.simpleMessage("Invite"),
        "random_text_109":
            MessageLookupByLibrary.simpleMessage("Withdraw Amount"),
        "random_text_1090": MessageLookupByLibrary.simpleMessage("Friends"),
        "random_text_1091": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' first deposit"),
        "random_text_1092":
            MessageLookupByLibrary.simpleMessage("Subordinates\' turnover"),
        "random_text_1093":
            MessageLookupByLibrary.simpleMessage("Total deposits"),
        "random_text_1094":
            MessageLookupByLibrary.simpleMessage("Total turnover"),
        "random_text_1095": MessageLookupByLibrary.simpleMessage("Invited"),
        "random_text_1096":
            MessageLookupByLibrary.simpleMessage("Subordinates\' deposited"),
        "random_text_1097":
            MessageLookupByLibrary.simpleMessage("Subordinates\' turnovers"),
        "random_text_1098": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' first deposits"),
        "random_text_1099": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' turnover participants"),
        "random_text_11": MessageLookupByLibrary.simpleMessage("March"),
        "random_text_110": MessageLookupByLibrary.simpleMessage(
            "Difference between deposits and withdrawals"),
        "random_text_1100":
            MessageLookupByLibrary.simpleMessage("Total deposits"),
        "random_text_1101":
            MessageLookupByLibrary.simpleMessage("Total turnover"),
        "random_text_1102":
            MessageLookupByLibrary.simpleMessage("Accumulated invitations"),
        "random_text_1103": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' accumulated deposits"),
        "random_text_1104": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' accumulated turnover"),
        "random_text_1105": MessageLookupByLibrary.simpleMessage(
            "Subordinates\' accumulated first deposits"),
        "random_text_1106":
            MessageLookupByLibrary.simpleMessage("Accumulated deposits"),
        "random_text_1107":
            MessageLookupByLibrary.simpleMessage("Accumulated turnover"),
        "random_text_1108": MessageLookupByLibrary.simpleMessage(", reward"),
        "random_text_1109": MessageLookupByLibrary.simpleMessage("Draw times"),
        "random_text_111":
            MessageLookupByLibrary.simpleMessage("(current balance)"),
        "random_text_1110": MessageLookupByLibrary.simpleMessage(", rewarded"),
        "random_text_1111": MessageLookupByLibrary.simpleMessage(
            "Statistical data not displayed for this user"),
        "random_text_1112": MessageLookupByLibrary.simpleMessage("Safe"),
        "random_text_1113": MessageLookupByLibrary.simpleMessage("Normal"),
        "random_text_1114": MessageLookupByLibrary.simpleMessage("High Risk"),
        "random_text_1115":
            MessageLookupByLibrary.simpleMessage("Verification Code"),
        "random_text_1116": MessageLookupByLibrary.simpleMessage("No Phone? "),
        "random_text_1117": MessageLookupByLibrary.simpleMessage("No Email? "),
        "random_text_1118": MessageLookupByLibrary.simpleMessage("Use Email"),
        "random_text_1119": MessageLookupByLibrary.simpleMessage("Use Phone"),
        "random_text_112":
            MessageLookupByLibrary.simpleMessage("Statistics Date"),
        "random_text_1120":
            MessageLookupByLibrary.simpleMessage("Bonus Points"),
        "random_text_1121": MessageLookupByLibrary.simpleMessage("Promotion"),
        "random_text_1122": MessageLookupByLibrary.simpleMessage("Full Name"),
        "random_text_1123": MessageLookupByLibrary.simpleMessage("Bank Card"),
        "random_text_1124": MessageLookupByLibrary.simpleMessage("Full Name"),
        "random_text_1125":
            MessageLookupByLibrary.simpleMessage("Withdrawal Account"),
        "random_text_1126":
            MessageLookupByLibrary.simpleMessage("Wallet Address"),
        "random_text_1127":
            MessageLookupByLibrary.simpleMessage("Bind Crypto Currency"),
        "random_text_1128": MessageLookupByLibrary.simpleMessage("Branch"),
        "random_text_1129": MessageLookupByLibrary.simpleMessage("CPF Number"),
        "random_text_113":
            MessageLookupByLibrary.simpleMessage("Receive Amount"),
        "random_text_1130":
            MessageLookupByLibrary.simpleMessage("Deposit Currency"),
        "random_text_1131":
            MessageLookupByLibrary.simpleMessage("Withdrawal Currency"),
        "random_text_1132": MessageLookupByLibrary.simpleMessage("Gift +"),
        "random_text_1133": MessageLookupByLibrary.simpleMessage("Icon"),
        "random_text_1134": MessageLookupByLibrary.simpleMessage(
            "Please enter the depositor’s name"),
        "random_text_1135": MessageLookupByLibrary.simpleMessage("Select Bank"),
        "random_text_1136":
            MessageLookupByLibrary.simpleMessage("Select Network"),
        "random_text_1137": MessageLookupByLibrary.simpleMessage("Select Bank"),
        "random_text_1138": MessageLookupByLibrary.simpleMessage("Show More"),
        "random_text_1139":
            MessageLookupByLibrary.simpleMessage("Fiat Currency"),
        "random_text_114": MessageLookupByLibrary.simpleMessage("Cashback"),
        "random_text_1140": MessageLookupByLibrary.simpleMessage(
            "Please bind the receiving information first"),
        "random_text_1141":
            MessageLookupByLibrary.simpleMessage("Withdrawal Address"),
        "random_text_1142":
            MessageLookupByLibrary.simpleMessage("Add Receipt Account"),
        "random_text_1143":
            MessageLookupByLibrary.simpleMessage("Withdrawal Bank"),
        "random_text_1144":
            MessageLookupByLibrary.simpleMessage("Withdrawal Amount"),
        "random_text_1145": MessageLookupByLibrary.simpleMessage(
            "Mobile phone number is not registered"),
        "random_text_1146":
            MessageLookupByLibrary.simpleMessage("Email is not registered"),
        "random_text_1147": MessageLookupByLibrary.simpleMessage(
            "Please agree and check the User Agreement"),
        "random_text_1148": MessageLookupByLibrary.simpleMessage(
            "Your phone verification code contains 6 digits"),
        "random_text_1149":
            MessageLookupByLibrary.simpleMessage("Correct verification code"),
        "random_text_115":
            MessageLookupByLibrary.simpleMessage("Agent Commission"),
        "random_text_1150": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully"),
        "random_text_1151": MessageLookupByLibrary.simpleMessage(
            "It refers to the vertically developed members and are collectively called direct teams. (1) B1, B2, B3 contribute to A, (80,000 + 50,000 + 30,000) x 0.10 = 1600. \n\n(2) C1, C2 contribute to B1, (100,000 + 40,000) x 0.08 = 1120. \n\n(3) C3 contributes to B3, 610,000 x 0.10 = 6100."),
        "random_text_1152": MessageLookupByLibrary.simpleMessage(
            "It refers to the members developed at lower levels, such as subordinates, sub-subordinates, etc., called uniformly from other teams. Our platform can develop subordinates indefinitely, with a two-tier structure as an example. (1) coming from C1, C2 due to B1\'s total performance of 140,000, taking advantage of only 0.08 of commission rate, while a\'s total performance is 1,010,000, taking advantage of 0.10 of commission rate, so the commission difference between A and B1 is: 0.10-0.08 = 0.02, this difference is the part that C1 and C2 contribute to A, so C1 and C2: (100,000 + 40,000) × 0.02 = 280. (2) coming from C3 due to B3\'s total performance of 710,000, taking advantage of 0.10 of the commission rate, A\'s total performance is 1,010,000, taking advantage of 0.10 of the commission rate, so the commission difference between A and B3 is: 0.10 - 0.10 = 0, C3 contributes to A: 610,000 x 0/000 = 0."),
        "random_text_1153": MessageLookupByLibrary.simpleMessage(
            " (1) C3 is so powerful that A receives a higher commission rate for the entire performance. \n\n (2) B2 may not be diligent and not develop a team. at all, it is not profitable. \n\n (3) although B3 participates relatively slowly and is A team of A, C3 performs well, giving B3 a higher commission ratio directly. therefore, no matter when B3 participates or who is a team. regardless of his level, income will not be affected, and development will not be limited. (4) This is an absolutely fair and just agency model. Whoever joins late will never be stepped on."),
        "random_text_1154": MessageLookupByLibrary.simpleMessage(
            "The commission rate table is as follows"),
        "random_text_1155": MessageLookupByLibrary.simpleMessage("Must reach"),
        "random_text_1156":
            MessageLookupByLibrary.simpleMessage("Unlock the chat function"),
        "random_text_1157":
            MessageLookupByLibrary.simpleMessage("Sending failed"),
        "random_text_1158": MessageLookupByLibrary.simpleMessage("Original"),
        "random_text_1159": MessageLookupByLibrary.simpleMessage(
            "You currently have no bonus to claim"),
        "random_text_116": MessageLookupByLibrary.simpleMessage("Yes"),
        "random_text_1160": MessageLookupByLibrary.simpleMessage(
            "You currently have no cashback to receive"),
        "random_text_1161": MessageLookupByLibrary.simpleMessage(
            "You must verify your mobile phone number to make a withdrawal"),
        "random_text_1162":
            MessageLookupByLibrary.simpleMessage("Verification Code"),
        "random_text_1163": MessageLookupByLibrary.simpleMessage(
            "The current currency exchange will be based on the real-time market exchange rate"),
        "random_text_1164":
            MessageLookupByLibrary.simpleMessage("Country Code"),
        "random_text_1165":
            MessageLookupByLibrary.simpleMessage("Invite Friends 1-10 People"),
        "random_text_1166":
            MessageLookupByLibrary.simpleMessage("Send 15/ person"),
        "random_text_1167": MessageLookupByLibrary.simpleMessage("Share"),
        "random_text_1168": MessageLookupByLibrary.simpleMessage("Bet ID"),
        "random_text_1169": MessageLookupByLibrary.simpleMessage(
            "Please enter feedback content"),
        "random_text_117": MessageLookupByLibrary.simpleMessage("No"),
        "random_text_1170":
            MessageLookupByLibrary.simpleMessage("Message Center"),
        "random_text_1171": MessageLookupByLibrary.simpleMessage("PIX Type"),
        "random_text_1172": MessageLookupByLibrary.simpleMessage(
            "Please start with an English letter"),
        "random_text_1173":
            MessageLookupByLibrary.simpleMessage("Minimum character length is"),
        "random_text_1174": MessageLookupByLibrary.simpleMessage("Handicap"),
        "random_text_1175": MessageLookupByLibrary.simpleMessage("DD"),
        "random_text_1176": MessageLookupByLibrary.simpleMessage("Meibo Safe"),
        "random_text_1177":
            MessageLookupByLibrary.simpleMessage("Invite friends"),
        "random_text_1178":
            MessageLookupByLibrary.simpleMessage("No feedback yet"),
        "random_text_1179": MessageLookupByLibrary.simpleMessage("MM/dd"),
        "random_text_118": MessageLookupByLibrary.simpleMessage("Online"),
        "random_text_1180": MessageLookupByLibrary.simpleMessage(
            "Please carefully check the payment address. After completing the payment, please click \"Paid\""),
        "random_text_1181": MessageLookupByLibrary.simpleMessage("Network"),
        "random_text_1182":
            MessageLookupByLibrary.simpleMessage("Payment address"),
        "random_text_1183":
            MessageLookupByLibrary.simpleMessage("Payment amount"),
        "random_text_1184":
            MessageLookupByLibrary.simpleMessage("Cancel Deposit Request"),
        "random_text_1185": MessageLookupByLibrary.simpleMessage("I have paid"),
        "random_text_1186": MessageLookupByLibrary.simpleMessage("Bank name"),
        "random_text_1187":
            MessageLookupByLibrary.simpleMessage("Bank account"),
        "random_text_1188":
            MessageLookupByLibrary.simpleMessage("Please select PIX type"),
        "random_text_1189":
            MessageLookupByLibrary.simpleMessage("Please select bank name"),
        "random_text_119": MessageLookupByLibrary.simpleMessage("Offline"),
        "random_text_12": MessageLookupByLibrary.simpleMessage("April"),
        "random_text_120": MessageLookupByLibrary.simpleMessage("Times"),
        "random_text_120_copy": MessageLookupByLibrary.simpleMessage("Times"),
        "random_text_121":
            MessageLookupByLibrary.simpleMessage("Is This Your First Deposit"),
        "random_text_122": MessageLookupByLibrary.simpleMessage("Last Login"),
        "random_text_123":
            MessageLookupByLibrary.simpleMessage("Online Status"),
        "random_text_124":
            MessageLookupByLibrary.simpleMessage("Number of times"),
        "random_text_125": MessageLookupByLibrary.simpleMessage("Sports"),
        "random_text_126": MessageLookupByLibrary.simpleMessage("View"),
        "random_text_127":
            MessageLookupByLibrary.simpleMessage("Settlement Time"),
        "random_text_128": MessageLookupByLibrary.simpleMessage("Type"),
        "random_text_129": MessageLookupByLibrary.simpleMessage("Performance"),
        "random_text_13": MessageLookupByLibrary.simpleMessage("May"),
        "random_text_132": MessageLookupByLibrary.simpleMessage("Next page"),
        "random_text_133": MessageLookupByLibrary.simpleMessage("Search for:"),
        "random_text_134":
            MessageLookupByLibrary.simpleMessage("Number of Subordinates"),
        "random_text_135":
            MessageLookupByLibrary.simpleMessage("Contribute Commission"),
        "random_text_136": MessageLookupByLibrary.simpleMessage("WeChat"),
        "random_text_137":
            MessageLookupByLibrary.simpleMessage("Accumulated Commission"),
        "random_text_138":
            MessageLookupByLibrary.simpleMessage("Received Commission"),
        "random_text_139":
            MessageLookupByLibrary.simpleMessage("Last Commission"),
        "random_text_14": MessageLookupByLibrary.simpleMessage("June"),
        "random_text_140": MessageLookupByLibrary.simpleMessage("Team Number"),
        "random_text_141": MessageLookupByLibrary.simpleMessage("1 person"),
        "random_text_142":
            MessageLookupByLibrary.simpleMessage("Direct Members"),
        "random_text_143":
            MessageLookupByLibrary.simpleMessage("Other Members"),
        "random_text_144":
            MessageLookupByLibrary.simpleMessage("Direct Performance"),
        "random_text_145":
            MessageLookupByLibrary.simpleMessage("Other Performance"),
        "random_text_146":
            MessageLookupByLibrary.simpleMessage("Subordinate bets"),
        "random_text_147":
            MessageLookupByLibrary.simpleMessage("Effective value of the bet"),
        "random_text_148":
            MessageLookupByLibrary.simpleMessage("Total Bet Slips"),
        "random_text_149":
            MessageLookupByLibrary.simpleMessage("999,999,999 orders"),
        "random_text_15": MessageLookupByLibrary.simpleMessage("July"),
        "random_text_150":
            MessageLookupByLibrary.simpleMessage("Total Loss/Win"),
        "random_text_151": MessageLookupByLibrary.simpleMessage("Copied!"),
        "random_text_152":
            MessageLookupByLibrary.simpleMessage("Promotional Information"),
        "random_text_153": MessageLookupByLibrary.simpleMessage("More"),
        "random_text_154":
            MessageLookupByLibrary.simpleMessage("Click to Save the QR Code"),
        "random_text_155": MessageLookupByLibrary.simpleMessage("My link"),
        "random_text_156": MessageLookupByLibrary.simpleMessage("Click here"),
        "random_text_157":
            MessageLookupByLibrary.simpleMessage("Total Performance"),
        "random_text_158": MessageLookupByLibrary.simpleMessage("1.01 million"),
        "random_text_159":
            MessageLookupByLibrary.simpleMessage(", general agent bonus"),
        "random_text_16": MessageLookupByLibrary.simpleMessage("August"),
        "random_text_160": MessageLookupByLibrary.simpleMessage("160K"),
        "random_text_161":
            MessageLookupByLibrary.simpleMessage(", contribution"),
        "random_text_162": MessageLookupByLibrary.simpleMessage("850K"),
        "random_text_163": MessageLookupByLibrary.simpleMessage("Direct under"),
        "random_text_164":
            MessageLookupByLibrary.simpleMessage("Contribute to"),
        "random_text_166": MessageLookupByLibrary.simpleMessage(" and "),
        "random_text_167": MessageLookupByLibrary.simpleMessage(
            "Total performance of subordinates"),
        "random_text_168": MessageLookupByLibrary.simpleMessage("140K \n"),
        "random_text_169": MessageLookupByLibrary.simpleMessage("Enjoy"),
        "random_text_17": MessageLookupByLibrary.simpleMessage("September"),
        "random_text_170": MessageLookupByLibrary.simpleMessage(""),
        "random_text_171":
            MessageLookupByLibrary.simpleMessage("B1 has a valid bet of 80K"),
        "random_text_172":
            MessageLookupByLibrary.simpleMessage("Examples as follows:"),
        "random_text_173": MessageLookupByLibrary.simpleMessage(
            "Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3. A few days later, B1\'s effective bet was 80,000, B2\'s effective bet was 50,000, B3\'s effective bet was 30,000 and C1\'s effective bet is 100,000, C2\'s effective bet is 40,000, and C3\'s effective bet is 710,000, so B1\'s total performance comes from C1 and C2, which is 140,000, and the corresponding discount proportion is 80/10,000; B2\'s performance without subordinates is 0; the subordinate C3 of B3 is very powerful, with a total performance of 710,000, and the corresponding discount ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams, with a total performance of 1.01 million, and the corresponding discount rate is 1 million/10,000. Then the revenue between them is calculated as follows:"),
        "random_text_174":
            MessageLookupByLibrary.simpleMessage("1. Direct team:"),
        "random_text_175":
            MessageLookupByLibrary.simpleMessage("Examples as follows: \n"),
        "random_text_176": MessageLookupByLibrary.simpleMessage(
            "Discounts on this site are based on valid bets. The discount list is assumed to be the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2 and B2 have no subordinates, and B3 only developed the relatively powerful C3.\nA few days later, B1\'s effective bet was 80K, B2\'s effective bet was 50K, B3\'s effective bet was of 30K and C1 My effective bet is 100K, C2\'s effective bet is 40K, C3\'s effective bet is 710K, so B1\'s total performance comes from C1 and C2 totaling 140K, and the corresponding discount ratio is 800K/10K ; B2 has no subordinates Performance is 0; B3\'s subordinate C3 is amazing, with a total performance of 710K, and the corresponding discount ratio is 1M/10K; A has 160K from the direct team and 850K from other teams, the total performance is 1.01 million and the corresponding discount ratio is 1M/10K.\nThen the income between them is calculated as follows:\n\n1,"),
        "random_text_177": MessageLookupByLibrary.simpleMessage("Direct Team"),
        "random_text_178": MessageLookupByLibrary.simpleMessage(
            ": \nRefers to vertically developed members, uniformly called direct teams.\n(1) B1, B2, B3 contribute to A: (80K+50K+30K)x1M/10K=1600.\n (2) C1 and C2 contributes to B1: (100K + 40K)x800K/10K=1120.\n(3) C3 contributes to B3: 710Kx1M/10K=7100.\n\n2,"),
        "random_text_179": MessageLookupByLibrary.simpleMessage("Other Teams"),
        "random_text_18": MessageLookupByLibrary.simpleMessage("October"),
        "random_text_180": MessageLookupByLibrary.simpleMessage(
            ":\nRefers to members of subordinates, subordinates, subordinates, etc., who are collectively called other teams; Since this system can develop subordinates infinitely, for the convenience of explanation, this article only considers the 2-level structure as an example. .\n(1) From C1 and C2: Because B1 has a total performance of 140K and enjoys a discount rate of only 800K/10K, while A has a total performance of 1.01 million and enjoys a discount rate of 1 million/ten thousand, then the relationship between A and B1 The discount difference generated is: 100-80 = 20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100K+ 40K)×20/10K=280. \n(2) From C3: As B3 has total sales of 710K and enjoys a discount rate of 1 million/10 thousand, and A has total sales of 1.01 million and enjoys a discount rate of 1 million/10 thousand, then the discount difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710Kx0/10K=0.\n\n"),
        "random_text_181":
            MessageLookupByLibrary.simpleMessage("3. Summary:\n"),
        "random_text_182": MessageLookupByLibrary.simpleMessage(
            "(1)C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all his performance.\n(2)B2 may be lazy and not develop subordinates, so there is no profit.\n(3) B3 although he joined late in the comparison and belongs to A\'s subordinate, but his subordinate C3 is powerful, allowing B3 to directly enjoy a higher commission rate. Therefore, it doesn\'t matter when B3 joins, who he is subordinate to, it doesn\'t matter At whatever level it is in effect, income will never be affected. No matter how much you suffer at the expense of other people\'s subordinates, your development will not be restricted.\n(4) This is an absolutely fair and just agency model, and no one will do it. being trampled on forever just because you came in late."),
        "random_text_183":
            MessageLookupByLibrary.simpleMessage("Type member account number"),
        "random_text_185":
            MessageLookupByLibrary.simpleMessage("Submit registration"),
        "random_text_186":
            MessageLookupByLibrary.simpleMessage("Search by account"),
        "random_text_187": MessageLookupByLibrary.simpleMessage("Select time"),
        "random_text_188": MessageLookupByLibrary.simpleMessage("All Types"),
        "random_text_189":
            MessageLookupByLibrary.simpleMessage("Accumulated commission:"),
        "random_text_19": MessageLookupByLibrary.simpleMessage("November"),
        "random_text_191": MessageLookupByLibrary.simpleMessage("Page/"),
        "random_text_192": MessageLookupByLibrary.simpleMessage("Page"),
        "random_text_194": MessageLookupByLibrary.simpleMessage("Skip to"),
        "random_text_196":
            MessageLookupByLibrary.simpleMessage("Content number"),
        "random_text_197":
            MessageLookupByLibrary.simpleMessage("Minimum 3 characters"),
        "random_text_198":
            MessageLookupByLibrary.simpleMessage("Available commission:"),
        "random_text_199":
            MessageLookupByLibrary.simpleMessage("Activity clicks"),
        "random_text_20": MessageLookupByLibrary.simpleMessage("December"),
        "random_text_200":
            MessageLookupByLibrary.simpleMessage("Available Amount"),
        "random_text_201":
            MessageLookupByLibrary.simpleMessage("Financing available"),
        "random_text_203": MessageLookupByLibrary.simpleMessage(
            "All of our games come with different house edge percentages. You can use the following formula to calculate your commission:"),
        "random_text_204": MessageLookupByLibrary.simpleMessage(
            "All sports bets are placed with a theoretical house edge of 3%. You can use the following formula to calculate your commission:"),
        "random_text_205": MessageLookupByLibrary.simpleMessage(
            "If you are an affiliate with great influence and can reach a large number of people, or are in other special circumstances, please contact our outstanding support team. After discussion with the affiliate manager, we can try to customize an affiliate program for you. This may include higher commissions."),
        "random_text_206": MessageLookupByLibrary.simpleMessage(
            "At meibo.com, player satisfaction has been - and always will be - the number one priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward and satisfy our players through exclusive programs and events.\nThese programs provide additional funds and rewards, which not only provide a better gaming experience for players, but also help increase affiliate commissions. Total Income.\nThe plan includes:\nDiscounts\nWeekly Bonuses\nMonthly Bonuses\nDaily/Hourly Reload Bonuses\nVIP Level Bonuses\nWith this unique method, your commission is to achieve these costs Based on the final house edge. Depending on the extent to which players receive benefits, the house edge commission you receive will be approximately less than 45% of the advertised house edge for any given game.\nIf you would like a detailed breakdown of fee calculations, please feel free to contact the affiliate manager through support."),
        "random_text_207":
            MessageLookupByLibrary.simpleMessage("Meow meow meow"),
        "random_text_209":
            MessageLookupByLibrary.simpleMessage("Total deposits"),
        "random_text_21": MessageLookupByLibrary.simpleMessage(
            "Step 2/2 :\t\t Read and agree to the terms and conditions"),
        "random_text_210": MessageLookupByLibrary.simpleMessage(
            "Financing available \n2023-08-22"),
        "random_text_211": MessageLookupByLibrary.simpleMessage(
            "Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive an affiliate commission. \nAs an affiliate, the commission earned will be based on the recommended users\' total bets on casino games and sports betting. The difference with traditional affiliate programs is that you can earn the same commission regardless of whether the referred user wins or loses!"),
        "random_text_212":
            MessageLookupByLibrary.simpleMessage("Download banner"),
        "random_text_216":
            MessageLookupByLibrary.simpleMessage("There are no unsettled bets"),
        "random_text_217":
            MessageLookupByLibrary.simpleMessage("Start Betting Now!"),
        "random_text_218":
            MessageLookupByLibrary.simpleMessage("No bets settled"),
        "random_text_220": MessageLookupByLibrary.simpleMessage("Payout"),
        "random_text_220copy": MessageLookupByLibrary.simpleMessage("Payout"),
        "random_text_221": MessageLookupByLibrary.simpleMessage(
            "There Are No Casino Bets Yet"),
        "random_text_223": MessageLookupByLibrary.simpleMessage("At the"),
        "random_text_224": MessageLookupByLibrary.simpleMessage("Multiplier"),
        "random_text_225": MessageLookupByLibrary.simpleMessage("Play "),
        "random_text_227": MessageLookupByLibrary.simpleMessage("Bet Amount"),
        "random_text_228":
            MessageLookupByLibrary.simpleMessage("Estimated Payment"),
        "random_text_229": MessageLookupByLibrary.simpleMessage("Money"),
        "random_text_232": MessageLookupByLibrary.simpleMessage("Draw"),
        "random_text_233": MessageLookupByLibrary.simpleMessage("Win half"),
        "random_text_234": MessageLookupByLibrary.simpleMessage("Lose half"),
        "random_text_235": MessageLookupByLibrary.simpleMessage("Lose part"),
        "random_text_237": MessageLookupByLibrary.simpleMessage("Place by:"),
        "random_text_238": MessageLookupByLibrary.simpleMessage("Hidden"),
        "random_text_239":
            MessageLookupByLibrary.simpleMessage("Register to place bets"),
        "random_text_241":
            MessageLookupByLibrary.simpleMessage("Bet Slip is Empty"),
        "random_text_243":
            MessageLookupByLibrary.simpleMessage("Amount between"),
        "random_text_244": MessageLookupByLibrary.simpleMessage("of"),
        "random_text_245": MessageLookupByLibrary.simpleMessage(
            "This game does not support the currency you selected"),
        "random_text_246":
            MessageLookupByLibrary.simpleMessage("You have a suspended bet"),
        "random_text_247": MessageLookupByLibrary.simpleMessage(
            "A maximum of 10 bets can be selected at the same time"),
        "random_text_248":
            MessageLookupByLibrary.simpleMessage("You have closed bets"),
        "random_text_249": MessageLookupByLibrary.simpleMessage(
            "Insufficient account balance"),
        "random_text_250": MessageLookupByLibrary.simpleMessage(
            "Failed to obtain betting information"),
        "random_text_251": MessageLookupByLibrary.simpleMessage(
            "You have bets that do not support multiple bets"),
        "random_text_252": MessageLookupByLibrary.simpleMessage(
            "Multiple bets cannot be combined on the same event"),
        "random_text_253":
            MessageLookupByLibrary.simpleMessage("Vietnam - Netherlands"),
        "random_text_254": MessageLookupByLibrary.simpleMessage("Win"),
        "random_text_255": MessageLookupByLibrary.simpleMessage("Netherlands"),
        "random_text_256":
            MessageLookupByLibrary.simpleMessage("Wins/losses/draws"),
        "random_text_257": MessageLookupByLibrary.simpleMessage("Chat Rules"),
        "random_text_258": MessageLookupByLibrary.simpleMessage(
            "1. Do not spam chat and avoid using capital letters.\n2. Do not harass or offend other users and Stake staff. \n3. Do not share anything personal about yourself or other players\' information (including social media accounts)\n4. Do not ask other users for money or loans, or send red envelopes or tips. \n5. Chatting using any account other than your main account is strictly prohibited. \n6. Suspected fraud behavior is not permitted. \n7. Do not engage in any form of advertising, negotiation, sale, purchase, provision of services, among others. \n8. Don\'t argue about streamers, Twitch or any other similar platform. \n9. Don\'t use shortened URLs. Make sure you send the full link. \n10. Do not share code, scripts or any bots for the Service. \n11. Chat only in the specified language in the chat room. \n12 . Discussion of political and religious topics is strictly prohibited."),
        "random_text_260": MessageLookupByLibrary.simpleMessage("Recent"),
        "random_text_263":
            MessageLookupByLibrary.simpleMessage("1,000 playing"),
        "random_text_265": MessageLookupByLibrary.simpleMessage("Featured"),
        "random_text_268":
            MessageLookupByLibrary.simpleMessage("Race Leaderboard"),
        "random_text_272": MessageLookupByLibrary.simpleMessage(""),
        "random_text_273": MessageLookupByLibrary.simpleMessage("Big Wins"),
        "random_text_274": MessageLookupByLibrary.simpleMessage("Lucky Wins"),
        "random_text_275": MessageLookupByLibrary.simpleMessage(
            "There are currently no active challenges for Wanted Dead or Wild"),
        "random_text_276":
            MessageLookupByLibrary.simpleMessage("House Advantage:"),
        "random_text_277": MessageLookupByLibrary.simpleMessage("Baccarat"),
        "random_text_279": MessageLookupByLibrary.simpleMessage("Table Games"),
        "random_text_28": MessageLookupByLibrary.simpleMessage(
            "Join the meibo.com affiliate program and earn money by recommending our brands! Every time a user signs up through your referral link and uses meibo.com, you will receive a commission."),
        "random_text_280":
            MessageLookupByLibrary.simpleMessage("\$100k Race - 24 Hours"),
        "random_text_281":
            MessageLookupByLibrary.simpleMessage("End: in 8 hours"),
        "random_text_282": MessageLookupByLibrary.simpleMessage("Rank"),
        "random_text_286": MessageLookupByLibrary.simpleMessage("Event"),
        "random_text_287": MessageLookupByLibrary.simpleMessage("Bet smarter"),
        "random_text_288": MessageLookupByLibrary.simpleMessage("Sign up now"),
        "random_text_29": MessageLookupByLibrary.simpleMessage(
            "As a meibo.com affiliate, the commission earned will be based on the recommended users\' total bets at casinos and sportsbooks. The difference from traditional affiliate programs is that it doesn\'t matter if users win or lose, you will receive commission either way!"),
        "random_text_290": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "random_text_296":
            MessageLookupByLibrary.simpleMessage("Weekly prizes of \$ 75K"),
        "random_text_297":
            MessageLookupByLibrary.simpleMessage("\$100K contest - 24 hours"),
        "random_text_298":
            MessageLookupByLibrary.simpleMessage("Pragmatic Airdrop Bonus"),
        "random_text_3":
            MessageLookupByLibrary.simpleMessage("The day cannot exceed 31"),
        "random_text_30":
            MessageLookupByLibrary.simpleMessage("Recommended link"),
        "random_text_300":
            MessageLookupByLibrary.simpleMessage("Alfa Romeo F1 Team"),
        "random_text_301": MessageLookupByLibrary.simpleMessage("Everton F.C."),
        "random_text_302": MessageLookupByLibrary.simpleMessage("Kun Agüero"),
        "random_text_303":
            MessageLookupByLibrary.simpleMessage("Israel Adesanya"),
        "random_text_304":
            MessageLookupByLibrary.simpleMessage("Jailton Almeida"),
        "random_text_305":
            MessageLookupByLibrary.simpleMessage("Volleyball Nations League"),
        "random_text_306": MessageLookupByLibrary.simpleMessage(": Chinese"),
        "random_text_307": MessageLookupByLibrary.simpleMessage("Chinese"),
        "random_text_308":
            MessageLookupByLibrary.simpleMessage("Club Friendlies"),
        "random_text_309": MessageLookupByLibrary.simpleMessage(
            "FIFA Women\'s Football World Cup"),
        "random_text_31": MessageLookupByLibrary.simpleMessage("Copy"),
        "random_text_310":
            MessageLookupByLibrary.simpleMessage("WTA Osaka singles"),
        "random_text_311": MessageLookupByLibrary.simpleMessage(
            "Davis Cup Tennis Championship"),
        "random_text_312":
            MessageLookupByLibrary.simpleMessage("Major League Baseball"),
        "random_text_313": MessageLookupByLibrary.simpleMessage("KBO League"),
        "random_text_314":
            MessageLookupByLibrary.simpleMessage("American football"),
        "random_text_315": MessageLookupByLibrary.simpleMessage("NFL"),
        "random_text_316": MessageLookupByLibrary.simpleMessage("NCAA"),
        "random_text_317": MessageLookupByLibrary.simpleMessage("WNBA"),
        "random_text_318":
            MessageLookupByLibrary.simpleMessage("BBL Championship"),
        "random_text_319": MessageLookupByLibrary.simpleMessage("Rainbow Six"),
        "random_text_32": MessageLookupByLibrary.simpleMessage(
            "At meibo.com, player satisfaction has been - and always will be - a top priority. It is at the heart of our long-term strategy for the people who interact with the platform as players and affiliates. We strive to reward our players and achieve player satisfaction through exclusive programs and events."),
        "random_text_321": MessageLookupByLibrary.simpleMessage("Overwatch"),
        "random_text_322":
            MessageLookupByLibrary.simpleMessage("Kings of Glory"),
        "random_text_323":
            MessageLookupByLibrary.simpleMessage("Mobile Legends"),
        "random_text_324": MessageLookupByLibrary.simpleMessage("Valorant"),
        "random_text_326":
            MessageLookupByLibrary.simpleMessage("3x3 basketball"),
        "random_text_327": MessageLookupByLibrary.simpleMessage(
            "Australia men\'s national basketball team"),
        "random_text_328": MessageLookupByLibrary.simpleMessage("Cricket"),
        "random_text_329": MessageLookupByLibrary.simpleMessage("Ice hockey"),
        "random_text_33": MessageLookupByLibrary.simpleMessage(
            "These programs provide additional funds and incentives that not only provide players with a better gaming experience but also help increase overall affiliate commission revenue."),
        "random_text_330": MessageLookupByLibrary.simpleMessage("Alpinism"),
        "random_text_331": MessageLookupByLibrary.simpleMessage("Darts"),
        "random_text_332": MessageLookupByLibrary.simpleMessage("Pesäpallo"),
        "random_text_333":
            MessageLookupByLibrary.simpleMessage("Stock car racing"),
        "random_text_334": MessageLookupByLibrary.simpleMessage("Golf"),
        "random_text_335":
            MessageLookupByLibrary.simpleMessage("Odds: decimals"),
        "random_text_336":
            MessageLookupByLibrary.simpleMessage("Language: Chinese"),
        "random_text_337": MessageLookupByLibrary.simpleMessage(
            "Search requires at least 3 characters."),
        "random_text_34":
            MessageLookupByLibrary.simpleMessage("The plan includes"),
        "random_text_343": MessageLookupByLibrary.simpleMessage("APP update"),
        "random_text_344": MessageLookupByLibrary.simpleMessage("Comments"),
        "random_text_345":
            MessageLookupByLibrary.simpleMessage("Preparing to download..."),
        "random_text_346":
            MessageLookupByLibrary.simpleMessage("Download completed"),
        "random_text_347": MessageLookupByLibrary.simpleMessage("Notice"),
        "random_text_348": MessageLookupByLibrary.simpleMessage(
            "Download failed, make sure the network is open"),
        "random_text_349":
            MessageLookupByLibrary.simpleMessage("Try again now"),
        "random_text_35": MessageLookupByLibrary.simpleMessage("Rebate"),
        "random_text_350": MessageLookupByLibrary.simpleMessage("Try later"),
        "random_text_351": MessageLookupByLibrary.simpleMessage(
            "Passing parameters between pages"),
        "random_text_352":
            MessageLookupByLibrary.simpleMessage("Competition details"),
        "random_text_353":
            MessageLookupByLibrary.simpleMessage("The luckiest trophy 1"),
        "random_text_354":
            MessageLookupByLibrary.simpleMessage("The luckiest trophy 2"),
        "random_text_355":
            MessageLookupByLibrary.simpleMessage("The luckiest trophy 3"),
        "random_text_357":
            MessageLookupByLibrary.simpleMessage("Join date: 07/01/2023"),
        "random_text_357copy2":
            MessageLookupByLibrary.simpleMessage("Joined on: "),
        "random_text_358": MessageLookupByLibrary.simpleMessage("Date"),
        "random_text_359":
            MessageLookupByLibrary.simpleMessage("Raffle tickets"),
        "random_text_36": MessageLookupByLibrary.simpleMessage("Weekly bonus"),
        "random_text_360": MessageLookupByLibrary.simpleMessage("Lucky Trophy"),
        "random_text_362":
            MessageLookupByLibrary.simpleMessage("Request statistics"),
        "random_text_363": MessageLookupByLibrary.simpleMessage(
            "Requests for statistical data are limited to 5 times a day, 24 hours a day."),
        "random_text_364": MessageLookupByLibrary.simpleMessage("Text 01"),
        "random_text_365": MessageLookupByLibrary.simpleMessage("One day"),
        "random_text_366": MessageLookupByLibrary.simpleMessage("One week"),
        "random_text_367": MessageLookupByLibrary.simpleMessage("One month"),
        "random_text_368": MessageLookupByLibrary.simpleMessage("Three months"),
        "random_text_369": MessageLookupByLibrary.simpleMessage("Six months"),
        "random_text_37": MessageLookupByLibrary.simpleMessage("Monthly bonus"),
        "random_text_370": MessageLookupByLibrary.simpleMessage("One year"),
        "random_text_371": MessageLookupByLibrary.simpleMessage("Permanent"),
        "random_text_372":
            MessageLookupByLibrary.simpleMessage("Editable after 22:43"),
        "random_text_373": MessageLookupByLibrary.simpleMessage("Bet limit"),
        "random_text_374": MessageLookupByLibrary.simpleMessage(
            "The betting limit has been set to 1,000.00/day"),
        "random_text_375": MessageLookupByLibrary.simpleMessage(
            "Control your games or bets using loss or bet limits. These limits allow you to control the maximum loss or bet amount within a set period of time. Any changes to these limits require a 24-hour cooling off period."),
        "random_text_377": MessageLookupByLibrary.simpleMessage(
            "Need a break from meibo.com? To begin the automated self-exclusion process, click the button below to receive confirmation instructions via email."),
        "random_text_378": MessageLookupByLibrary.simpleMessage(
            "Your email address must be verified before self-exclusion can be activated."),
        "random_text_38":
            MessageLookupByLibrary.simpleMessage("Hourly/day deposit bonus"),
        "random_text_380":
            MessageLookupByLibrary.simpleMessage("Cooling off period 23:33:12"),
        "random_text_381": MessageLookupByLibrary.simpleMessage("Duration"),
        "random_text_383":
            MessageLookupByLibrary.simpleMessage("Self-exclusion set"),
        "random_text_384": MessageLookupByLibrary.simpleMessage(
            "You have set your account to self-exclusion mode"),
        "random_text_385": MessageLookupByLibrary.simpleMessage(
            "Disclaimer: Any decision made hereunder is final and irreversible. Please withdraw any remaining balance in your account before submitting your self-exclusion request."),
        "random_text_386":
            MessageLookupByLibrary.simpleMessage("Learn more about"),
        "random_text_387": MessageLookupByLibrary.simpleMessage("Message"),
        "random_text_388": MessageLookupByLibrary.simpleMessage("Title"),
        "random_text_389": MessageLookupByLibrary.simpleMessage("Message"),
        "random_text_39":
            MessageLookupByLibrary.simpleMessage("VIP Level Bonuses"),
        "random_text_390":
            MessageLookupByLibrary.simpleMessage("Japan - Spain"),
        "random_text_391":
            MessageLookupByLibrary.simpleMessage("Victory equals defeat"),
        "random_text_392": MessageLookupByLibrary.simpleMessage("Draw"),
        "random_text_393": MessageLookupByLibrary.simpleMessage("Second half"),
        "random_text_394":
            MessageLookupByLibrary.simpleMessage("Exchange 1.00000"),
        "random_text_395":
            MessageLookupByLibrary.simpleMessage("Investor: Mamama"),
        "random_text_396":
            MessageLookupByLibrary.simpleMessage("at 17:50 on 08/07/2023"),
        "random_text_397": MessageLookupByLibrary.simpleMessage("In a number:"),
        "random_text_398":
            MessageLookupByLibrary.simpleMessage("Payment amount:"),
        "random_text_4": MessageLookupByLibrary.simpleMessage("Loading"),
        "random_text_40": MessageLookupByLibrary.simpleMessage(
            "Using this unique approach, your commission is based on the house edge after realizing these costs. Depending on the extent to which players benefit, the house edge commission you will receive will be approximately 45% lower than any game advertises."),
        "random_text_403": MessageLookupByLibrary.simpleMessage("Cashback"),
        "random_text_404": MessageLookupByLibrary.simpleMessage("Daily salary"),
        "random_text_405":
            MessageLookupByLibrary.simpleMessage("Weekly salary"),
        "random_text_406":
            MessageLookupByLibrary.simpleMessage("Monthly salary"),
        "random_text_407": MessageLookupByLibrary.simpleMessage(
            "There is currently no activity gift money to claim"),
        "random_text_408": MessageLookupByLibrary.simpleMessage(
            "Successfully received event bonus"),
        "random_text_409": MessageLookupByLibrary.simpleMessage(
            "The highest level has been reached"),
        "random_text_41": MessageLookupByLibrary.simpleMessage(
            "If you would like a detailed breakdown of fee calculations, please feel free to contact your affiliate manager through support."),
        "random_text_410": MessageLookupByLibrary.simpleMessage("Not received"),
        "random_text_412": MessageLookupByLibrary.simpleMessage("Upgraded"),
        "random_text_413": MessageLookupByLibrary.simpleMessage("Available"),
        "random_text_414":
            MessageLookupByLibrary.simpleMessage("Awaiting upgrade"),
        "random_text_415":
            MessageLookupByLibrary.simpleMessage("Upgrade Bonuses"),
        "random_text_416":
            MessageLookupByLibrary.simpleMessage("Booster Bonus"),
        "random_text_417": MessageLookupByLibrary.simpleMessage(
            "You can expect weekly and monthly bonuses based on your playing volume. The more you play, the more bonuses you get."),
        "random_text_418": MessageLookupByLibrary.simpleMessage(
            "Recent Game Performance Bonuses"),
        "random_text_419": MessageLookupByLibrary.simpleMessage(
            "Isn\'t luck very favorable? No problem! Stake provides additional funds based on your losses every time you level up."),
        "random_text_42": MessageLookupByLibrary.simpleMessage(
            "The retention plan allows your referrals to be used in sportsbooks and casinos. However, the cost of the retention plan is absorbed before the affiliate commission for sports betting is calculated, allowing us to set the default profit margin of 3%."),
        "random_text_420": MessageLookupByLibrary.simpleMessage(
            "Dedicated VIP Service Representative"),
        "random_text_421": MessageLookupByLibrary.simpleMessage(
            "Be assigned a dedicated VIP Service Representative who will support and cater to your betting needs."),
        "random_text_422":
            MessageLookupByLibrary.simpleMessage("Upgrade bonus"),
        "random_text_423": MessageLookupByLibrary.simpleMessage(
            "Get bonuses after reaching each next level. The higher the level reached, the greater the upgrade bonus."),
        "random_text_424": MessageLookupByLibrary.simpleMessage(
            "Work with your dedicated VIP Service representative to tailor benefits to your betting needs."),
        "random_text_425":
            MessageLookupByLibrary.simpleMessage("VIP level comparison"),
        "random_text_426": MessageLookupByLibrary.simpleMessage("Bet Amount"),
        "random_text_427":
            MessageLookupByLibrary.simpleMessage("Monthly bonus"),
        "random_text_428": MessageLookupByLibrary.simpleMessage("Weekly bonus"),
        "random_text_429":
            MessageLookupByLibrary.simpleMessage("Daily Bonus \nReload Bonus"),
        "random_text_430": MessageLookupByLibrary.simpleMessage("Bonus growth"),
        "random_text_431": MessageLookupByLibrary.simpleMessage(
            "Exclusive VIP Service Representative"),
        "random_text_432": MessageLookupByLibrary.simpleMessage("Ten thousand"),
        "random_text_433":
            MessageLookupByLibrary.simpleMessage("Meibo VIP Experience"),
        "random_text_434": MessageLookupByLibrary.simpleMessage(
            "Unlock exclusive benefits and get bonuses that you can withdraw instantly with no strings attached."),
        "random_text_436":
            MessageLookupByLibrary.simpleMessage("View VIP Level Table"),
        "random_text_437":
            MessageLookupByLibrary.simpleMessage("Manual for Beginners"),
        "random_text_438": MessageLookupByLibrary.simpleMessage(
            "Becoming a VIP is an easy and rewarding process"),
        "random_text_439": MessageLookupByLibrary.simpleMessage("First Step"),
        "random_text_44": MessageLookupByLibrary.simpleMessage("(o deposit)"),
        "random_text_440": MessageLookupByLibrary.simpleMessage(
            "Every bet you make affects your progress towards the VIP level. Reach the next level to unlock more benefits."),
        "random_text_441": MessageLookupByLibrary.simpleMessage("Step Two"),
        "random_text_442": MessageLookupByLibrary.simpleMessage("Step Three"),
        "random_text_443": MessageLookupByLibrary.simpleMessage(
            "Claim your bonus now. Daily, weekly and monthly redemption in a simple and practical way."),
        "random_text_444": MessageLookupByLibrary.simpleMessage("Experience"),
        "random_text_445": MessageLookupByLibrary.simpleMessage("Prizes"),
        "random_text_446": MessageLookupByLibrary.simpleMessage(
            "You can get better rewards every time you upgrade"),
        "random_text_447":
            MessageLookupByLibrary.simpleMessage("Alipay account"),
        "random_text_448": MessageLookupByLibrary.simpleMessage("Link Alipay"),
        "random_text_449": MessageLookupByLibrary.simpleMessage(
            "The minimum withdrawal amount is: 0.00020000"),
        "random_text_450": MessageLookupByLibrary.simpleMessage(
            "We will deduct this from your balance"),
        "random_text_451": MessageLookupByLibrary.simpleMessage(
            "As a transaction fee for your withdrawal."),
        "random_text_452":
            MessageLookupByLibrary.simpleMessage("Search Currencies"),
        "random_text_453": MessageLookupByLibrary.simpleMessage(
            "Please enter the full verification code"),
        "random_text_455":
            MessageLookupByLibrary.simpleMessage("Set transaction password"),
        "random_text_456": MessageLookupByLibrary.simpleMessage(
            "To keep your account extra secure leave a two factor authentication enabled."),
        "random_text_457": MessageLookupByLibrary.simpleMessage(
            "Copy This Code to Your Authenticator App"),
        "random_text_458":
            MessageLookupByLibrary.simpleMessage("Don\'t Let Anyone See This!"),
        "random_text_46":
            MessageLookupByLibrary.simpleMessage("Number of deposits"),
        "random_text_461":
            MessageLookupByLibrary.simpleMessage("Remove from blacklist"),
        "random_text_462": MessageLookupByLibrary.simpleMessage(
            "Link Cryptocurrency Payment Address"),
        "random_text_463": MessageLookupByLibrary.simpleMessage(
            "Link fiat currency payment address"),
        "random_text_464": MessageLookupByLibrary.simpleMessage(
            "Please enter the name of the account holder"),
        "random_text_465": MessageLookupByLibrary.simpleMessage(
            "Once linked, it will not be possible to change. Only the account holder\'s payment method can be added."),
        "random_text_468": MessageLookupByLibrary.simpleMessage("Bank account"),
        "random_text_47": MessageLookupByLibrary.simpleMessage("Agent level"),
        "random_text_471": MessageLookupByLibrary.simpleMessage(
            "Each currency can be linked to 5 withdrawal methods"),
        "random_text_472": MessageLookupByLibrary.simpleMessage(
            "Each cryptocurrency can be linked to up to 2 withdrawal addresses"),
        "random_text_473": MessageLookupByLibrary.simpleMessage("New"),
        "random_text_474":
            MessageLookupByLibrary.simpleMessage("Email sent to \n"),
        "random_text_475": MessageLookupByLibrary.simpleMessage("Email sent"),
        "random_text_476": MessageLookupByLibrary.simpleMessage(
            "Email address updated successfully"),
        "random_text_477": MessageLookupByLibrary.simpleMessage(
            "The confirmation email has been sent to \n"),
        "random_text_478": MessageLookupByLibrary.simpleMessage(
            "Phone number successfully updated"),
        "random_text_479": MessageLookupByLibrary.simpleMessage(
            "Mobile number has been updated to "),
        "random_text_48":
            MessageLookupByLibrary.simpleMessage("Promotion conditions"),
        "random_text_481": MessageLookupByLibrary.simpleMessage("Login Time"),
        "random_text_482": MessageLookupByLibrary.simpleMessage("Browser"),
        "random_text_483": MessageLookupByLibrary.simpleMessage("Area"),
        "random_text_485": MessageLookupByLibrary.simpleMessage("Alipay"),
        "random_text_486": MessageLookupByLibrary.simpleMessage("Pre-Handicap"),
        "random_text_487": MessageLookupByLibrary.simpleMessage("Championship"),
        "random_text_488": MessageLookupByLibrary.simpleMessage("League"),
        "random_text_489": MessageLookupByLibrary.simpleMessage("All sports"),
        "random_text_49": MessageLookupByLibrary.simpleMessage("Joining Time"),
        "random_text_491": MessageLookupByLibrary.simpleMessage("All matches"),
        "random_text_492": MessageLookupByLibrary.simpleMessage("First half"),
        "random_text_493":
            MessageLookupByLibrary.simpleMessage("Sort alphabetically"),
        "random_text_494": MessageLookupByLibrary.simpleMessage("Test"),
        "random_text_495":
            MessageLookupByLibrary.simpleMessage("Multiple Bets (2)"),
        "random_text_496":
            MessageLookupByLibrary.simpleMessage("\$100,000 Race - 24 Hours"),
        "random_text_5":
            MessageLookupByLibrary.simpleMessage("Successfully registered"),
        "random_text_500":
            MessageLookupByLibrary.simpleMessage("Search your event"),
        "random_text_501": MessageLookupByLibrary.simpleMessage(
            "Minimum character length is 3"),
        "random_text_502": MessageLookupByLibrary.simpleMessage(
            "Minimum character length is 8"),
        "random_text_503":
            MessageLookupByLibrary.simpleMessage("Email domain not supported"),
        "random_text_504": MessageLookupByLibrary.simpleMessage(
            "Please add the “.” symbol to your email address"),
        "random_text_505": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address"),
        "random_text_506": MessageLookupByLibrary.simpleMessage(
            "Your username must be at least 3 characters long"),
        "random_text_507": MessageLookupByLibrary.simpleMessage(
            "Your username must be less than 14 characters long"),
        "random_text_508": MessageLookupByLibrary.simpleMessage(
            "The year must be greater than or equal to 1900"),
        "random_text_509": MessageLookupByLibrary.simpleMessage(
            "Your age cannot exceed 120 years old"),
        "random_text_51": MessageLookupByLibrary.simpleMessage("Valid Bets"),
        "random_text_510":
            MessageLookupByLibrary.simpleMessage("Date cannot exceed"),
        "random_text_511": MessageLookupByLibrary.simpleMessage("Number"),
        "random_text_512": MessageLookupByLibrary.simpleMessage(
            "Your username must be 3-14 characters long"),
        "random_text_513":
            MessageLookupByLibrary.simpleMessage("Add new subagent"),
        "random_text_514":
            MessageLookupByLibrary.simpleMessage("All Currencies"),
        "random_text_515": MessageLookupByLibrary.simpleMessage("Superior: "),
        "random_text_516":
            MessageLookupByLibrary.simpleMessage("Commission Wallet"),
        "random_text_517":
            MessageLookupByLibrary.simpleMessage("Commission Record"),
        "random_text_518": MessageLookupByLibrary.simpleMessage("Time"),
        "random_text_519": MessageLookupByLibrary.simpleMessage("Type"),
        "random_text_51copy2":
            MessageLookupByLibrary.simpleMessage("Valid Bets"),
        "random_text_52":
            MessageLookupByLibrary.simpleMessage("Total Win and Loss"),
        "random_text_520": MessageLookupByLibrary.simpleMessage("Time"),
        "random_text_521": MessageLookupByLibrary.simpleMessage("Order Number"),
        "random_text_522":
            MessageLookupByLibrary.simpleMessage("Type Selection"),
        "random_text_523":
            MessageLookupByLibrary.simpleMessage("Members Win or Lose"),
        "random_text_524": MessageLookupByLibrary.simpleMessage("Cash Profit"),
        "random_text_525":
            MessageLookupByLibrary.simpleMessage("Registration Time"),
        "random_text_526": MessageLookupByLibrary.simpleMessage("0 people"),
        "random_text_527":
            MessageLookupByLibrary.simpleMessage("Total Valid Bets"),
        "random_text_528": MessageLookupByLibrary.simpleMessage("People"),
        "random_text_529":
            MessageLookupByLibrary.simpleMessage("Go to settings"),
        "random_text_53": MessageLookupByLibrary.simpleMessage("Account"),
        "random_text_530": MessageLookupByLibrary.simpleMessage(
            "Access to the photo album is disabled, please go to settings to grant permission to access the photo album"),
        "random_text_531":
            MessageLookupByLibrary.simpleMessage("Save successfully"),
        "random_text_532": MessageLookupByLibrary.simpleMessage("Save failed"),
        "random_text_533": MessageLookupByLibrary.simpleMessage("My Link"),
        "random_text_534": MessageLookupByLibrary.simpleMessage("For Example"),
        "random_text_535": MessageLookupByLibrary.simpleMessage(
            "The rebates on this site are based on valid bets, assuming the rebate ratio is shown in the table in the upper left corner. A was the first to discover business opportunities on this site and immediately developed B1, B2 and B3. B1 then developed C1 and C2. B2 had no subordinates, and B3 only developed the relatively powerful C3.\n\n A few days later, B1’s effective bet is 80,000, B2’s effective bet is 50,000, B3’s effective bet is 30,000, C1’s effective bet is 100,000, C2’s effective bet is 40,000, and C3 My effective bet reaches 710,000, then the total performance of B1 comes from C1 and C2, which is 140,000, and the corresponding rebate ratio is 80/10,000; the performance of B2 without subordinates is 0; the subordinate C3 of B3 is powerful, the total performance is 710,000, and the corresponding rebate is The ratio is 1 million/10,000; A has 160,000 from the direct team and 850,000 from other teams. The total performance is 1.01 million, and the corresponding rebate ratio is 1 million/10,000.\n\n Then the income between them is calculated as follows."),
        "random_text_536": MessageLookupByLibrary.simpleMessage(
            "It refers to members who develop vertically and are collectively called direct teams. \n(1) B1, B2, and B3 contribute to A: (80,000 + 50,000 + 30,000) x 100/10,000 = 1,600. \n\n(2) C1 and C2 contribute to B1: (100,000+40,000)x80/10,000=1120. \n\n(3) C3 contributes to B3: 710,000 x 100/10,000 = 7100."),
        "random_text_537": MessageLookupByLibrary.simpleMessage(
            "It refers to the members who develop into subordinates, subordinates, subordinates, etc., and are collectively called other teams; because this system can develop subordinates infinitely, for the convenience of explanation, this article only takes the 2-level structure as an example. \n\n(1) From C1 and C2: Because B1 has a total performance of 140,000 and only enjoys a rebate ratio of 80/ten thousand, while A’s total performance is 1.01 million and enjoys a rebate ratio of 1 million/ten thousand, then there is a rebate between A and B1 The commission difference is: 100-80=20/10,000. This difference is the part contributed by C1 and C2 to A, so C1 and C2 contribute to A: (100,000+40,000)×20/10,000=280. \n\n(2) From C3: Since B3 has a total performance of 710,000 and enjoys a rebate ratio of 1 million/10,000, and A has a total performance of 1.01 million and enjoys a rebate ratio of 1 million/10,000, then the rebate difference between A and B3 is: 100-100=0/10,000, C3 contributes to A: 710,000x0/10,000=0."),
        "random_text_538": MessageLookupByLibrary.simpleMessage("Summary"),
        "random_text_539": MessageLookupByLibrary.simpleMessage(
            "(1) C3 is so powerful that it indirectly allows A to enjoy a higher commission rate for all its performance. \n\n(2) B2 may be lazy and will not benefit if he does not develop his subordinates. \n\n(3) Although B3 joined relatively late and is a subordinate of A, its subordinate C3 is very powerful, allowing B3 to directly enjoy a higher commission ratio. Therefore, no matter when B3 joins, whose subordinate he is, no matter what level he is in, Income will never be affected, you will no longer suffer from the losses of other people\'s subordinates, and your development will not be restricted. \n\n(4) This is an absolutely fair and just agency model, and no one will be stepped on forever just because they join late."),
        "random_text_54":
            MessageLookupByLibrary.simpleMessage("Promotional Tutorial"),
        "random_text_540": MessageLookupByLibrary.simpleMessage(
            "Email address cannot be empty"),
        "random_text_541":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "random_text_542": MessageLookupByLibrary.simpleMessage(
            "Please enter the correct email address"),
        "random_text_543": MessageLookupByLibrary.simpleMessage(
            "Your username must be 3 - 14 characters long"),
        "random_text_544": MessageLookupByLibrary.simpleMessage(
            "The password length must be greater than or equal to 8 characters"),
        "random_text_545":
            MessageLookupByLibrary.simpleMessage("Registration successful!"),
        "random_text_546":
            MessageLookupByLibrary.simpleMessage("Registration failed!"),
        "random_text_547":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "random_text_548": MessageLookupByLibrary.simpleMessage("Username"),
        "random_text_549": MessageLookupByLibrary.simpleMessage("Password"),
        "random_text_55": MessageLookupByLibrary.simpleMessage("My Promotions"),
        "random_text_550": MessageLookupByLibrary.simpleMessage("End time"),
        "random_text_551": MessageLookupByLibrary.simpleMessage("Player ID"),
        "random_text_552": MessageLookupByLibrary.simpleMessage("Keyword"),
        "random_text_553": MessageLookupByLibrary.simpleMessage("hours"),
        "random_text_554":
            MessageLookupByLibrary.simpleMessage("minutes later"),
        "random_text_555":
            MessageLookupByLibrary.simpleMessage("Put the above"),
        "random_text_556": MessageLookupByLibrary.simpleMessage(
            "Item bet, add it to my betting slip"),
        "random_text_557":
            MessageLookupByLibrary.simpleMessage("Complex betting ratio:"),
        "random_text_558":
            MessageLookupByLibrary.simpleMessage("The odds are less than"),
        "random_text_559": MessageLookupByLibrary.simpleMessage(
            "The betting items cannot be combined into multiple bets"),
        "random_text_56": MessageLookupByLibrary.simpleMessage("My Commission"),
        "random_text_560": MessageLookupByLibrary.simpleMessage("Currency"),
        "random_text_561":
            MessageLookupByLibrary.simpleMessage("Amount of Bet"),
        "random_text_562":
            MessageLookupByLibrary.simpleMessage("Wins and Losses"),
        "random_text_563": MessageLookupByLibrary.simpleMessage("Emoji"),
        "random_text_564": MessageLookupByLibrary.simpleMessage(
            "1. Don\'t spam & don\'t use excessive capital letters when chatting."),
        "random_text_565": MessageLookupByLibrary.simpleMessage(
            "2. Don\'t harass or be offensive to other users or Meibo staff."),
        "random_text_566": MessageLookupByLibrary.simpleMessage(
            "3. Don\'t share any personal information (including socials) of you or other players."),
        "random_text_567": MessageLookupByLibrary.simpleMessage(
            "4. Don\'t beg or ask for loans, rains or tips."),
        "random_text_568": MessageLookupByLibrary.simpleMessage(
            "5. Don\'t use alternative (alts) accounts on chat, that is strictly forbidden."),
        "random_text_569": MessageLookupByLibrary.simpleMessage(
            "6. No suspicious behavior that can be seen as potential scams."),
        "random_text_57":
            MessageLookupByLibrary.simpleMessage("My Performance"),
        "random_text_570": MessageLookupByLibrary.simpleMessage(
            "7. Don\'t engage in any forms of advertising/trading/selling/buying or offering services."),
        "random_text_571": MessageLookupByLibrary.simpleMessage(
            "8. No discussion of streamers or Twitch or any other similar platforms."),
        "random_text_572": MessageLookupByLibrary.simpleMessage(
            "9. Don\'t use URL shortening services. Always submit the full link."),
        "random_text_573": MessageLookupByLibrary.simpleMessage(
            "10. Don\'t share codes, scripts or any other bot service."),
        "random_text_574": MessageLookupByLibrary.simpleMessage(
            "11. Only use the language specified in the chat channel, potential abuse will be sanctioned."),
        "random_text_575": MessageLookupByLibrary.simpleMessage(
            "12. No politics & no religion talk in chat, this one is strictly forbidden."),
        "random_text_576": MessageLookupByLibrary.simpleMessage(
            "Our full rules can be found on our "),
        "random_text_577": MessageLookupByLibrary.simpleMessage(""),
        "random_text_578": MessageLookupByLibrary.simpleMessage(" playing"),
        "random_text_579": MessageLookupByLibrary.simpleMessage("End in"),
        "random_text_58": MessageLookupByLibrary.simpleMessage("All Data"),
        "random_text_580": MessageLookupByLibrary.simpleMessage("1.Terms"),
        "random_text_581": MessageLookupByLibrary.simpleMessage("2.Terms"),
        "random_text_582":
            MessageLookupByLibrary.simpleMessage("Download updates"),
        "random_text_583":
            MessageLookupByLibrary.simpleMessage("New version is downloading!"),
        "random_text_584": MessageLookupByLibrary.simpleMessage(
            "The new version is being updated, please wait..."),
        "random_text_585":
            MessageLookupByLibrary.simpleMessage("Current version number:"),
        "random_text_586":
            MessageLookupByLibrary.simpleMessage("Latest version number:"),
        "random_text_587": MessageLookupByLibrary.simpleMessage(
            "It is the latest version number"),
        "random_text_588":
            MessageLookupByLibrary.simpleMessage("Download the latest APP"),
        "random_text_589":
            MessageLookupByLibrary.simpleMessage("Payment address:"),
        "random_text_59":
            MessageLookupByLibrary.simpleMessage("Direct Finance"),
        "random_text_590":
            MessageLookupByLibrary.simpleMessage("Account type:"),
        "random_text_591":
            MessageLookupByLibrary.simpleMessage("Beneficiary bank:"),
        "random_text_592":
            MessageLookupByLibrary.simpleMessage("No Deposits Yet"),
        "random_text_593":
            MessageLookupByLibrary.simpleMessage("No Withdrawals"),
        "random_text_594":
            MessageLookupByLibrary.simpleMessage("No Banking Deposits"),
        "random_text_595":
            MessageLookupByLibrary.simpleMessage("No Banking Withdrawals"),
        "random_text_596": MessageLookupByLibrary.simpleMessage("Amount: "),
        "random_text_597":
            MessageLookupByLibrary.simpleMessage("The maximum value is:"),
        "random_text_598":
            MessageLookupByLibrary.simpleMessage("Learn more about Vault"),
        "random_text_599": MessageLookupByLibrary.simpleMessage(
            "Please enter a 6-digit password"),
        "random_text_6":
            MessageLookupByLibrary.simpleMessage("I have read and agree"),
        "random_text_60":
            MessageLookupByLibrary.simpleMessage("Direct Betting"),
        "random_text_600":
            MessageLookupByLibrary.simpleMessage("Accumulated Bonus"),
        "random_text_601":
            MessageLookupByLibrary.simpleMessage("Promotion Criteria"),
        "random_text_602":
            MessageLookupByLibrary.simpleMessage("Relegation Criteria"),
        "random_text_603":
            MessageLookupByLibrary.simpleMessage("Daily Salary Bonus"),
        "random_text_604":
            MessageLookupByLibrary.simpleMessage("Weekly Salary Bonus"),
        "random_text_605":
            MessageLookupByLibrary.simpleMessage("Monthly Salary Bonus"),
        "random_text_606": MessageLookupByLibrary.simpleMessage(
            "Level maintenance instructions"),
        "random_text_607":
            MessageLookupByLibrary.simpleMessage("Audit Instructions"),
        "random_text_608":
            MessageLookupByLibrary.simpleMessage("Activity Statement"),
        "random_text_609":
            MessageLookupByLibrary.simpleMessage("Explanation Instructions"),
        "random_text_61": MessageLookupByLibrary.simpleMessage("Direct User"),
        "random_text_610": MessageLookupByLibrary.simpleMessage(
            "If you meet the requirements for VIP promotion (that is, you meet the requirements for all codes), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all the promotion bonuses; 2. Daily salary: Meet the daily salary requirements corresponding to the VIP level , you can receive the bonus for the corresponding day, which will be reset at 00:00 every day;"),
        "random_text_611": MessageLookupByLibrary.simpleMessage(
            "If you meet the relegation requirements within 90 days after being promoted or downgraded (that is, all code requirements are met), you can retain your current VIP level. If the coding demand cannot be met within 90 days, the VIP level will be lowered."),
        "random_text_612": MessageLookupByLibrary.simpleMessage(
            "Daily Salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00am every day."),
        "random_text_613": MessageLookupByLibrary.simpleMessage(
            "Weekly Salary: If you reach the VIP level corresponding to the weekly salary requirements, you can receive the corresponding weekly bonus, which is reset every Monday at 12:00am."),
        "random_text_614": MessageLookupByLibrary.simpleMessage(
            "Monthly Salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00am on the 1st of each month."),
        "random_text_615": MessageLookupByLibrary.simpleMessage(
            "After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the level maintenance requirements, the member will automatically be downgraded by one level;"),
        "random_text_616": MessageLookupByLibrary.simpleMessage(
            "Audit Instructions: The bonus given by VIP requires 1 times of turnover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform."),
        "random_text_617": MessageLookupByLibrary.simpleMessage(
            "Activity Statement: This function is limited to normal game betting by the account owner. Renting accounts, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, exploitation of protocols, loopholes, interfaces, If group control or other technical means are involved, and once verified to be true, the platform has the right to terminate members\' login, suspend members\' use of the website, and confiscate bonuses and improper profits without prior notice."),
        "random_text_618": MessageLookupByLibrary.simpleMessage(
            "Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguities in textual understanding, the platform reserves the right to final interpretation of this event."),
        "random_text_619": MessageLookupByLibrary.simpleMessage("Points"),
        "random_text_62":
            MessageLookupByLibrary.simpleMessage("Receive Directly"),
        "random_text_620":
            MessageLookupByLibrary.simpleMessage("Relegation Points"),
        "random_text_621": MessageLookupByLibrary.simpleMessage("Last 7 Days"),
        "random_text_622": MessageLookupByLibrary.simpleMessage("Last 30 Days"),
        "random_text_623": MessageLookupByLibrary.simpleMessage("Last 90 Days"),
        "random_text_624": MessageLookupByLibrary.simpleMessage("VIP Points"),
        "random_text_625": MessageLookupByLibrary.simpleMessage(
            "VIP points will be calculated based on your valid bets."),
        "random_text_626": MessageLookupByLibrary.simpleMessage(
            "1. The exchange rate will be synchronized in real time according to market fluctuations"),
        "random_text_627": MessageLookupByLibrary.simpleMessage(
            "2. The exchange rate will prevail when your bet is settled"),
        "random_text_628": MessageLookupByLibrary.simpleMessage(
            "3. Valid bets that have been counted will not be affected by subsequent exchange rates"),
        "random_text_629": MessageLookupByLibrary.simpleMessage(
            "4. Betting on different venues will result in different accumulation of VIP points. For details, please see the picture below"),
        "random_text_63":
            MessageLookupByLibrary.simpleMessage("Commission Rate"),
        "random_text_630":
            MessageLookupByLibrary.simpleMessage("Betting Currency"),
        "random_text_631":
            MessageLookupByLibrary.simpleMessage("Stadium Points"),
        "random_text_632":
            MessageLookupByLibrary.simpleMessage("Live Venue Points"),
        "random_text_633":
            MessageLookupByLibrary.simpleMessage("Electronic venue points"),
        "random_text_634":
            MessageLookupByLibrary.simpleMessage("Fishing venue points"),
        "random_text_635":
            MessageLookupByLibrary.simpleMessage("Activity Bonus"),
        "random_text_636": MessageLookupByLibrary.simpleMessage("With"),
        "random_text_637": MessageLookupByLibrary.simpleMessage("Settlement"),
        "random_text_638": MessageLookupByLibrary.simpleMessage(
            "Please check the address carefully. If the address is incorrect, funds will not be received."),
        "random_text_639":
            MessageLookupByLibrary.simpleMessage("Please select the country"),
        "random_text_64": MessageLookupByLibrary.simpleMessage("New subagent"),
        "random_text_640":
            MessageLookupByLibrary.simpleMessage("Please fill in the city"),
        "random_text_641":
            MessageLookupByLibrary.simpleMessage("PIX account type"),
        "random_text_642": MessageLookupByLibrary.simpleMessage("Country"),
        "random_text_643": MessageLookupByLibrary.simpleMessage("Protocol"),
        "random_text_644":
            MessageLookupByLibrary.simpleMessage("Virtual currency address"),
        "random_text_645": MessageLookupByLibrary.simpleMessage(
            "Please Bind Withdrawal Information\n1. Each currency can only bind 3 payment information\n2. If you need to bind more, please delete the infrequently used ones first"),
        "random_text_645c1": MessageLookupByLibrary.simpleMessage(
            "Please Bind Withdrawal Information"),
        "random_text_645c2": MessageLookupByLibrary.simpleMessage(
            "1. Each currency can only bind 3 payment information"),
        "random_text_645c3": MessageLookupByLibrary.simpleMessage(
            "2. If you need to bind more, please delete the infrequently used ones first"),
        "random_text_646":
            MessageLookupByLibrary.simpleMessage("Bind Payment Account Number"),
        "random_text_647":
            MessageLookupByLibrary.simpleMessage("Bind Payment Account Number"),
        "random_text_648":
            MessageLookupByLibrary.simpleMessage("Bind Payment Account Number"),
        "random_text_649": MessageLookupByLibrary.simpleMessage(
            "Each currency can only be bound to 3 payment information. If you need to bind more, please delete the infrequently used ones first."),
        "random_text_65": MessageLookupByLibrary.simpleMessage("Basketball"),
        "random_text_650": MessageLookupByLibrary.simpleMessage("Exchange "),
        "random_text_651": MessageLookupByLibrary.simpleMessage("Pay"),
        "random_text_652":
            MessageLookupByLibrary.simpleMessage("Exchange Rate: "),
        "random_text_653":
            MessageLookupByLibrary.simpleMessage("Payment Method"),
        "random_text_654": MessageLookupByLibrary.simpleMessage(
            "Please scroll down to select the recharge amount"),
        "random_text_655": MessageLookupByLibrary.simpleMessage(
            "You do not have payment information for this currency yet \n. Please go to the card package to bind payment information"),
        "random_text_655c1": MessageLookupByLibrary.simpleMessage(
            "You have no payment information for this currency yet"),
        "random_text_655c2": MessageLookupByLibrary.simpleMessage(
            "Please go to my cards to bind payment information."),
        "random_text_656":
            MessageLookupByLibrary.simpleMessage("Go to My Cards"),
        "random_text_657": MessageLookupByLibrary.simpleMessage(
            "Please bind your bank card first"),
        "random_text_658": MessageLookupByLibrary.simpleMessage(
            "This is your first time to withdraw money, you need to set a fund password first"),
        "random_text_659": MessageLookupByLibrary.simpleMessage(
            "This is your first withdrawal; you need to set up two-factor authentication first."),
        "random_text_660": MessageLookupByLibrary.simpleMessage("Mark"),
        "random_text_661": MessageLookupByLibrary.simpleMessage("Memo"),
        "random_text_662": MessageLookupByLibrary.simpleMessage(
            "Please bind the address first"),
        "random_text_663": MessageLookupByLibrary.simpleMessage("Network"),
        "random_text_664":
            MessageLookupByLibrary.simpleMessage("Deposit currency"),
        "random_text_665": MessageLookupByLibrary.simpleMessage("Balance:"),
        "random_text_666": MessageLookupByLibrary.simpleMessage("Collapse"),
        "random_text_667": MessageLookupByLibrary.simpleMessage(
            "There are currently no deposit channels for this currency, \n Please try again later or contact customer service"),
        "random_text_668": MessageLookupByLibrary.simpleMessage(
            "Your password must be at least 8 characters long"),
        "random_text_669": MessageLookupByLibrary.simpleMessage(
            "Your verification code must be 6 digits"),
        "random_text_670": MessageLookupByLibrary.simpleMessage("Password"),
        "random_text_671": MessageLookupByLibrary.simpleMessage("Submit"),
        "random_text_672": MessageLookupByLibrary.simpleMessage(
            "Verification email has been resent to"),
        "random_text_673": MessageLookupByLibrary.simpleMessage("Mail sent"),
        "random_text_674": MessageLookupByLibrary.simpleMessage(
            "Confirmation email address has been sent to"),
        "random_text_675": MessageLookupByLibrary.simpleMessage(
            "The password Must contain at least 1 number"),
        "random_text_676": MessageLookupByLibrary.simpleMessage(
            "Your password must be at least 8 characters long"),
        "random_text_677":
            MessageLookupByLibrary.simpleMessage("Passwords are inconsistent"),
        "random_text_678": MessageLookupByLibrary.simpleMessage(
            "You haven\'t bound your email address yet! Please bind your email address first and then set your fund password"),
        "random_text_679":
            MessageLookupByLibrary.simpleMessage("Additional time"),
        "random_text_68": MessageLookupByLibrary.simpleMessage("Baseball"),
        "random_text_680":
            MessageLookupByLibrary.simpleMessage("Virtual Sports"),
        "random_text_681":
            MessageLookupByLibrary.simpleMessage("No Active Bets"),
        "random_text_682":
            MessageLookupByLibrary.simpleMessage("Handicap type"),
        "random_text_683":
            MessageLookupByLibrary.simpleMessage("No Odds Available Yet"),
        "random_text_684": MessageLookupByLibrary.simpleMessage(
            "There are no favorite events yet"),
        "random_text_685": MessageLookupByLibrary.simpleMessage("Done"),
        "random_text_686": MessageLookupByLibrary.simpleMessage("Processing"),
        "random_text_687": MessageLookupByLibrary.simpleMessage("Activity 1"),
        "random_text_688": MessageLookupByLibrary.simpleMessage("Activity 2"),
        "random_text_689": MessageLookupByLibrary.simpleMessage("Activity 3"),
        "random_text_69": MessageLookupByLibrary.simpleMessage("Badminton"),
        "random_text_690": MessageLookupByLibrary.simpleMessage("Activity 4"),
        "random_text_691":
            MessageLookupByLibrary.simpleMessage("Do Not Show Me Again Today"),
        "random_text_692": MessageLookupByLibrary.simpleMessage("Announcement"),
        "random_text_693": MessageLookupByLibrary.simpleMessage(
            "VIP-Exclusive Cashback Offer"),
        "random_text_694": MessageLookupByLibrary.simpleMessage(
            "After each of your bets, you will receive a cashback offer based on your VIP level."),
        "random_text_695":
            MessageLookupByLibrary.simpleMessage("Failed to collect"),
        "random_text_696":
            MessageLookupByLibrary.simpleMessage("Claim Successful"),
        "random_text_697":
            MessageLookupByLibrary.simpleMessage("Promotion Bonus Claim"),
        "random_text_698": MessageLookupByLibrary.simpleMessage(
            "Successfully Claimed Promotion Bonus"),
        "random_text_699": MessageLookupByLibrary.simpleMessage(
            "You have reached the maximum VIP level"),
        "random_text_700": MessageLookupByLibrary.simpleMessage(
            "Sign up now to start betting at the casino or sports markets"),
        "random_text_701": MessageLookupByLibrary.simpleMessage(
            "Claim your winnings immediately. The process of claiming daily, weekly and monthly bonuses is simple and easy."),
        "random_text_702": MessageLookupByLibrary.simpleMessage(
            "Meibo provides a unique and unparalleled experience through continuous bonus giveaways."),
        "random_text_703": MessageLookupByLibrary.simpleMessage(
            "Instructions for Receiving: The bonuses for this event are all issued in USDT; you can choose the currency you want to receive, and the exchange rate between currencies adopts the real-time market exchange rate."),
        "random_text_704": MessageLookupByLibrary.simpleMessage(
            "Please check the card number carefully. If the card number is incorrect, funds will not be available."),
        "random_text_705":
            MessageLookupByLibrary.simpleMessage("Set account as default"),
        "random_text_706": MessageLookupByLibrary.simpleMessage(
            "Please check your account carefully. If the card number is incorrect, funds will not be available."),
        "random_text_707": MessageLookupByLibrary.simpleMessage("Exchange "),
        "random_text_708": MessageLookupByLibrary.simpleMessage("To"),
        "random_text_709": MessageLookupByLibrary.simpleMessage("Pay"),
        "random_text_709c1": m11,
        "random_text_71": MessageLookupByLibrary.simpleMessage("Account: "),
        "random_text_710":
            MessageLookupByLibrary.simpleMessage("Confirm Withdrawal"),
        "random_text_711":
            MessageLookupByLibrary.simpleMessage("Available Withdrawal Amount"),
        "random_text_712": MessageLookupByLibrary.simpleMessage(
            "\n Total turnover required for full withdrawal"),
        "random_text_713": MessageLookupByLibrary.simpleMessage(
            "No deposit channels available for this currency,"),
        "random_text_714": MessageLookupByLibrary.simpleMessage(
            "Please try again later or contact customer support"),
        "random_text_715": MessageLookupByLibrary.simpleMessage(
            "Successfully changed fund password"),
        "random_text_716": MessageLookupByLibrary.simpleMessage(
            "Fund password set successfully"),
        "random_text_717": MessageLookupByLibrary.simpleMessage(
            "The sports venue is under maintenance..."),
        "random_text_718":
            MessageLookupByLibrary.simpleMessage("Under maintenance"),
        "random_text_719": MessageLookupByLibrary.simpleMessage("to"),
        "random_text_72":
            MessageLookupByLibrary.simpleMessage("Upper level ID"),
        "random_text_720":
            MessageLookupByLibrary.simpleMessage("Return to home page"),
        "random_text_721": MessageLookupByLibrary.simpleMessage("No Data"),
        "random_text_722": MessageLookupByLibrary.simpleMessage("Shoot"),
        "random_text_723": MessageLookupByLibrary.simpleMessage("Album"),
        "random_text_724": MessageLookupByLibrary.simpleMessage("Close"),
        "random_text_725": MessageLookupByLibrary.simpleMessage("Verified"),
        "random_text_726": MessageLookupByLibrary.simpleMessage("Reload"),
        "random_text_727": MessageLookupByLibrary.simpleMessage("No More Data"),
        "random_text_728": MessageLookupByLibrary.simpleMessage("Description"),
        "random_text_729":
            MessageLookupByLibrary.simpleMessage("Live streaming"),
        "random_text_73":
            MessageLookupByLibrary.simpleMessage("Direct member 111111"),
        "random_text_730":
            MessageLookupByLibrary.simpleMessage("Real-time statistics"),
        "random_text_731": MessageLookupByLibrary.simpleMessage("Disappear"),
        "random_text_732": MessageLookupByLibrary.simpleMessage("Spread"),
        "random_text_733": MessageLookupByLibrary.simpleMessage("Minutes"),
        "random_text_734": MessageLookupByLibrary.simpleMessage("Seconds"),
        "random_text_735": MessageLookupByLibrary.simpleMessage("Start Time:"),
        "random_text_736": MessageLookupByLibrary.simpleMessage("Scoreboard"),
        "random_text_737": MessageLookupByLibrary.simpleMessage(
            "Loading failed; please retry."),
        "random_text_738":
            MessageLookupByLibrary.simpleMessage("Loading anomaly"),
        "random_text_739":
            MessageLookupByLibrary.simpleMessage("Service loading anomaly"),
        "random_text_74": MessageLookupByLibrary.simpleMessage("Collectible"),
        "random_text_740": MessageLookupByLibrary.simpleMessage("Loading"),
        "random_text_741": MessageLookupByLibrary.simpleMessage(
            "Current download status: Not started yet"),
        "random_text_742": MessageLookupByLibrary.simpleMessage("Update now"),
        "random_text_743": MessageLookupByLibrary.simpleMessage("Skip update"),
        "random_text_744":
            MessageLookupByLibrary.simpleMessage("Enter first name"),
        "random_text_745":
            MessageLookupByLibrary.simpleMessage("Enter last name"),
        "random_text_746": MessageLookupByLibrary.simpleMessage("Enter city"),
        "random_text_747":
            MessageLookupByLibrary.simpleMessage("Enter detailed address"),
        "random_text_748":
            MessageLookupByLibrary.simpleMessage("Enter correct PIX account"),
        "random_text_749":
            MessageLookupByLibrary.simpleMessage("Commission conversion"),
        "random_text_750": MessageLookupByLibrary.simpleMessage(
            "Your current commission wallet amount is approximately equivalent to:"),
        "random_text_751": MessageLookupByLibrary.simpleMessage(
            "You can choose to convert to your desired currency"),
        "random_text_752":
            MessageLookupByLibrary.simpleMessage("Converted currency"),
        "random_text_753":
            MessageLookupByLibrary.simpleMessage("Estimated Total Accumulated"),
        "random_text_754":
            MessageLookupByLibrary.simpleMessage("Confirm conversion"),
        "random_text_755":
            MessageLookupByLibrary.simpleMessage("Commission Transfer"),
        "random_text_756": MessageLookupByLibrary.simpleMessage(
            "Commission withdrawal successful"),
        "random_text_757": MessageLookupByLibrary.simpleMessage(
            "Withdraw available commission"),
        "random_text_758":
            MessageLookupByLibrary.simpleMessage("Transfer to Wallet"),
        "random_text_759": MessageLookupByLibrary.simpleMessage(
            "After transferring to the wallet,  you need 1 time rollover the valid bet before you can withdraw it."),
        "random_text_76": MessageLookupByLibrary.simpleMessage("Record"),
        "random_text_760":
            MessageLookupByLibrary.simpleMessage("Total approximately:"),
        "random_text_761": MessageLookupByLibrary.simpleMessage(
            "Currency conversion commission"),
        "random_text_762": MessageLookupByLibrary.simpleMessage("Transfer"),
        "random_text_763": MessageLookupByLibrary.simpleMessage("This week"),
        "random_text_764": MessageLookupByLibrary.simpleMessage("This month"),
        "random_text_765": MessageLookupByLibrary.simpleMessage("This quarter"),
        "random_text_766": MessageLookupByLibrary.simpleMessage("Back"),
        "random_text_767":
            MessageLookupByLibrary.simpleMessage("Vault Explained"),
        "random_text_768":
            MessageLookupByLibrary.simpleMessage("Minimum Deposit Amount"),
        "random_text_769":
            MessageLookupByLibrary.simpleMessage("Annual Interest Rate"),
        "random_text_77": MessageLookupByLibrary.simpleMessage(""),
        "random_text_770": MessageLookupByLibrary.simpleMessage(
            "You must verify your email address to make a deposit"),
        "random_text_771": MessageLookupByLibrary.simpleMessage("years ago"),
        "random_text_772": MessageLookupByLibrary.simpleMessage("months ago"),
        "random_text_773": MessageLookupByLibrary.simpleMessage(" Days Ago"),
        "random_text_773copy2":
            MessageLookupByLibrary.simpleMessage("A Day Ago"),
        "random_text_774": MessageLookupByLibrary.simpleMessage("hours ago"),
        "random_text_775": MessageLookupByLibrary.simpleMessage("minutes ago"),
        "random_text_776": MessageLookupByLibrary.simpleMessage("Just now"),
        "random_text_777":
            MessageLookupByLibrary.simpleMessage("Exchange Currency"),
        "random_text_778":
            MessageLookupByLibrary.simpleMessage("withdraw failed"),
        "random_text_779": MessageLookupByLibrary.simpleMessage(
            "Currency Exchange Successful"),
        "random_text_78": MessageLookupByLibrary.simpleMessage(""),
        "random_text_780": MessageLookupByLibrary.simpleMessage("Send"),
        "random_text_781": MessageLookupByLibrary.simpleMessage("IP"),
        "random_text_782":
            MessageLookupByLibrary.simpleMessage("Withdrawal successful"),
        "random_text_783":
            MessageLookupByLibrary.simpleMessage("Withdrawal failed"),
        "random_text_784":
            MessageLookupByLibrary.simpleMessage("Deposit Success"),
        "random_text_785":
            MessageLookupByLibrary.simpleMessage("deposit failed"),
        "random_text_786":
            MessageLookupByLibrary.simpleMessage("Deposit in Process"),
        "random_text_787": MessageLookupByLibrary.simpleMessage("Your "),
        "random_text_788":
            MessageLookupByLibrary.simpleMessage("withdraw success"),
        "random_text_789":
            MessageLookupByLibrary.simpleMessage("withdraw in process"),
        "random_text_79": MessageLookupByLibrary.simpleMessage(""),
        "random_text_790":
            MessageLookupByLibrary.simpleMessage("Withdrawal processed"),
        "random_text_791":
            MessageLookupByLibrary.simpleMessage("Deposit in Process"),
        "random_text_792":
            MessageLookupByLibrary.simpleMessage("Withdrawal has arrived"),
        "random_text_793":
            MessageLookupByLibrary.simpleMessage("Cash withdrawal in progress"),
        "random_text_794": MessageLookupByLibrary.simpleMessage(
            "There are no settled bets yet"),
        "random_text_795": MessageLookupByLibrary.simpleMessage(
            "No withdrawal channels available for this currency,"),
        "random_text_796": MessageLookupByLibrary.simpleMessage("Yours"),
        "random_text_797": MessageLookupByLibrary.simpleMessage("on "),
        "random_text_798": MessageLookupByLibrary.simpleMessage("of"),
        "random_text_799": MessageLookupByLibrary.simpleMessage("Copied!"),
        "random_text_8": MessageLookupByLibrary.simpleMessage("Step 1/2: "),
        "random_text_80": MessageLookupByLibrary.simpleMessage(""),
        "random_text_800":
            MessageLookupByLibrary.simpleMessage("Copied, share online!"),
        "random_text_801": MessageLookupByLibrary.simpleMessage("Target"),
        "random_text_802": MessageLookupByLibrary.simpleMessage("Result"),
        "random_text_803": MessageLookupByLibrary.simpleMessage("Risk"),
        "random_text_804": MessageLookupByLibrary.simpleMessage("Medium"),
        "random_text_805": MessageLookupByLibrary.simpleMessage("Rows"),
        "random_text_806": MessageLookupByLibrary.simpleMessage("Banker"),
        "random_text_807": MessageLookupByLibrary.simpleMessage("Player"),
        "random_text_808":
            MessageLookupByLibrary.simpleMessage("Roll less than"),
        "random_text_809":
            MessageLookupByLibrary.simpleMessage("Winning probability"),
        "random_text_81": MessageLookupByLibrary.simpleMessage(""),
        "random_text_810":
            MessageLookupByLibrary.simpleMessage("Provably Fair"),
        "random_text_811": MessageLookupByLibrary.simpleMessage("Server Seed"),
        "random_text_812":
            MessageLookupByLibrary.simpleMessage("Seed not revealed yet"),
        "random_text_813":
            MessageLookupByLibrary.simpleMessage("Server Seed (Hashed)"),
        "random_text_814": MessageLookupByLibrary.simpleMessage("Client Seed"),
        "random_text_815": MessageLookupByLibrary.simpleMessage("Real sign"),
        "random_text_816": MessageLookupByLibrary.simpleMessage(
            "Rotate your seed pairings to verify this bet"),
        "random_text_817":
            MessageLookupByLibrary.simpleMessage("What is provably fair?"),
        "random_text_818": MessageLookupByLibrary.simpleMessage("Hash"),
        "random_text_819": MessageLookupByLibrary.simpleMessage("Seeds"),
        "random_text_82": MessageLookupByLibrary.simpleMessage(""),
        "random_text_820": MessageLookupByLibrary.simpleMessage("Verify bet"),
        "random_text_821": MessageLookupByLibrary.simpleMessage(
            "Feedback submited successfully!"),
        "random_text_822": MessageLookupByLibrary.simpleMessage(
            "This currency cannot be used"),
        "random_text_823": MessageLookupByLibrary.simpleMessage("System error"),
        "random_text_824":
            MessageLookupByLibrary.simpleMessage("Exchange Successful"),
        "random_text_825": MessageLookupByLibrary.simpleMessage(
            "Please read the terms and conditions in full and scroll to the end to accept them."),
        "random_text_826":
            MessageLookupByLibrary.simpleMessage("Sports Betting"),
        "random_text_827":
            MessageLookupByLibrary.simpleMessage("Latest Promotions"),
        "random_text_828": MessageLookupByLibrary.simpleMessage("Ends In "),
        "random_text_829":
            MessageLookupByLibrary.simpleMessage("Get 100 coins for free"),
        "random_text_830": MessageLookupByLibrary.simpleMessage(
            "Full Name (same as the account)"),
        "random_text_831": MessageLookupByLibrary.simpleMessage("Report"),
        "random_text_832":
            MessageLookupByLibrary.simpleMessage("My Invitations"),
        "random_text_833": MessageLookupByLibrary.simpleMessage("Rules"),
        "random_text_834": MessageLookupByLibrary.simpleMessage(
            "Invite friends to help with withdrawal"),
        "random_text_835": MessageLookupByLibrary.simpleMessage(
            "Transfer to wallet still requires"),
        "random_text_836":
            MessageLookupByLibrary.simpleMessage("Share with friends"),
        "random_text_837": MessageLookupByLibrary.simpleMessage("Give up"),
        "random_text_838": MessageLookupByLibrary.simpleMessage("BRL withdraw"),
        "random_text_839":
            MessageLookupByLibrary.simpleMessage("Get coins for free"),
        "random_text_84": MessageLookupByLibrary.simpleMessage("Fishing"),
        "random_text_840":
            MessageLookupByLibrary.simpleMessage("Quick withdrawal"),
        "random_text_841": MessageLookupByLibrary.simpleMessage(
            "Spin for free and win real money"),
        "random_text_842": MessageLookupByLibrary.simpleMessage("Raffle"),
        "random_text_843":
            MessageLookupByLibrary.simpleMessage("You still need"),
        "random_text_844":
            MessageLookupByLibrary.simpleMessage("to withdraw to wallet"),
        "random_text_845": m12,
        "random_text_846": MessageLookupByLibrary.simpleMessage("Bet Now"),
        "random_text_847":
            MessageLookupByLibrary.simpleMessage("Just Received"),
        "random_text_848": MessageLookupByLibrary.simpleMessage(
            "Invite friends to help withdraw"),
        "random_text_849": MessageLookupByLibrary.simpleMessage(
            "2. Send help invitations to random players"),
        "random_text_85": MessageLookupByLibrary.simpleMessage("Chess"),
        "random_text_850":
            MessageLookupByLibrary.simpleMessage("Send via WhatsApp"),
        "random_text_851": MessageLookupByLibrary.simpleMessage("Send via SMS"),
        "random_text_852": MessageLookupByLibrary.simpleMessage(
            "Congratulations on your luck, you won"),
        "random_text_853": MessageLookupByLibrary.simpleMessage(
            "To withdraw to Pix still requires"),
        "random_text_854":
            MessageLookupByLibrary.simpleMessage("Request more cash"),
        "random_text_855": MessageLookupByLibrary.simpleMessage(
            "You\'ll be able to withdraw soon"),
        "random_text_856": MessageLookupByLibrary.simpleMessage(
            "Total amount to be paid soon"),
        "random_text_857":
            MessageLookupByLibrary.simpleMessage("Payment request submitted"),
        "random_text_858":
            MessageLookupByLibrary.simpleMessage("You still need"),
        "random_text_859":
            MessageLookupByLibrary.simpleMessage("to withdraw to wallet"),
        "random_text_860": MessageLookupByLibrary.simpleMessage(
            "Will be deposited into your wallet account"),
        "random_text_861": MessageLookupByLibrary.simpleMessage(
            "Invite friends to help with withdrawal"),
        "random_text_862":
            MessageLookupByLibrary.simpleMessage("Please enable permissions"),
        "random_text_863":
            MessageLookupByLibrary.simpleMessage("Get it for free"),
        "random_text_864": MessageLookupByLibrary.simpleMessage("Coin"),
        "random_text_865":
            MessageLookupByLibrary.simpleMessage("Collect within 1 hour"),
        "random_text_866": MessageLookupByLibrary.simpleMessage(
            "Not available in your region"),
        "random_text_867":
            MessageLookupByLibrary.simpleMessage("Just cashed out"),
        "random_text_868": MessageLookupByLibrary.simpleMessage("Monday"),
        "random_text_869": MessageLookupByLibrary.simpleMessage("Tuesday"),
        "random_text_870": MessageLookupByLibrary.simpleMessage("Wednesday"),
        "random_text_871": MessageLookupByLibrary.simpleMessage("Thursday"),
        "random_text_872": MessageLookupByLibrary.simpleMessage("Friday"),
        "random_text_873": MessageLookupByLibrary.simpleMessage("Saturday"),
        "random_text_874": MessageLookupByLibrary.simpleMessage("Sunday"),
        "random_text_875":
            MessageLookupByLibrary.simpleMessage("You\'re so lucky!"),
        "random_text_876":
            MessageLookupByLibrary.simpleMessage("All Currencies"),
        "random_text_877":
            MessageLookupByLibrary.simpleMessage("New Fund Password"),
        "random_text_878": MessageLookupByLibrary.simpleMessage(
            "Verification code sent successfully"),
        "random_text_879":
            MessageLookupByLibrary.simpleMessage("Request transfer to wallet"),
        "random_text_88":
            MessageLookupByLibrary.simpleMessage("Classification"),
        "random_text_880":
            MessageLookupByLibrary.simpleMessage("You can transfer to wallet"),
        "random_text_881": MessageLookupByLibrary.simpleMessage("Request now"),
        "random_text_882":
            MessageLookupByLibrary.simpleMessage("Transfer to wallet now"),
        "random_text_883":
            MessageLookupByLibrary.simpleMessage("All Activities"),
        "random_text_884":
            MessageLookupByLibrary.simpleMessage("Pending review"),
        "random_text_885":
            MessageLookupByLibrary.simpleMessage("Current Points: "),
        "random_text_886": MessageLookupByLibrary.simpleMessage("Progress "),
        "random_text_887":
            MessageLookupByLibrary.simpleMessage("Remaining for relegation"),
        "random_text_888": MessageLookupByLibrary.simpleMessage("S"),
        "random_text_889": MessageLookupByLibrary.simpleMessage(
            "All currencies you bet with will be standardized to tournament currency"),
        "random_text_89": MessageLookupByLibrary.simpleMessage("Rebate amount"),
        "random_text_890":
            MessageLookupByLibrary.simpleMessage("Please click to retry"),
        "random_text_891": MessageLookupByLibrary.simpleMessage("Originals"),
        "random_text_892": MessageLookupByLibrary.simpleMessage("Hello 👋"),
        "random_text_893":
            MessageLookupByLibrary.simpleMessage("How can we help?"),
        "random_text_894": MessageLookupByLibrary.simpleMessage(
            "24/7 Online Customer Service"),
        "random_text_895": MessageLookupByLibrary.simpleMessage(
            "Customer service is available to help resolve issues and answer questions"),
        "random_text_896":
            MessageLookupByLibrary.simpleMessage("Activity Details"),
        "random_text_897": MessageLookupByLibrary.simpleMessage("12% Cashback"),
        "random_text_898": MessageLookupByLibrary.simpleMessage("Maximum: 25%"),
        "random_text_899":
            MessageLookupByLibrary.simpleMessage("5000 Bets to Level 2"),
        "random_text_9": MessageLookupByLibrary.simpleMessage("January"),
        "random_text_900":
            MessageLookupByLibrary.simpleMessage("Your Cashback This Week"),
        "random_text_901": MessageLookupByLibrary.simpleMessage(
            "You will receive ??? cashback for playing games this week."),
        "random_text_902":
            MessageLookupByLibrary.simpleMessage("Statistical Time:"),
        "random_text_903":
            MessageLookupByLibrary.simpleMessage("Distribution Time:"),
        "random_text_904": MessageLookupByLibrary.simpleMessage("Claim Now"),
        "random_text_905": MessageLookupByLibrary.simpleMessage("Claim Time:"),
        "random_text_906":
            MessageLookupByLibrary.simpleMessage("Cashback Level"),
        "random_text_907":
            MessageLookupByLibrary.simpleMessage("Cashback Ratio"),
        "random_text_908":
            MessageLookupByLibrary.simpleMessage("Terms and Rules"),
        "random_text_909": MessageLookupByLibrary.simpleMessage(
            "Cashback provided weekly as a reward."),
        "random_text_910": MessageLookupByLibrary.simpleMessage(
            "The weekly cashback calculation period is from Monday 00:00 to Sunday 23:59."),
        "random_text_911": MessageLookupByLibrary.simpleMessage(
            "Cashback application period: From next Monday 06:00 to Friday 23:59, expired claims will not be accepted."),
        "random_text_912": MessageLookupByLibrary.simpleMessage(
            "Multiply the actual loss amount by the cashback ratio to get this week\'s cashback amount."),
        "random_text_913": MessageLookupByLibrary.simpleMessage(
            "If you haven\'t placed any bets during the cashback activity period, or if your earnings or total earnings from last week exceed your losses, you will not receive cashback."),
        "random_text_914": MessageLookupByLibrary.simpleMessage(
            "The maximum weekly cashback reward per person is 10,000 BRL"),
        "random_text_915": MessageLookupByLibrary.simpleMessage(
            "Cashback amount can be withdrawn directly or used to continue gaming."),
        "random_text_916": MessageLookupByLibrary.simpleMessage("Join Now!"),
        "random_text_917":
            MessageLookupByLibrary.simpleMessage("Invitation Details"),
        "random_text_918": MessageLookupByLibrary.simpleMessage("Valid"),
        "random_text_919": MessageLookupByLibrary.simpleMessage("Invalid"),
        "random_text_92":
            MessageLookupByLibrary.simpleMessage("Number of Contributors"),
        "random_text_920": MessageLookupByLibrary.simpleMessage(
            "Subordinate Cumulative Recharge"),
        "random_text_921": MessageLookupByLibrary.simpleMessage("or above"),
        "random_text_922": MessageLookupByLibrary.simpleMessage(
            "Subordinate Cumulative Betting"),
        "random_text_923": MessageLookupByLibrary.simpleMessage(
            "Subordinate Cumulative Recharge Frequency"),
        "random_text_924":
            MessageLookupByLibrary.simpleMessage("2 times or more"),
        "random_text_925": MessageLookupByLibrary.simpleMessage(
            "Subordinate Cumulative Recharge Days"),
        "random_text_926":
            MessageLookupByLibrary.simpleMessage("Try Making a Deposit"),
        "random_text_927":
            MessageLookupByLibrary.simpleMessage("Promotion Activity"),
        "random_text_928": MessageLookupByLibrary.simpleMessage("Quick Share"),
        "random_text_929":
            MessageLookupByLibrary.simpleMessage("0 Valid Referrals"),
        "random_text_930": MessageLookupByLibrary.simpleMessage(
            "What is a valid referral? (meeting the following conditions)"),
        "random_text_931":
            MessageLookupByLibrary.simpleMessage("Activity Requirements"),
        "random_text_932": MessageLookupByLibrary.simpleMessage(
            "Cumulative recharge meets activity requirements, reset daily at 00:00"),
        "random_text_933":
            MessageLookupByLibrary.simpleMessage("Designated Deposit"),
        "random_text_934":
            MessageLookupByLibrary.simpleMessage("Total Deposit"),
        "random_text_935":
            MessageLookupByLibrary.simpleMessage("Activity Content"),
        "random_text_936": MessageLookupByLibrary.simpleMessage(
            "1.  Daily cumulative deposits entitle you to rewards at different levels. The more you deposit, the larger the rewards, up to a maximum of 0.02. \n\n2.  During the event period, the accumulated recharge amount will be reset to zero at 00:00 each day, and you can continue to recharge to receive rewards. \n\n3.  Rewards can only be claimed the next day and can only be manually claimed on the iOS, Android, H5, and PC platforms. Unclaimed rewards will be invalid.  \n\n4.  The bonus for this event (excluding the principal) must be wagered at least once to withdraw. Wagering is not limited to any gaming platform.  \n\n5.  This event is only available for account owners who engage in manual operations, leasing, use of cheating software, bots, collusion between different accounts, manipulation, arbitrage, API, agreements, exploitation of vulnerabilities, group control, or other technical means are prohibited. Otherwise, rewards may be canceled, deducted, or the account may be frozen or even blacklisted. \n\n6.  In order to avoid differences in interpretation, the platform reserves the right to interpret this event."),
        "random_text_937": MessageLookupByLibrary.simpleMessage(
            "Try depositing to see if you can receive a bonus."),
        "random_text_938":
            MessageLookupByLibrary.simpleMessage("Relegation reminder"),
        "random_text_939":
            MessageLookupByLibrary.simpleMessage("Claim cashback"),
        "random_text_939copy2":
            MessageLookupByLibrary.simpleMessage("Claim Now"),
        "random_text_94": MessageLookupByLibrary.simpleMessage(
            "Commission received successfully"),
        "random_text_940":
            MessageLookupByLibrary.simpleMessage("Birthday Bonus"),
        "random_text_941": MessageLookupByLibrary.simpleMessage("Platform"),
        "random_text_942": MessageLookupByLibrary.simpleMessage("Ratio"),
        "random_text_943": MessageLookupByLibrary.simpleMessage(
            "Relegation recharge still required:"),
        "random_text_944": MessageLookupByLibrary.simpleMessage(
            "Relegation wagering still required:"),
        "random_text_945":
            MessageLookupByLibrary.simpleMessage("Red envelope event"),
        "random_text_946": MessageLookupByLibrary.simpleMessage(
            "Each red envelope is 100,000,"),
        "random_text_947": MessageLookupByLibrary.simpleMessage(
            ", with a maximum red envelope of 8888"),
        "random_text_948": MessageLookupByLibrary.simpleMessage(
            "1. Each red envelope rain distributes 100,000 reais for free."),
        "random_text_949": MessageLookupByLibrary.simpleMessage(
            "2. Maximum cash drop: each red envelope is distributed for free."),
        "random_text_95":
            MessageLookupByLibrary.simpleMessage("To your account"),
        "random_text_950": MessageLookupByLibrary.simpleMessage(
            "3. Members who have already recharged can claim for free."),
        "random_text_951": MessageLookupByLibrary.simpleMessage(
            "4. The cash received can be used for gaming or withdrawn directly."),
        "random_text_952": MessageLookupByLibrary.simpleMessage(
            "5. The higher the VIP membership level, the more cash you receive."),
        "random_text_953": MessageLookupByLibrary.simpleMessage(
            "6. To avoid differences in textual interpretation, the platform reserves the final interpretation right for this event."),
        "random_text_954": MessageLookupByLibrary.simpleMessage(
            "Money falls like rain six times a day."),
        "random_text_955": MessageLookupByLibrary.simpleMessage(
            "Money falls like rain \n Unpacking is rewarded"),
        "random_text_956":
            MessageLookupByLibrary.simpleMessage("Six times a day"),
        "random_text_957":
            MessageLookupByLibrary.simpleMessage("1st to 7th of each month"),
        "random_text_958": MessageLookupByLibrary.simpleMessage(
            "Every Friday, Saturday, and Sunday"),
        "random_text_959":
            MessageLookupByLibrary.simpleMessage("Three times a day"),
        "random_text_96":
            MessageLookupByLibrary.simpleMessage("Successfully received"),
        "random_text_960": MessageLookupByLibrary.simpleMessage("Other times"),
        "random_text_961":
            MessageLookupByLibrary.simpleMessage("Next red envelope event"),
        "random_text_962": MessageLookupByLibrary.simpleMessage("Lucky bonus"),
        "random_text_963": MessageLookupByLibrary.simpleMessage("Ongoing"),
        "random_text_964": MessageLookupByLibrary.simpleMessage("Disabled"),
        "random_text_965": MessageLookupByLibrary.simpleMessage(
            "Deposit + Betting (reset after 7 consecutive days)"),
        "random_text_966": MessageLookupByLibrary.simpleMessage(
            "Subordinate\'s first recharge"),
        "random_text_967": MessageLookupByLibrary.simpleMessage("Days"),
        "random_text_967_copy": MessageLookupByLibrary.simpleMessage("Days"),
        "random_text_968":
            MessageLookupByLibrary.simpleMessage("Effective promotion count"),
        "random_text_969": MessageLookupByLibrary.simpleMessage("people"),
        "random_text_97":
            MessageLookupByLibrary.simpleMessage("Receive comission"),
        "random_text_970": MessageLookupByLibrary.simpleMessage("/23 people"),
        "random_text_971":
            MessageLookupByLibrary.simpleMessage("Total recharge"),
        "random_text_972":
            MessageLookupByLibrary.simpleMessage("Direct recharge"),
        "random_text_973":
            MessageLookupByLibrary.simpleMessage("Other recharge"),
        "random_text_974":
            MessageLookupByLibrary.simpleMessage("Current Points: "),
        "random_text_975": MessageLookupByLibrary.simpleMessage("Recharge"),
        "random_text_976": MessageLookupByLibrary.simpleMessage("Rollover"),
        "random_text_977": MessageLookupByLibrary.simpleMessage(
            "You have successfully claimed"),
        "random_text_978": MessageLookupByLibrary.simpleMessage(
            "No available cashback to claim"),
        "random_text_979": MessageLookupByLibrary.simpleMessage("Venue"),
        "random_text_98": MessageLookupByLibrary.simpleMessage(
            "Your current commission can be received"),
        "random_text_980": MessageLookupByLibrary.simpleMessage(
            "1. All betting currency amounts will be automatically converted to USDT"),
        "random_text_981": MessageLookupByLibrary.simpleMessage(
            "2. The exchange rate will be based on the market rate at the time of settlement"),
        "random_text_982": MessageLookupByLibrary.simpleMessage(
            "3. Valid bets already counted will not be affected by subsequent exchange rate changes"),
        "random_text_983": MessageLookupByLibrary.simpleMessage(
            "1. All deposited currencies will be converted based on the real-time market rate"),
        "random_text_984": MessageLookupByLibrary.simpleMessage(
            "2. The exchange rate will be based on the market rate at the time of successful deposit"),
        "random_text_985": MessageLookupByLibrary.simpleMessage(
            "Turnover will be calculated based on your valid betting amount"),
        "random_text_986": MessageLookupByLibrary.simpleMessage(
            "Deposits will be converted to USDT based on the market rate"),
        "random_text_987": MessageLookupByLibrary.simpleMessage("Per month"),
        "random_text_988": MessageLookupByLibrary.simpleMessage("Day"),
        "random_text_988cpoy2": m13,
        "random_text_989": MessageLookupByLibrary.simpleMessage("Monday"),
        "random_text_99": MessageLookupByLibrary.simpleMessage(
            "You can choose the currency you want to receive"),
        "random_text_990": MessageLookupByLibrary.simpleMessage("Tuesday"),
        "random_text_991": MessageLookupByLibrary.simpleMessage("Wednesday"),
        "random_text_992": MessageLookupByLibrary.simpleMessage("Thursday"),
        "random_text_993": MessageLookupByLibrary.simpleMessage("Friday"),
        "random_text_994": MessageLookupByLibrary.simpleMessage("Saturday"),
        "random_text_995": MessageLookupByLibrary.simpleMessage("Sunday"),
        "random_text_996": MessageLookupByLibrary.simpleMessage("Every "),
        "random_text_997":
            MessageLookupByLibrary.simpleMessage("Exchange failed"),
        "random_text_998":
            MessageLookupByLibrary.simpleMessage("Claim and exchange"),
        "random_text_999":
            MessageLookupByLibrary.simpleMessage("Each red envelope"),
        "random_text_fix1": MessageLookupByLibrary.simpleMessage(
            "Please include the “@” symbol in your email address"),
        "random_text_fix2": MessageLookupByLibrary.simpleMessage(
            "The email for reseting the password was sent"),
        "random_text_fix3": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to end your session and log out?"),
        "reacquire": MessageLookupByLibrary.simpleMessage("Get again"),
        "receive": MessageLookupByLibrary.simpleMessage("Receive"),
        "recover_password_text":
            MessageLookupByLibrary.simpleMessage("Recover Password"),
        "recover_password_title_text":
            MessageLookupByLibrary.simpleMessage("Reset password"),
        "redeem_bonus_text":
            MessageLookupByLibrary.simpleMessage("Redeem AirDrop bonus"),
        "redeem_bonus_tips_text": MessageLookupByLibrary.simpleMessage(
            "Get AirDrop bonus codes on our social media such as Twitter and Telegram"),
        "redeem_code_text": MessageLookupByLibrary.simpleMessage("Code"),
        "reg_next": MessageLookupByLibrary.simpleMessage("Continue"),
        "register_an_account":
            MessageLookupByLibrary.simpleMessage("Register an Account"),
        "register_protocol_title":
            MessageLookupByLibrary.simpleMessage("Terms and conditions"),
        "resend_email_text":
            MessageLookupByLibrary.simpleMessage("Resend Email"),
        "responsible_btn_clear_limit":
            MessageLookupByLibrary.simpleMessage("Clear limit"),
        "responsible_btn_request_self_exclusion":
            MessageLookupByLibrary.simpleMessage("Request self-exclusion"),
        "responsible_for_gambling":
            MessageLookupByLibrary.simpleMessage("Responsible Gambling"),
        "responsible_gaming":
            MessageLookupByLibrary.simpleMessage("Responsible Gambling"),
        "responsible_label_loss_limits":
            MessageLookupByLibrary.simpleMessage("Loss limits"),
        "responsible_tab_betting_limits":
            MessageLookupByLibrary.simpleMessage("Betting limits"),
        "responsible_title_self_exclusion":
            MessageLookupByLibrary.simpleMessage("Self exclusion"),
        "s_2fa_body_code_text":
            MessageLookupByLibrary.simpleMessage("Two Factor Code"),
        "s_2fa_body_code_text1":
            MessageLookupByLibrary.simpleMessage("Two Factor Code"),
        "s_2fa_body_tips_text": MessageLookupByLibrary.simpleMessage(
            "To keep your account extra secure leave a two factor authentication enabled."),
        "s_2fa_body_title_text":
            MessageLookupByLibrary.simpleMessage("Disable Two Factor"),
        "s_2fa_body_warning_text": MessageLookupByLibrary.simpleMessage(
            "You need to re-enter the secret key in the Authenticator after disabling it, and the old secret key will become invalid"),
        "search_game": MessageLookupByLibrary.simpleMessage("Search your game"),
        "set_fund_password":
            MessageLookupByLibrary.simpleMessage("Set fund password"),
        "setting": MessageLookupByLibrary.simpleMessage("Settings"),
        "settled_bet": MessageLookupByLibrary.simpleMessage("Settled"),
        "setup_pay_password_button_text":
            MessageLookupByLibrary.simpleMessage("Email verification"),
        "setup_pay_password_title_text": MessageLookupByLibrary.simpleMessage(
            "The fund password will be used to protect withdraws and make withdraws from the safe more secure"),
        "showingContentNow": m14,
        "single_bet": MessageLookupByLibrary.simpleMessage("Single"),
        "snack_bar_normal_tips":
            MessageLookupByLibrary.simpleMessage("Friendly Reminder"),
        "social_account_text":
            MessageLookupByLibrary.simpleMessage("Social Media Account"),
        "sponsorships": MessageLookupByLibrary.simpleMessage("Sponsorships"),
        "sport_add_more": MessageLookupByLibrary.simpleMessage("Load More"),
        "sport_all": MessageLookupByLibrary.simpleMessage("All"),
        "sport_bet": MessageLookupByLibrary.simpleMessage("Sports betting"),
        "sport_bet_dota2": MessageLookupByLibrary.simpleMessage("Dota 2"),
        "sport_bet_football": MessageLookupByLibrary.simpleMessage("Soccer"),
        "sport_bet_handicap": MessageLookupByLibrary.simpleMessage("Handicap"),
        "sport_bet_hot": MessageLookupByLibrary.simpleMessage("Popular Events"),
        "sport_bet_lol":
            MessageLookupByLibrary.simpleMessage("League of Legends"),
        "sport_bet_page": MessageLookupByLibrary.simpleMessage("Home"),
        "sport_bet_pingpong": MessageLookupByLibrary.simpleMessage("Ping pong"),
        "sport_bet_puck": MessageLookupByLibrary.simpleMessage("Ice hockey"),
        "sport_bet_score":
            MessageLookupByLibrary.simpleMessage("Total handicap"),
        "sport_bet_tennis": MessageLookupByLibrary.simpleMessage("Tennis"),
        "sport_bet_volleyball":
            MessageLookupByLibrary.simpleMessage("Volleyball"),
        "sport_bet_winning":
            MessageLookupByLibrary.simpleMessage("Winning Line"),
        "sport_betting_begin_bet":
            MessageLookupByLibrary.simpleMessage("Start Betting Now!"),
        "sport_champion": MessageLookupByLibrary.simpleMessage("Outrights"),
        "sport_des_one": MessageLookupByLibrary.simpleMessage(
            "The Best Cryptocurrency Online Sports Betting"),
        "sport_des_two": MessageLookupByLibrary.simpleMessage(
            "Bet on sports teams, players and leagues from around the world with our sports betting platform. Enjoy an unparalleled sports betting experience by placing bets on a variety of betting options on MMA, basketball, football and many other sports, as well as on live markets."),
        "sport_event_list_begin_time":
            MessageLookupByLibrary.simpleMessage("Start time"),
        "sport_event_list_over":
            MessageLookupByLibrary.simpleMessage("Finished"),
        "sport_event_list_sort_ab": MessageLookupByLibrary.simpleMessage("All"),
        "sport_event_list_sort_hot":
            MessageLookupByLibrary.simpleMessage("Popular"),
        "sport_event_list_time_hour_after":
            MessageLookupByLibrary.simpleMessage("Start time: 60 hours later"),
        "sport_event_list_time_min_after": MessageLookupByLibrary.simpleMessage(
            "Start time: 60 minutes later"),
        "sport_event_list_time_sec_after": MessageLookupByLibrary.simpleMessage(
            "Start time: 60 seconds later"),
        "sport_fav_comming_rolling":
            MessageLookupByLibrary.simpleMessage("Upcoming hot event"),
        "sport_fav_hot_rolling":
            MessageLookupByLibrary.simpleMessage("Collect"),
        "sport_lock": MessageLookupByLibrary.simpleMessage("Closed handicap"),
        "sport_locked":
            MessageLookupByLibrary.simpleMessage("Handicap blocked"),
        "sport_nodata": MessageLookupByLibrary.simpleMessage("No data"),
        "sport_rolling_coming": MessageLookupByLibrary.simpleMessage(
            "Rolling and upcoming match odds"),
        "sport_tabbar_coming":
            MessageLookupByLibrary.simpleMessage("Starting Soon"),
        "sport_tabbar_favorites":
            MessageLookupByLibrary.simpleMessage("Favourites"),
        "sport_tabbar_hall": MessageLookupByLibrary.simpleMessage("Lobby"),
        "sport_tabbar_mybet": MessageLookupByLibrary.simpleMessage("My Bets"),
        "sport_tabbar_rank":
            MessageLookupByLibrary.simpleMessage("Competition Ranking"),
        "sport_tabbar_rolling":
            MessageLookupByLibrary.simpleMessage("Live Events"),
        "sport_unlogin": MessageLookupByLibrary.simpleMessage("Not connected"),
        "sports_betting_rules":
            MessageLookupByLibrary.simpleMessage("Sports Rules"),
        "start_game_text": MessageLookupByLibrary.simpleMessage("Play Now"),
        "state_pending":
            MessageLookupByLibrary.simpleMessage("Waiting Process"),
        "state_processed": MessageLookupByLibrary.simpleMessage("Processed"),
        "statistics_title_lose_text":
            MessageLookupByLibrary.simpleMessage("Lose"),
        "statistics_title_total_text":
            MessageLookupByLibrary.simpleMessage("Wagered"),
        "statistics_title_win_text":
            MessageLookupByLibrary.simpleMessage("Win"),
        "submit_bet_result": MessageLookupByLibrary.simpleMessage(
            "Successfully suppressed total value"),
        "submit_bet_result_amount": m15,
        "submit_text": MessageLookupByLibrary.simpleMessage("Submit"),
        "success_pwd": MessageLookupByLibrary.simpleMessage("Success"),
        "successfullyCopi": MessageLookupByLibrary.simpleMessage("Copied!"),
        "tab_bar_chat_room": MessageLookupByLibrary.simpleMessage("Chat"),
        "tab_bar_ent": MessageLookupByLibrary.simpleMessage("Casino"),
        "tab_bar_ent_copy": MessageLookupByLibrary.simpleMessage("Casino"),
        "tab_bar_exchange_text":
            MessageLookupByLibrary.simpleMessage("Discount exchange"),
        "tab_bar_kyc_text":
            MessageLookupByLibrary.simpleMessage("KYC Verification"),
        "tab_bar_menu": MessageLookupByLibrary.simpleMessage("Browse"),
        "tab_bar_order": MessageLookupByLibrary.simpleMessage("Bets"),
        "tab_bar_orders": MessageLookupByLibrary.simpleMessage("Bet Slip"),
        "tab_bar_sports": MessageLookupByLibrary.simpleMessage("Sports"),
        "tab_bar_title_2fa_text":
            MessageLookupByLibrary.simpleMessage("Security"),
        "tab_bar_title_2fa_textcopy2":
            MessageLookupByLibrary.simpleMessage("Security"),
        "tab_bar_title_black_list_text":
            MessageLookupByLibrary.simpleMessage("Blacklist"),
        "tab_bar_title_change_password_text":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "tab_bar_title_contact_text":
            MessageLookupByLibrary.simpleMessage("General"),
        "tab_bar_title_data_statistics_text":
            MessageLookupByLibrary.simpleMessage("Statistics"),
        "tab_bar_title_google_verification_text":
            MessageLookupByLibrary.simpleMessage("Google Authenticator"),
        "tab_bar_title_login_log_text":
            MessageLookupByLibrary.simpleMessage("Login Record"),
        "tab_bar_title_privacy_text":
            MessageLookupByLibrary.simpleMessage("Privacy options"),
        "tab_bar_title_trophy_text":
            MessageLookupByLibrary.simpleMessage("Trophy"),
        "tab_bar_title_withdrawal_info_text":
            MessageLookupByLibrary.simpleMessage("Withdraw information"),
        "terms_of_service_text":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "text_field_birthday_tips":
            MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "text_field_user_name_tips":
            MessageLookupByLibrary.simpleMessage("Username"),
        "text_filed_tips_repeat_password_text":
            MessageLookupByLibrary.simpleMessage("Repeat password"),
        "token_invalid_text":
            MessageLookupByLibrary.simpleMessage("Your token has expired"),
        "top_login": MessageLookupByLibrary.simpleMessage("Log in"),
        "top_login_copy": MessageLookupByLibrary.simpleMessage("Sign In"),
        "top_register": MessageLookupByLibrary.simpleMessage("Register"),
        "top_sports": MessageLookupByLibrary.simpleMessage("Top Sports"),
        "top_wallet_setting":
            MessageLookupByLibrary.simpleMessage("Wallet Settings"),
        "transaction_password":
            MessageLookupByLibrary.simpleMessage("Transaction password"),
        "transaction_password_set_successfully":
            MessageLookupByLibrary.simpleMessage(
                "Transaction password set successfully"),
        "transaction_records":
            MessageLookupByLibrary.simpleMessage("Transactions"),
        "transactions_detail_bet": MessageLookupByLibrary.simpleMessage("Bet:"),
        "transactions_detail_blockchan_protocol":
            MessageLookupByLibrary.simpleMessage("Transaction protocol"),
        "transactions_detail_card":
            MessageLookupByLibrary.simpleMessage("Credit card"),
        "transactions_detail_card_number":
            MessageLookupByLibrary.simpleMessage("Receipt account:"),
        "transactions_detail_coin_type":
            MessageLookupByLibrary.simpleMessage("Currency"),
        "transactions_detail_help": MessageLookupByLibrary.simpleMessage(
            "In case of need, please contact us for assistance."),
        "transactions_detail_means":
            MessageLookupByLibrary.simpleMessage("Transaction Methods"),
        "transactions_detail_odds":
            MessageLookupByLibrary.simpleMessage("Multiplier:"),
        "transactions_detail_order_id":
            MessageLookupByLibrary.simpleMessage("Order Number"),
        "transactions_detail_pay":
            MessageLookupByLibrary.simpleMessage("Payment amount:"),
        "transactions_detail_play": m16,
        "transactions_detail_player": m17,
        "transactions_detail_state":
            MessageLookupByLibrary.simpleMessage("Status"),
        "transactions_detail_state_confirmed":
            MessageLookupByLibrary.simpleMessage("Confirmed"),
        "transactions_detail_state_confirming":
            MessageLookupByLibrary.simpleMessage("Pending"),
        "transactions_detail_state_fail":
            MessageLookupByLibrary.simpleMessage("Failure"),
        "transactions_detail_state_time_out":
            MessageLookupByLibrary.simpleMessage("Order timeout"),
        "transactions_detail_time":
            MessageLookupByLibrary.simpleMessage("Transaction Time"),
        "transactions_other": MessageLookupByLibrary.simpleMessage("Other"),
        "transactions_other_bonus":
            MessageLookupByLibrary.simpleMessage("Prize"),
        "transactions_other_campaign_withdrawal":
            MessageLookupByLibrary.simpleMessage(
                "Activity commission withdraw"),
        "transactions_other_drop":
            MessageLookupByLibrary.simpleMessage("Airdrop bonus"),
        "transactions_other_rains_received":
            MessageLookupByLibrary.simpleMessage(
                "Receive rain of red envelopes"),
        "transactions_other_reload_claim":
            MessageLookupByLibrary.simpleMessage("Receive recharge bonus"),
        "twice_password_error_text": MessageLookupByLibrary.simpleMessage(
            "The passwords entered twice are inconsistent"),
        "two_password_inputs_are_inconsistent":
            MessageLookupByLibrary.simpleMessage(
                "The two password inputs are inconsistent"),
        "user_name_error_tips": MessageLookupByLibrary.simpleMessage(
            "The username contains invalid characters"),
        "user_name_uppercase_error_tips": MessageLookupByLibrary.simpleMessage(
            "The username cannot contain uppercase characters"),
        "username_already_exists_text": MessageLookupByLibrary.simpleMessage(
            "This username is already taken, please choose another username"),
        "vault": MessageLookupByLibrary.simpleMessage("Vault"),
        "vault_Cancel_deposit_request":
            MessageLookupByLibrary.simpleMessage("Cancel Deposit Request"),
        "vault_Confirm_deposit_with_full_amount_excluding_fees_to_avoid_issues_with_crediting":
            MessageLookupByLibrary.simpleMessage(
                "Please confirm that the payment address is deposited with the full amount (excluding handling fees), otherwise it may result in the inability to increase points."),
        "vault_USDT_transfer_in_progress_Please_wait_for_confirmation": m18,
        "vault_address": MessageLookupByLibrary.simpleMessage("Address"),
        "vault_amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "vault_amountCannotExceedMaximum": MessageLookupByLibrary.simpleMessage(
            "The amount cannot exceed the limit"),
        "vault_confirm_payment":
            MessageLookupByLibrary.simpleMessage("Confirm Payment"),
        "vault_confirmedExtractionFromVault":
            MessageLookupByLibrary.simpleMessage("Safe withdraw confirmed"),
        "vault_confirmedExtractionFromVaultcopy2":
            MessageLookupByLibrary.simpleMessage("Safe withdraw confirmed"),
        "vault_currency": MessageLookupByLibrary.simpleMessage("Safe currency"),
        "vault_deposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "vault_deposit_vault":
            MessageLookupByLibrary.simpleMessage("Deposit to Vault"),
        "vault_enteringVault":
            MessageLookupByLibrary.simpleMessage("Enter the safe"),
        "vault_have_deposited":
            MessageLookupByLibrary.simpleMessage("Deposited"),
        "vault_increase_your_account_security_with_double_verification":
            MessageLookupByLibrary.simpleMessage(
                "Improve your account security with Two-Factor Authentication"),
        "vault_max_value": MessageLookupByLibrary.simpleMessage("Max"),
        "vault_minimum_amount_limit_text": m19,
        "vault_recharge_amount":
            MessageLookupByLibrary.simpleMessage("Recharge Amount"),
        "vault_successfullyStor":
            MessageLookupByLibrary.simpleMessage("Deposited"),
        "vault_take_out": MessageLookupByLibrary.simpleMessage("Withdraw"),
        "vault_takeout": MessageLookupByLibrary.simpleMessage("Safe Take Out"),
        "vault_the_minimal_amount_is": m20,
        "vault_this_field_is_required":
            MessageLookupByLibrary.simpleMessage("Please select the address"),
        "vault_transfer_amount": m21,
        "vault_transfer_to_address":
            MessageLookupByLibrary.simpleMessage("Transfer-to address"),
        "vault_turn_on_two_step_verification":
            MessageLookupByLibrary.simpleMessage("Enable2FA"),
        "vault_two_step_verification":
            MessageLookupByLibrary.simpleMessage("Security"),
        "vault_vaultDeposits":
            MessageLookupByLibrary.simpleMessage("Deposit in the safe"),
        "vault_withdraw_money":
            MessageLookupByLibrary.simpleMessage("Withdraw"),
        "verification_code_must_be_filled":
            MessageLookupByLibrary.simpleMessage(
                "Verification code cannot be blank"),
        "version": MessageLookupByLibrary.simpleMessage("Version number"),
        "vip": MessageLookupByLibrary.simpleMessage("VIP"),
        "vip_bouns_history_tab_amount":
            MessageLookupByLibrary.simpleMessage("Receiving Amount"),
        "vip_bouns_history_tab_time":
            MessageLookupByLibrary.simpleMessage("Receipt Time"),
        "vip_bouns_history_tab_type":
            MessageLookupByLibrary.simpleMessage("Type of Receipt"),
        "vip_bouns_total":
            MessageLookupByLibrary.simpleMessage("Total amount received"),
        "vip_club": MessageLookupByLibrary.simpleMessage("VIP Club"),
        "vip_commission_history":
            MessageLookupByLibrary.simpleMessage("Cashback"),
        "vip_commission_receive":
            MessageLookupByLibrary.simpleMessage("Get it with one click"),
        "vip_degree_of_progress":
            MessageLookupByLibrary.simpleMessage("Progress level"),
        "vip_get_recharge_bonus":
            MessageLookupByLibrary.simpleMessage("Get recharge bonus"),
        "vip_level": MessageLookupByLibrary.simpleMessage("No classification"),
        "vip_level_copper": MessageLookupByLibrary.simpleMessage("Copper"),
        "vip_next_collection_is_at": m22,
        "vip_next_level": m23,
        "vip_recharge_bonus":
            MessageLookupByLibrary.simpleMessage("Deposit bonus"),
        "vip_recharge_bonus_is_valid_until": m24,
        "vip_rule_content": MessageLookupByLibrary.simpleMessage(
            "1. Promotion criteria: If you meet the VIP promotion requirements (that is, all code requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses;\n\n2 . Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, which is reset at 12:00 am every day; \n\n3. Weekly salary: If you meet the weekly salary requirements corresponding to the VIP level, you can receive the corresponding weekly bonus. Reset every Monday at 12:00 am; \n\n4. Monthly salary: If the monthly recharge and coding meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus, reset at 12:00 am on the 1st of each month; \n \n5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will be automatically downgraded by one level; \n\n6. Audit instructions: The bonus given by VIP needs to be rolled over 1 times. (i.e. auditing, coding or valid betting) can be withdrawn, and coding is not limited to game platforms; \n\n7. Activity statement: This function is limited to the account owner for normal game betting. Rental accounts, risk-free betting (vs. betting, etc.) are prohibited. Once verified, this platform has the right to terminate member login, suspend member\'s use of the website, and the right to confiscate bonuses and improper profits without special notice; \n\n8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform retains The right of final interpretation of this event."),
        "vip_rule_title":
            MessageLookupByLibrary.simpleMessage("VIP Rules Description"),
        "vip_tab_bouns":
            MessageLookupByLibrary.simpleMessage("Promotion Bonus"),
        "vip_tab_bouns_day":
            MessageLookupByLibrary.simpleMessage("Daily bonus"),
        "vip_tab_bouns_month":
            MessageLookupByLibrary.simpleMessage("Monthly bonus"),
        "vip_tab_bouns_week":
            MessageLookupByLibrary.simpleMessage("Weekly bonus"),
        "vip_tab_exp":
            MessageLookupByLibrary.simpleMessage("Promotion experience"),
        "vip_tab_level": MessageLookupByLibrary.simpleMessage("Level"),
        "vip_tab_turnover": MessageLookupByLibrary.simpleMessage("Status"),
        "vip_welfare": MessageLookupByLibrary.simpleMessage("Benefit"),
        "vip_your_progress":
            MessageLookupByLibrary.simpleMessage("Your VIP Progress"),
        "viprule_content1": MessageLookupByLibrary.simpleMessage(
            "1. Promotion criteria: If you meet the requirements for VIP promotion (that is, all coding requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses"),
        "viprule_content2": MessageLookupByLibrary.simpleMessage(
            "2. Daily salary: If you meet the daily salary requirements corresponding to the VIP level, you can receive the corresponding daily bonus, reset at 12:00 am every day"),
        "viprule_content3": MessageLookupByLibrary.simpleMessage(
            "3. Weekly salary: If you reach the VIP level corresponding to the weekly salary requirement, you can receive the corresponding weekly bonus, which will be reset every Monday at 12:00 am"),
        "viprule_content4": MessageLookupByLibrary.simpleMessage(
            "4. Monthly salary: If you recharge and code every month to meet the monthly salary requirements corresponding to the current VIP level, you can receive the corresponding monthly bonus. It will be reset at 12:00 am on the 1st of each month."),
        "viprule_content5": MessageLookupByLibrary.simpleMessage(
            "5. Level maintenance instructions: After a member reaches a certain VIP level, if the recharge and coding in the last month do not meet the maintenance requirements, the member will automatically be downgraded by one level"),
        "viprule_content6": MessageLookupByLibrary.simpleMessage(
            "6. Audit instructions: The bonus given by VIP requires 1 times rollover (i.e. audit, coding or valid betting) before it can be withdrawn. The coding is not limited to the game platform"),
        "viprule_content7": MessageLookupByLibrary.simpleMessage(
            "7. Activity statement: This function is limited to normal game betting by the account owner. It is prohibited to rent an account, risk-free betting (betting, betting, low-loss betting), malicious arbitrage, use of plug-ins, robots, and use of agreements , loopholes, interfaces, group control or other technical means, once verified to be true, this platform has the right to terminate member login, suspend members\' use of the website, and confiscate bonuses and improper profits without special notice."),
        "viprule_content8": MessageLookupByLibrary.simpleMessage(
            "8. Explanation: When a member receives VIP rewards, the platform will assume that the member agrees and abides by the corresponding conditions and other relevant regulations. In order to avoid ambiguity in text understanding, the platform reserves the final right to interpret this event"),
        "viprule_content_copy1": MessageLookupByLibrary.simpleMessage(
            "Promotion Criteria: If you meet the requirements for VIP promotion (that is, all requirements are met), you can be promoted to the corresponding VIP level and receive the corresponding promotion bonus. If you advance to multiple levels in a row, you can receive all level promotion bonuses."),
        "wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "wallet_accountOpeningOutlets":
            MessageLookupByLibrary.simpleMessage("Opening address"),
        "wallet_amountCannotBe": m25,
        "wallet_bankSelection":
            MessageLookupByLibrary.simpleMessage("Bank Choice"),
        "wallet_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "wallet_confirmDelete":
            MessageLookupByLibrary.simpleMessage("Confirm deletion"),
        "wallet_currency": MessageLookupByLibrary.simpleMessage("Currency"),
        "wallet_deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("Confirm deletion"),
        "wallet_deposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "wallet_deposit_copy": MessageLookupByLibrary.simpleMessage("Deposit"),
        "wallet_email_hint_auth": MessageLookupByLibrary.simpleMessage(
            "You must verify your email address to make withdrawals"),
        "wallet_email_open": MessageLookupByLibrary.simpleMessage("Open Gmail"),
        "wallet_enterFundPassword":
            MessageLookupByLibrary.simpleMessage("Enter the fund password"),
        "wallet_fundPassword":
            MessageLookupByLibrary.simpleMessage("Fund Password"),
        "wallet_fundPasswordcopy2":
            MessageLookupByLibrary.simpleMessage("Fund Password"),
        "wallet_goToSettings":
            MessageLookupByLibrary.simpleMessage("Go to settings"),
        "wallet_hideChangeBalance":
            MessageLookupByLibrary.simpleMessage("Hide Zero Balances"),
        "wallet_maximumAmountIs":
            MessageLookupByLibrary.simpleMessage("Maximum amount is"),
        "wallet_minimumAmountIs":
            MessageLookupByLibrary.simpleMessage("Minumum amount is"),
        "wallet_paymentBankCard":
            MessageLookupByLibrary.simpleMessage("Withdraw Bank Card"),
        "wallet_pixAccount":
            MessageLookupByLibrary.simpleMessage("PIX account"),
        "wallet_pleaseBindWithdrawalMethodBeforeMakingWithdrawal":
            MessageLookupByLibrary.simpleMessage(
                "Please bind the withdrawal method first before withdrawing"),
        "wallet_pleaseEnterAmount":
            MessageLookupByLibrary.simpleMessage("10.00-100000.00"),
        "wallet_pleaseEnterFundPassword": MessageLookupByLibrary.simpleMessage(
            "Please enter the fund password"),
        "wallet_pleaseEnterNameDepositor": MessageLookupByLibrary.simpleMessage(
            "Please enter the depositor\'s name"),
        "wallet_pleaseSelectAmount":
            MessageLookupByLibrary.simpleMessage("Please select the amount"),
        "wallet_pleaseSelectPIXAccount":
            MessageLookupByLibrary.simpleMessage("Please select a PIX account"),
        "wallet_search": MessageLookupByLibrary.simpleMessage("Search"),
        "wallet_setFundPassword": MessageLookupByLibrary.simpleMessage(
            "For the safety of your funds, please set a fund password first"),
        "wallet_successfulApplicationForPayment":
            MessageLookupByLibrary.simpleMessage(
                "Withdraw application successful"),
        "wallet_transferAmount":
            MessageLookupByLibrary.simpleMessage("Transfer Amount"),
        "wallet_withdraw_money":
            MessageLookupByLibrary.simpleMessage("Withdraw"),
        "wallet_yourFundPasswordContainsDigit": m26,
        "wallet_yourZeroBalanceWillNotBeDisplayedInWallet":
            MessageLookupByLibrary.simpleMessage(
                "Your zero balances won\'t appear in your wallet"),
        "welcome_body_text": m27,
        "welcome_title_text": MessageLookupByLibrary.simpleMessage("Welcome"),
        "withdraw_money_type":
            MessageLookupByLibrary.simpleMessage("Withdraw method"),
        "you_have_not_bound_your_email": MessageLookupByLibrary.simpleMessage(
            "You have not bound your email"),
        "yulecheng_casino": MessageLookupByLibrary.simpleMessage("Live casino"),
        "yulecheng_hot_recoment":
            MessageLookupByLibrary.simpleMessage("Recommended"),
        "yulecheng_nextpage": MessageLookupByLibrary.simpleMessage("Next"),
        "yulecheng_prepage": MessageLookupByLibrary.simpleMessage("Previous"),
        "yulecheng_savegame_tofavorite":
            MessageLookupByLibrary.simpleMessage("Add game to favorites"),
        "yulecheng_selectShowBalance":
            MessageLookupByLibrary.simpleMessage("Select Your Display Balance"),
        "yulecheng_slot": MessageLookupByLibrary.simpleMessage("Slot"),
        "yulecheng_special_slot":
            MessageLookupByLibrary.simpleMessage("Featured slot"),
        "yulecheng_trygame": MessageLookupByLibrary.simpleMessage("Fun Play"),
        "yulecheng_zanwushoucang": MessageLookupByLibrary.simpleMessage(
            "There are no favorites yet, start using now")
      };
}
