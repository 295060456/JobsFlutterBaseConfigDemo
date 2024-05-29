// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(start_number, end_number) =>
      "Vui lòng nhập đúng số thẻ ngân hàng gồm chữ số ${start_number} - ${end_number}";

  static String m1(currencyName) => " ${currencyName} của bạn";

  static String m2(number) => "Trực tuyến: ${number}";

  static String m3(title) => "Tải về toàn bộ";

  static String m4(rate) => "Tỷ giá hối đoái hiện tại là ${rate}";

  static String m5(one, two) => "Xem Tất Cả ${one} ${two}";

  static String m6(character_number) => "Tối thiểu ${character_number} ký tự";

  static String m7(app_name_text, hCaptcha_text, privacy_policy_text,
          terms_of_service_text) =>
      "${app_name_text}được${hCaptcha_text}bảo vệ，${hCaptcha_text}${privacy_policy_text}và${terms_of_service_text}được áp dụng";

  static String m8(text_length) => "Độ dài ký tự tối đa là ${text_length}";

  static String m9(text_length) => "Độ dài ký tự tối thiểu là ${text_length}";

  static String m10(password_characters_length) =>
      "Mật khẩu của bạn phải dài ít nhất ${password_characters_length} ký tự";

  static String m11(type7) => "Thanh toán bằng ${type7} ";

  static String m12(number) => "${number} ngày sau sẽ hết hạn";

  static String m13(month, day) => "${month} ${day}";

  static String m14(two, one) => "Đang hiển thị ${one} ${two} các trò chơi";

  static String m15(amount) => "{số lượng}";

  static String m16(name) => "Hãy vào {tên}";

  static String m17(user_name) => "Nguời đầu tư ${user_name}";

  static String m18(currency) =>
      "Vui lòng xác nhận gửi ${currency} đến địa chỉ này. Việc nạp tiền cần có xác nhận từ toàn bộ mạng trước khi có thể được ghi có. Vui lòng kiên nhẫn chờ đợi.";

  static String m19(amount) =>
      "Số tiền tối thiểu không thể nhỏ hơn hoặc bằng ${amount}";

  static String m20(minimal_amount) =>
      "Số tiền tối thiểu ở đây là ${minimal_amount}";

  static String m21(amount) => "Số tiền chuyền vào";

  static String m22(nextTime) => "Lần nhận tiếp theo tại ${nextTime}";

  static String m23(level, amount) =>
      "Vẫn còn thiếu ${level} VIP${amount} Tích điểm";

  static String m24(time) => "Phần thưởng nạp lại có hiệu lực cho đến ${time}";

  static String m25(zero) => "Số tiền không thể là {0}";

  static String m26(number) => "Mật khẩu quỹ của bạn chứa ${number} chữ số";

  static String m27(user_name) => "Chào đón ${user_name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_us": MessageLookupByLibrary.simpleMessage("Về Chúng Tôi"),
        "active_bet": MessageLookupByLibrary.simpleMessage("Hoạt động"),
        "agree_terms_text": MessageLookupByLibrary.simpleMessage(
            "Tôi đã đọc và đồng ý các điều khoản và điều kiện "),
        "agree_terms_tips": MessageLookupByLibrary.simpleMessage(
            "Vui lòng đọc đầy đủ các điều khoản và điều kiện và cuộn đến cuối để chấp nhận chúng"),
        "all_bet": MessageLookupByLibrary.simpleMessage("Tất Cả Cược"),
        "all_esports":
            MessageLookupByLibrary.simpleMessage("Tất cả thể thao điện tử"),
        "all_sports": MessageLookupByLibrary.simpleMessage("Tất Cả"),
        "alliance_activity": MessageLookupByLibrary.simpleMessage("Hoạt động"),
        "alliance_activity_name":
            MessageLookupByLibrary.simpleMessage("Tên hoạt động"),
        "alliance_capital": MessageLookupByLibrary.simpleMessage("Quỹ"),
        "alliance_commission": MessageLookupByLibrary.simpleMessage("Hoa hồng"),
        "alliance_create_activity":
            MessageLookupByLibrary.simpleMessage("Tạo hoạt động"),
        "alliance_game": MessageLookupByLibrary.simpleMessage("Giải trí"),
        "alliance_monery_takeout":
            MessageLookupByLibrary.simpleMessage("Có thể rút hoa hồng có sẵn"),
        "alliance_plan":
            MessageLookupByLibrary.simpleMessage("Kế hoạch bảo lưu"),
        "alliance_program": MessageLookupByLibrary.simpleMessage("Liên kết"),
        "alliance_recommendation":
            MessageLookupByLibrary.simpleMessage("Người dùng được đề xuất"),
        "alliance_sort": MessageLookupByLibrary.simpleMessage("Sắp xếp theo"),
        "alliance_summary": MessageLookupByLibrary.simpleMessage("Tổng quan"),
        "already_have_an_account_text":
            MessageLookupByLibrary.simpleMessage("Đã có tài khoản? "),
        "app_name_text": MessageLookupByLibrary.simpleMessage("Stake"),
        "back_list_action_text":
            MessageLookupByLibrary.simpleMessage("Thao tác"),
        "back_list_player_text":
            MessageLookupByLibrary.simpleMessage("Người chơi"),
        "banking_text": MessageLookupByLibrary.simpleMessage("Nội tệ"),
        "bet_accept_any_odds":
            MessageLookupByLibrary.simpleMessage("Chấp Nhận Tất Cả Tỉ Lệ"),
        "bet_accept_only_higher_odds":
            MessageLookupByLibrary.simpleMessage("Chỉ Chấp Nhận Tỉ Lệ Cao hơn"),
        "bet_again":
            MessageLookupByLibrary.simpleMessage("Tái sử dụng đơn cược"),
        "bet_agree_new_odds":
            MessageLookupByLibrary.simpleMessage("Chấp Nhận Tỉ Lệ Mới"),
        "bet_all_clean": MessageLookupByLibrary.simpleMessage("Xoá Hết"),
        "bet_live": MessageLookupByLibrary.simpleMessage("Trực tiếp"),
        "bet_pay": MessageLookupByLibrary.simpleMessage("Est. Thanh toán"),
        "bet_pay_all": MessageLookupByLibrary.simpleMessage("Tổng Cược"),
        "bet_settled": MessageLookupByLibrary.simpleMessage("Đã đóng"),
        "bet_stop": MessageLookupByLibrary.simpleMessage("Bị gián đoạn"),
        "bet_submit": MessageLookupByLibrary.simpleMessage("Đặt cược Đơn"),
        "bet_submit_tips_one": MessageLookupByLibrary.simpleMessage(
            "Phiếu đặt cược của bạn không thể chứa kèo bị tạm cấm hoặc đóng "),
        "bet_submit_tips_two": MessageLookupByLibrary.simpleMessage(
            "Tỷ lệ đã thay đổi.Để đặt cược, trước tiên bạn cần xem lại và phê duyệt các thay đổi."),
        "bet_submit_two":
            MessageLookupByLibrary.simpleMessage("Đặt Cược Nhiều Trận"),
        "bet_tips_three": MessageLookupByLibrary.simpleMessage(
            "Nhiều đơn cược từ cùng một trận đấu không thể cấu thành đơn cược nhiều lần."),
        "bet_total_odds": MessageLookupByLibrary.simpleMessage("Tổng Tỉ Lệ"),
        "betting_casino_begin_game":
            MessageLookupByLibrary.simpleMessage("Bắt đầu chơi ngay !"),
        "billboard": MessageLookupByLibrary.simpleMessage("Người Chơi Lớn"),
        "bind_fail": MessageLookupByLibrary.simpleMessage("Liên kết thất bại"),
        "bind_pix_account":
            MessageLookupByLibrary.simpleMessage("Liên kết tài khoản PIX"),
        "binding_bank_card": MessageLookupByLibrary.simpleMessage(
            "Liên kết tài khoản ngân hàng"),
        "binding_bank_card_account_name":
            MessageLookupByLibrary.simpleMessage("Tên Chủ tài khoản "),
        "binding_bank_card_account_opening_branch":
            MessageLookupByLibrary.simpleMessage(
                "Địa chỉ mở tài khoản ngân hàng"),
        "binding_bank_card_all_bound_accounts":
            MessageLookupByLibrary.simpleMessage(
                "Tất cả các tài khoản liên kết"),
        "binding_bank_card_binding":
            MessageLookupByLibrary.simpleMessage("Liên kết"),
        "binding_bank_card_hint": MessageLookupByLibrary.simpleMessage(
            "Hãy cẩn thận trong việc xác định tên của bạn, việc thay đổi tên của bạn sẽ rất rắc rối."),
        "binding_bank_card_names_must_match":
            MessageLookupByLibrary.simpleMessage(
                "Họ tên phải thống nhất với nhau"),
        "binding_bank_card_number":
            MessageLookupByLibrary.simpleMessage("Số thẻ ngân hàng"),
        "binding_bank_card_please_enter":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập"),
        "binding_bank_card_select_bank":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn ngân hàng"),
        "binding_bindPIX": MessageLookupByLibrary.simpleMessage("Liên kết PIX"),
        "binding_cannotBeChangedAfterBind":
            MessageLookupByLibrary.simpleMessage(
                "Không thể sửa đổi sau khi liên kết"),
        "binding_confirmDeletion": MessageLookupByLibrary.simpleMessage(
            "Vui lòng xác nhận để xóa các phương thức rút tiền sau?"),
        "binding_pleaseEnterCorrect430DigitBankCardNumber": m0,
        "binding_pleaseEnterCorrectBankCardNumber":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập đúng số thẻ ngân hàng"),
        "binding_pleaseEnterCorrectName":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập đúng họ tên"),
        "binding_pleaseEnterCorrectWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập đúng địa chỉ rút tiền"),
        "binding_pleaseEnterThirdPartyAccount":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập tài khoản của bên thứ ba"),
        "binding_pleaseEnterWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập địa chỉ rút tiền"),
        "binding_pleaseEnterYourBankCardNumber":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập số thẻ ngân hàng"),
        "binding_pleaseSelectPIXAccountType":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng chọn loại tài khoản PIX"),
        "binding_selectAgreement":
            MessageLookupByLibrary.simpleMessage("Chọn giao thức"),
        "binding_setAsDefaultAddress": MessageLookupByLibrary.simpleMessage(
            "Có nên đặt làm địa chỉ mặc định hay không"),
        "binding_setAsDefaultCardNumber": MessageLookupByLibrary.simpleMessage(
            "Có nên cài đặt làm số thẻ mặc định hay không"),
        "binding_tripartite_account_holder_name":
            MessageLookupByLibrary.simpleMessage("Họ tên chủ tài khoản"),
        "binding_tripartite_account_type_please":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng chọn loại tài khoản"),
        "binding_your": m1,
        "button_save_text": MessageLookupByLibrary.simpleMessage("Lưu"),
        "buy_crypto": MessageLookupByLibrary.simpleMessage("Mua tiền điện tử"),
        "cardHolder": MessageLookupByLibrary.simpleMessage("Ví thẻ"),
        "casino_bet": MessageLookupByLibrary.simpleMessage("Đơn cược đánh bài"),
        "casino_des_one": MessageLookupByLibrary.simpleMessage(
            "Sòng bạc tiền điện tử trực tuyến hàng đầu"),
        "casino_des_two": MessageLookupByLibrary.simpleMessage(
            "Duyệt qua nhiều trò chơi sòng bạc đa dạng của chúng tôi và để Stake mang đến cho bạn trải nghiệm cờ bạc trực tuyến vừa công bằng vừa thú vị. Đặt cược trực tiếp từ trình duyệt của bạn vào các trò đánh bạc, sòng bạc trực tiếp, blackjack, baccarat, roulette và hàng nghìn trò chơi sòng bạc cổ điển bao gồm cả trò chơi Stake nguyên bản hấp dẫn nhất"),
        "casinoplatformName":
            MessageLookupByLibrary.simpleMessage("Tên trang bet"),
        "chaKanQuanBu": MessageLookupByLibrary.simpleMessage("Xem Tất Cả"),
        "change_area_code_tips_text": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi chỉ phục vụ các khu vực được liệt kê trong danh sách mã quốc gia có sẵn."),
        "change_area_code_title_text":
            MessageLookupByLibrary.simpleMessage("Mã vùng điện thoại quốc tế"),
        "change_fund_password":
            MessageLookupByLibrary.simpleMessage("Thay đổi mật khẩu quỹ"),
        "chat_room_online_text": m2,
        "check_box_input_code_tips":
            MessageLookupByLibrary.simpleMessage("Mã (Không bắt buộc)"),
        "check_my_betlist":
            MessageLookupByLibrary.simpleMessage("Xem qua đơn cược của tôi"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirm_button_text": MessageLookupByLibrary.simpleMessage("Xác định"),
        "confirm_fund_password":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu quỹ"),
        "confirm_new_password_text":
            MessageLookupByLibrary.simpleMessage("Xác Nhận Mật Khẩu Mới"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu"),
        "contact_customer_service":
            MessageLookupByLibrary.simpleMessage("Liên hệ chăm sóc khách hàng"),
        "contains_alphabet_text": MessageLookupByLibrary.simpleMessage(
            "Bao gồm chữ thường và chữ hoa"),
        "contains_one_more_number_text":
            MessageLookupByLibrary.simpleMessage("Ít nhất 1 số"),
        "copy_text_to_authenticator_app": MessageLookupByLibrary.simpleMessage(
            "Sao chép mã này vào ứng dụng xác thực của bạn"),
        "create_account_title": MessageLookupByLibrary.simpleMessage(
            "Điền thông tin chi tiết của bạn"),
        "create_account_title_text":
            MessageLookupByLibrary.simpleMessage("Tạo tài khoản"),
        "crypto_text": MessageLookupByLibrary.simpleMessage("Tiền điện tử"),
        "data_count_activity":
            MessageLookupByLibrary.simpleMessage("Hoạt động trao giải"),
        "data_count_data": MessageLookupByLibrary.simpleMessage("Thống kê"),
        "data_count_datacopy2":
            MessageLookupByLibrary.simpleMessage("Statistics"),
        "data_count_race": MessageLookupByLibrary.simpleMessage("Cuộc Đua"),
        "date_past_month":
            MessageLookupByLibrary.simpleMessage("Cách đây 30 ngày"),
        "date_past_today": MessageLookupByLibrary.simpleMessage("Hôm nay"),
        "date_past_week":
            MessageLookupByLibrary.simpleMessage("Cách đây 7 ngày"),
        "details": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "detailscopy1": MessageLookupByLibrary.simpleMessage("Chi tiết:"),
        "detailscopy2": MessageLookupByLibrary.simpleMessage("nạp tiền"),
        "done_text": MessageLookupByLibrary.simpleMessage("Hoàn thành"),
        "download_all_text": m3,
        "email_address_text": MessageLookupByLibrary.simpleMessage("Email"),
        "email_already_exists_text": MessageLookupByLibrary.simpleMessage(
            "Địa chủ hòm thư điện tử này đã được sử dụng"),
        "email_error_tips": MessageLookupByLibrary.simpleMessage(
            "Điều này chứa các ký tự email không hợp lệ"),
        "email_verification_code":
            MessageLookupByLibrary.simpleMessage("Mã xác minh email"),
        "error_title_text": MessageLookupByLibrary.simpleMessage("Lỗi"),
        "fairness": MessageLookupByLibrary.simpleMessage("Công bằng"),
        "feedback_back_title":
            MessageLookupByLibrary.simpleMessage("Quay lại trang cấp trên"),
        "feedback_bonus_title":
            MessageLookupByLibrary.simpleMessage("Chờ nhận phần thưởng "),
        "feedback_confirm_receive":
            MessageLookupByLibrary.simpleMessage("Xác nhận nhận được"),
        "feedback_content_sub": MessageLookupByLibrary.simpleMessage(
            "Mọi ý kiến ​​của bạn đều rất quan trọng đối với chúng tôi. Tất cả các ý kiến ​​có giá trị sẽ được thông qua. Sau khi được thông qua, các phần thưởng tiền mặt khác nhau sẽ được trao tùy theo mức độ quan trọng. Bạn có thể thoải mái đóng góp ý kiến!"),
        "feedback_content_title":
            MessageLookupByLibrary.simpleMessage("Nội dung: "),
        "feedback_customer_service": MessageLookupByLibrary.simpleMessage(
            "Dịch vụ chăm sóc khách hàng "),
        "feedback_expected_receive":
            MessageLookupByLibrary.simpleMessage("Dự kiến sẽ nhận được"),
        "feedback_img_sub": MessageLookupByLibrary.simpleMessage(
            "Chỉ có thể tải lên: định dạng png/jpg, tối đa 5 ảnh, tối đa một ảnh 1M"),
        "feedback_rate": m4,
        "feedback_receive_amount_1": MessageLookupByLibrary.simpleMessage(
            "Số tiền hiện tại bạn cần nhận là"),
        "feedback_receive_amount_2": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể tự do lựa chọn loại tiền bạn muốn nhận"),
        "feedback_receive_title": MessageLookupByLibrary.simpleMessage("Nhận"),
        "feedback_rule_sub": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi đã thiết lập một khoản tiền thưởng khổng lồ để thu thập phản hồi có thể tối ưu hoá hệ thống và chức năng, đồng thời mang đến cho bạn trải nghiệm tốt hơn! Sau khi được thông qua, tiền thưởng sẽ được trao dựa trên tầm quan trọng (trừ khi không được thông qua)"),
        "feedback_rule_title":
            MessageLookupByLibrary.simpleMessage("Quy tắc tiền thưởng"),
        "feedback_state_title":
            MessageLookupByLibrary.simpleMessage("Tình trạng phản hồi: "),
        "feedback_title_content":
            MessageLookupByLibrary.simpleMessage("Nội dung đóng góp"),
        "feedback_title_img": MessageLookupByLibrary.simpleMessage("Hình ảnh"),
        "feedback_transfer_await":
            MessageLookupByLibrary.simpleMessage("Chờ nhận lãnh"),
        "feedback_transfer_received":
            MessageLookupByLibrary.simpleMessage("Đã nhận lãnh"),
        "feedback_transfer_service": MessageLookupByLibrary.simpleMessage(
            "Chăm sóc khách đang chuyển tiền vào tài khoản"),
        "feedbacl_id_title":
            MessageLookupByLibrary.simpleMessage("ID phản hồi: "),
        "fiat_currency_Depositor_is_name":
            MessageLookupByLibrary.simpleMessage("Tên người nạp tiền"),
        "fiat_currency_channel_selection":
            MessageLookupByLibrary.simpleMessage("Lựa chọn kênh"),
        "fiat_currency_confirm_promptly_after_successful_transfer_to_avoid_scoring_delays":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng xác nhận ngay sau khi chuyển khoản thành công! Để tránh gây ra sự chậm trễ trong việc lên điểm của bạn!"),
        "fiat_currency_deposit_hint": MessageLookupByLibrary.simpleMessage(
            "Để đảm bảo thanh toán kịp thời, vui lòng đảm bảo nhập đúng tên người nạp tiền"),
        "fiat_currency_drawing_bank":
            MessageLookupByLibrary.simpleMessage("Ngân hàng rút tiền"),
        "fiat_currency_payee_name":
            MessageLookupByLibrary.simpleMessage("Họ tên người nhận tiền"),
        "fiat_currency_select_the_payment_bank":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng chọn ngân hàng thanh toán"),
        "fiat_currency_transfer_amount_must_match_the_order_amount":
            MessageLookupByLibrary.simpleMessage(
                "Số tiền chuyển phải thống nhất với số tiền của đơn"),
        "first_and_then_set_the_password": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên kết email của bạn trước và sau đó đặt mật khẩu quỹ"),
        "forget_password_text":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu"),
        "forgot_your_fund_password_go_to": MessageLookupByLibrary.simpleMessage(
            "Bạn quên mật khẩu quỹ của mình? Đi đến "),
        "fund_password_is_inconsistent": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu quỹ được nhập hai lần không chính xác"),
        "game_Category_no_results":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy kết quả nào."),
        "game_category_check_all":
            MessageLookupByLibrary.simpleMessage("Xem Tất cả các"),
        "game_category_clear_seach_results":
            MessageLookupByLibrary.simpleMessage("Xoá lịch sử tìm kiếm ("),
        "game_category_recent_search":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm gần đây"),
        "game_category_repair": MessageLookupByLibrary.simpleMessage(
            "Phòng chơi đang được bảo trì"),
        "game_category_search_standards": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu ít nhất 3 ký tự để tìm kiếm"),
        "game_detail_yue": MessageLookupByLibrary.simpleMessage("Số dư"),
        "game_live": MessageLookupByLibrary.simpleMessage(
            "Đánh bài với nhân viên trực tuyến"),
        "game_slots": MessageLookupByLibrary.simpleMessage("Điện tử"),
        "game_supplier": MessageLookupByLibrary.simpleMessage("Nhà cung cấp"),
        "get_verification_code":
            MessageLookupByLibrary.simpleMessage("Lấy mã xác minh"),
        "go_to_Binding":
            MessageLookupByLibrary.simpleMessage("Hãy liên kết trước"),
        "go_to_casino":
            MessageLookupByLibrary.simpleMessage("Đến khu vực sòng bạc"),
        "go_to_sports_book":
            MessageLookupByLibrary.simpleMessage("Đến trang cá cược thể thao"),
        "hCaptcha_text": MessageLookupByLibrary.simpleMessage("hCaptcha"),
        "hello_text": MessageLookupByLibrary.simpleMessage("Xin chào"),
        "homeChaKanQuanBu": m5,
        "home_blog": MessageLookupByLibrary.simpleMessage("Blog"),
        "home_challenge": MessageLookupByLibrary.simpleMessage("Thách đấu"),
        "home_forum": MessageLookupByLibrary.simpleMessage("Diễn đàn"),
        "home_game": MessageLookupByLibrary.simpleMessage("Trò chơi"),
        "home_recent_games": MessageLookupByLibrary.simpleMessage("Gần Đây"),
        "image_load_error":
            MessageLookupByLibrary.simpleMessage("Tải không thành công x_x"),
        "invalid_birthday_text": MessageLookupByLibrary.simpleMessage(
            "Ngày tháng năm sinh không phù hợp"),
        "kyc_address_prove_text":
            MessageLookupByLibrary.simpleMessage("Chứng minh địa chỉ"),
        "kyc_city_text": MessageLookupByLibrary.simpleMessage("Thành phố"),
        "kyc_family_name_text": MessageLookupByLibrary.simpleMessage("Họ"),
        "kyc_given_name_text": MessageLookupByLibrary.simpleMessage("Tên"),
        "kyc_job_text":
            MessageLookupByLibrary.simpleMessage("Chức vụ (công việc của bạn)"),
        "kyc_level_four_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng hoàn tất xác minh cấp ba trước"),
        "kyc_level_four_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng tải lên căn cước công dân của bạn trước. Tất cả tài liệu phải được đặt trên một mặt phẳng có bốn góc trong khung và mọi thông tin phải rõ ràng, dễ đọc."),
        "kyc_level_front_text":
            MessageLookupByLibrary.simpleMessage("Mặt trước"),
        "kyc_level_money_source_text":
            MessageLookupByLibrary.simpleMessage("Nguồn quỹ"),
        "kyc_level_number_four_text":
            MessageLookupByLibrary.simpleMessage("Cấp độ 4"),
        "kyc_level_number_one_text":
            MessageLookupByLibrary.simpleMessage("Cấp độ 1"),
        "kyc_level_number_three_text":
            MessageLookupByLibrary.simpleMessage("Cấp độ 3"),
        "kyc_level_number_two_text":
            MessageLookupByLibrary.simpleMessage("Cấp độ 2"),
        "kyc_level_one_tips_text": MessageLookupByLibrary.simpleMessage(
            "Xác minh cấp 1 có thể được cập nhật sau nếu thông tin chi tiết của bạn thay đổi"),
        "kyc_level_personal_id_text":
            MessageLookupByLibrary.simpleMessage("Căn cước công dân"),
        "kyc_level_reverse_text":
            MessageLookupByLibrary.simpleMessage("Mặt sau"),
        "kyc_level_there_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng hoàn tất xác minh cấp hai trước"),
        "kyc_level_there_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng tải lên căn cước công dân của bạn trước. Tất cả tài liệu phải được đặt trên một mặt phẳng có bốn góc trong khung và mọi thông tin phải rõ ràng, dễ đọc."),
        "kyc_level_two_tips1_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng hoàn tất xác minh cấp độ đầu tiên"),
        "kyc_level_two_tips2_text": MessageLookupByLibrary.simpleMessage(
            "Vui lòng tải lên căn cước công dân của bạn trước. Tất cả tài liệu phải được đặt trên một mặt phẳng có bốn góc trong khung và mọi thông tin phải rõ ràng, dễ đọc."),
        "kyc_level_verify_title_text":
            MessageLookupByLibrary.simpleMessage("Xác minh"),
        "kyc_live_place_text":
            MessageLookupByLibrary.simpleMessage("Nơi ở hiện tại"),
        "kyc_nationality_text":
            MessageLookupByLibrary.simpleMessage("Quốc gia"),
        "kyc_postal_code_text":
            MessageLookupByLibrary.simpleMessage("Mã bưu điện"),
        "kyc_security_tips_text": MessageLookupByLibrary.simpleMessage(
            "Tất cả dữ liệu sẽ được lưu trữ và mã hóa an toàn"),
        "kyc_type_support_text": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi chấp nhận các loại tệp: png, jpg, pdf"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "least_character_text": m6,
        "live_support":
            MessageLookupByLibrary.simpleMessage("Hỗ Trợ Trực Tuyến"),
        "login_bottom_protocol_text": m7,
        "login_text_field_account_tips":
            MessageLookupByLibrary.simpleMessage("Email hoặc Tên đăng nhập"),
        "login_text_field_password_tips":
            MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "login_text_other_use": MessageLookupByLibrary.simpleMessage("HOẶC"),
        "logout_text": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "max_character_limit_text": m8,
        "menu_odds": MessageLookupByLibrary.simpleMessage("Tỉ lệ cược"),
        "message_read": MessageLookupByLibrary.simpleMessage("Đã xem"),
        "message_send_button_text": MessageLookupByLibrary.simpleMessage("Lưu"),
        "message_unread": MessageLookupByLibrary.simpleMessage("Chưa đọc"),
        "minimum_character_limit_text": m9,
        "monthly_text": MessageLookupByLibrary.simpleMessage("Tháng "),
        "multiple_bet": MessageLookupByLibrary.simpleMessage("Nhiều"),
        "must_over_18_year_text":
            MessageLookupByLibrary.simpleMessage("Bạn phải từ 18 tuổi trở lên"),
        "new_password_text":
            MessageLookupByLibrary.simpleMessage("Mật Khẩu Mới"),
        "newcomer_discount_tips_text": MessageLookupByLibrary.simpleMessage(
            "Ưu đãi mới chỉ có hiệu lực trong 24 giờ sau khi đăng ký"),
        "no_account_tips_text":
            MessageLookupByLibrary.simpleMessage("Không có tài khoản? "),
        "no_crypto": MessageLookupByLibrary.simpleMessage(
            "Không có tiền điện tử? Không vấn đề"),
        "no_entries": MessageLookupByLibrary.simpleMessage("Chưa có dữ liệu"),
        "no_odds_changes_accepted": MessageLookupByLibrary.simpleMessage(
            "Không Chấp Nhận Tỉ Lệ Thay Đổi"),
        "notification": MessageLookupByLibrary.simpleMessage("Thông báo"),
        "notifs_announcement":
            MessageLookupByLibrary.simpleMessage("Thông báo"),
        "notifs_as_read":
            MessageLookupByLibrary.simpleMessage("Đánh dấu tất cả là đã đọc"),
        "notifs_available":
            MessageLookupByLibrary.simpleMessage("Không có thông báo nào"),
        "notifs_available_tip": MessageLookupByLibrary.simpleMessage(
            "Các tương tác của bạn sẽ hiện thị ở đây"),
        "notifs_content_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage(
                "Khoản tiền gửi %s %s của bạn đã được xử lý thành công"),
        "notifs_content_deposit_pending": MessageLookupByLibrary.simpleMessage(
            "Khoản tiền gửi %s %s của bạn đã được đăng ký và đang chờ xác nhận"),
        "notifs_insert_feedback":
            MessageLookupByLibrary.simpleMessage("Tạo sự phản hồi"),
        "notifs_marquee": MessageLookupByLibrary.simpleMessage("Đèn kéo quân"),
        "notifs_my_feedback":
            MessageLookupByLibrary.simpleMessage("Phản hồi của tôi"),
        "notifs_new": MessageLookupByLibrary.simpleMessage("Phiên bản mới"),
        "notifs_rewarded_feedback":
            MessageLookupByLibrary.simpleMessage("Phản hồi có khen thưởng"),
        "notifs_site_message":
            MessageLookupByLibrary.simpleMessage("Thông báo nội bộ"),
        "notifs_title_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage("Đã xác nhận nạp tiền"),
        "notifs_title_deposit_pending":
            MessageLookupByLibrary.simpleMessage("Đang chờ nạp tiền"),
        "odds_american": MessageLookupByLibrary.simpleMessage("American"),
        "odds_decimal": MessageLookupByLibrary.simpleMessage("Số thập phân"),
        "odds_fractional": MessageLookupByLibrary.simpleMessage("Phân số"),
        "odds_hong_kong": MessageLookupByLibrary.simpleMessage("Hong Kong"),
        "odds_indonesian": MessageLookupByLibrary.simpleMessage("Indonesian"),
        "odds_malaysian": MessageLookupByLibrary.simpleMessage("Malaysian"),
        "offerrs_redeem_bonus_drop":
            MessageLookupByLibrary.simpleMessage("Đổi phần thưởng airdrop"),
        "offers": MessageLookupByLibrary.simpleMessage("Ưu đãi"),
        "offers_code": MessageLookupByLibrary.simpleMessage("Mã"),
        "offers_redeem_body": MessageLookupByLibrary.simpleMessage(
            "Nhận mã thưởng airdrop trên các nền tảng truyền thông xã hội của chúng tôi như Twitter và Telegram"),
        "offers_welcome_offer":
            MessageLookupByLibrary.simpleMessage("Thêm ưu đãi mới"),
        "offers_welcome_offer_body": MessageLookupByLibrary.simpleMessage(
            "Ưu đãi mới chỉ có hiệu lực trong 24 giờ sau khi đăng ký"),
        "old_password_text":
            MessageLookupByLibrary.simpleMessage("Mật Khẩu Cũ"),
        "only_supports_6_digit_pure_numbers":
            MessageLookupByLibrary.simpleMessage(
                "Chỉ hỗ trợ số nguyên có 6 chữ số"),
        "original_fund_password":
            MessageLookupByLibrary.simpleMessage("Mật khẩu quỹ gốc"),
        "password_can_not_be_blank": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu không được bỏ trống"),
        "password_contains_uppercase_and_lowercase_tips":
            MessageLookupByLibrary.simpleMessage(
                "Mật khẩu phải bao gồm ký tự viết thường và viết hoa"),
        "password_has_been_updated":
            MessageLookupByLibrary.simpleMessage("Sửa mật khẩu thành công"),
        "password_required_characters": m10,
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Chi tiết thanh toán"),
        "phone_number_text":
            MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "please_input_account_tips":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập tài khoản"),
        "please_input_birthday_tips": MessageLookupByLibrary.simpleMessage(
            "Xin vui lòng nhập ngày sinh của bạn"),
        "please_input_email_tips":
            MessageLookupByLibrary.simpleMessage("Trường này là bắt buộc"),
        "please_input_message":
            MessageLookupByLibrary.simpleMessage("Nhập tin nhắn của bạn"),
        "please_input_password_tips":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập mật khẩu"),
        "please_input_user_name_tips":
            MessageLookupByLibrary.simpleMessage("Vui Lòng nhập tên tài khoản"),
        "please_join_at_tips": MessageLookupByLibrary.simpleMessage(
            "Vui lòng thêm biểu tượng “@” vào địa chỉ email của bạn"),
        "prevent_other_people_look":
            MessageLookupByLibrary.simpleMessage("Không để ai xem cái này!"),
        "privacy_body_community_title_text":
            MessageLookupByLibrary.simpleMessage("Cộng đồng"),
        "privacy_body_race_switch_tips_text": MessageLookupByLibrary.simpleMessage(
            "Những người chơi khác sẽ không thể xem thống kê cuộc đua của bạn"),
        "privacy_body_sale_title_text":
            MessageLookupByLibrary.simpleMessage("Tiếp thị "),
        "privacy_body_statistics_switch_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Những người dùng khác sẽ không thể xem số liệu thống kê thắng, thua và đặt cược của bạn"),
        "privacy_body_statistics_switch_title_text":
            MessageLookupByLibrary.simpleMessage("Ẩn tất cả thống kê của bạn"),
        "privacy_body_stealth_switch_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Cược của bạn sẽ không xuất hiện trên phần đặt cược công khai và bản xem trước đặt cược"),
        "privacy_body_stealth_switch_title_text":
            MessageLookupByLibrary.simpleMessage("Bật Ẩn Danh"),
        "privacy_body_switch_red_rain_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Không nhận mưa trên kênh chát"),
        "privacy_body_switch_red_rain_title_text":
            MessageLookupByLibrary.simpleMessage("Không nhận mưa"),
        "privacy_body_switch_sale_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Trạng thái đăng ký nhận email tiếp thị hoặc ưu đãi"),
        "privacy_body_switch_sale_title_text":
            MessageLookupByLibrary.simpleMessage("Nhận tiếp thị qua email"),
        "privacy_body_take_effect_tips_text":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng cho phép tối đa 30 giây để cập nhật có hiệu lực."),
        "privacy_body_tips_text": MessageLookupByLibrary.simpleMessage(
            "Quyền riêng tư của người dùng là một trong những giá trị cốt lõi của Meibo. Các cài đặt này cho phép bạn ẩn danh hoàn toàn với những người chơi còn lại."),
        "privacy_body_title_text":
            MessageLookupByLibrary.simpleMessage("Riêng tư"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Chính Sách Bảo Mật"),
        "privacy_policy_text":
            MessageLookupByLibrary.simpleMessage("Thỏa thuận bảo mật"),
        "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
        "promotions": MessageLookupByLibrary.simpleMessage("Khuyến mãi"),
        "race_leaderboard":
            MessageLookupByLibrary.simpleMessage("Bảng xếp hạng cuộc đua"),
        "random_text_1": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi đã gửi email khôi phục tài khoản tới\n"),
        "random_text_10": MessageLookupByLibrary.simpleMessage("Tháng hai"),
        "random_text_100": MessageLookupByLibrary.simpleMessage("Loại tiền tệ"),
        "random_text_1000":
            MessageLookupByLibrary.simpleMessage("Phong Bì Tối Đa "),
        "random_text_1001": MessageLookupByLibrary.simpleMessage("Rất tiếc"),
        "random_text_1002": MessageLookupByLibrary.simpleMessage(
            "Phong bì trận này đã bị nhận hết."),
        "random_text_1003": MessageLookupByLibrary.simpleMessage(
            "Phong bì trận này đã thạm gia."),
        "random_text_1004": MessageLookupByLibrary.simpleMessage(
            "Sự kiện chưa bắt đầu, vui lòng thử lại sau."),
        "random_text_1005":
            MessageLookupByLibrary.simpleMessage("Gợi ý sự kiện "),
        "random_text_1006": MessageLookupByLibrary.simpleMessage("Mỗi ngày "),
        "random_text_1007": MessageLookupByLibrary.simpleMessage("Mỗi lần"),
        "random_text_1008":
            MessageLookupByLibrary.simpleMessage("Tối thiểu 100.00 rút tiền "),
        "random_text_1009": MessageLookupByLibrary.simpleMessage(
            "Gửi lời mời đến người chơi ngẫu nhiên "),
        "random_text_101":
            MessageLookupByLibrary.simpleMessage("Dự kiến nhận được:"),
        "random_text_1010":
            MessageLookupByLibrary.simpleMessage("Gửi tin nhắn "),
        "random_text_1011":
            MessageLookupByLibrary.simpleMessage("Tiến độ nhận"),
        "random_text_1012": MessageLookupByLibrary.simpleMessage(
            "Địa chỉ email/ Số điện thoại"),
        "random_text_1013": MessageLookupByLibrary.simpleMessage(
            "Chưa xác minh số điện thoại hoặc tài khoản email, vui lòng "),
        "random_text_1014":
            MessageLookupByLibrary.simpleMessage("Số điện thoại không hợp lệ "),
        "random_text_1015": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại định dạng bị lỗi "),
        "random_text_1016": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng/đăng nhập với email "),
        "random_text_1017": MessageLookupByLibrary.simpleMessage(
            "Đăng nhập bằng số điện thoại"),
        "random_text_1018":
            MessageLookupByLibrary.simpleMessage("Quên Mật Khẩu?"),
        "random_text_1019":
            MessageLookupByLibrary.simpleMessage("Người dùng mới? "),
        "random_text_102":
            MessageLookupByLibrary.simpleMessage("Ví hoa hồng và số dư"),
        "random_text_1020":
            MessageLookupByLibrary.simpleMessage("Tạo tài khoản "),
        "random_text_1021":
            MessageLookupByLibrary.simpleMessage("Đăng nhập trực tiếp "),
        "random_text_1022": MessageLookupByLibrary.simpleMessage("Email"),
        "random_text_1023":
            MessageLookupByLibrary.simpleMessage("Tên người dùng 3-14 chữ "),
        "random_text_1024":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập mã giới thiệu"),
        "random_text_1025": MessageLookupByLibrary.simpleMessage("Tôi đồng ý "),
        "random_text_1026":
            MessageLookupByLibrary.simpleMessage("Thoả thuận người dùng "),
        "random_text_1027": MessageLookupByLibrary.simpleMessage(
            "và xác nhận tôi đã đủ 18 tuổi"),
        "random_text_1028": MessageLookupByLibrary.simpleMessage(
            "Thoả thuận người dùng là bắt buộc "),
        "random_text_1029": MessageLookupByLibrary.simpleMessage(
            "Tôi đồng ý nhận thông tin khuyến mãi của Win6"),
        "random_text_103":
            MessageLookupByLibrary.simpleMessage("Quy đổi tổng tỷ giá nhận xu"),
        "random_text_1030":
            MessageLookupByLibrary.simpleMessage("Đăng ký OAuth"),
        "random_text_1031": MessageLookupByLibrary.simpleMessage(
            "Vui lòng điền thông tin chi tiết của bạn "),
        "random_text_1032":
            MessageLookupByLibrary.simpleMessage("Thoả thuận người dùng "),
        "random_text_1033":
            MessageLookupByLibrary.simpleMessage("Thư xác thực "),
        "random_text_1034": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập 6 số xác thực đã được gửi đến justin888@gmail.com, mã xác thực này có hiệu lực trong 5 phút"),
        "random_text_1035": MessageLookupByLibrary.simpleMessage(
            "Không nhận được mã xác minh?"),
        "random_text_1036":
            MessageLookupByLibrary.simpleMessage("Điện thoại xác thực "),
        "random_text_1037": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập 6 số xác thực đã được gửi đến số +86 18988888888, mã xác thực này có hiệu lực trong 5 phút"),
        "random_text_1038":
            MessageLookupByLibrary.simpleMessage("Địa chỉ email "),
        "random_text_1039": MessageLookupByLibrary.simpleMessage(
            "Tin nhắn sẽ được gửi đến điện thoại của bạn nếu bạn không nhận được mã xác minh sau nhiều lần thử"),
        "random_text_1040": MessageLookupByLibrary.simpleMessage(
            "Tin nhắn sẽ được gửi đến hòm thư điện tử của bạn nếu bạn không nhận được mã xác minh sau nhiều lần thử"),
        "random_text_1041": MessageLookupByLibrary.simpleMessage(
            "1. Kiểm tra xem điện thoại của bạn có phải đang tắt máy "),
        "random_text_1042": MessageLookupByLibrary.simpleMessage(
            "1. Kiểm tra xem email của bạn có đúng không "),
        "random_text_1043": MessageLookupByLibrary.simpleMessage(
            "2. Kiểm tra xem tin nhắn có phải đang trong thùng rác "),
        "random_text_1044": MessageLookupByLibrary.simpleMessage(
            "2. Kiểm tra xem bưu kiện có phải đang trong thùng rác email "),
        "random_text_1045": MessageLookupByLibrary.simpleMessage(
            "3. Thông tin này có thể gửi trễ trong vài phút, vui lòng thử lại sau 10 phút nữa "),
        "random_text_1046":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập mã xác thực"),
        "random_text_1047":
            MessageLookupByLibrary.simpleMessage("Xác minh điện thoại "),
        "random_text_1048": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập mã xác minh gồm 6 chữ số được gửi tới "),
        "random_text_1049": MessageLookupByLibrary.simpleMessage(
            ". Mã xác minh này có hiệu lực trong 5 phút."),
        "random_text_105":
            MessageLookupByLibrary.simpleMessage("Thời gian thống kê"),
        "random_text_1050": MessageLookupByLibrary.simpleMessage("Gửi lại "),
        "random_text_1051": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu của bạn phải chứa ít nhất 8 ký tự "),
        "random_text_1052": MessageLookupByLibrary.simpleMessage(
            " , mã xác thực này có hiệu lực trong 5 phút"),
        "random_text_1053":
            MessageLookupByLibrary.simpleMessage("Giao nộp thành công "),
        "random_text_1054":
            MessageLookupByLibrary.simpleMessage("Thông qua xét duyệt "),
        "random_text_1055":
            MessageLookupByLibrary.simpleMessage("Từ chối xét duyệt"),
        "random_text_1056": MessageLookupByLibrary.simpleMessage(
            "Sự kiện này chưa bắt đầu, vui lòng thử lại sau "),
        "random_text_1057": MessageLookupByLibrary.simpleMessage(
            "Bạn tạm thời chưa đáp ứng đủ điều kiện nhận lĩnh"),
        "random_text_1058": MessageLookupByLibrary.simpleMessage("Đang xin "),
        "random_text_1059": MessageLookupByLibrary.simpleMessage(
            "Tiền hoàn của bạn đang trong quá trình xin "),
        "random_text_106":
            MessageLookupByLibrary.simpleMessage("Số lượng đơn cược"),
        "random_text_1060":
            MessageLookupByLibrary.simpleMessage("Lỗi không xác định"),
        "random_text_1061":
            MessageLookupByLibrary.simpleMessage("Cấp hiện tại "),
        "random_text_1062": MessageLookupByLibrary.simpleMessage(
            "Khoảng cách đến cấp tiếp theo cần "),
        "random_text_1063":
            MessageLookupByLibrary.simpleMessage("Hoàn tiền lợi nhuận âm "),
        "random_text_1064": MessageLookupByLibrary.simpleMessage(
            "Lượt chơi tuần này của bạn sẽ đạt được mức cao nhất "),
        "random_text_1065": MessageLookupByLibrary.simpleMessage("% hoàn tiền"),
        "random_text_1066":
            MessageLookupByLibrary.simpleMessage("Sau khi kết thúc"),
        "random_text_1067":
            MessageLookupByLibrary.simpleMessage("Có thể nhận trong ngày "),
        "random_text_1068": MessageLookupByLibrary.simpleMessage("Tổng cộng "),
        "random_text_1069": MessageLookupByLibrary.simpleMessage("Lớn hơn "),
        "random_text_107": MessageLookupByLibrary.simpleMessage("Số tiền nạp"),
        "random_text_1070": MessageLookupByLibrary.simpleMessage("Thấp hơn "),
        "random_text_1071": MessageLookupByLibrary.simpleMessage("Cấp cao "),
        "random_text_1072": MessageLookupByLibrary.simpleMessage(
            "Số tiền đã được gửi đến ví tiền tệ tương ứng của bạn"),
        "random_text_1073": MessageLookupByLibrary.simpleMessage(
            "Tạm không có tiền giảm giá có thể lĩnh"),
        "random_text_1074": MessageLookupByLibrary.simpleMessage(
            "Đáp ứng đủ yêu cầu về tích điểm để thăng cấp VIP bạn lập tức có thể lên cấp VIP tương ứng và nhận được phần thưởng khuyến mãi tương ứng. Nếu bạn thăng cấp liên tiếp, bạn có thể nhận được tất cả tiền thưởng khuyến mãi khi nâng cấp."),
        "random_text_1075": MessageLookupByLibrary.simpleMessage(
            "Trong vòng 90 ngày đổ lại đáp ứng đủ yêu cầu tích điểm để giữ cấp có thể giữ nguyên cấp bậc VIP hiện tại. Nếu trong 90 ngày không đáp ứng yêu cầu tích điểm để giữ cấp thì cấp VIP của bạn sẽ bị hạ 1 bậc."),
        "random_text_1076": MessageLookupByLibrary.simpleMessage(
            "Cấp hiện tại đã đạt mức cao nhất"),
        "random_text_1077":
            MessageLookupByLibrary.simpleMessage("Giữ cấp hiện tại cần "),
        "random_text_1078": MessageLookupByLibrary.simpleMessage(
            "Hướng dẫn sự kiện: tiền thưởng nhận trong sự kiện này sẽ dựa vào loại tiền tệ bạn chọn để phát thưởng, sau khi nhận thành công lần đầu hệ thống sẽ dựa vào loại tiền tệ bạn đã chọn để làm loại tiền tệ phát thưởng cố định."),
        "random_text_1079": MessageLookupByLibrary.simpleMessage("Email"),
        "random_text_107_copy":
            MessageLookupByLibrary.simpleMessage("Số tiền nạp"),
        "random_text_108": MessageLookupByLibrary.simpleMessage("(Số lần)"),
        "random_text_1080":
            MessageLookupByLibrary.simpleMessage("Mã vùng điện thoại "),
        "random_text_1081":
            MessageLookupByLibrary.simpleMessage("Nhận thêm càng nhiều lần "),
        "random_text_1082":
            MessageLookupByLibrary.simpleMessage("Cấp dưới tích luỹ nạp tiền "),
        "random_text_1083": MessageLookupByLibrary.simpleMessage(
            "Cấp dưới tích luỹ tiền vòng cược"),
        "random_text_1084": MessageLookupByLibrary.simpleMessage(
            "Số cấp dưới nạp tiền lần đầu "),
        "random_text_1085": MessageLookupByLibrary.simpleMessage(
            "Số cấp dưới có tiền vòng cược "),
        "random_text_1086":
            MessageLookupByLibrary.simpleMessage("Tự tích luỹ nạp tiền"),
        "random_text_1087":
            MessageLookupByLibrary.simpleMessage("Tự tích luỹ tiền vòng cược"),
        "random_text_1088":
            MessageLookupByLibrary.simpleMessage("Số lần tự nạp "),
        "random_text_1089": MessageLookupByLibrary.simpleMessage("Mời "),
        "random_text_109": MessageLookupByLibrary.simpleMessage("Số tiền rút"),
        "random_text_1090": MessageLookupByLibrary.simpleMessage("1 bạn tốt "),
        "random_text_1091":
            MessageLookupByLibrary.simpleMessage("Cấp dưới nạp tiền lần đầu "),
        "random_text_1092": MessageLookupByLibrary.simpleMessage(
            "Tiền vòng cược của cấp dưới "),
        "random_text_1093":
            MessageLookupByLibrary.simpleMessage("Tích luỹ nạp tiền"),
        "random_text_1094":
            MessageLookupByLibrary.simpleMessage("Tích luỹ tiền vòng cược"),
        "random_text_1095": MessageLookupByLibrary.simpleMessage("Đã mời "),
        "random_text_1096":
            MessageLookupByLibrary.simpleMessage("Cấp dưới đã nạp tiền "),
        "random_text_1097":
            MessageLookupByLibrary.simpleMessage("Cấp dưới đã cược tiền "),
        "random_text_1098": MessageLookupByLibrary.simpleMessage(
            "Cấp dưới đã nạp tiền lần đầu "),
        "random_text_1099": MessageLookupByLibrary.simpleMessage(
            "Số cấp dưới đã có tiền vòng cược "),
        "random_text_11": MessageLookupByLibrary.simpleMessage("Tháng ba"),
        "random_text_110": MessageLookupByLibrary.simpleMessage(
            "Chêch lệch số tiền nạp và rút tiền"),
        "random_text_1100":
            MessageLookupByLibrary.simpleMessage("Đã nạp tiền "),
        "random_text_1101":
            MessageLookupByLibrary.simpleMessage("Đã cược tiền "),
        "random_text_1102":
            MessageLookupByLibrary.simpleMessage("Đã tích luỹ lời mời "),
        "random_text_1103": MessageLookupByLibrary.simpleMessage(
            "Cấp duới đã tích luỹ nạp tiền"),
        "random_text_1104": MessageLookupByLibrary.simpleMessage(
            "Cấp dưới đã tích luỹ tiền vòng cược"),
        "random_text_1105": MessageLookupByLibrary.simpleMessage(
            "Cấp dưới đã tích luỹ nạp tiền lần đầu "),
        "random_text_1106":
            MessageLookupByLibrary.simpleMessage("Đã tích luỹ nạp tiền "),
        "random_text_1107":
            MessageLookupByLibrary.simpleMessage("Đã tích luỹ tiền cược "),
        "random_text_1108":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng "),
        "random_text_1109":
            MessageLookupByLibrary.simpleMessage("Lần rút thưởng "),
        "random_text_111":
            MessageLookupByLibrary.simpleMessage("(Số dư hiện tại)"),
        "random_text_1110": MessageLookupByLibrary.simpleMessage("Đã thưởng "),
        "random_text_1111": MessageLookupByLibrary.simpleMessage(
            "Người dùng này chưa hiển thị số liệu thống kê "),
        "random_text_1112": MessageLookupByLibrary.simpleMessage("An toàn "),
        "random_text_1113":
            MessageLookupByLibrary.simpleMessage("Bình thường "),
        "random_text_1114": MessageLookupByLibrary.simpleMessage("Rủi ro "),
        "random_text_1115":
            MessageLookupByLibrary.simpleMessage("Mã xác minh điện thoại "),
        "random_text_1116":
            MessageLookupByLibrary.simpleMessage("Không có điện thoại?"),
        "random_text_1117":
            MessageLookupByLibrary.simpleMessage("Không có email?"),
        "random_text_1118":
            MessageLookupByLibrary.simpleMessage("Sử dụng email"),
        "random_text_1119":
            MessageLookupByLibrary.simpleMessage("Sử dụng điện thoại "),
        "random_text_112":
            MessageLookupByLibrary.simpleMessage("Ngày thống kê"),
        "random_text_1120":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tích luỹ"),
        "random_text_1121":
            MessageLookupByLibrary.simpleMessage("Thưởng thăng cấp "),
        "random_text_1122": MessageLookupByLibrary.simpleMessage("Tên thật "),
        "random_text_1123":
            MessageLookupByLibrary.simpleMessage("Thẻ ngân hàng "),
        "random_text_1124": MessageLookupByLibrary.simpleMessage("Họ tên "),
        "random_text_1125":
            MessageLookupByLibrary.simpleMessage("Tài khoản rút tiền "),
        "random_text_1126":
            MessageLookupByLibrary.simpleMessage("Địa chỉ ví tiền "),
        "random_text_1127":
            MessageLookupByLibrary.simpleMessage("Ràng buộc tiền điện tử "),
        "random_text_1128": MessageLookupByLibrary.simpleMessage(
            "Vui lòng điền trang web mở tài khoản "),
        "random_text_1129": MessageLookupByLibrary.simpleMessage(
            "Vui lòng điền CPF chính xác "),
        "random_text_113":
            MessageLookupByLibrary.simpleMessage("Tổng số tiền nhận được"),
        "random_text_1130":
            MessageLookupByLibrary.simpleMessage("Loại tiền nạp"),
        "random_text_1131":
            MessageLookupByLibrary.simpleMessage("Loại tiền rút"),
        "random_text_1132": MessageLookupByLibrary.simpleMessage("Tặng +"),
        "random_text_1133": MessageLookupByLibrary.simpleMessage("Biểu tượng"),
        "random_text_1134":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập họ tên"),
        "random_text_1135":
            MessageLookupByLibrary.simpleMessage("Chọn phương thức thanh toán"),
        "random_text_1136": MessageLookupByLibrary.simpleMessage("Chọn mạng "),
        "random_text_1137":
            MessageLookupByLibrary.simpleMessage("Chọn ngân hàng"),
        "random_text_1138":
            MessageLookupByLibrary.simpleMessage("Hiển thị thêm "),
        "random_text_1139": MessageLookupByLibrary.simpleMessage("Nội tệ "),
        "random_text_114":
            MessageLookupByLibrary.simpleMessage("Hoàn lại tiền"),
        "random_text_1140": MessageLookupByLibrary.simpleMessage(
            "Vui lòng ràng buộc thông tin thanh toán trước "),
        "random_text_1141":
            MessageLookupByLibrary.simpleMessage("Địa chỉ rút tiền"),
        "random_text_1142":
            MessageLookupByLibrary.simpleMessage("Điền tài khoản thu tiền  "),
        "random_text_1143":
            MessageLookupByLibrary.simpleMessage("Ngân hàng rút tiền"),
        "random_text_1144": MessageLookupByLibrary.simpleMessage("Số tiền rút"),
        "random_text_1145":
            MessageLookupByLibrary.simpleMessage("Số điện thoại chưa đăng ký"),
        "random_text_1146":
            MessageLookupByLibrary.simpleMessage("Email chưa đăng ký"),
        "random_text_1147": MessageLookupByLibrary.simpleMessage(
            "Vui lòng đồng ý với Thoả thuận người dùng"),
        "random_text_1148": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập 6 số xác minh "),
        "random_text_1149":
            MessageLookupByLibrary.simpleMessage("Mã xác minh chính xác"),
        "random_text_115":
            MessageLookupByLibrary.simpleMessage("Hoa hồng đại lý"),
        "random_text_1150": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu đăng nhập sửa thành công"),
        "random_text_1151": MessageLookupByLibrary.simpleMessage(
            "Đề cập đến việc phát triển theo chiều dọc của hội viên, thống nhất gọi là Đội nhóm trực thuộc. \n\n(1) B1, B2, B3 cống hiến cho A: (80,000+50,000+30,000) x0.20=3200.\n\n(2) C1, C2 cống hiến cho B1: (100,000+40,000)x0.018=2520.\n\n(3) C3 cống hiến cho B3: 610,000x0.02=12200."),
        "random_text_1152": MessageLookupByLibrary.simpleMessage(
            "Chỉ cấp dưới, cấp dưới của cấp dưới,... phát triển thành viên, thống nhất gọi là Đội nhóm khác. Công ty không hạn chế phát triển cấp dưới, cấu trúc thứ cấp được minh hoạ như sau.\n\n(1) Từ C1, C2 đến B1 tổng hiệu suất là 140,000, chỉ hưởng 0.018 tỷ kệ chiết khấu, mà A có tổng hiệu suất là 1010,000 hưởng 0.02 tỷ lệ chiết khấu. Vậy thì giữa A và B1 sẽ sinh ra chiết khấu chênh lệch là: 0.02-0.018=0.002 sự chênh lệch này là do C1 và C2 đóng góp một phần cho A, vậy nên C1 và C2 đóng góp cho A: (100,000+40,000)x0.002=280.\n\n(2) Từ C3 đến B3 tổng hiệu xuất là 710,000 hưởng 0.02 tỷ lệ chiết khấu, A tổng hiệu suất 1010,000 hưởng 0.02tỷ lệ chiết khấu. Vậy thì giữa A và B3 sẽ sinh ra chiết khấu chênh lệch là: 0.02-0.02=0 , C3 cống hiến cho A: 610,000x0=0."),
        "random_text_1153": MessageLookupByLibrary.simpleMessage(
            "(1) C3 mạnh gián tiếp làm cho A hưởng tỉ lệ hoa hồng cao hơn với tất cả các hiệu suất.  \n\n(2) Có thể do B2 khá lười không phát triển cấp dưới nên không thu lợi ích.  \n\n(3) Tuy B3 tham gia khá muộn và trực thuộc cấp dưới của A, nhưng cấp dưới C3 mạnh trực tiếp làm cho B3 hưởng tỉ lệ hoa hồng cao hơn, cho nên bất luận B3 tham gia vào thời gian nào, trực thuộc cấp dưới của ai và đang ở cấp mấy thì việc hưởng lợi sẽ không bị ảnh hưởng, đồng thời cũng không phải chịu thiệt vì là cấp dưới của người khác, phát triển cũng không bị hạn chế. \n\n(4) Đây là một hình thức đại lý hoàn toàn công bằng và khách quan, không một ai bị bỏ lại phía sau chỉ vì tham gia muộn."),
        "random_text_1154":
            MessageLookupByLibrary.simpleMessage("Bảng tỉ lệ hoa hồng như sau"),
        "random_text_1155":
            MessageLookupByLibrary.simpleMessage("Bắt buộc đạt đến"),
        "random_text_1156":
            MessageLookupByLibrary.simpleMessage("Mở khoá phòng chat "),
        "random_text_1157":
            MessageLookupByLibrary.simpleMessage("Gửi thất bại"),
        "random_text_1158": MessageLookupByLibrary.simpleMessage("Nguyên bản"),
        "random_text_1159": MessageLookupByLibrary.simpleMessage(
            "Bạn hiện tại không có tiền thưởng có thể lãnh"),
        "random_text_116": MessageLookupByLibrary.simpleMessage("Có"),
        "random_text_1160": MessageLookupByLibrary.simpleMessage(
            "Bạn hiện tại không có tiền giảm giá có thể lãnh"),
        "random_text_1161": MessageLookupByLibrary.simpleMessage(
            "Bạn bắt buộc phải xác minh số điện thoại trước mới được tiến hành rút tiền"),
        "random_text_1162": MessageLookupByLibrary.simpleMessage("Mã xác minh"),
        "random_text_1163": MessageLookupByLibrary.simpleMessage(
            "Loại tiền tệ đang giao dịch sẽ được chuyển đổi theo tỷ giá hối đoái thực trên thị trường"),
        "random_text_1164":
            MessageLookupByLibrary.simpleMessage("Mã vùng quốc tế"),
        "random_text_1165":
            MessageLookupByLibrary.simpleMessage("Mời bạn bè 1-10 người"),
        "random_text_1166":
            MessageLookupByLibrary.simpleMessage("Tặng 15/người"),
        "random_text_1167": MessageLookupByLibrary.simpleMessage("Chia sẻ"),
        "random_text_1168": MessageLookupByLibrary.simpleMessage("ID Cược"),
        "random_text_1169": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập nội dung phản hồi"),
        "random_text_117": MessageLookupByLibrary.simpleMessage("Không"),
        "random_text_1170":
            MessageLookupByLibrary.simpleMessage("Trung tâm thông báo"),
        "random_text_1171":
            MessageLookupByLibrary.simpleMessage("Loại hình PIX"),
        "random_text_1172": MessageLookupByLibrary.simpleMessage(
            "Vui lòng bắt đầu bằng chữ cái tiếng Anh"),
        "random_text_1173":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là"),
        "random_text_1174": MessageLookupByLibrary.simpleMessage("Chấp bóng"),
        "random_text_1175": MessageLookupByLibrary.simpleMessage("Ngày"),
        "random_text_1176":
            MessageLookupByLibrary.simpleMessage("Meibo an toàn"),
        "random_text_1177": MessageLookupByLibrary.simpleMessage("Mời bạn bè "),
        "random_text_1178":
            MessageLookupByLibrary.simpleMessage("Tạm thời không có phản hồi"),
        "random_text_1179":
            MessageLookupByLibrary.simpleMessage("MM Tháng DD Ngày"),
        "random_text_118": MessageLookupByLibrary.simpleMessage("Trực tuyến"),
        "random_text_1180": MessageLookupByLibrary.simpleMessage(
            "Chú ý: Vui lòng kiểm tra kỹ địa chỉ thanh toán, nhấn vào Tôi đã thanh toán khi hoàn tất"),
        "random_text_1181": MessageLookupByLibrary.simpleMessage("Mạng lưới"),
        "random_text_1182":
            MessageLookupByLibrary.simpleMessage("Địa chỉ nhận tiền "),
        "random_text_1183":
            MessageLookupByLibrary.simpleMessage("Số tiền thanh toán "),
        "random_text_1184":
            MessageLookupByLibrary.simpleMessage("Huỷ lệnh nạp tiền "),
        "random_text_1185":
            MessageLookupByLibrary.simpleMessage("Tôi đã thanh toán"),
        "random_text_1186":
            MessageLookupByLibrary.simpleMessage("Tên ngân hàng"),
        "random_text_1187":
            MessageLookupByLibrary.simpleMessage("Số tài khoản ngân hàng"),
        "random_text_1188":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn loại hình PIX"),
        "random_text_1189":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn tên ngân hàng"),
        "random_text_119":
            MessageLookupByLibrary.simpleMessage("Không trực tuyến"),
        "random_text_12": MessageLookupByLibrary.simpleMessage("Tháng tư"),
        "random_text_120": MessageLookupByLibrary.simpleMessage("lần"),
        "random_text_120_copy": MessageLookupByLibrary.simpleMessage("lần"),
        "random_text_121": MessageLookupByLibrary.simpleMessage(
            "Có phải nạp lần đầu hay không"),
        "random_text_122":
            MessageLookupByLibrary.simpleMessage("Lần đăng nhập gần đây"),
        "random_text_123":
            MessageLookupByLibrary.simpleMessage("Trạng thái trực tuyến"),
        "random_text_124": MessageLookupByLibrary.simpleMessage("Số lần"),
        "random_text_125": MessageLookupByLibrary.simpleMessage("Thể thao"),
        "random_text_126": MessageLookupByLibrary.simpleMessage("Kiểm tra"),
        "random_text_127":
            MessageLookupByLibrary.simpleMessage("Thời gian kết toán"),
        "random_text_128": MessageLookupByLibrary.simpleMessage("Loại hình"),
        "random_text_129": MessageLookupByLibrary.simpleMessage("Hiệu suất"),
        "random_text_13": MessageLookupByLibrary.simpleMessage("Tháng năm"),
        "random_text_132":
            MessageLookupByLibrary.simpleMessage("Trang tiếp theo "),
        "random_text_133": MessageLookupByLibrary.simpleMessage("Tìm kiếm:"),
        "random_text_134": MessageLookupByLibrary.simpleMessage(
            "Số lượng thành viên cấp dưới"),
        "random_text_135":
            MessageLookupByLibrary.simpleMessage("Đóng góp hoa hồng"),
        "random_text_136": MessageLookupByLibrary.simpleMessage("WeChat"),
        "random_text_137":
            MessageLookupByLibrary.simpleMessage("Hoa hồng tích lũy"),
        "random_text_138":
            MessageLookupByLibrary.simpleMessage("Hoa hồng nhận đã nhận được"),
        "random_text_139":
            MessageLookupByLibrary.simpleMessage("Hoa hồng gần đây"),
        "random_text_14": MessageLookupByLibrary.simpleMessage("Tháng sáu"),
        "random_text_140":
            MessageLookupByLibrary.simpleMessage("Tổng số đội nhóm"),
        "random_text_141": MessageLookupByLibrary.simpleMessage("1 người"),
        "random_text_142":
            MessageLookupByLibrary.simpleMessage("Hội viên trực thuộc"),
        "random_text_143":
            MessageLookupByLibrary.simpleMessage("Các hội viên khác"),
        "random_text_144":
            MessageLookupByLibrary.simpleMessage("Hiệu suất trực thuộc"),
        "random_text_145":
            MessageLookupByLibrary.simpleMessage("Các hiệu suất khác"),
        "random_text_146": MessageLookupByLibrary.simpleMessage("Cược phụ"),
        "random_text_147":
            MessageLookupByLibrary.simpleMessage("Số tiền đặt cược hợp lệ"),
        "random_text_148":
            MessageLookupByLibrary.simpleMessage("Tổng đơn cược"),
        "random_text_149":
            MessageLookupByLibrary.simpleMessage("999,999,999 đơn"),
        "random_text_15": MessageLookupByLibrary.simpleMessage("Tháng bảy "),
        "random_text_150":
            MessageLookupByLibrary.simpleMessage("Tổng thắng/thua"),
        "random_text_151":
            MessageLookupByLibrary.simpleMessage("Đã sao chép thành công"),
        "random_text_152":
            MessageLookupByLibrary.simpleMessage("Thông tin ưu đãi"),
        "random_text_153": MessageLookupByLibrary.simpleMessage("Nhiều hơn"),
        "random_text_154":
            MessageLookupByLibrary.simpleMessage("Nhấn để lưu mã QR"),
        "random_text_155":
            MessageLookupByLibrary.simpleMessage("Liên kết của tôi"),
        "random_text_156": MessageLookupByLibrary.simpleMessage("Bấm vào đây"),
        "random_text_157":
            MessageLookupByLibrary.simpleMessage("Tổng hiệu suất"),
        "random_text_158": MessageLookupByLibrary.simpleMessage("1010K"),
        "random_text_159":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tổng đại lý"),
        "random_text_16": MessageLookupByLibrary.simpleMessage("Tháng tám"),
        "random_text_160": MessageLookupByLibrary.simpleMessage("160K"),
        "random_text_161": MessageLookupByLibrary.simpleMessage("Đóng góp"),
        "random_text_162": MessageLookupByLibrary.simpleMessage("850K"),
        "random_text_163": MessageLookupByLibrary.simpleMessage("Trực thuộc"),
        "random_text_164": MessageLookupByLibrary.simpleMessage("Đóng góp cho"),
        "random_text_166": MessageLookupByLibrary.simpleMessage(" và "),
        "random_text_167":
            MessageLookupByLibrary.simpleMessage("Tổng hiệu suất của cấp dưới"),
        "random_text_168": MessageLookupByLibrary.simpleMessage("140K \n"),
        "random_text_169": MessageLookupByLibrary.simpleMessage("Thưởng thức"),
        "random_text_17": MessageLookupByLibrary.simpleMessage("Tháng chín"),
        "random_text_170": MessageLookupByLibrary.simpleMessage(""),
        "random_text_171": MessageLookupByLibrary.simpleMessage(
            "B1 có mức cược hợp lệ là 80K"),
        "random_text_172":
            MessageLookupByLibrary.simpleMessage("Ví dụ như sau:"),
        "random_text_173": MessageLookupByLibrary.simpleMessage(
            "Các khoản giảm giá trên trang này dựa trên các cược hợp lệ, giả sử tỷ lệ hoàn tiền được hiển thị trong bảng ở góc trên bên trái. A là người đầu tiên phát hiện ra cơ hội kinh doanh trên địa điểm này và ngay lập tức phát triển B1, B2, B3, B1 sau đó phát triển C1 và C2, B2 không có cấp dưới, còn B3 chỉ phát triển C3 tương đối mạnh. \nVài ngày sau, mức đặt cược hiệu quả của B1 là 80.000, mức đặt cược hiệu quả của B2 là 50.000, mức đặt cược hiệu quả của B3 là 30.000, mức đặt cược hiệu quả của C1 là 100.000 và mức đặt cược hiệu quả của C2 là 40.000, mức đặt cược hiệu quả của C3 đạt 710.000, khi đó tổng thành tích của B1 đến từ C1 và C2 là 140.000 và tỷ lệ giảm giá tương ứng là 80/10.000; Hiệu suất của B2 không có cấp dưới là 0; C3 cấp dưới của B3 rất mạnh và tổng hiệu suất của nó là 710.000, tương ứng với Tỷ lệ giảm giá là 1 triệu/10.000; A có 160.000 từ đội trực tiếp và 850.000 từ các đội khác, tổng hiệu suất là 1,01 triệu và tỷ lệ giảm giá tương ứng là 1 triệu/10.000. \nKhi đó thu nhập giữa họ được tính như sau: \n\n1."),
        "random_text_174":
            MessageLookupByLibrary.simpleMessage("1.Đội nhóm trực thuộc: "),
        "random_text_175":
            MessageLookupByLibrary.simpleMessage("Ví dụ cụ thể như sau:\n"),
        "random_text_176": MessageLookupByLibrary.simpleMessage(
            "Việc giảm giá trên trang này dựa trên các cược hợp lệ, giả sử tỷ lệ hoàn tiền được hiển thị trong bảng ở góc trên bên trái. A là người đầu tiên phát hiện ra cơ hội kinh doanh trên địa điểm này và ngay lập tức phát triển B1, B2, B3, B1 sau đó phát triển C1 và C2, B2 không có cấp dưới, còn B3 chỉ phát triển C3 tương đối mạnh. \nVài ngày sau, mức đặt cược hiệu quả của B1 là 80.000, mức đặt cược hiệu quả của B2 là 50.000, mức đặt cược hiệu quả của B3 là 30.000, mức đặt cược hiệu quả của C1 là 100.000 và mức đặt cược hiệu quả của C2 là 40.000. , mức đặt cược hiệu quả của C3 đạt 710.000, khi đó tổng thành tích của B1 đến từ C1 và C2 là 140.000 và tỷ lệ giảm giá tương ứng là 80/10.000; Hiệu suất của B2 không có cấp dưới là 0; C3 cấp dưới của B3 rất mạnh và tổng hiệu suất của nó là 710.000, tương ứng với Tỷ lệ giảm giá là 1 triệu/10.000; A có 160.000 từ đội trực tiếp và 850.000 từ các đội khác, tổng hiệu suất là 1,01 triệu và tỷ lệ giảm giá tương ứng là 1 triệu/10.000. \nKhi đó thu nhập giữa họ được tính như sau:\n\n1."),
        "random_text_177":
            MessageLookupByLibrary.simpleMessage("Đội nhóm trực thuộc"),
        "random_text_178": MessageLookupByLibrary.simpleMessage(
            ": \nĐề cập đến các thành viên phát triển theo chiều dọc, gọi chung là nhóm trực tiếp. \n(1) B1, B2 và B3 đóng góp vào A: (80.000+50.000+30.000)x100/10.000=1.600. \n(2) C1 và C2 đóng góp vào B1: (100.000+40.000)x80/10.000=1120. \n(3) C3 đóng góp vào B3: 710.000x100/10.000=7100. \n\n2."),
        "random_text_179":
            MessageLookupByLibrary.simpleMessage("Đội nhóm khác"),
        "random_text_18": MessageLookupByLibrary.simpleMessage("Tháng mười"),
        "random_text_180": MessageLookupByLibrary.simpleMessage(
            "Các khoản giảm giá trên trang này dựa trên các cược hợp lệ, giả sử tỷ lệ hoàn tiền được hiển thị trong bảng ở góc trên bên trái. A là người đầu tiên phát hiện ra cơ hội kinh doanh trên địa điểm này và ngay lập tức phát triển B1, B2, B3, B1 sau đó phát triển C1 và C2, B2 không có cấp dưới, còn B3 chỉ phát triển C3 tương đối mạnh. \nVài ngày sau, mức đặt cược hiệu quả của B1 là 80.000, mức đặt cược hiệu quả của B2 là 50.000, mức đặt cược hiệu quả của B3 là 30.000, mức đặt cược hiệu quả của C1 là 100.000 và mức đặt cược hiệu quả của C2 là 40.000. , mức đặt cược hiệu quả của C3 đạt 710.000, khi đó tổng thành tích của B1 đến từ C1 và C2 là 140.000 và tỷ lệ giảm giá tương ứng là 80/10.000; Hiệu suất của B2 không có cấp dưới là 0; C3 cấp dưới của B3 rất mạnh và tổng hiệu suất của nó là 710.000, tương ứng với Tỷ lệ giảm giá là 1 triệu/10.000; A có 160.000 từ đội trực tiếp và 850.000 từ các đội khác, tổng hiệu suất là 1,01 triệu và tỷ lệ giảm giá tương ứng là 1 triệu/10.000. \nKhi đó thu nhập giữa họ được tính như sau: \n\n1."),
        "random_text_181":
            MessageLookupByLibrary.simpleMessage("3.ghi chú tóm tắt:\n"),
        "random_text_182": MessageLookupByLibrary.simpleMessage(
            "(1) C3 mạnh đến mức nó gián tiếp cho phép A được hưởng tỷ lệ hoa hồng cao hơn cho tất cả hiệu suất của nó. \n(2)B2 có thể lười biếng, không phát triển cấp dưới thì sẽ không có ích lợi gì. \n(3) mặc dù B3 tham gia tương đối muộn và là cấp dưới của A, nhưng cấp dưới C3 của nó rất mạnh, giúp B3 trực tiếp được hưởng tỷ lệ hoa hồng cao hơn, vì vậy, bất kể B3 gia nhập khi nào, cấp dưới của anh ta là ai, bất kể cấp bậc nào hắn đẳng cấp, thu nhập của ngươi sẽ không bao giờ bị ảnh hưởng, ngươi sẽ không còn phải chịu sự tổn thất của cấp dưới của người khác, sự phát triển của ngươi sẽ không bị hạn chế. \n(4) Đây là một mô hình đại lý hoàn toàn công bằng và chính đáng, và sẽ không có ai bị chà đạp mãi mãi chỉ vì họ tham gia muộn."),
        "random_text_183":
            MessageLookupByLibrary.simpleMessage("Nhập tài khoản hội viên"),
        "random_text_185": MessageLookupByLibrary.simpleMessage("Gửi đăng ký"),
        "random_text_186":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm theo tài khoản"),
        "random_text_187":
            MessageLookupByLibrary.simpleMessage("Chọn thời gian"),
        "random_text_188":
            MessageLookupByLibrary.simpleMessage("Toàn bộ loại hình"),
        "random_text_189":
            MessageLookupByLibrary.simpleMessage("Hoa hồng tích luỹ:"),
        "random_text_19":
            MessageLookupByLibrary.simpleMessage("Tháng mười một"),
        "random_text_191": MessageLookupByLibrary.simpleMessage("Trang/"),
        "random_text_192": MessageLookupByLibrary.simpleMessage("Trang"),
        "random_text_194": MessageLookupByLibrary.simpleMessage("Chuyển tới"),
        "random_text_196": MessageLookupByLibrary.simpleMessage("Số nội dung"),
        "random_text_197":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 3"),
        "random_text_198":
            MessageLookupByLibrary.simpleMessage("Hoa hồng có sẵn:"),
        "random_text_199":
            MessageLookupByLibrary.simpleMessage("Số lần nhận hoạt động"),
        "random_text_20":
            MessageLookupByLibrary.simpleMessage("Tháng mười hai"),
        "random_text_200":
            MessageLookupByLibrary.simpleMessage("Số tiền có sẵn"),
        "random_text_201":
            MessageLookupByLibrary.simpleMessage("Tài chính có sẵn"),
        "random_text_203": MessageLookupByLibrary.simpleMessage(
            "Tất cả các trò chơi của chúng tôi đều có tỷ lệ lợi nhuận nhà cái khác nhau. Bạn có thể sử dụng công thức sau để tính hoa hồng của mình:"),
        "random_text_204": MessageLookupByLibrary.simpleMessage(
            "Tất cả các cược thể thao được đặt với tỷ lệ lợi nhuận nhà cái theo lý thuyết là 3%. Bạn có thể sử dụng công thức sau để tính hoa hồng của mình:"),
        "random_text_205": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn có tầm ảnh hưởng lớn và có thể tiếp cận được nhiều người hoặc đang trong những trường hợp đặc biệt khác, vui lòng liên hệ với nhóm hỗ trợ xuất sắc của chúng tôi. Sau khi thảo luận với người quản lý liên kết, chúng tôi có thể cố gắng tùy chỉnh chương trình liên kết cho bạn. Điều này có thể bao gồm hoa hồng cao hơn."),
        "random_text_206": MessageLookupByLibrary.simpleMessage(
            "Tại meibo.com, sự hài lòng của người chơi đã luôn - và sẽ luôn - là ưu tiên số một. Đây là cốt lõi trong chiến lược dài hạn của chúng tôi dành cho những người tương tác với nền tảng với tư cách là người chơi và chi nhánh. Chúng tôi cố gắng trao thưởng cho người chơi thông qua các chương trình và hoạt động độc đáo để đạt được sự hài lòng của người chơi. \nCác chương trình này cung cấp thêm tiền và ưu đãi, không chỉ mang đến cho người chơi trải nghiệm cờ bạc tốt hơn mà còn giúp tăng tổng doanh thu hoa hồng liên kết. \nKế hoạch này bao gồm:\nHoàn tiền\nTiền thưởng hàng tuần\nTiền thưởng hàng tháng\nTiền thưởng nạp tiền hàng giờ/hàng ngày\nTiền thưởng cấp VIP\nVới phương pháp độc đáo này, hoa hồng của bạn sẽ được tính dựa trên nhà cái sau khi nhận ra các chi phí này. Dựa trên các lợi thế. Trong phạm vi người chơi nhận được lợi ích, hoa hồng lợi nhuận nhà cái mà bạn nhận được sẽ thấp hơn khoảng 45% lợi nhuận nhà cái được quảng cáo cho bất kỳ trò chơi nào. \nNếu bạn muốn phân tích chi tiết cách tính phí, vui lòng liên hệ với người quản lý liên kết của bạn thông qua bộ phận hỗ trợ."),
        "random_text_207": MessageLookupByLibrary.simpleMessage("Meo meo meo"),
        "random_text_209":
            MessageLookupByLibrary.simpleMessage("Tổng số tiền nạp"),
        "random_text_21": MessageLookupByLibrary.simpleMessage(
            "Bước 2/2:\t\tĐọc và chấp nhận các điều khoản và điều kiện"),
        "random_text_210": MessageLookupByLibrary.simpleMessage(
            "Tài chính có sẵn \n2023-08-22"),
        "random_text_211": MessageLookupByLibrary.simpleMessage(
            "Hãy tham gia chương trình liên kết của meibo.com và kiếm tiền bằng cách giới thiệu thương hiệu của chúng tôi! Mỗi khi người dùng đăng ký thông qua liên kết giới thiệu của bạn và sử dụng meibo.com, bạn sẽ nhận được hoa hồng liên kết. \nLà một chi nhánh của meibo.com, hoa hồng kiếm được sẽ dựa trên tổng số tiền đặt cược của người dùng được đề xuất trong sòng bạc và cá cược thể thao. Điều làm cho chương trình này khác với các chương trình liên kết truyền thống là bạn nhận được cùng một khoản hoa hồng bất kể người giới thiệu thắng hay thua!"),
        "random_text_212":
            MessageLookupByLibrary.simpleMessage("Tải xuống biểu ngữ"),
        "random_text_216":
            MessageLookupByLibrary.simpleMessage("Không Có Cược Hoạt Động"),
        "random_text_217": MessageLookupByLibrary.simpleMessage(
            "Bắt đầu đặt cược ngay bây giờ!"),
        "random_text_218":
            MessageLookupByLibrary.simpleMessage("Không Có Cược Đã Kết Thúc"),
        "random_text_220": MessageLookupByLibrary.simpleMessage("Số Tiền Cược"),
        "random_text_220copy":
            MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "random_text_221":
            MessageLookupByLibrary.simpleMessage("Không có cược sòng bạc"),
        "random_text_223": MessageLookupByLibrary.simpleMessage("Tại"),
        "random_text_224": MessageLookupByLibrary.simpleMessage("Hệ số"),
        "random_text_225": MessageLookupByLibrary.simpleMessage("Đi đến"),
        "random_text_227": MessageLookupByLibrary.simpleMessage("Số Tiền Cược"),
        "random_text_228":
            MessageLookupByLibrary.simpleMessage("Est. Thanh toán"),
        "random_text_229":
            MessageLookupByLibrary.simpleMessage("Đổi tiền mặt "),
        "random_text_232": MessageLookupByLibrary.simpleMessage("hòa"),
        "random_text_233": MessageLookupByLibrary.simpleMessage("Ăn nửa tiền"),
        "random_text_234":
            MessageLookupByLibrary.simpleMessage("Thua nửa tiền"),
        "random_text_235":
            MessageLookupByLibrary.simpleMessage("Thua một phần"),
        "random_text_237":
            MessageLookupByLibrary.simpleMessage("Người đặt cược:"),
        "random_text_238": MessageLookupByLibrary.simpleMessage("Ẩn"),
        "random_text_239":
            MessageLookupByLibrary.simpleMessage("Đăng ký đặt cược"),
        "random_text_241":
            MessageLookupByLibrary.simpleMessage("Phiếu Cược Trống"),
        "random_text_243": MessageLookupByLibrary.simpleMessage("Số tiền giữa"),
        "random_text_244": MessageLookupByLibrary.simpleMessage("Của"),
        "random_text_245": MessageLookupByLibrary.simpleMessage(
            "Trò chơi này không hỗ trợ loại tiền bạn đã chọn"),
        "random_text_246": MessageLookupByLibrary.simpleMessage(
            "Bạn có một khoản cược bị đình chỉ"),
        "random_text_247": MessageLookupByLibrary.simpleMessage(
            "Có thể chọn tối đa 10 cược cùng lúc"),
        "random_text_248":
            MessageLookupByLibrary.simpleMessage("Bạn đã đóng cược"),
        "random_text_249":
            MessageLookupByLibrary.simpleMessage("Số dư tài khoản không đủ"),
        "random_text_250": MessageLookupByLibrary.simpleMessage(
            "Không thể lấy được thông tin cá cược"),
        "random_text_251": MessageLookupByLibrary.simpleMessage(
            "Bạn có các cược không hỗ trợ nhiều cược"),
        "random_text_252": MessageLookupByLibrary.simpleMessage(
            "Không thể kết hợp nhiều cược vào cùng một sự kiện"),
        "random_text_253":
            MessageLookupByLibrary.simpleMessage("Việt Nam - Hà Lan"),
        "random_text_254": MessageLookupByLibrary.simpleMessage("Thắng"),
        "random_text_255": MessageLookupByLibrary.simpleMessage("Hà Lan"),
        "random_text_256":
            MessageLookupByLibrary.simpleMessage("Thắng/Thua/Hòa"),
        "random_text_257": MessageLookupByLibrary.simpleMessage("Quy Tắc Chat"),
        "random_text_258": MessageLookupByLibrary.simpleMessage(
            "1. Không spam trong phần trò chuyện và tránh sử dụng quá nhiều chữ in hoa. \n2. Vui lòng không quấy rối hoặc xúc phạm người dùng khác và nhân viên Stake. \n3. Không chia sẻ bất kỳ thông tin cá nhân nào về bạn hoặc những người chơi khác (bao gồm cả tài khoản mạng xã hội) \n4. Không xin tiền hoặc khoản vay, gửi phong bì đỏ hoặc tiền boa từ những người dùng khác. \n5. Nghiêm cấm trò chuyện bằng bất kỳ tài khoản nào khác ngoại trừ tài khoản chính của bạn. \n6. Không được phép có hành vi đáng ngờ có thể bị coi là gian lận. \n7. Vui lòng không tham gia vào bất kỳ hình thức quảng cáo/mua bán/bán/mua/cung cấp dịch vụ nào. \n8. Không thảo luận về người phát trực tiếp, Twitch hoặc bất kỳ nền tảng tương tự nào khác. \n9. Không sử dụng dịch vụ rút ngắn URL. Hãy chắc chắn để gửi liên kết đầy đủ. \n10. Không chia sẻ mã, tập lệnh hoặc bất kỳ dịch vụ bot nào. \n11. Vui lòng chỉ trò chuyện bằng ngôn ngữ được chỉ định trong phòng trò chuyện. Khả năng lạm dụng sẽ bị xử phạt. \n12. Nghiêm cấm thảo luận về các chủ đề chính trị và tôn giáo."),
        "random_text_260": MessageLookupByLibrary.simpleMessage("Gần Đây"),
        "random_text_263": MessageLookupByLibrary.simpleMessage("1.000 chơi"),
        "random_text_265": MessageLookupByLibrary.simpleMessage("Tính năng"),
        "random_text_268":
            MessageLookupByLibrary.simpleMessage("Bảng xếp hạng cuộc đua"),
        "random_text_272": MessageLookupByLibrary.simpleMessage(""),
        "random_text_273": MessageLookupByLibrary.simpleMessage("Thắng Lớn"),
        "random_text_274":
            MessageLookupByLibrary.simpleMessage("Chiến Thắng May Mắn"),
        "random_text_275": MessageLookupByLibrary.simpleMessage(
            "Hiện tại không có thử thách nào đang diễn ra"),
        "random_text_276":
            MessageLookupByLibrary.simpleMessage("Ưu tiên nhà cái"),
        "random_text_277": MessageLookupByLibrary.simpleMessage("Baccarat"),
        "random_text_279":
            MessageLookupByLibrary.simpleMessage("trò chơi trên bàn"),
        "random_text_28": MessageLookupByLibrary.simpleMessage(
            "Tham gia chương trình liên kết của meibo.com và kiếm tiền bằng cách giới thiệu thương hiệu của chúng tôi!Mỗi khi người dùng đăng ký thông qua liên kết giới thiệu của bạn và sử dụng meibo.com, bạn sẽ nhận được hoa hồng liên kết"),
        "random_text_280":
            MessageLookupByLibrary.simpleMessage("Cuộc đua \$100.000 -24 giờ"),
        "random_text_281":
            MessageLookupByLibrary.simpleMessage("Kết thúc sau 8 giờ nữa"),
        "random_text_282": MessageLookupByLibrary.simpleMessage("Hạng"),
        "random_text_286": MessageLookupByLibrary.simpleMessage("Sự kiện"),
        "random_text_287":
            MessageLookupByLibrary.simpleMessage("Đặt cược thông minh hơn"),
        "random_text_288": MessageLookupByLibrary.simpleMessage("Đăng ký ngay"),
        "random_text_29": MessageLookupByLibrary.simpleMessage(
            "Với tư cách là một chi nhánh của meibo.com, hoa hồng kiếm được sẽ dựa trên tổng số tiền đặt cược mà người dùng được giới thiệu trong sòng bạc và cá cược thể thao. Điều làm cho chương trình này khác với các chương trình liên kết truyền thống là bạn nhận được cùng một khoản hoa hồng bất kể người được giới thiệu thắng hay thua."),
        "random_text_290":
            MessageLookupByLibrary.simpleMessage("Chào mừng trở lại"),
        "random_text_296": MessageLookupByLibrary.simpleMessage(
            "Giải thưởng hàng tuần trị giá \$ 75K"),
        "random_text_297":
            MessageLookupByLibrary.simpleMessage("Cuộc đua \$100K - 24 giờ"),
        "random_text_298":
            MessageLookupByLibrary.simpleMessage("Phần thưởng Airdrop thực tế"),
        "random_text_3": MessageLookupByLibrary.simpleMessage(
            "Ngày không thể vượt quá ngày 31"),
        "random_text_30":
            MessageLookupByLibrary.simpleMessage("Liên kết được đề xuất"),
        "random_text_300":
            MessageLookupByLibrary.simpleMessage("Đội đua Alfa Romeo F1"),
        "random_text_301":
            MessageLookupByLibrary.simpleMessage("Câu lạc bộ bóng đá Everton"),
        "random_text_302": MessageLookupByLibrary.simpleMessage("Kun Aguero"),
        "random_text_303":
            MessageLookupByLibrary.simpleMessage("Isli Adesanya"),
        "random_text_304":
            MessageLookupByLibrary.simpleMessage("Jeldon Almeida"),
        "random_text_305":
            MessageLookupByLibrary.simpleMessage("Giải bóng chuyền quốc gia"),
        "random_text_306":
            MessageLookupByLibrary.simpleMessage("：tiếng Trung Quốc"),
        "random_text_307": MessageLookupByLibrary.simpleMessage("Tiếng Trung"),
        "random_text_308":
            MessageLookupByLibrary.simpleMessage("Câu lạc bộ giao hữu"),
        "random_text_309": MessageLookupByLibrary.simpleMessage(
            "Giải vô địch bóng đá nữ thế giới FIFA"),
        "random_text_31": MessageLookupByLibrary.simpleMessage("Sao chép"),
        "random_text_310":
            MessageLookupByLibrary.simpleMessage("Đấu đơn WTA Osaka"),
        "random_text_311": MessageLookupByLibrary.simpleMessage(
            "Giải vô địch quần vợt Davis Cup"),
        "random_text_312":
            MessageLookupByLibrary.simpleMessage("Giải bóng chày Major League"),
        "random_text_313":
            MessageLookupByLibrary.simpleMessage("Giải đấu KBO Hàn Quốc"),
        "random_text_314":
            MessageLookupByLibrary.simpleMessage("bóng bầu dục Mỹ"),
        "random_text_315":
            MessageLookupByLibrary.simpleMessage("Giải bóng đá lớn Mỹ"),
        "random_text_316": MessageLookupByLibrary.simpleMessage(
            "Hiệp hội thể thao trường đại học quốc gia, mùa giải thường lệ"),
        "random_text_317": MessageLookupByLibrary.simpleMessage(
            "Hiệp hội bóng rổ nữ quốc gia "),
        "random_text_318": MessageLookupByLibrary.simpleMessage(
            "Liên đoàn bóng rổ toàn nước Anh"),
        "random_text_319": MessageLookupByLibrary.simpleMessage("Rainbow Six"),
        "random_text_32": MessageLookupByLibrary.simpleMessage(
            "Tại meibo.com, sự hài lòng của người chơi đã luôn - và sẽ luôn - là ưu tiên số một. Đây là cốt lõi trong chiến lược dài hạn của chúng tôi dành cho những người tương tác với nền tảng với tư cách là người chơi và chi nhánh. Chúng tôi cố gắng khen thưởng và làm hài lòng người chơi thông qua các chương trình và sự kiện độc đáo"),
        "random_text_321": MessageLookupByLibrary.simpleMessage("Đề phòng"),
        "random_text_322":
            MessageLookupByLibrary.simpleMessage("vua của sự vinh quang"),
        "random_text_323":
            MessageLookupByLibrary.simpleMessage("Cuộc thách đấu bất tận"),
        "random_text_324": MessageLookupByLibrary.simpleMessage("Sự bế tắc"),
        "random_text_326": MessageLookupByLibrary.simpleMessage("Bóng rổ 3x3"),
        "random_text_327": MessageLookupByLibrary.simpleMessage(
            "Đội tuyển bóng rổ nam quốc gia Úc"),
        "random_text_328": MessageLookupByLibrary.simpleMessage("Bóng gậy"),
        "random_text_329":
            MessageLookupByLibrary.simpleMessage("Khúc Côn Cầu Trên Băng"),
        "random_text_33": MessageLookupByLibrary.simpleMessage(
            "Các chương trình này cung cấp thêm tiền và ưu đãi không chỉ mang đến cho người chơi trải nghiệm chơi trò chơi tốt hơn mà còn giúp tăng doanh thu hoa hồng liên kết."),
        "random_text_330": MessageLookupByLibrary.simpleMessage("Leo núi"),
        "random_text_331": MessageLookupByLibrary.simpleMessage("Phi tiêu"),
        "random_text_332":
            MessageLookupByLibrary.simpleMessage("Bóng chày Phần Lan"),
        "random_text_333":
            MessageLookupByLibrary.simpleMessage("Cuộc đua xe sửa đổi"),
        "random_text_334": MessageLookupByLibrary.simpleMessage("Đánh gôn"),
        "random_text_335":
            MessageLookupByLibrary.simpleMessage("Tỷ lệ cược: số thập phân"),
        "random_text_336":
            MessageLookupByLibrary.simpleMessage("Ngôn ngữ: Tiếng Trung Quốc"),
        "random_text_337":
            MessageLookupByLibrary.simpleMessage("Tìm yêu cầu ít nhất 3 ký tự"),
        "random_text_34":
            MessageLookupByLibrary.simpleMessage("Kế hoạch bao gồm"),
        "random_text_343":
            MessageLookupByLibrary.simpleMessage("Cập nhật ứng dụng"),
        "random_text_344": MessageLookupByLibrary.simpleMessage("Nhận xét"),
        "random_text_345":
            MessageLookupByLibrary.simpleMessage("Đang chuẩn bị tải xuống..."),
        "random_text_346":
            MessageLookupByLibrary.simpleMessage("Tải xuống hoàn tất"),
        "random_text_347": MessageLookupByLibrary.simpleMessage("Nhắc nhở"),
        "random_text_348": MessageLookupByLibrary.simpleMessage(
            "Tải xuống không thành công, vui lòng đảm bảo mạng mở"),
        "random_text_349": MessageLookupByLibrary.simpleMessage("Thử lại ngay"),
        "random_text_35": MessageLookupByLibrary.simpleMessage("Hạ giá"),
        "random_text_350": MessageLookupByLibrary.simpleMessage("Thử lại sau"),
        "random_text_351": MessageLookupByLibrary.simpleMessage(
            "Truyền tham số qua các trang"),
        "random_text_352":
            MessageLookupByLibrary.simpleMessage("Chi tiết cuộc đua"),
        "random_text_353":
            MessageLookupByLibrary.simpleMessage("Cúp may mắn nhất 1"),
        "random_text_354":
            MessageLookupByLibrary.simpleMessage("Cúp may mắn nhất 2"),
        "random_text_355":
            MessageLookupByLibrary.simpleMessage("Cúp may mắn nhất 3"),
        "random_text_357":
            MessageLookupByLibrary.simpleMessage("Ngày tham gia: 2023/07/01"),
        "random_text_357copy2":
            MessageLookupByLibrary.simpleMessage("Tham gia vào "),
        "random_text_358": MessageLookupByLibrary.simpleMessage("Ngày"),
        "random_text_359":
            MessageLookupByLibrary.simpleMessage("Phiếu rút thăm"),
        "random_text_36":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng hàng tuần"),
        "random_text_360":
            MessageLookupByLibrary.simpleMessage("Chiến tích may mắnnhất"),
        "random_text_362":
            MessageLookupByLibrary.simpleMessage("Yêu cầu thống kê"),
        "random_text_363": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu dữ liệu thống kê được giới hạn 5 lần mỗi ngày, 24 giờ một ngày"),
        "random_text_364": MessageLookupByLibrary.simpleMessage("Văn bản 01"),
        "random_text_365": MessageLookupByLibrary.simpleMessage("Một ngày"),
        "random_text_366": MessageLookupByLibrary.simpleMessage("Một tuần"),
        "random_text_367": MessageLookupByLibrary.simpleMessage("Một tháng"),
        "random_text_368": MessageLookupByLibrary.simpleMessage("Ba tháng"),
        "random_text_369": MessageLookupByLibrary.simpleMessage("Sáu tháng"),
        "random_text_37":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng hàng tháng"),
        "random_text_370": MessageLookupByLibrary.simpleMessage("Một năm"),
        "random_text_371": MessageLookupByLibrary.simpleMessage("Vĩnh viễn"),
        "random_text_372":
            MessageLookupByLibrary.simpleMessage("Có thể chỉnh sửa sau 22:43"),
        "random_text_373":
            MessageLookupByLibrary.simpleMessage("Giới hạn cá cược"),
        "random_text_374": MessageLookupByLibrary.simpleMessage(
            "Giới hạn cá cược đã được đặt thành 1000,00/ngày"),
        "random_text_375": MessageLookupByLibrary.simpleMessage(
            "Kiểm soát việc chơi game hoặc cá cược của bạn bằng cách sử dụng giới hạn thua hoặc cá cược. Những giới hạn này cho phép bạn kiểm soát số tiền thua hoặc số tiền đặt cược tối đa trong một khoảng thời gian nhất định. Bất kỳ thay đổi nào đối với những hạn chế này sẽ yêu cầu thời gian cân nhắc 24 giờ."),
        "random_text_377": MessageLookupByLibrary.simpleMessage(
            "Bạn muốn nghỉ ngơi Meibo.com? Để bắt đầu quy trình tự loại trừ tự động, vui lòng nhấp vào nút bên dưới để nhận hướng dẫn xác nhận qua email."),
        "random_text_378": MessageLookupByLibrary.simpleMessage(
            "Địa chỉ email của bạn phải được xác minh trước khi bạn có thể kích hoạt tính năng tự loại trừ."),
        "random_text_38": MessageLookupByLibrary.simpleMessage(
            "Tiền thưởng nạp tiền hàng giờ/hàng ngày"),
        "random_text_380": MessageLookupByLibrary.simpleMessage(
            "Thời gian nghỉ ngơi 23:33:12"),
        "random_text_381":
            MessageLookupByLibrary.simpleMessage("Khoảng thời gian"),
        "random_text_383":
            MessageLookupByLibrary.simpleMessage("Bộ tự loại trừ"),
        "random_text_384": MessageLookupByLibrary.simpleMessage(
            "Bạn đã đưa tài khoản của mình vào chế độ tự loại trừ"),
        "random_text_385": MessageLookupByLibrary.simpleMessage(
            "Tuyên bố miễn trừ trách nhiệm: Mọi quyết định được đưa ra ở đây là quyết định cuối cùng và không thể thay đổi. Vui lòng rút mọi số dư còn lại trong tài khoản của bạn trước khi gửi yêu cầu tự loại trừ."),
        "random_text_386":
            MessageLookupByLibrary.simpleMessage("Tìm hiểu thêm về"),
        "random_text_387": MessageLookupByLibrary.simpleMessage("Tin tức"),
        "random_text_388": MessageLookupByLibrary.simpleMessage("Tiêu đề "),
        "random_text_389": MessageLookupByLibrary.simpleMessage("thông báo"),
        "random_text_39":
            MessageLookupByLibrary.simpleMessage("Phần thưởng cấp VIP"),
        "random_text_390":
            MessageLookupByLibrary.simpleMessage("Nhật Bản-Tây Ban Nha"),
        "random_text_391":
            MessageLookupByLibrary.simpleMessage("Thắng Hòa Thua"),
        "random_text_392": MessageLookupByLibrary.simpleMessage("Trận hòa"),
        "random_text_393": MessageLookupByLibrary.simpleMessage("Hiệp 2"),
        "random_text_394":
            MessageLookupByLibrary.simpleMessage("Quy đổi 1.00000"),
        "random_text_395":
            MessageLookupByLibrary.simpleMessage("Chủ đầu tư: Mamama"),
        "random_text_396":
            MessageLookupByLibrary.simpleMessage("lúc 17:50 ngày 07/08/2023"),
        "random_text_397":
            MessageLookupByLibrary.simpleMessage("Thành một số:"),
        "random_text_398": MessageLookupByLibrary.simpleMessage("Thanh toán:"),
        "random_text_4": MessageLookupByLibrary.simpleMessage("Đang tải"),
        "random_text_40": MessageLookupByLibrary.simpleMessage(
            "Với cách sử dụng phương pháp độc đáo này, hoa hồng của bạn sẽ được tính dựa trên lợi nhuận của nhà cái sau khi nhận ra những chi phí này. Tùy thuộc vào mức độ người chơi được hưởng lợi, hoa hồng nhà cái mà bạn nhận được sẽ thấp hơn khoảng 45% so với bất kỳ trò chơi nào quảng cáo."),
        "random_text_403": MessageLookupByLibrary.simpleMessage("Giảm giá"),
        "random_text_404":
            MessageLookupByLibrary.simpleMessage("Thu nhập hàng ngày"),
        "random_text_405":
            MessageLookupByLibrary.simpleMessage("Thu nhập hàng tuần"),
        "random_text_406":
            MessageLookupByLibrary.simpleMessage("Thu nhập hàng tháng"),
        "random_text_407": MessageLookupByLibrary.simpleMessage(
            "Hiện tại không thể nhận tiền quà tặng hoạt động"),
        "random_text_408": MessageLookupByLibrary.simpleMessage(
            "Nhận thành công phần thưởng sự kiện"),
        "random_text_409":
            MessageLookupByLibrary.simpleMessage("Đã đạt đến cấp độ cao nhất"),
        "random_text_41": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn muốn phân tích chi tiết cách tính phí, vui lòng liên hệ với người quản lý liên kết thông qua bộ phận hỗ trợ."),
        "random_text_410":
            MessageLookupByLibrary.simpleMessage("Không nhận được"),
        "random_text_412": MessageLookupByLibrary.simpleMessage("Đã thăng cấp"),
        "random_text_413":
            MessageLookupByLibrary.simpleMessage("Có thể nhận được"),
        "random_text_414":
            MessageLookupByLibrary.simpleMessage("Đang chờ thăng cấp"),
        "random_text_415":
            MessageLookupByLibrary.simpleMessage("Phần thưởng nâng cấp"),
        "random_text_416":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tăng cường"),
        "random_text_417": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể mong đợi tiền thưởng hàng tuần và hàng tháng dựa trên số lượng chơi của bạn. Càng chơi nhiều, bạn càng nhận được nhiều tiền thưởng."),
        "random_text_418": MessageLookupByLibrary.simpleMessage(
            "Tiền thưởng hiệu suất trò chơi gần đây"),
        "random_text_419": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn vận may không tốt?  Meibo sẽ cung cấp cho bạn số tiền bổ sung dựa trên số tiền bạn thua mỗi khi bạn lên cấp."),
        "random_text_42": MessageLookupByLibrary.simpleMessage(
            "Kế hoạch duy trì này cho phép các lượt giới thiệu của bạn được sử dụng trong cá cược thể thao và sòng bạc. Tuy nhiên, chi phí của kế hoạch duy trì sẽ được tính trước khi tính hoa hồng liên kết cho cá cược thể thao, cho phép chúng tôi đặt tỷ suất lợi nhuận mặc định là 3%."),
        "random_text_420":
            MessageLookupByLibrary.simpleMessage("Người chăm sóc VIP"),
        "random_text_421": MessageLookupByLibrary.simpleMessage(
            "Được chỉ định một Đại diện Dịch vụ VIP tận tâm, người sẽ hỗ trợ và đáp ứng nhu cầu cá cược của bạn."),
        "random_text_422":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tăng cấp"),
        "random_text_423": MessageLookupByLibrary.simpleMessage(
            "Nhận tiền thưởng sau khi đạt đến từng cấp độ tiếp theo. Cấp độ đạt được càng cao thì tiền thưởng nâng cấp càng lớn."),
        "random_text_424": MessageLookupByLibrary.simpleMessage(
            "Làm việc với đại diện Dịch vụ VIP chuyên dụng của bạn để điều chỉnh lợi ích cho phù hợp với nhu cầu cá cược của bạn."),
        "random_text_425":
            MessageLookupByLibrary.simpleMessage("So sánh đẳng cấp VIP"),
        "random_text_426":
            MessageLookupByLibrary.simpleMessage("Số tiền đặt cược"),
        "random_text_427":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng hàng tháng"),
        "random_text_428":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng hàng tuần"),
        "random_text_429": MessageLookupByLibrary.simpleMessage(
            "Tiền thưởng hàng ngày\nTiền thưởng nạp tiền"),
        "random_text_430":
            MessageLookupByLibrary.simpleMessage("tăng trưởng tiền thưởng"),
        "random_text_431": MessageLookupByLibrary.simpleMessage(
            "Dịch vụ VIP độc quyền\nngười đại diện"),
        "random_text_432": MessageLookupByLibrary.simpleMessage("Vạn"),
        "random_text_433":
            MessageLookupByLibrary.simpleMessage("Trải nghiệm VIP tuyệt vời"),
        "random_text_434": MessageLookupByLibrary.simpleMessage(
            "Mở khóa các lợi ích độc quyền và nhận tiền thưởng mà bạn có thể rút ngay lập tức mà không cần ràng buộc."),
        "random_text_436":
            MessageLookupByLibrary.simpleMessage("Xem bảng cấp độ VIP"),
        "random_text_437":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn bắt đầu"),
        "random_text_438": MessageLookupByLibrary.simpleMessage(
            "Trở thành VIP là một quá trình dễ dàng và bổ ích"),
        "random_text_439":
            MessageLookupByLibrary.simpleMessage("Bước đầu tiên"),
        "random_text_44": MessageLookupByLibrary.simpleMessage("(o nạp tiền）"),
        "random_text_440": MessageLookupByLibrary.simpleMessage(
            "Mỗi lần đặt cược bạn thực hiện đều ảnh hưởng đến tiến trình đạt cấp VIP của bạn. Đạt cấp độ tiếp theo để mở khóa nhiều lợi ích hơn."),
        "random_text_441": MessageLookupByLibrary.simpleMessage("Bước Hai"),
        "random_text_442": MessageLookupByLibrary.simpleMessage("Bước Ba"),
        "random_text_443": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu tiền thắng cược của bạn ngay. Quá trình nhận tiền thưởng hàng ngày, hàng tuần và hàng tháng rất đơn giản và dễ dàng."),
        "random_text_444": MessageLookupByLibrary.simpleMessage("Trải nghiệm"),
        "random_text_445": MessageLookupByLibrary.simpleMessage("Tiền thưởng"),
        "random_text_446": MessageLookupByLibrary.simpleMessage(
            "Nhận phần thưởng tốt hơn với mỗi lần tăng cấp độ"),
        "random_text_447":
            MessageLookupByLibrary.simpleMessage("Tài khoản Alipay"),
        "random_text_448":
            MessageLookupByLibrary.simpleMessage("Liên kết Alipay"),
        "random_text_449": MessageLookupByLibrary.simpleMessage(
            "Số tiền rút tối thiểu là: 0,00020000"),
        "random_text_450": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi sẽ khấu trừ số tiền này khỏi số dư của bạn"),
        "random_text_451": MessageLookupByLibrary.simpleMessage(
            "Là phí giao dịch cho việc rút tiền của bạn."),
        "random_text_452": MessageLookupByLibrary.simpleMessage("Tìm"),
        "random_text_453": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập mã xác minh đầy đủ"),
        "random_text_455":
            MessageLookupByLibrary.simpleMessage("Đặt mật khẩu rút tiền"),
        "random_text_456": MessageLookupByLibrary.simpleMessage(
            "Để giữ cho tài khoản của bạn thêm an toàn, hãy bật xác thực hai yếu tố."),
        "random_text_457": MessageLookupByLibrary.simpleMessage(
            "Sao chép mã này vào ứng dụng xác thực của bạn"),
        "random_text_458":
            MessageLookupByLibrary.simpleMessage("Không để ai xem cái này!"),
        "random_text_46":
            MessageLookupByLibrary.simpleMessage("Số lần tiền nạp"),
        "random_text_461":
            MessageLookupByLibrary.simpleMessage("Xóa bỏ danh sách đen"),
        "random_text_462": MessageLookupByLibrary.simpleMessage(
            "Liên kết địa chỉ thanh toán tiền điện tử"),
        "random_text_463": MessageLookupByLibrary.simpleMessage(
            "Liên kết địa chỉ thanh toán bằng tiền tệ hợp pháp"),
        "random_text_464": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập tên chủ tài khoản"),
        "random_text_465": MessageLookupByLibrary.simpleMessage(
            "Không thể thay đổi sau khi liên kết, chỉ có thể thêm phương thức thanh toán của chủ tài khoản hiện tại"),
        "random_text_468":
            MessageLookupByLibrary.simpleMessage("Tài khoản ngân hàng"),
        "random_text_47": MessageLookupByLibrary.simpleMessage("Cấp đại lý"),
        "random_text_471": MessageLookupByLibrary.simpleMessage(
            "Mỗi loại tiền tệ có thể được áp dụng 5 phương thức rút tiền"),
        "random_text_472": MessageLookupByLibrary.simpleMessage(
            "Mỗi loại tiền điện tử có thể được liên kết với tối đa 2 địa chỉ rút tiền"),
        "random_text_473": MessageLookupByLibrary.simpleMessage("Mới"),
        "random_text_474":
            MessageLookupByLibrary.simpleMessage("Email được gửi tới\n"),
        "random_text_475":
            MessageLookupByLibrary.simpleMessage("Email đã được gửi"),
        "random_text_476": MessageLookupByLibrary.simpleMessage(
            "Thành công cập nhật địa chỉ thư điện tử"),
        "random_text_477": MessageLookupByLibrary.simpleMessage(
            "Email xác nhận đã được gửi tới \n"),
        "random_text_478": MessageLookupByLibrary.simpleMessage(
            "Thành công cập nhật số điện thoại di động"),
        "random_text_479": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại di động đã được cập nhật là "),
        "random_text_48":
            MessageLookupByLibrary.simpleMessage("Điều kiện khuyến mãi"),
        "random_text_481":
            MessageLookupByLibrary.simpleMessage("Sử Dụng Lần Cuối"),
        "random_text_482": MessageLookupByLibrary.simpleMessage("Trình duyệt"),
        "random_text_483": MessageLookupByLibrary.simpleMessage("Gần"),
        "random_text_485": MessageLookupByLibrary.simpleMessage("Alipay"),
        "random_text_486": MessageLookupByLibrary.simpleMessage("Trận mới mở"),
        "random_text_487":
            MessageLookupByLibrary.simpleMessage("Sự kiện vô địch"),
        "random_text_488": MessageLookupByLibrary.simpleMessage("Liên đoàn"),
        "random_text_489":
            MessageLookupByLibrary.simpleMessage("Tất cả các môn thể thao"),
        "random_text_49":
            MessageLookupByLibrary.simpleMessage("Thời gian tham gia"),
        "random_text_491":
            MessageLookupByLibrary.simpleMessage("Toàn trận đấu"),
        "random_text_492": MessageLookupByLibrary.simpleMessage("Hiệp 1"),
        "random_text_493": MessageLookupByLibrary.simpleMessage(
            "Sắp xếp theo thứ tự bảng chữ cái"),
        "random_text_494": MessageLookupByLibrary.simpleMessage("Kiểm tra"),
        "random_text_495":
            MessageLookupByLibrary.simpleMessage("Cược nhiều (2)"),
        "random_text_496":
            MessageLookupByLibrary.simpleMessage("Cuộc đua \$100.000 -24 giờ"),
        "random_text_5":
            MessageLookupByLibrary.simpleMessage("Đăng ký thành công"),
        "random_text_500":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm sự kiện"),
        "random_text_501":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 3"),
        "random_text_502":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 8"),
        "random_text_503": MessageLookupByLibrary.simpleMessage(
            "Tên miền email không được hỗ trợ"),
        "random_text_504": MessageLookupByLibrary.simpleMessage(
            "Vui lòng thêm biểu tượng “.” trong địa chỉ email của bạn"),
        "random_text_505": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập địa chỉ email hợp lệ"),
        "random_text_506": MessageLookupByLibrary.simpleMessage(
            "Tên đăng nhập của bạn phải dài ít nhất 3 ký tự"),
        "random_text_507": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng của bạn không thể vượt quá 14 ký tự"),
        "random_text_508": MessageLookupByLibrary.simpleMessage(
            "Năm phải lớn hơn hoặc bằng 1900"),
        "random_text_509": MessageLookupByLibrary.simpleMessage(
            "Bạn không thể lớn hơn 120 tuổi"),
        "random_text_51":
            MessageLookupByLibrary.simpleMessage("Đơn cược hợp lệ"),
        "random_text_510": MessageLookupByLibrary.simpleMessage(
            "Ngày sinh không thể vượt quá "),
        "random_text_511": MessageLookupByLibrary.simpleMessage(""),
        "random_text_512": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng của bạn phải dài từ 3-14 ký tự"),
        "random_text_513":
            MessageLookupByLibrary.simpleMessage("Thêm đại lý phụ mới"),
        "random_text_514":
            MessageLookupByLibrary.simpleMessage("Tất cả loại tiền tệ"),
        "random_text_515": MessageLookupByLibrary.simpleMessage("Cấp trên: "),
        "random_text_516":
            MessageLookupByLibrary.simpleMessage("Ví tiền hoa hồng"),
        "random_text_517":
            MessageLookupByLibrary.simpleMessage("Lịch sử hoa hồng"),
        "random_text_518": MessageLookupByLibrary.simpleMessage("Thời gian"),
        "random_text_519": MessageLookupByLibrary.simpleMessage("Loại hình"),
        "random_text_51copy2":
            MessageLookupByLibrary.simpleMessage("Đơn cược hợp lệ"),
        "random_text_52": MessageLookupByLibrary.simpleMessage(
            "Tổng số tiền thắng hoặc thua"),
        "random_text_520": MessageLookupByLibrary.simpleMessage("Thời gian"),
        "random_text_521":
            MessageLookupByLibrary.simpleMessage("Đơn đặt cược "),
        "random_text_522":
            MessageLookupByLibrary.simpleMessage("Loại hình lựa chọn"),
        "random_text_523":
            MessageLookupByLibrary.simpleMessage("Thành viên thắng hay thua"),
        "random_text_524":
            MessageLookupByLibrary.simpleMessage("Lợi nhuận tiền mặt"),
        "random_text_525":
            MessageLookupByLibrary.simpleMessage("Thời gian đăng ký"),
        "random_text_526": MessageLookupByLibrary.simpleMessage("0 người"),
        "random_text_527":
            MessageLookupByLibrary.simpleMessage("Tổng cược có hiệu lực"),
        "random_text_528": MessageLookupByLibrary.simpleMessage("Người"),
        "random_text_529":
            MessageLookupByLibrary.simpleMessage("Đi tới cài đặt"),
        "random_text_53": MessageLookupByLibrary.simpleMessage("Tài khoản"),
        "random_text_530": MessageLookupByLibrary.simpleMessage(
            "Quyền truy cập bộ sưu tập ảnh bị vô hiệu hóa. Vui lòng chuyển tới cài đặt để cấp quyền truy cập vào bộ sưu tập ảnh."),
        "random_text_531":
            MessageLookupByLibrary.simpleMessage("Đã lưu thành công"),
        "random_text_532":
            MessageLookupByLibrary.simpleMessage("Lưu không thành công"),
        "random_text_533":
            MessageLookupByLibrary.simpleMessage("Liên kết được tài trợ"),
        "random_text_534":
            MessageLookupByLibrary.simpleMessage("Ví dụ cụ thể như sau"),
        "random_text_535": MessageLookupByLibrary.simpleMessage(
            "Việc giảm giá trên trang này dựa trên các cược hợp lệ, giả sử tỷ lệ hoàn tiền được hiển thị trong bảng ở góc trên bên trái. A là người đầu tiên phát hiện ra cơ hội kinh doanh trên địa điểm này và ngay lập tức phát triển B1, B2, B3, B1 sau đó phát triển C1 và C2, B2 không có cấp dưới, còn B3 chỉ phát triển C3 tương đối mạnh. \n\n Vài ngày sau, mức đặt cược hiệu quả của B1 là 80.000, mức đặt cược hiệu quả của B2 là 50.000, mức đặt cược hiệu quả của B3 là 30.000, mức đặt cược hiệu quả của C1 là 100.000, mức đặt cược hiệu quả của C2 là 40.000 và C3 của tôi đạt 710.000, sau đó tổng hiệu suất của B1 đến từ C1 và C2 là 140.000 và tỷ lệ chi trả hoa hồng tương ứng là 80/10.000; hiệu suất của B2 không có cấp dưới là 0; cấp dưới C3 của B3 rất mạnh, tổng hiệu suất là 710.000 và tỷ lệ chi trả hoa hồng tương ứng là Tỷ lệ là 1 triệu/10.000, A có 160.000 từ đội trực tiếp và 850.000 từ các đội khác, tổng hiệu suất là 1,01 triệu và tỷ lệ chi trả hoa hồng tương ứng là 1 triệu/10.000. \n\n Khi đó thu nhập giữa họ được tính như sau:"),
        "random_text_536": MessageLookupByLibrary.simpleMessage(
            "Nó dùng để chỉ những thành viên phát triển theo chiều dọc và được gọi chung là đội trực tiếp. \n(1) B1, B2, B3 đóng góp vào A: (80.000 + 50.000 + 30.000) x 100/10.000 = 1.600. \n\n(2) C1 và C2 đóng góp vào B1: (100.000+40.000)x80/10.000=1120. \n\n(3) C3 góp vào B3: 710.000 x 100/10.000 = 7100."),
        "random_text_537": MessageLookupByLibrary.simpleMessage(
            "Nó dùng để chỉ các thành viên phát triển thành cấp dưới, cấp dưới kế tiếp, cấp dưới tiếp theo, v.v. và được gọi chung là các đội nhóm khác; vì hệ thống này có thể phát triển cấp dưới vô hạn nên để thuận tiện cho việc giải thích, bài viết này chỉ lấy cấu trúc 2 cấp làm ví dụ. \n\n(1) Từ C1 và C2: Vì B1 có tổng hiệu suất là 140.000 và chỉ được hưởng tỷ lệ chi trả hoa hồng 80/10 nghìn, trong khi tổng hiệu suất của A là 1,01 triệu và được hưởng tỷ lệ chi trả hoa hồng 1 triệu/10 nghìn nên có khoản giảm giá giữa A và B1 Chênh lệch hoa hồng là: 100-80=20/10.000. Chênh lệch này là phần đóng góp của C1 và C2 cho A, do đó C1 và C2 đóng góp cho A: (100.000+40.000)×20/10.000= 280. \n\n(2) Từ C3: Vì B3 có tổng hiệu suất là 710.000 và được hưởng tỷ lệ giảm giá là 1 triệu/10.000 và A có tổng hiệu suất là 1,01 triệu và được hưởng tỷ lệ chi trả hoa hồng là 1 triệu/10.000, nên chênh lệch chi trả hoa hồng giữa A và B3 là: 100-100=0/10.000, C3 đóng góp vào A: 710.000x0/10.000=0."),
        "random_text_538":
            MessageLookupByLibrary.simpleMessage("Ghi chú tóm tắt"),
        "random_text_539": MessageLookupByLibrary.simpleMessage(
            "(1) C3 mạnh đến mức nó gián tiếp cho phép A được hưởng tỷ lệ hoa hồng cao hơn cho tất cả hiệu suất của nó. \n\n(2) B2 có thể không chăm chỉ và sẽ không được lợi gì nếu không phát triển cấp dưới của mình. \n\n(3) Mặc dù B3 tham gia tương đối muộn và là cấp dưới của A nhưng cấp dưới C3 của nó rất mạnh, cho phép B3 trực tiếp được hưởng tỷ lệ hoa hồng cao hơn, vì vậy, bất kể B3 tham gia khi nào, cấp dưới của ai, bất kể cấp bậc nào đã vào, Thu nhập sẽ không bao giờ bị ảnh hưởng, bạn sẽ không còn phải gánh chịu sự thiệt thòi của cấp dưới người khác và sự phát triển của B3 sẽ không bị hạn chế. \n\n(4) Đây là một mô hình đại lý công bằng và chính đáng và không có thành viên nào bị thiệt thòi nếu tham gia muộn."),
        "random_text_54":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn khuyến mãi"),
        "random_text_540": MessageLookupByLibrary.simpleMessage(
            "Địa chỉ email không được để trống"),
        "random_text_541": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng không được để trống"),
        "random_text_542": MessageLookupByLibrary.simpleMessage(
            "Xin vui lòng điền địa chỉ email chính xác"),
        "random_text_543": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng của bạn phải dài từ 3-14 ký tự"),
        "random_text_544": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu của bạn phải dài ít nhất 8 ký tự"),
        "random_text_545":
            MessageLookupByLibrary.simpleMessage("Đăng ký thành công"),
        "random_text_546":
            MessageLookupByLibrary.simpleMessage("Đăng ký thất bại"),
        "random_text_547":
            MessageLookupByLibrary.simpleMessage("Địa chỉ email"),
        "random_text_548":
            MessageLookupByLibrary.simpleMessage("Tên người dùng"),
        "random_text_549": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "random_text_55":
            MessageLookupByLibrary.simpleMessage("Sự quảng cáo của tôi"),
        "random_text_550": MessageLookupByLibrary.simpleMessage("Kết thúc sau"),
        "random_text_551":
            MessageLookupByLibrary.simpleMessage("ID người chơi"),
        "random_text_552": MessageLookupByLibrary.simpleMessage("Từ khóa"),
        "random_text_553": MessageLookupByLibrary.simpleMessage("giờ nữa"),
        "random_text_554": MessageLookupByLibrary.simpleMessage("Vài phút sau"),
        "random_text_555": MessageLookupByLibrary.simpleMessage("Đặt ở trên"),
        "random_text_556": MessageLookupByLibrary.simpleMessage(
            "Khoản đặt cược, thêm vào phiếu cá cược của tôi"),
        "random_text_557": MessageLookupByLibrary.simpleMessage(
            "Kích thước tỷ lệ đặt cược đôi:"),
        "random_text_558":
            MessageLookupByLibrary.simpleMessage("Tỷ lệ cược ít hơn"),
        "random_text_559": MessageLookupByLibrary.simpleMessage(
            "Khoản cược không thể được kết hợp thành nhiều cược"),
        "random_text_56":
            MessageLookupByLibrary.simpleMessage("Hoa hồng của tôi"),
        "random_text_560": MessageLookupByLibrary.simpleMessage("Tiền tệ"),
        "random_text_561":
            MessageLookupByLibrary.simpleMessage("Lượng đơn cược"),
        "random_text_562": MessageLookupByLibrary.simpleMessage("Thắng thua"),
        "random_text_563":
            MessageLookupByLibrary.simpleMessage("Biểu tượng cảm xúc"),
        "random_text_564": MessageLookupByLibrary.simpleMessage(
            "1. Đừng spam trong cuộc trò chuyện và tránh sử dụng quá nhiều chữ in hoa."),
        "random_text_565": MessageLookupByLibrary.simpleMessage(
            "2. Vui lòng không quấy rối hoặc xúc phạm người dùng khác và nhân viên Meibo."),
        "random_text_566": MessageLookupByLibrary.simpleMessage(
            "3. Không chia sẻ bất kỳ thông tin cá nhân nào về bản thân hoặc người chơi khác (bao gồm cả tài khoản mạng xã hội)"),
        "random_text_567": MessageLookupByLibrary.simpleMessage(
            "4. Vui lòng không xin tiền hoặc vay từ người dùng khác, phong bì màu đỏ hoặc là tiền tip."),
        "random_text_568": MessageLookupByLibrary.simpleMessage(
            "5. Nghiêm cấm trò chuyện bằng bất kỳ tài khoản nào khác ngoại trừ tài khoản chính của bạn."),
        "random_text_569": MessageLookupByLibrary.simpleMessage(
            "6. Không được phép có hành vi đáng ngờ nào và có thể coi là gian lận."),
        "random_text_57":
            MessageLookupByLibrary.simpleMessage("Thành tích của tôi"),
        "random_text_570": MessageLookupByLibrary.simpleMessage(
            "7. Vui lòng không tham gia vào bất kỳ hình thức dịch vụ quảng cáo/giao dịch/bán/mua/."),
        "random_text_571": MessageLookupByLibrary.simpleMessage(
            "8. Không thảo luận về phát trực tiếp, Twitch hoặc bất kỳ nền tảng tương tự nào khác."),
        "random_text_572": MessageLookupByLibrary.simpleMessage(
            "9. Không sử dụng dịch vụ rút ngắn URL. Hãy chắc chắn để gửi liên kết đầy đủ."),
        "random_text_573": MessageLookupByLibrary.simpleMessage(
            "10. Không chia sẻ mã hóa, tập lệnh hoặc bất kỳ dịch vụ bot nào."),
        "random_text_574": MessageLookupByLibrary.simpleMessage(
            "11. Vui lòng chỉ trò chuyện bằng ngôn ngữ được chỉ định trong phòng trò chuyện, nếu có hành vi lạm dụng sẽ bị chặn."),
        "random_text_575": MessageLookupByLibrary.simpleMessage(
            "12. Nghiêm cấm thảo luận về các chủ đề chính trị và tôn giáo."),
        "random_text_576": MessageLookupByLibrary.simpleMessage(
            "Tất cả quy tắc có thể tìm thấy tại "),
        "random_text_577": MessageLookupByLibrary.simpleMessage("."),
        "random_text_578": MessageLookupByLibrary.simpleMessage(" chơi"),
        "random_text_579":
            MessageLookupByLibrary.simpleMessage("Kết thúc sau "),
        "random_text_58":
            MessageLookupByLibrary.simpleMessage("Tất cả dữ liệu"),
        "random_text_580":
            MessageLookupByLibrary.simpleMessage("1. Điều khoản"),
        "random_text_581":
            MessageLookupByLibrary.simpleMessage("2. Điều khoản"),
        "random_text_582":
            MessageLookupByLibrary.simpleMessage("Tải xuống bản cập nhật"),
        "random_text_583": MessageLookupByLibrary.simpleMessage(
            "Phiên bản mới đang được tải xuống!"),
        "random_text_584": MessageLookupByLibrary.simpleMessage(
            "Phiên bản mới đang được cập nhật, vui lòng chờ..."),
        "random_text_585":
            MessageLookupByLibrary.simpleMessage("Phiên bản hiện tại: "),
        "random_text_586":
            MessageLookupByLibrary.simpleMessage("Phiên bản mới nhất: "),
        "random_text_587":
            MessageLookupByLibrary.simpleMessage("Đã là phiên bản mới nhất"),
        "random_text_588":
            MessageLookupByLibrary.simpleMessage("Tải xuống APP mới nhất"),
        "random_text_589":
            MessageLookupByLibrary.simpleMessage("Địa chỉ nhận tiền"),
        "random_text_59":
            MessageLookupByLibrary.simpleMessage("Tài chính trực tiếp"),
        "random_text_590":
            MessageLookupByLibrary.simpleMessage("Loại tài khoản"),
        "random_text_591":
            MessageLookupByLibrary.simpleMessage("Ngân hàng nhận tiền"),
        "random_text_592":
            MessageLookupByLibrary.simpleMessage("Không có lần nạp tiền nào"),
        "random_text_593":
            MessageLookupByLibrary.simpleMessage("Không có lệnh Rút tiền"),
        "random_text_594":
            MessageLookupByLibrary.simpleMessage("Không Nạp Loại Tiền Này"),
        "random_text_595":
            MessageLookupByLibrary.simpleMessage("Không Rút Loại Tiền Này"),
        "random_text_596":
            MessageLookupByLibrary.simpleMessage("Lợi nhuận hằng năm:"),
        "random_text_597": MessageLookupByLibrary.simpleMessage(
            "Số tiền gửi tối thiểu của loại tiền này là: "),
        "random_text_598":
            MessageLookupByLibrary.simpleMessage("Tìm hiểu thêm về Kho"),
        "random_text_599":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 6"),
        "random_text_6":
            MessageLookupByLibrary.simpleMessage("Tôi đã đọc và đồng ý"),
        "random_text_60":
            MessageLookupByLibrary.simpleMessage("Cá cược trực tiếp"),
        "random_text_600":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tích lũy"),
        "random_text_601":
            MessageLookupByLibrary.simpleMessage("Tiêu chí thăng cấp"),
        "random_text_602":
            MessageLookupByLibrary.simpleMessage("Tiêu chí giữ hạng"),
        "random_text_603":
            MessageLookupByLibrary.simpleMessage("Lương hàng ngày"),
        "random_text_604":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tuần"),
        "random_text_605":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng tháng"),
        "random_text_606":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn giữ cấp độ"),
        "random_text_607":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn kiểm tra"),
        "random_text_608":
            MessageLookupByLibrary.simpleMessage("Hoạt động danh tiếng"),
        "random_text_609": MessageLookupByLibrary.simpleMessage("Giải thích"),
        "random_text_61":
            MessageLookupByLibrary.simpleMessage("Người chơi trực tiếp"),
        "random_text_610": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn đáp ứng các yêu cầu để thăng cấp VIP (nghĩa là bạn đáp ứng các yêu cầu cho tất cả các mã), bạn có thể được thăng cấp lên cấp VIP tương ứng và nhận được tiền thưởng khuyến mãi tương ứng, nếu bạn thăng lên nhiều cấp liên tiếp, bạn có thể nhận được 2. Lương hàng ngày: Đáp ứng yêu cầu về mức lương hàng ngày tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng cho ngày tương ứng, sẽ được đặt lại vào 00:00 hàng ngày;"),
        "random_text_611": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn đáp ứng các yêu cầu xuống hạng trong vòng 90 ngày sau khi được thăng hạng hoặc bị hạ cấp (nghĩa là đáp ứng tất cả các yêu cầu về mã), bạn có thể duy trì cấp VIP hiện tại của mình. Nếu nhu cầu mã hóa không thể được đáp ứng trong vòng 90 ngày, cấp VIP sẽ bị hạ xuống."),
        "random_text_612": MessageLookupByLibrary.simpleMessage(
            "Đáp ứng yêu cầu về mức lương hàng ngày tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng cho ngày tương ứng, sẽ được đặt lại vào 00:00 hàng ngày."),
        "random_text_613": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn đạt đến cấp VIP tương ứng với yêu cầu tiền thưởng hàng tuần tương ứng, bạn có thể nhận được tiền thưởng hàng tuần tương ứng, sẽ được đặt lại vào 00:00 thứ hai hàng tuần."),
        "random_text_614": MessageLookupByLibrary.simpleMessage(
            "Nếu nạp tiền và tiền vòng cược hàng tháng đáp ứng các yêu cầu tiền thưởng hàng tháng tương ứng với cấp VIP hiện tại, bạn có thể nhận được tiền thưởng hàng tháng tương ứng, tiền thưởng này sẽ được đặt lại vào lúc 00:00 ngày đầu tiên hàng tháng."),
        "random_text_615": MessageLookupByLibrary.simpleMessage(
            "Sau khi thành viên đạt đến cấp VIP nhất định, nếu nạp tiền và tiền vòng cược trong tháng trước không đáp ứng yêu cầu duy trì cấp độ, thành viên đó sẽ tự động bị hạ một cấp;"),
        "random_text_616": MessageLookupByLibrary.simpleMessage(
            "Phần thưởng VIP cần tiền vòng cược 1 lần (tức là kiểm toán, tiền vòng cược hoặc đặt cược hợp lệ) trước khi có thể rút tiền, tiền vòng cược được tính không giới hạn ở các nền tảng trò chơi."),
        "random_text_617": MessageLookupByLibrary.simpleMessage(
            "Chức năng này chỉ dành cho của chủ tài khoản có đặt cược trò chơi hợp lệ, nghiêm cấm thuê tài khoản, đặt cược không rủi ro (đối đánh, thông đồng cược, giảm đi tiền vòng cược), hành vi gian lận, sử dụng phần mềm hack, robot, lợi dụng giao thức, sơ hở, tiếp lời, kiểm soát nhóm hoặc nếu có liên quan đến các phương tiện kỹ thuật khác, sau khi được xác minh là đúng, nền tảng chúng tôi có quyền chấm dứt đăng nhập của thành viên, cấm thành viên sử dụng trang web và tịch thu tiền thưởng và lợi nhuận trước mắt mà không cần thông báo đặc biệt nào."),
        "random_text_618": MessageLookupByLibrary.simpleMessage(
            "Khi một thành viên nhận được phần thưởng VIP, nền tảng sẽ cho rằng thành viên đó đồng ý và tuân thủ các điều kiện tương ứng cũng như các quy định liên quan khác. Để tránh sự mơ hồ trong việc hiểu văn bản, nền tảng này có quyền giải thích cuối cùng về hoạt động này."),
        "random_text_619": MessageLookupByLibrary.simpleMessage("Tích điểm"),
        "random_text_62":
            MessageLookupByLibrary.simpleMessage("Nhận lãnh trực tiếp"),
        "random_text_620":
            MessageLookupByLibrary.simpleMessage("Điểm xuống hạng"),
        "random_text_621":
            MessageLookupByLibrary.simpleMessage("7 ngày gần đây"),
        "random_text_622":
            MessageLookupByLibrary.simpleMessage("30 ngày gần đây"),
        "random_text_623":
            MessageLookupByLibrary.simpleMessage("90 ngày gần đây"),
        "random_text_624":
            MessageLookupByLibrary.simpleMessage("VIP Tích Điểm"),
        "random_text_625": MessageLookupByLibrary.simpleMessage(
            "Điểm VIP được tính dựa trên mức cược hợp lệ của bạn"),
        "random_text_626": MessageLookupByLibrary.simpleMessage(
            "1. Tỷ giá sẽ được đồng bộ theo thời gian biến động của thị trường."),
        "random_text_627": MessageLookupByLibrary.simpleMessage(
            "2. Tỷ giá sẽ được áp dụng khi cược của bạn được giải quyết."),
        "random_text_628": MessageLookupByLibrary.simpleMessage(
            "3. Các cược hợp lệ đã được tính sẽ không bị ảnh hưởng bởi tỷ giá tiếp theo."),
        "random_text_629": MessageLookupByLibrary.simpleMessage(
            "4. Đặt cược ở các sân vận động khác nhau sẽ dẫn đến việc tích lũy điểm VIP khác nhau, vui lòng xem hình ảnh bên dưới để biết thêm chi tiết."),
        "random_text_63":
            MessageLookupByLibrary.simpleMessage("Tỷ lệ hoa hồng"),
        "random_text_630":
            MessageLookupByLibrary.simpleMessage("Loại tiền tệ đặt cược"),
        "random_text_631":
            MessageLookupByLibrary.simpleMessage("Tích điểm trò chơi thể thao"),
        "random_text_632":
            MessageLookupByLibrary.simpleMessage("Tích điểm trò chơi Baccarat"),
        "random_text_633":
            MessageLookupByLibrary.simpleMessage("Tích điểm trò chơi điện tử"),
        "random_text_634":
            MessageLookupByLibrary.simpleMessage("Tích điểm trò chơi bắn cá"),
        "random_text_635":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng hoạt động"),
        "random_text_636": MessageLookupByLibrary.simpleMessage("Theo"),
        "random_text_637": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "random_text_638": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra địa chỉ chính xác, nếu địa chỉ sai, sẽ không được nhận tiền"),
        "random_text_639":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn Quốc gia"),
        "random_text_64":
            MessageLookupByLibrary.simpleMessage("Thêm đại lý phụ mới"),
        "random_text_640":
            MessageLookupByLibrary.simpleMessage("Vui lòng điền tên Thành phố"),
        "random_text_641":
            MessageLookupByLibrary.simpleMessage("Các loại tài khoản PIX"),
        "random_text_642": MessageLookupByLibrary.simpleMessage("Quốc gia"),
        "random_text_643": MessageLookupByLibrary.simpleMessage("Giao thức"),
        "random_text_644":
            MessageLookupByLibrary.simpleMessage("Địa chỉ tiền tệ"),
        "random_text_645": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên kết tài khoản rút tiền\n1. Mỗi loại tiền tệ chỉ có thể liên kết với 3 tài khoản nhận tiền\n2. Nếu bạn cần liên kết nhiều hơn, vui lòng xóa những cái không sử dụng thường xuyên trước."),
        "random_text_645c1": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên kết tài khoản rút tiền"),
        "random_text_645c2": MessageLookupByLibrary.simpleMessage(
            "1. Mỗi loại tiền tệ chỉ có thể liên kết với 3 tài khoản nhận tiền"),
        "random_text_645c3": MessageLookupByLibrary.simpleMessage(
            "2. Nếu bạn cần liên kết nhiều hơn, vui lòng xóa những cái không sử dụng thường xuyên trước."),
        "random_text_646":
            MessageLookupByLibrary.simpleMessage("Liên kết địa chỉ nhận"),
        "random_text_647":
            MessageLookupByLibrary.simpleMessage("Liên kết ngân hàng nhận"),
        "random_text_648":
            MessageLookupByLibrary.simpleMessage("Liên kết địa chỉ nhận"),
        "random_text_649": MessageLookupByLibrary.simpleMessage(
            "Mỗi loại tiền tệ chỉ có thể liên kết với 3 tài khoản nhận tiền, nếu bạn cần liên kết nhiều hơn, vui lòng xóa những cái không sử dụng thường xuyên trước"),
        "random_text_65": MessageLookupByLibrary.simpleMessage("Bóng rổ"),
        "random_text_650": MessageLookupByLibrary.simpleMessage("Đổi "),
        "random_text_651": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "random_text_652": MessageLookupByLibrary.simpleMessage("Tỷ giá: "),
        "random_text_653":
            MessageLookupByLibrary.simpleMessage("Phương thức thanh toán"),
        "random_text_654": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kéo xuống để chọn số tiền nạp"),
        "random_text_655": MessageLookupByLibrary.simpleMessage(
            "Bạn chưa có thông tin thanh toán cho loại tiền tệ này\nVui lòng vào ví thẻ để liên kết thông tin nhận tiền"),
        "random_text_655c1": MessageLookupByLibrary.simpleMessage(
            "Bạn chưa có thông tin thanh toán cho loại tiền tệ này"),
        "random_text_655c2": MessageLookupByLibrary.simpleMessage(
            "Vui lòng vào ví thẻ để liên kết thông tin nhận tiền"),
        "random_text_656":
            MessageLookupByLibrary.simpleMessage("Đi tới ví thẻ"),
        "random_text_657": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên kết tài khoản ngân hàng trước"),
        "random_text_658": MessageLookupByLibrary.simpleMessage(
            "Đây là lần đầu tiên bạn rút tiền, bạn cần đặt mật khẩu quỹ trước"),
        "random_text_659": MessageLookupByLibrary.simpleMessage(
            "Đây là lần đầu tiên bạn rút tiền, bạn cần thiết lập xác minh hai yếu tố trước"),
        "random_text_660": MessageLookupByLibrary.simpleMessage("Đánh dấu"),
        "random_text_661": MessageLookupByLibrary.simpleMessage("Ghi chú"),
        "random_text_662": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên kết địa chỉ trước"),
        "random_text_663": MessageLookupByLibrary.simpleMessage("Mạng lưới"),
        "random_text_664":
            MessageLookupByLibrary.simpleMessage("Nạp các loại tiền tệ"),
        "random_text_665": MessageLookupByLibrary.simpleMessage("Số dư "),
        "random_text_666": MessageLookupByLibrary.simpleMessage("Thu nhỏ"),
        "random_text_667": MessageLookupByLibrary.simpleMessage(
            "Vui lòng lòng thử lại sau hoặc liên hệ với chăm sóc khách hàng"),
        "random_text_668": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu của bạn phải dài ít nhất 8 ký tự"),
        "random_text_669":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 6"),
        "random_text_670": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "random_text_671": MessageLookupByLibrary.simpleMessage("Vô hiệu hóa"),
        "random_text_672": MessageLookupByLibrary.simpleMessage(
            "Email xác minh đã được gửi lại "),
        "random_text_673":
            MessageLookupByLibrary.simpleMessage("Thư điện tử đã được gửi đi"),
        "random_text_674": MessageLookupByLibrary.simpleMessage(
            "Địa chỉ email xác nhận đã được gửi tới"),
        "random_text_675": MessageLookupByLibrary.simpleMessage("Ít nhất 1 số"),
        "random_text_676": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu của bạn phải dài ít nhất 8 ký tự"),
        "random_text_677":
            MessageLookupByLibrary.simpleMessage("Mật khẩu không nhất quán"),
        "random_text_678": MessageLookupByLibrary.simpleMessage(
            "Bạn chưa liên kết địa chỉ email của mình, Vui lòng liên kết email của bạn trước và sau đó đặt mật khẩu quỹ"),
        "random_text_679":
            MessageLookupByLibrary.simpleMessage("Thêm thời gian"),
        "random_text_68": MessageLookupByLibrary.simpleMessage("Bóng chày"),
        "random_text_680": MessageLookupByLibrary.simpleMessage("Thể thao 3D"),
        "random_text_681":
            MessageLookupByLibrary.simpleMessage("Không Có Cược Hoạt Động"),
        "random_text_682":
            MessageLookupByLibrary.simpleMessage("Loại hình cược chấp"),
        "random_text_683":
            MessageLookupByLibrary.simpleMessage("Chưa có cược chấp nào"),
        "random_text_684": MessageLookupByLibrary.simpleMessage(
            "Chưa có sự kiện yêu thích nào"),
        "random_text_685": MessageLookupByLibrary.simpleMessage("Hoàn tất"),
        "random_text_686": MessageLookupByLibrary.simpleMessage("Đang xử lý"),
        "random_text_687": MessageLookupByLibrary.simpleMessage("Hoạt động 1"),
        "random_text_688": MessageLookupByLibrary.simpleMessage("Hoạt động 2"),
        "random_text_689": MessageLookupByLibrary.simpleMessage("Hoạt động 3"),
        "random_text_69": MessageLookupByLibrary.simpleMessage("Cầu lông"),
        "random_text_690": MessageLookupByLibrary.simpleMessage("Hoạt động 4"),
        "random_text_691":
            MessageLookupByLibrary.simpleMessage("Hôm nay không hiển thị nữa "),
        "random_text_692":
            MessageLookupByLibrary.simpleMessage("Thông báo trang web "),
        "random_text_693": MessageLookupByLibrary.simpleMessage(
            "Ưu đãi giảm giá độc quyền dành cho VIP"),
        "random_text_694": MessageLookupByLibrary.simpleMessage(
            "Sau mỗi lần bạn đặt cược, sẽ nhận được hoàn tiền vòng cược hàng ngày dựa trên cấp độ VIP của bạn"),
        "random_text_695":
            MessageLookupByLibrary.simpleMessage("Nhận lãnh thất bại"),
        "random_text_696":
            MessageLookupByLibrary.simpleMessage("Nhận lãnh thành công"),
        "random_text_697": MessageLookupByLibrary.simpleMessage(
            "Nhận lãnh tiền thưởng khuyến mãi"),
        "random_text_698": MessageLookupByLibrary.simpleMessage(
            "Nhận lãnh thành công tiền thưởng khuyến mãi "),
        "random_text_699": MessageLookupByLibrary.simpleMessage(
            "Cấp độ VIP của bạn đã đạt đến mức tối đa"),
        "random_text_700": MessageLookupByLibrary.simpleMessage(
            "Đăng ký ngay để bắt đầu cá cược tại sòng bạc hoặc chợ thể thao."),
        "random_text_701": MessageLookupByLibrary.simpleMessage(
            "Nhận tiền thắng cược của bạn ngay lập tức. Quá trình nhận tiền thưởng hàng ngày, hàng tuần và hàng tháng rất đơn giản và dễ dàng."),
        "random_text_702": MessageLookupByLibrary.simpleMessage(
            "Meibo mang đến trải nghiệm độc đáo và tuyệt vời với các phần thưởng không ngừng được trao"),
        "random_text_703": MessageLookupByLibrary.simpleMessage(
            "Hướng dẫn nhận: Tiền thưởng cho hoạt động này đều được phát bằng USDT, bạn có thể chọn loại tiền bạn muốn nhận và tỷ giá giữa các loại tiền tệ áp dụng tỷ giá thị trường theo thời gian thực."),
        "random_text_704": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra số thẻ chính xác, nếu số thẻ sai, sẽ không được nhận tiền"),
        "random_text_705": MessageLookupByLibrary.simpleMessage(
            "nó có thể đặt làm tài khoản mặc định hay không"),
        "random_text_706": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra tài khoản chính xác, nếu tài khoản sai, sẽ không được nhận tiền"),
        "random_text_707": MessageLookupByLibrary.simpleMessage("Đổi "),
        "random_text_708": MessageLookupByLibrary.simpleMessage("Bằng"),
        "random_text_709": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "random_text_709c1": m11,
        "random_text_71": MessageLookupByLibrary.simpleMessage("Tài khoản: "),
        "random_text_710":
            MessageLookupByLibrary.simpleMessage("Xác nhận rút tiền"),
        "random_text_711":
            MessageLookupByLibrary.simpleMessage("Tiền có thể rút "),
        "random_text_712": MessageLookupByLibrary.simpleMessage(
            "\nRút tiền toàn bộ cần tiền vòng cược hợp lệ là "),
        "random_text_713": MessageLookupByLibrary.simpleMessage(
            "Không có kênh phù hợp cho loại tiền tệ này,"),
        "random_text_714": MessageLookupByLibrary.simpleMessage(
            "Vui lòng lòng thử lại sau hoặc liên hệ với chăm sóc khách hàng"),
        "random_text_715": MessageLookupByLibrary.simpleMessage(
            "mật khẩu quỹ được thay đổi thành công"),
        "random_text_716": MessageLookupByLibrary.simpleMessage(
            "Cài đặt mật khẩu quỹ thành công "),
        "random_text_717": MessageLookupByLibrary.simpleMessage(
            "Trò chơi thể thao đang bảo trì..."),
        "random_text_718":
            MessageLookupByLibrary.simpleMessage("Thời gian bảo trì"),
        "random_text_719": MessageLookupByLibrary.simpleMessage("Đến"),
        "random_text_72": MessageLookupByLibrary.simpleMessage("ID cấp trên: "),
        "random_text_720":
            MessageLookupByLibrary.simpleMessage("Trở về trang chủ"),
        "random_text_721":
            MessageLookupByLibrary.simpleMessage("Không có dữ liệu"),
        "random_text_722": MessageLookupByLibrary.simpleMessage("Chụp ảnh"),
        "random_text_723": MessageLookupByLibrary.simpleMessage("Album ảnh"),
        "random_text_724": MessageLookupByLibrary.simpleMessage("Đóng"),
        "random_text_725": MessageLookupByLibrary.simpleMessage("Đã xác minh"),
        "random_text_726": MessageLookupByLibrary.simpleMessage("Tải lại"),
        "random_text_727":
            MessageLookupByLibrary.simpleMessage("Không còn dữ liệu"),
        "random_text_728": MessageLookupByLibrary.simpleMessage("Miêu tả"),
        "random_text_729":
            MessageLookupByLibrary.simpleMessage("Phát trực tiếp"),
        "random_text_73":
            MessageLookupByLibrary.simpleMessage("Thành viên trực tiếp 111111"),
        "random_text_730":
            MessageLookupByLibrary.simpleMessage("Thống kê thời gian thực tế"),
        "random_text_731": MessageLookupByLibrary.simpleMessage("Biến mất"),
        "random_text_732": MessageLookupByLibrary.simpleMessage("Cược chấp"),
        "random_text_733": MessageLookupByLibrary.simpleMessage("Phút"),
        "random_text_734": MessageLookupByLibrary.simpleMessage("Giây"),
        "random_text_735":
            MessageLookupByLibrary.simpleMessage("Thời gian bắt đầu"),
        "random_text_736":
            MessageLookupByLibrary.simpleMessage("Thẻ tích điểm"),
        "random_text_737": MessageLookupByLibrary.simpleMessage(
            "Tải không thành công, vui lòng thử lại"),
        "random_text_738":
            MessageLookupByLibrary.simpleMessage("tải bất thường"),
        "random_text_739":
            MessageLookupByLibrary.simpleMessage("Máy chủ tải bất thường"),
        "random_text_74":
            MessageLookupByLibrary.simpleMessage("Có sẵn để nhận: "),
        "random_text_740":
            MessageLookupByLibrary.simpleMessage("Đang tải xuống"),
        "random_text_741": MessageLookupByLibrary.simpleMessage(
            "Trạng thái tải xuống hiện tại : Chưa bắt đầu"),
        "random_text_742":
            MessageLookupByLibrary.simpleMessage("cập nhật ngay "),
        "random_text_743":
            MessageLookupByLibrary.simpleMessage("Bỏ qua cập nhật"),
        "random_text_744":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập tên "),
        "random_text_745":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập họ"),
        "random_text_746":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập tên thành phố"),
        "random_text_747": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập địa chỉ chi tiết"),
        "random_text_748": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập đúng tài khoản PIX"),
        "random_text_749":
            MessageLookupByLibrary.simpleMessage("Chuyển đổi hoa hồng"),
        "random_text_750": MessageLookupByLibrary.simpleMessage(
            "Tổng số tiền hoa hồng hiện tại của ví tiền hoa hồng được chuyển đổi dựa trên tỷ giá hối đoái USDT là khoảng:"),
        "random_text_751": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể lựa chọn loại tiền tệ mà bạn muốn chuyển đổi "),
        "random_text_752":
            MessageLookupByLibrary.simpleMessage("Sau khi chuyển đổi tiền tệ"),
        "random_text_753": MessageLookupByLibrary.simpleMessage(
            "Dự tính tích luỹ sẽ thu được "),
        "random_text_754":
            MessageLookupByLibrary.simpleMessage("Xác nhận chuyển đổi"),
        "random_text_755":
            MessageLookupByLibrary.simpleMessage("Chuyển tiền hoa hồng"),
        "random_text_756": MessageLookupByLibrary.simpleMessage(
            "Rút tiền hoa hồng thành công"),
        "random_text_757":
            MessageLookupByLibrary.simpleMessage("Rút tiền hoa hồng"),
        "random_text_758":
            MessageLookupByLibrary.simpleMessage("Chuyển vào ví"),
        "random_text_759": MessageLookupByLibrary.simpleMessage(
            "Sau khi chuyển vào ví, bạn cần gấp đôi số tiền đặt cược hợp lệ trước khi có thể rút tiền."),
        "random_text_76": MessageLookupByLibrary.simpleMessage("Ghi"),
        "random_text_760":
            MessageLookupByLibrary.simpleMessage("Tổng cộng khoảng"),
        "random_text_761": MessageLookupByLibrary.simpleMessage(
            "Chuyển đổi loại tiền hoa hồng "),
        "random_text_762": MessageLookupByLibrary.simpleMessage("Chuyển tiền"),
        "random_text_763": MessageLookupByLibrary.simpleMessage("Tuần này"),
        "random_text_764": MessageLookupByLibrary.simpleMessage("Tháng này"),
        "random_text_765": MessageLookupByLibrary.simpleMessage("Quý này"),
        "random_text_766": MessageLookupByLibrary.simpleMessage("Quay lại"),
        "random_text_767":
            MessageLookupByLibrary.simpleMessage("Giới thiệu kho"),
        "random_text_768":
            MessageLookupByLibrary.simpleMessage("Tiền gửi tối thiểu"),
        "random_text_769": MessageLookupByLibrary.simpleMessage("Lãi hằng năm"),
        "random_text_77": MessageLookupByLibrary.simpleMessage(""),
        "random_text_770": MessageLookupByLibrary.simpleMessage(
            "Bạn cần xác nhận đia chỉ email của bạn mới có thể tiến hành nạp tiền "),
        "random_text_771": MessageLookupByLibrary.simpleMessage(" năm trước"),
        "random_text_772": MessageLookupByLibrary.simpleMessage(" tháng trước"),
        "random_text_773": MessageLookupByLibrary.simpleMessage(" ngày trước"),
        "random_text_773copy2":
            MessageLookupByLibrary.simpleMessage(" ngày trước"),
        "random_text_774": MessageLookupByLibrary.simpleMessage(" giờ trước"),
        "random_text_775": MessageLookupByLibrary.simpleMessage(" phút trước"),
        "random_text_776": MessageLookupByLibrary.simpleMessage("Mới đây"),
        "random_text_777": MessageLookupByLibrary.simpleMessage("Đổi tệ"),
        "random_text_778":
            MessageLookupByLibrary.simpleMessage("Rút tiền thất bại"),
        "random_text_779":
            MessageLookupByLibrary.simpleMessage("Đổi thành công"),
        "random_text_78": MessageLookupByLibrary.simpleMessage(""),
        "random_text_780": MessageLookupByLibrary.simpleMessage("Lưu"),
        "random_text_781": MessageLookupByLibrary.simpleMessage("Địa chỉ IP"),
        "random_text_782":
            MessageLookupByLibrary.simpleMessage("Rút tiền thành công"),
        "random_text_783":
            MessageLookupByLibrary.simpleMessage("Rút tiển thất bại"),
        "random_text_784":
            MessageLookupByLibrary.simpleMessage("Nạp tiền thành công"),
        "random_text_785":
            MessageLookupByLibrary.simpleMessage("Nạp tiền thất bại"),
        "random_text_786":
            MessageLookupByLibrary.simpleMessage("Đang tiến hành nạp"),
        "random_text_787": MessageLookupByLibrary.simpleMessage(" của bạn"),
        "random_text_788":
            MessageLookupByLibrary.simpleMessage("Rút tiền thành công"),
        "random_text_789":
            MessageLookupByLibrary.simpleMessage("Đang tiến hành rút"),
        "random_text_79": MessageLookupByLibrary.simpleMessage(""),
        "random_text_790":
            MessageLookupByLibrary.simpleMessage("Số tiền nạp đã đến"),
        "random_text_791":
            MessageLookupByLibrary.simpleMessage("đang tiến hành nạp tiền"),
        "random_text_792":
            MessageLookupByLibrary.simpleMessage("Số tiền rút đã đến"),
        "random_text_793":
            MessageLookupByLibrary.simpleMessage("Đang tiến hành rút tiền"),
        "random_text_794":
            MessageLookupByLibrary.simpleMessage("Không Có Cược Đã Kết Thúc"),
        "random_text_795": MessageLookupByLibrary.simpleMessage(
            "Không có kênh phù hợp cho loại tiền tệ này"),
        "random_text_796": MessageLookupByLibrary.simpleMessage("Của bạn"),
        "random_text_797": MessageLookupByLibrary.simpleMessage("Tại "),
        "random_text_798": MessageLookupByLibrary.simpleMessage("Của"),
        "random_text_799": MessageLookupByLibrary.simpleMessage(
            "Đã sao chép thành công, hãy chia sẻ vào phòng chat !"),
        "random_text_8": MessageLookupByLibrary.simpleMessage("Bước 1/2:\t\t"),
        "random_text_80": MessageLookupByLibrary.simpleMessage(""),
        "random_text_800": MessageLookupByLibrary.simpleMessage(
            "Đã sao chép thành công, hãy chia sẻ trực tuyến !"),
        "random_text_801": MessageLookupByLibrary.simpleMessage("Mục tiêu"),
        "random_text_802": MessageLookupByLibrary.simpleMessage("Kết quả"),
        "random_text_803": MessageLookupByLibrary.simpleMessage("Rủi ro cao"),
        "random_text_804": MessageLookupByLibrary.simpleMessage("Trung bình"),
        "random_text_805": MessageLookupByLibrary.simpleMessage("Thứ hạng"),
        "random_text_806": MessageLookupByLibrary.simpleMessage("Nhà cái"),
        "random_text_807": MessageLookupByLibrary.simpleMessage("Người chơi"),
        "random_text_808":
            MessageLookupByLibrary.simpleMessage("Ném tối thiểu"),
        "random_text_809":
            MessageLookupByLibrary.simpleMessage("Xác suất chiến thắng"),
        "random_text_81": MessageLookupByLibrary.simpleMessage(""),
        "random_text_810": MessageLookupByLibrary.simpleMessage(
            "Công bằng đã được chứng nhận"),
        "random_text_811":
            MessageLookupByLibrary.simpleMessage("Hạt giống máy chủ"),
        "random_text_812":
            MessageLookupByLibrary.simpleMessage("Hạt giống không có hiển thị"),
        "random_text_813": MessageLookupByLibrary.simpleMessage(
            "Hạt giống máy chủ đang hoạt động (Băm)"),
        "random_text_814":
            MessageLookupByLibrary.simpleMessage("Hạt giống khách hàng"),
        "random_text_815":
            MessageLookupByLibrary.simpleMessage("Dấu hiệu thực tế"),
        "random_text_816": MessageLookupByLibrary.simpleMessage(
            "Chuyển động máy chủ của bạn để xác minh đặt cược này"),
        "random_text_817": MessageLookupByLibrary.simpleMessage(
            "Sự công bằng có thể chứng minh được là gì?"),
        "random_text_818": MessageLookupByLibrary.simpleMessage("Băm"),
        "random_text_819": MessageLookupByLibrary.simpleMessage("Hạt giống"),
        "random_text_82": MessageLookupByLibrary.simpleMessage(""),
        "random_text_820":
            MessageLookupByLibrary.simpleMessage("Xác minh đặt cược"),
        "random_text_821":
            MessageLookupByLibrary.simpleMessage("Đã gửi phản hồi thành công"),
        "random_text_822":
            MessageLookupByLibrary.simpleMessage("Không thể sử dụng tiền tệ"),
        "random_text_823": MessageLookupByLibrary.simpleMessage("Hệ thống lỗi"),
        "random_text_824":
            MessageLookupByLibrary.simpleMessage("Đổi thành công"),
        "random_text_825": MessageLookupByLibrary.simpleMessage(
            "Vui lòng đọc đầy đủ các điều khoản và điều kiện, vuốt đến cuối cùng để chấp nhận nó."),
        "random_text_826": MessageLookupByLibrary.simpleMessage("Thể thao"),
        "random_text_827":
            MessageLookupByLibrary.simpleMessage("Khuyến mãi mới nhất"),
        "random_text_828":
            MessageLookupByLibrary.simpleMessage("Kết thúc vào "),
        "random_text_829":
            MessageLookupByLibrary.simpleMessage("Nhận 100 xu miễn phí"),
        "random_text_830":
            MessageLookupByLibrary.simpleMessage("Tên tài khoản"),
        "random_text_831": MessageLookupByLibrary.simpleMessage("Báo cáo"),
        "random_text_832":
            MessageLookupByLibrary.simpleMessage("Lời mời của tôi"),
        "random_text_833": MessageLookupByLibrary.simpleMessage("Quy tắc"),
        "random_text_834": MessageLookupByLibrary.simpleMessage(
            "Mời bạn bè trợ giúp rút tiền"),
        "random_text_835":
            MessageLookupByLibrary.simpleMessage("Chuyển sang ví phải cần "),
        "random_text_836":
            MessageLookupByLibrary.simpleMessage("Chia sẻ với bạn bè"),
        "random_text_837": MessageLookupByLibrary.simpleMessage("Từ bỏ "),
        "random_text_838":
            MessageLookupByLibrary.simpleMessage(" rút tiền BRL"),
        "random_text_839":
            MessageLookupByLibrary.simpleMessage("Nhận xu miễn phí"),
        "random_text_84": MessageLookupByLibrary.simpleMessage("Bắn cá"),
        "random_text_840": MessageLookupByLibrary.simpleMessage("Rút nhanh"),
        "random_text_841": MessageLookupByLibrary.simpleMessage(
            "Vòng quay miễn phí nhận được tiền thật"),
        "random_text_842": MessageLookupByLibrary.simpleMessage("Rút thưởng"),
        "random_text_843":
            MessageLookupByLibrary.simpleMessage("Bạn cần phải "),
        "random_text_844":
            MessageLookupByLibrary.simpleMessage(" mới có thể rút tiền đến ví"),
        "random_text_845": m12,
        "random_text_846":
            MessageLookupByLibrary.simpleMessage("Đặt cược ngay"),
        "random_text_847":
            MessageLookupByLibrary.simpleMessage("Vừa nhận được"),
        "random_text_848": MessageLookupByLibrary.simpleMessage(
            "Mời bạn bè trợ giúp rút tiền"),
        "random_text_849": MessageLookupByLibrary.simpleMessage(
            "2. Gửi lời mời trợ giúp tới người chơi ngẫu nhiên"),
        "random_text_85": MessageLookupByLibrary.simpleMessage("Đánh bài"),
        "random_text_850":
            MessageLookupByLibrary.simpleMessage("Gửi qua WhatsApp"),
        "random_text_851": MessageLookupByLibrary.simpleMessage("Gửi tin nhắn"),
        "random_text_852": MessageLookupByLibrary.simpleMessage(
            "Chúc mừng bạn may mắn, bạn đã thắng"),
        "random_text_853":
            MessageLookupByLibrary.simpleMessage("4 rút tiền đến Pix phải cần"),
        "random_text_854":
            MessageLookupByLibrary.simpleMessage("Yêu cầu thêm thông tin"),
        "random_text_855":
            MessageLookupByLibrary.simpleMessage("Bạn có thể rút nhanh"),
        "random_text_856": MessageLookupByLibrary.simpleMessage(
            "Tổng số tiền phải thanh toán"),
        "random_text_857":
            MessageLookupByLibrary.simpleMessage("Đã gửi yêu cầu thanh toán"),
        "random_text_858":
            MessageLookupByLibrary.simpleMessage("Bạn cần phải "),
        "random_text_859":
            MessageLookupByLibrary.simpleMessage(" mới có thể rút tiền đến ví"),
        "random_text_860": MessageLookupByLibrary.simpleMessage(
            "sẽ được gửi vào tài khoản ví của bạn"),
        "random_text_861":
            MessageLookupByLibrary.simpleMessage("Mời bạn bè trợ giúp"),
        "random_text_862":
            MessageLookupByLibrary.simpleMessage("Vui lòng cấp quyền"),
        "random_text_863": MessageLookupByLibrary.simpleMessage("Nhận"),
        "random_text_864": MessageLookupByLibrary.simpleMessage("xu miễn phí"),
        "random_text_865":
            MessageLookupByLibrary.simpleMessage("Trong 1 giờ rút nhanh "),
        "random_text_866": MessageLookupByLibrary.simpleMessage(
            "Không có sẵn ở khu vực của bạn"),
        "random_text_867": MessageLookupByLibrary.simpleMessage("vừa đổi "),
        "random_text_868": MessageLookupByLibrary.simpleMessage("Th 2"),
        "random_text_869": MessageLookupByLibrary.simpleMessage("Th 3"),
        "random_text_870": MessageLookupByLibrary.simpleMessage("Th 4"),
        "random_text_871": MessageLookupByLibrary.simpleMessage("Th 5"),
        "random_text_872": MessageLookupByLibrary.simpleMessage("Th 6"),
        "random_text_873": MessageLookupByLibrary.simpleMessage("Th 7"),
        "random_text_874": MessageLookupByLibrary.simpleMessage("CN"),
        "random_text_875":
            MessageLookupByLibrary.simpleMessage("Bạn thật may mắn!"),
        "random_text_876":
            MessageLookupByLibrary.simpleMessage("Tất cả các loại tiền tệ"),
        "random_text_877":
            MessageLookupByLibrary.simpleMessage("Mật khẩu quỹ mới"),
        "random_text_878": MessageLookupByLibrary.simpleMessage(
            "Mã xác nhận đã được gửi thành công"),
        "random_text_879":
            MessageLookupByLibrary.simpleMessage("Yêu cầu chuyển vào ví"),
        "random_text_88": MessageLookupByLibrary.simpleMessage("Cấp độ"),
        "random_text_880":
            MessageLookupByLibrary.simpleMessage("Bạn có thể chuyển vào ví"),
        "random_text_881":
            MessageLookupByLibrary.simpleMessage("Yêu cầu lập tức"),
        "random_text_882":
            MessageLookupByLibrary.simpleMessage("Chuyển vào ví lập tức"),
        "random_text_883":
            MessageLookupByLibrary.simpleMessage("Tất cả hoạt động"),
        "random_text_884":
            MessageLookupByLibrary.simpleMessage("Đang xét duyệt"),
        "random_text_885":
            MessageLookupByLibrary.simpleMessage("Tiền vòng cược hiện tại "),
        "random_text_886": MessageLookupByLibrary.simpleMessage("Tiến độ "),
        "random_text_887": MessageLookupByLibrary.simpleMessage("Giữ hạng cần"),
        "random_text_888": MessageLookupByLibrary.simpleMessage("S"),
        "random_text_889": MessageLookupByLibrary.simpleMessage(
            "Tổng cược của bạn với tất cả các loại tiền điện tử sẽ được chuyển đổi thành loại tiền của cuộc đua"),
        "random_text_89":
            MessageLookupByLibrary.simpleMessage("Số tiền hoàn lại"),
        "random_text_890": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhấp vào để thử lại"),
        "random_text_891":
            MessageLookupByLibrary.simpleMessage("Trò chơi nguyên bản"),
        "random_text_892": MessageLookupByLibrary.simpleMessage("Chào bạn 👋"),
        "random_text_893": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi có thể giúp được gì cho bạn?"),
        "random_text_894": MessageLookupByLibrary.simpleMessage(
            "Dịch vụ khách hàng trực tuyến 24/7"),
        "random_text_895": MessageLookupByLibrary.simpleMessage(
            "Dịch vụ khách hàng luôn sẵn sàng giúp bạn giải quyết các vấn đề và giải đáp thắc mắc"),
        "random_text_896":
            MessageLookupByLibrary.simpleMessage("Chi tiết sự kiện "),
        "random_text_897":
            MessageLookupByLibrary.simpleMessage("Hoàn tiền 12%"),
        "random_text_898": MessageLookupByLibrary.simpleMessage("Tối đa: 25%"),
        "random_text_899":
            MessageLookupByLibrary.simpleMessage("Đặt cược 5000 đến cấp 2"),
        "random_text_9": MessageLookupByLibrary.simpleMessage("Tháng giêng"),
        "random_text_900": MessageLookupByLibrary.simpleMessage(
            "Tiền hoàn lại của bạn trong tuần này"),
        "random_text_901": MessageLookupByLibrary.simpleMessage(
            "Bạn sẽ nhận được ??? tiền hoàn lại khi chơi trong tuần này."),
        "random_text_902":
            MessageLookupByLibrary.simpleMessage("Thời gian thống kê"),
        "random_text_903":
            MessageLookupByLibrary.simpleMessage("Thời gian phát "),
        "random_text_904": MessageLookupByLibrary.simpleMessage("Nhận ngay "),
        "random_text_905":
            MessageLookupByLibrary.simpleMessage("Thời gian nhận"),
        "random_text_906":
            MessageLookupByLibrary.simpleMessage("Cấp hoàn tiền"),
        "random_text_907":
            MessageLookupByLibrary.simpleMessage("Tỷ lệ hoàn tiền"),
        "random_text_908":
            MessageLookupByLibrary.simpleMessage("Điều khoản và quy tắc"),
        "random_text_909": MessageLookupByLibrary.simpleMessage(
            "Hoàn tiền được phát hàng tuần như một phần thưởng"),
        "random_text_910": MessageLookupByLibrary.simpleMessage(
            "Hàng tuần hoàn tiền được tính từ 00:00 thứ hai đến 23:59 chủ nhật."),
        "random_text_911": MessageLookupByLibrary.simpleMessage(
            "Thời gian áp dụng hoàn tiền: từ 06:00 thứ hai tuần sau đến 23:59 thứ sáu, sau ngày hết hạn sẽ không được hoàn tiền."),
        "random_text_912": MessageLookupByLibrary.simpleMessage(
            "Số tiền thua lỗ thực tế nhân với tỷ lệ hoàn tiền sẽ bằng số tiền hoàn lại trong tuần này."),
        "random_text_913": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn chưa đặt bất kỳ cược nào trong thời gian hoàn tiền hoặc nếu tổng số tiền lãi của bạn từ tuần trước vượt quá số tiền thua lỗ, bạn sẽ không nhận được tiền hoàn lại."),
        "random_text_914": MessageLookupByLibrary.simpleMessage(
            "Giới hạn tối đa hoàn lại tiền hàng tuần cho mỗi người là 10.000 BRL."),
        "random_text_915": MessageLookupByLibrary.simpleMessage(
            "Tiền hoàn lại có thể rút trực tiếp hoặc tiếp tục chơi."),
        "random_text_916":
            MessageLookupByLibrary.simpleMessage("Tham gia ngay bây giờ"),
        "random_text_917":
            MessageLookupByLibrary.simpleMessage("Lời mời chi tiết "),
        "random_text_918": MessageLookupByLibrary.simpleMessage("Hợp lệ "),
        "random_text_919":
            MessageLookupByLibrary.simpleMessage("Không hợp lệ "),
        "random_text_92":
            MessageLookupByLibrary.simpleMessage("Số người đóng góp"),
        "random_text_920":
            MessageLookupByLibrary.simpleMessage("Tích lũy nạp ở mức thấp"),
        "random_text_921": MessageLookupByLibrary.simpleMessage("Cao hơn"),
        "random_text_922":
            MessageLookupByLibrary.simpleMessage("Tích lũy cược ở mức thấp"),
        "random_text_923": MessageLookupByLibrary.simpleMessage(
            "Số lần tích lũy nạp ở mức thấp"),
        "random_text_924":
            MessageLookupByLibrary.simpleMessage("2 lần hoặc cao hơn"),
        "random_text_925": MessageLookupByLibrary.simpleMessage(
            "Số lần tích lũy nạp ở mức thấp theo ngày"),
        "random_text_926":
            MessageLookupByLibrary.simpleMessage("Nạp thử 1 lần "),
        "random_text_927":
            MessageLookupByLibrary.simpleMessage("Sự kiện được tài trợ "),
        "random_text_928":
            MessageLookupByLibrary.simpleMessage("Chia sẻ nhanh"),
        "random_text_929": MessageLookupByLibrary.simpleMessage(
            "Số lượng liên kết có hiệu lực 0 người"),
        "random_text_930": MessageLookupByLibrary.simpleMessage(
            "Số lượng liên kết có hiệu lực là gì ? (Đáp ứng đầy đủ các điều kiện sau)"),
        "random_text_931":
            MessageLookupByLibrary.simpleMessage("Sự kiện yêu cầu "),
        "random_text_932": MessageLookupByLibrary.simpleMessage(
            "Số tiền nạp tích lũy đáp ứng yêu cầu sự kiện và sẽ được đặt lại vào lúc 00:00 hàng ngày"),
        "random_text_933": MessageLookupByLibrary.simpleMessage("Chỉ định nạp"),
        "random_text_934": MessageLookupByLibrary.simpleMessage("Tổng nạp"),
        "random_text_935":
            MessageLookupByLibrary.simpleMessage("Nội dung sự kiện"),
        "random_text_936": MessageLookupByLibrary.simpleMessage(
            "1. Tiền nạp hàng ngày được tích lũy có thể nhận được các mức tiền thưởng khác nhau. Bạn nạp càng nhiều, phần thưởng càng lớn, lên tới 0,02\n\n2. Vào lúc 00:00 hàng ngày, số tiền nạp tích lũy sẽ về 0 và bạn có thể tiếp tục nạp để nhận phần thưởng\n\n3. Phần thưởng chỉ có thể nhận vào ngày hôm sau và chỉ có thể nhận thủ công trên các nền tảng IOS, Android, H5 và PC, nếu không nhận tiền thưởng sẽ hết hiệu lực\n\n4. Phần thưởng của sự kiện này (không bao gồm tiền gốc) yêu cầu 1 lần đặt cược hợp lệ mới có thể rút, đặt cược không giới hạn ở nền tảng trò chơi \n\n5. Sự kiện này giới hạn ở các thao tác thủ công thông thường, tất cả các chủ tài khoản, tài khoản cho thuê, sử dụng phần mềm gian lận, robot, đặt cược giữa các tài khoản khác nhau, thao túng lẫn nhau, hành vi gian lận, API, giao dịch, lợi dụng sơ hở, kiểm soát nhóm hoặc các phương tiện kỹ thuật khác đều bị cấm, nếu không thì phần thưởng sẽ được phát có thể bị hủy, khấu trừ hoặc tài khoản có thể bị đóng băng thậm chí bị đưa vào danh sách đen\n\n6. Để tránh sự hiểu nhầm trong nội dung sự kiện, nền tảng có quyền giải thích cuối cùng về sự kiện này."),
        "random_text_937": MessageLookupByLibrary.simpleMessage(
            "Tiền thưởng trên trời rơi xuống, nạp thử 1 lần "),
        "random_text_938":
            MessageLookupByLibrary.simpleMessage("Nhắc giữ hạng "),
        "random_text_939":
            MessageLookupByLibrary.simpleMessage("Lĩnh giảm giá "),
        "random_text_939copy2": MessageLookupByLibrary.simpleMessage(""),
        "random_text_94":
            MessageLookupByLibrary.simpleMessage("Đã nhận hoa hồng thành công"),
        "random_text_940":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng sinh nhật "),
        "random_text_941": MessageLookupByLibrary.simpleMessage("Nền tảng "),
        "random_text_942": MessageLookupByLibrary.simpleMessage("Tỷ lệ "),
        "random_text_943":
            MessageLookupByLibrary.simpleMessage("Nạp để duy trì cấp cần"),
        "random_text_944": MessageLookupByLibrary.simpleMessage(
            "Tền vòng cược để duy trì cấp vẫn cần "),
        "random_text_945":
            MessageLookupByLibrary.simpleMessage("Phong bao sự kiện "),
        "random_text_946":
            MessageLookupByLibrary.simpleMessage("Mỗi trận phong bì 100000"),
        "random_text_947":
            MessageLookupByLibrary.simpleMessage("Phong bì lớn nhất 8888"),
        "random_text_948": MessageLookupByLibrary.simpleMessage(
            "1.Mỗi lần mưa phong bì đều phát miễn phí 100,000BRL"),
        "random_text_949": MessageLookupByLibrary.simpleMessage(
            "2.Số tiền giảm tối đa: mỗi lần phát phong bì đều miễn phí"),
        "random_text_95":
            MessageLookupByLibrary.simpleMessage("Vào tài khoản của bạn "),
        "random_text_950": MessageLookupByLibrary.simpleMessage(
            "3.Hội viên đã nạp tiền có thể lãnh miễn phí"),
        "random_text_951": MessageLookupByLibrary.simpleMessage(
            "4.Tất cả số tiền đã lĩnh có thể đặt cược trò chơi hoặc trực tiếp rút tiền"),
        "random_text_952": MessageLookupByLibrary.simpleMessage(
            "5.Hội viên VIP cấp tầng càng cao tiền thưởngn càng nhiều "),
        "random_text_953": MessageLookupByLibrary.simpleMessage(
            "6.Để tránh sự hiểu nhầm trong nội dung sự kiện, nền tảng có quyền giải thích cuối cùng về sự kiện này."),
        "random_text_954": MessageLookupByLibrary.simpleMessage(
            "Tiền rơi như mưa mỗi ngày 6 lần "),
        "random_text_955": MessageLookupByLibrary.simpleMessage(
            "Tiền rơi như mưa\nMở quà có thưởng "),
        "random_text_956":
            MessageLookupByLibrary.simpleMessage("Mỗi ngày 6 lần"),
        "random_text_957": MessageLookupByLibrary.simpleMessage(
            "Mùng 1 đến mùng 7 hàng tháng "),
        "random_text_958": MessageLookupByLibrary.simpleMessage(
            "Mỗi thứ sáu, thứ bảy, chủ nhật hàng tuần "),
        "random_text_959":
            MessageLookupByLibrary.simpleMessage("Mỗi ngày 3 lần"),
        "random_text_96":
            MessageLookupByLibrary.simpleMessage("Thành công nhận lãnh"),
        "random_text_960":
            MessageLookupByLibrary.simpleMessage("Thời gian khác"),
        "random_text_961":
            MessageLookupByLibrary.simpleMessage("Phong bì lần sau "),
        "random_text_962":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng may mắn "),
        "random_text_963":
            MessageLookupByLibrary.simpleMessage("Đang tiến hành "),
        "random_text_964": MessageLookupByLibrary.simpleMessage("Chưa mở"),
        "random_text_965": MessageLookupByLibrary.simpleMessage(
            "Nạp tiền+ cược (đặt lại sau 7 ngày liên tiếp)"),
        "random_text_966":
            MessageLookupByLibrary.simpleMessage("Cấp dưới nạp tiền lần đầu"),
        "random_text_967": MessageLookupByLibrary.simpleMessage("ngày"),
        "random_text_967_copy": MessageLookupByLibrary.simpleMessage("ngày"),
        "random_text_968": MessageLookupByLibrary.simpleMessage(
            "Số người liên kết có hiệu lực"),
        "random_text_969": MessageLookupByLibrary.simpleMessage("người "),
        "random_text_97":
            MessageLookupByLibrary.simpleMessage("Hoa hồng nhận lãnh"),
        "random_text_970": MessageLookupByLibrary.simpleMessage("/23 người "),
        "random_text_971": MessageLookupByLibrary.simpleMessage("Tổng nạp "),
        "random_text_972":
            MessageLookupByLibrary.simpleMessage("Hiệu suất nạp"),
        "random_text_973":
            MessageLookupByLibrary.simpleMessage("Nạp tiền khác "),
        "random_text_974":
            MessageLookupByLibrary.simpleMessage("Tiền vòng cược hiện tại "),
        "random_text_975": MessageLookupByLibrary.simpleMessage("Nạp tiền "),
        "random_text_976": MessageLookupByLibrary.simpleMessage("Giảm giá"),
        "random_text_977":
            MessageLookupByLibrary.simpleMessage("Bạn đã nhận tiền thành công"),
        "random_text_978": MessageLookupByLibrary.simpleMessage(
            "Tạm thời chưa thể nhận tiền hoàn cược "),
        "random_text_979": MessageLookupByLibrary.simpleMessage("Sân vận động"),
        "random_text_98": MessageLookupByLibrary.simpleMessage(
            "Hoa hồng hiện tại của bạn có thể nhận được:"),
        "random_text_980": MessageLookupByLibrary.simpleMessage(
            "1.Tất cả các loại tiền cược sẽ được hệ thống tự động chuyển đổi thành USDT."),
        "random_text_981": MessageLookupByLibrary.simpleMessage(
            "2.Tỷ giá tiền tệ sẽ được tính vào lúc kết thúc vòng cược dựa theo tỷ giá thị trường vào thời điểm đó."),
        "random_text_982": MessageLookupByLibrary.simpleMessage(
            "3.Tiền cược đã được thống kê sẽ không bị ảnh hưởng bởi tỷ giá đối hoái sau."),
        "random_text_983": MessageLookupByLibrary.simpleMessage(
            "1.Tất cả các loại tiền tệ sẽ được tính dựa theo tỷ giá hiện trường thực."),
        "random_text_984": MessageLookupByLibrary.simpleMessage(
            "2.Tỷ giá sẽ được đổi theo tỷ giá thị trường vào lúc nạp tiền thành công."),
        "random_text_985": MessageLookupByLibrary.simpleMessage(
            "Tiền vòng cược sẽ được tính dựa vào tiền cược hợp lệ của bạn。"),
        "random_text_986": MessageLookupByLibrary.simpleMessage(
            "Nạp tiền sẽ dựa theo tỷ giá USDT của thị trường"),
        "random_text_987": MessageLookupByLibrary.simpleMessage("Mỗi tháng "),
        "random_text_988": MessageLookupByLibrary.simpleMessage("ngày "),
        "random_text_988cpoy2": m13,
        "random_text_989": MessageLookupByLibrary.simpleMessage("Thứ hai "),
        "random_text_99": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể tuỳ ý lựa chọn tiền tệ để nhận"),
        "random_text_990": MessageLookupByLibrary.simpleMessage("Thứ ba "),
        "random_text_991": MessageLookupByLibrary.simpleMessage("Thứ tư "),
        "random_text_992": MessageLookupByLibrary.simpleMessage("Thứ năm "),
        "random_text_993": MessageLookupByLibrary.simpleMessage("Thứ sáu"),
        "random_text_994": MessageLookupByLibrary.simpleMessage("Thứ bảy"),
        "random_text_995": MessageLookupByLibrary.simpleMessage("Chủ nhật"),
        "random_text_996": MessageLookupByLibrary.simpleMessage("Mỗi "),
        "random_text_997":
            MessageLookupByLibrary.simpleMessage("Đổi thất bại "),
        "random_text_998": MessageLookupByLibrary.simpleMessage("Nhận và đổi"),
        "random_text_999":
            MessageLookupByLibrary.simpleMessage("Mỗi Trận Phong Bì "),
        "random_text_fix1": MessageLookupByLibrary.simpleMessage(
            "Vui lòng bao gồm dấu “@” trong địa chỉ email của bạn"),
        "random_text_fix2": MessageLookupByLibrary.simpleMessage(
            "Thư thiết lập lại mật khẩu đã được gửi vào địa chỉ hòm thư"),
        "random_text_fix3": MessageLookupByLibrary.simpleMessage(
            "Đừng quên kiểm tra các khuyến mãi thể thao và trên casino khổng lồ của chúng tôi trước khi bạn rời đi!"),
        "reacquire": MessageLookupByLibrary.simpleMessage("Yêu cầu lấy lại"),
        "receive": MessageLookupByLibrary.simpleMessage("Nhận lãnh"),
        "recover_password_text":
            MessageLookupByLibrary.simpleMessage("Lấy Lại Mật Khẩu"),
        "recover_password_title_text":
            MessageLookupByLibrary.simpleMessage("Cài đặt lại mật khẩu"),
        "redeem_bonus_text":
            MessageLookupByLibrary.simpleMessage("Đổi phần thưởng airdrop"),
        "redeem_bonus_tips_text": MessageLookupByLibrary.simpleMessage(
            "Nhận mã thưởng airdrop trên các nền tảng truyền thông xã hội của chúng tôi như Twitter và Telegram"),
        "redeem_code_text": MessageLookupByLibrary.simpleMessage("Đoạn mã"),
        "reg_next": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "register_an_account":
            MessageLookupByLibrary.simpleMessage("Đăng ký Tài khoản"),
        "register_protocol_title":
            MessageLookupByLibrary.simpleMessage("Các điều khoản và điều kiện"),
        "resend_email_text":
            MessageLookupByLibrary.simpleMessage("Gửi lại Email"),
        "responsible_btn_clear_limit": MessageLookupByLibrary.simpleMessage(
            "Xóa bỏ giới hạn số tiền cược"),
        "responsible_btn_request_self_exclusion":
            MessageLookupByLibrary.simpleMessage("Yêu cầu tự loại trừ"),
        "responsible_for_gambling": MessageLookupByLibrary.simpleMessage(
            "Chịu trách nhiệm về sòng bạc"),
        "responsible_gaming":
            MessageLookupByLibrary.simpleMessage("Đặt Cược Có Trách Nhiệm"),
        "responsible_label_loss_limits":
            MessageLookupByLibrary.simpleMessage("Giới hạn tổn thất"),
        "responsible_tab_betting_limits":
            MessageLookupByLibrary.simpleMessage("Giới Hạn Đặt Cược"),
        "responsible_title_self_exclusion":
            MessageLookupByLibrary.simpleMessage("Tự Loại Trừ"),
        "s_2fa_body_code_text":
            MessageLookupByLibrary.simpleMessage("Mã hai yếu tố"),
        "s_2fa_body_code_text1":
            MessageLookupByLibrary.simpleMessage(" mã hai yếu tố"),
        "s_2fa_body_tips_text": MessageLookupByLibrary.simpleMessage(
            "Để giữ cho tài khoản của bạn thêm an toàn, hãy bật xác thực hai yếu tố."),
        "s_2fa_body_title_text": MessageLookupByLibrary.simpleMessage(
            "Vô hiệu hoá xác minh hai yếu tố"),
        "s_2fa_body_warning_text": MessageLookupByLibrary.simpleMessage(
            "Sau khi tắt nó, bạn cần thêm lại khóa bí mật vào Authenticator và khóa bí mật cũ sẽ không còn hợp lệ."),
        "search_game":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm trò chơi của bạn"),
        "set_fund_password":
            MessageLookupByLibrary.simpleMessage("Đặt mật khẩu quỹ"),
        "setting": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "settled_bet": MessageLookupByLibrary.simpleMessage("Đã đặt"),
        "setup_pay_password_button_text":
            MessageLookupByLibrary.simpleMessage("Xác minh hòm thử điện tử"),
        "setup_pay_password_title_text": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu quỹ sẽ được sử dụng để bảo vệ việc rút tiền và rút an toàn từ kho tiền"),
        "showingContentNow": m14,
        "single_bet": MessageLookupByLibrary.simpleMessage("Đơn"),
        "snack_bar_normal_tips":
            MessageLookupByLibrary.simpleMessage("Trân trọng thông báo"),
        "social_account_text":
            MessageLookupByLibrary.simpleMessage("Tài khoản mạng xã hội"),
        "sponsorships": MessageLookupByLibrary.simpleMessage("Tài trợ"),
        "sport_add_more": MessageLookupByLibrary.simpleMessage("Tải Thêm"),
        "sport_all": MessageLookupByLibrary.simpleMessage("Tất Cả"),
        "sport_bet": MessageLookupByLibrary.simpleMessage("Đặt cược thể thao"),
        "sport_bet_dota2": MessageLookupByLibrary.simpleMessage("Dota 2"),
        "sport_bet_football": MessageLookupByLibrary.simpleMessage("Bóng đá"),
        "sport_bet_handicap":
            MessageLookupByLibrary.simpleMessage("Kèo nhường điểm"),
        "sport_bet_hot":
            MessageLookupByLibrary.simpleMessage("Sự Kiện Phổ Biến"),
        "sport_bet_lol":
            MessageLookupByLibrary.simpleMessage("Liên Minh Huyền Thoại"),
        "sport_bet_page": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "sport_bet_pingpong": MessageLookupByLibrary.simpleMessage("Bóng bàn"),
        "sport_bet_puck": MessageLookupByLibrary.simpleMessage("Bóng "),
        "sport_bet_score":
            MessageLookupByLibrary.simpleMessage("Kèo tổng điểm"),
        "sport_bet_tennis": MessageLookupByLibrary.simpleMessage("Quần vợt"),
        "sport_bet_volleyball":
            MessageLookupByLibrary.simpleMessage("Bóng chuyền"),
        "sport_bet_winning":
            MessageLookupByLibrary.simpleMessage("Người chiến thắng"),
        "sport_betting_begin_bet": MessageLookupByLibrary.simpleMessage(
            "Bắt đầu đặt cược ngay bây giờ!"),
        "sport_champion": MessageLookupByLibrary.simpleMessage("Hiện tại"),
        "sport_des_one": MessageLookupByLibrary.simpleMessage(
            "Cá cược thể thao trực tuyến bằng tiền điện tử tốt nhất"),
        "sport_des_two": MessageLookupByLibrary.simpleMessage(
            "Đặt cược vào các đội thể thao, người chơi và giải đấu từ khắp nơi trên thế giới với nền tảng cá cược thể thao của chúng tôi. Tận hưởng trải nghiệm cá cược thể thao tuyệt vời bằng cách đặt cược vào nhiều tùy chọn cá cược khác nhau trên sóng trực tiếp như MMA, bóng rổ, bóng đá và nhiều môn thể thao khác "),
        "sport_event_list_begin_time":
            MessageLookupByLibrary.simpleMessage("Bắt Đầu Sau"),
        "sport_event_list_over": MessageLookupByLibrary.simpleMessage("Đã đặt"),
        "sport_event_list_sort_ab":
            MessageLookupByLibrary.simpleMessage("Tất Cả"),
        "sport_event_list_sort_hot":
            MessageLookupByLibrary.simpleMessage("Phổ biến"),
        "sport_event_list_time_hour_after":
            MessageLookupByLibrary.simpleMessage("Bắt Đầu Sau: Sau 60 giờ"),
        "sport_event_list_time_min_after":
            MessageLookupByLibrary.simpleMessage("Bắt Đầu Sau: Sau 60 phút"),
        "sport_event_list_time_sec_after":
            MessageLookupByLibrary.simpleMessage("Bắt Đầu Sau: Sau 60 giây"),
        "sport_fav_comming_rolling": MessageLookupByLibrary.simpleMessage(
            "Sắp diễn ra trận đấu phổ biến"),
        "sport_fav_hot_rolling":
            MessageLookupByLibrary.simpleMessage("Sưu tầm"),
        "sport_lock": MessageLookupByLibrary.simpleMessage("Đóng kèo"),
        "sport_locked": MessageLookupByLibrary.simpleMessage("Khóa kèo"),
        "sport_nodata":
            MessageLookupByLibrary.simpleMessage("Không Có Cược Đã Kết Thúc"),
        "sport_rolling_coming":
            MessageLookupByLibrary.simpleMessage("Trực tiếp \$ Sắp Diễn Ra"),
        "sport_tabbar_coming":
            MessageLookupByLibrary.simpleMessage("Sắp Bắt Đầu"),
        "sport_tabbar_favorites":
            MessageLookupByLibrary.simpleMessage("Yêu thích"),
        "sport_tabbar_hall": MessageLookupByLibrary.simpleMessage("Sảnh"),
        "sport_tabbar_mybet":
            MessageLookupByLibrary.simpleMessage("Cược Của Tôi"),
        "sport_tabbar_rank":
            MessageLookupByLibrary.simpleMessage("Xếp hạng cuộc thi"),
        "sport_tabbar_rolling":
            MessageLookupByLibrary.simpleMessage("Sự Kiện Trực Tuyến"),
        "sport_unlogin": MessageLookupByLibrary.simpleMessage("Chưa đăng nhập"),
        "sports_betting_rules":
            MessageLookupByLibrary.simpleMessage("Cách Đặt Cược Thể Thao"),
        "start_game_text": MessageLookupByLibrary.simpleMessage("Chơi"),
        "state_pending": MessageLookupByLibrary.simpleMessage("Chờ xử lý"),
        "state_processed": MessageLookupByLibrary.simpleMessage("Đã xử lý"),
        "statistics_title_lose_text":
            MessageLookupByLibrary.simpleMessage("Thua"),
        "statistics_title_total_text":
            MessageLookupByLibrary.simpleMessage("Tổng Cược"),
        "statistics_title_win_text":
            MessageLookupByLibrary.simpleMessage("Thắng"),
        "submit_bet_result": MessageLookupByLibrary.simpleMessage(
            "Đã chặn thành công tổng giá trị"),
        "submit_bet_result_amount": m15,
        "submit_text": MessageLookupByLibrary.simpleMessage("Gửi"),
        "success_pwd": MessageLookupByLibrary.simpleMessage("Thành công"),
        "successfullyCopi":
            MessageLookupByLibrary.simpleMessage("Đã sao chép!"),
        "tab_bar_chat_room": MessageLookupByLibrary.simpleMessage("Chat"),
        "tab_bar_ent": MessageLookupByLibrary.simpleMessage("Casino"),
        "tab_bar_ent_copy": MessageLookupByLibrary.simpleMessage("Casino"),
        "tab_bar_exchange_text":
            MessageLookupByLibrary.simpleMessage("Ưu đãi giảm giá"),
        "tab_bar_kyc_text":
            MessageLookupByLibrary.simpleMessage("Mã xác minh KYC"),
        "tab_bar_menu": MessageLookupByLibrary.simpleMessage("Duyệt"),
        "tab_bar_order": MessageLookupByLibrary.simpleMessage("Cược"),
        "tab_bar_orders": MessageLookupByLibrary.simpleMessage("Phiếu Cược"),
        "tab_bar_sports": MessageLookupByLibrary.simpleMessage("Thể thao"),
        "tab_bar_title_2fa_text":
            MessageLookupByLibrary.simpleMessage("Hai yếu tố"),
        "tab_bar_title_2fa_textcopy2":
            MessageLookupByLibrary.simpleMessage("Xác minh hai bước"),
        "tab_bar_title_black_list_text":
            MessageLookupByLibrary.simpleMessage("Chặn Người Chơi"),
        "tab_bar_title_change_password_text":
            MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
        "tab_bar_title_contact_text":
            MessageLookupByLibrary.simpleMessage("Chung"),
        "tab_bar_title_data_statistics_text":
            MessageLookupByLibrary.simpleMessage("Thống kê"),
        "tab_bar_title_google_verification_text":
            MessageLookupByLibrary.simpleMessage("Mã xác minh Google"),
        "tab_bar_title_login_log_text":
            MessageLookupByLibrary.simpleMessage("Phiên"),
        "tab_bar_title_privacy_text":
            MessageLookupByLibrary.simpleMessage("Tuỳ chọn"),
        "tab_bar_title_trophy_text":
            MessageLookupByLibrary.simpleMessage("Chiến tích"),
        "tab_bar_title_withdrawal_info_text":
            MessageLookupByLibrary.simpleMessage("Thông tin xuất khoản"),
        "terms_of_service_text":
            MessageLookupByLibrary.simpleMessage("Điều Khoản Dịch Vụ"),
        "text_field_birthday_tips":
            MessageLookupByLibrary.simpleMessage("Ngày Sinh"),
        "text_field_user_name_tips":
            MessageLookupByLibrary.simpleMessage("Tên đăng nhập"),
        "text_filed_tips_repeat_password_text":
            MessageLookupByLibrary.simpleMessage("Đặt lại mật khẩu"),
        "token_invalid_text":
            MessageLookupByLibrary.simpleMessage("Token của bạn đã hết hạn"),
        "top_login": MessageLookupByLibrary.simpleMessage("Đăng Nhập"),
        "top_login_copy": MessageLookupByLibrary.simpleMessage("Đăng Nhập"),
        "top_register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "top_sports":
            MessageLookupByLibrary.simpleMessage("Môn Thể Thao Hàng Đầu"),
        "top_wallet_setting":
            MessageLookupByLibrary.simpleMessage("Cài đặt Ví"),
        "transaction_password":
            MessageLookupByLibrary.simpleMessage("Mật khẩu giao dịch"),
        "transaction_password_set_successfully":
            MessageLookupByLibrary.simpleMessage(
                "Mật khẩu giao dịch đã cài đặt thành công"),
        "transaction_records":
            MessageLookupByLibrary.simpleMessage("Giao dịch"),
        "transactions_detail_bet": MessageLookupByLibrary.simpleMessage("Cược"),
        "transactions_detail_blockchan_protocol":
            MessageLookupByLibrary.simpleMessage("Thỏa thuận giao dịch"),
        "transactions_detail_card":
            MessageLookupByLibrary.simpleMessage("Thẻ tín dụng"),
        "transactions_detail_card_number":
            MessageLookupByLibrary.simpleMessage("Tài khoản nhận tiền"),
        "transactions_detail_coin_type":
            MessageLookupByLibrary.simpleMessage("Tiền tệ"),
        "transactions_detail_help": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn cần trợ giúp, vui lòng liên hệ hỗ trợ trực tuyến"),
        "transactions_detail_means":
            MessageLookupByLibrary.simpleMessage("Phương thức giao dịch:"),
        "transactions_detail_odds":
            MessageLookupByLibrary.simpleMessage("Phép nhân"),
        "transactions_detail_order_id":
            MessageLookupByLibrary.simpleMessage("Mã đơn"),
        "transactions_detail_pay":
            MessageLookupByLibrary.simpleMessage("Est. Thanh toán"),
        "transactions_detail_play": m16,
        "transactions_detail_player": m17,
        "transactions_detail_state":
            MessageLookupByLibrary.simpleMessage("Tình trạng"),
        "transactions_detail_state_confirmed":
            MessageLookupByLibrary.simpleMessage("Đã xác nhận"),
        "transactions_detail_state_confirming":
            MessageLookupByLibrary.simpleMessage("Đang xác nhận"),
        "transactions_detail_state_fail":
            MessageLookupByLibrary.simpleMessage("Thất bại"),
        "transactions_detail_state_time_out":
            MessageLookupByLibrary.simpleMessage("Đơn cược quá thời hạn"),
        "transactions_detail_time":
            MessageLookupByLibrary.simpleMessage("Thời gian giao dịch"),
        "transactions_other": MessageLookupByLibrary.simpleMessage("Khác"),
        "transactions_other_bonus":
            MessageLookupByLibrary.simpleMessage("Giải thưởng"),
        "transactions_other_campaign_withdrawal":
            MessageLookupByLibrary.simpleMessage("Rút tiền hoa hồng "),
        "transactions_other_drop":
            MessageLookupByLibrary.simpleMessage("Phần thưởng airdrop"),
        "transactions_other_rains_received":
            MessageLookupByLibrary.simpleMessage("Nhận được phong bao đỏ"),
        "transactions_other_reload_claim":
            MessageLookupByLibrary.simpleMessage("Nhận tiền thưởng nạp tiền"),
        "twice_password_error_text": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu nhập hai lần không chính xác"),
        "two_password_inputs_are_inconsistent":
            MessageLookupByLibrary.simpleMessage(
                "Hai lần nhập mật khẩu không nhất quán"),
        "user_name_error_tips": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng chứa các ký tự không hợp lệ"),
        "user_name_uppercase_error_tips": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng không được chứa ký tự viết hoa"),
        "username_already_exists_text": MessageLookupByLibrary.simpleMessage(
            "Tên người dùng này đã được sử dụng, vui lòng chọn tên người dùng khác"),
        "vault": MessageLookupByLibrary.simpleMessage("Kho"),
        "vault_Cancel_deposit_request":
            MessageLookupByLibrary.simpleMessage("Hủy lệnh nạp tiền"),
        "vault_Confirm_deposit_with_full_amount_excluding_fees_to_avoid_issues_with_crediting":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng xác nhận rằng địa chỉ thanh toán đã được nạp đầy đủ số tiền (không bao gồm phí xử lý), nếu không có thể dẫn đến việc không thể lên điểm."),
        "vault_USDT_transfer_in_progress_Please_wait_for_confirmation": m18,
        "vault_address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
        "vault_amount": MessageLookupByLibrary.simpleMessage("Số tiền"),
        "vault_amountCannotExceedMaximum": MessageLookupByLibrary.simpleMessage(
            "Số tiền không thể vượt quá mức tối đa"),
        "vault_confirm_payment":
            MessageLookupByLibrary.simpleMessage("Nạp tiền"),
        "vault_confirmedExtractionFromVault":
            MessageLookupByLibrary.simpleMessage(
                "Đã xác nhận rút tiền từ kho bảo hiểm"),
        "vault_confirmedExtractionFromVaultcopy2":
            MessageLookupByLibrary.simpleMessage(""),
        "vault_currency": MessageLookupByLibrary.simpleMessage("Kho tiền tệ"),
        "vault_deposit": MessageLookupByLibrary.simpleMessage("Chuyển vào"),
        "vault_deposit_vault":
            MessageLookupByLibrary.simpleMessage("Nạp vào Kho"),
        "vault_enteringVault": MessageLookupByLibrary.simpleMessage(" vào kho"),
        "vault_have_deposited":
            MessageLookupByLibrary.simpleMessage("Tôi đã nạp tiền"),
        "vault_increase_your_account_security_with_double_verification":
            MessageLookupByLibrary.simpleMessage(
                "Cải thiện bảo mật tài khoản của bạn với Xác thực hai yếu tố"),
        "vault_max_value": MessageLookupByLibrary.simpleMessage("Tối đa"),
        "vault_minimum_amount_limit_text": m19,
        "vault_recharge_amount":
            MessageLookupByLibrary.simpleMessage("Số tiền nạp"),
        "vault_successfullyStor":
            MessageLookupByLibrary.simpleMessage("Đã gửi thành công "),
        "vault_take_out": MessageLookupByLibrary.simpleMessage("Rút ra"),
        "vault_takeout": MessageLookupByLibrary.simpleMessage("Rút từ Kho"),
        "vault_the_minimal_amount_is": m20,
        "vault_this_field_is_required":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn địa chỉ"),
        "vault_transfer_amount": m21,
        "vault_transfer_to_address":
            MessageLookupByLibrary.simpleMessage("Địa chỉ chuyển vào"),
        "vault_turn_on_two_step_verification":
            MessageLookupByLibrary.simpleMessage("Kích Hoạt 2FA"),
        "vault_two_step_verification":
            MessageLookupByLibrary.simpleMessage("Hai Yếu Tố"),
        "vault_vaultDeposits":
            MessageLookupByLibrary.simpleMessage("Nạp vào kho"),
        "vault_withdraw_money":
            MessageLookupByLibrary.simpleMessage("Rút tiền "),
        "verification_code_must_be_filled":
            MessageLookupByLibrary.simpleMessage(
                "Mã xác minh không được bỏ trống"),
        "version": MessageLookupByLibrary.simpleMessage("Phiên bản "),
        "vip": MessageLookupByLibrary.simpleMessage("VIP"),
        "vip_bouns_history_tab_amount":
            MessageLookupByLibrary.simpleMessage("Số tiền nhận được"),
        "vip_bouns_history_tab_time":
            MessageLookupByLibrary.simpleMessage("Thời gian nhận lãnh"),
        "vip_bouns_history_tab_type":
            MessageLookupByLibrary.simpleMessage("Cách thức nhận"),
        "vip_bouns_total":
            MessageLookupByLibrary.simpleMessage("Tổng số tiền nhận được"),
        "vip_club": MessageLookupByLibrary.simpleMessage("VIP Club"),
        "vip_commission_history":
            MessageLookupByLibrary.simpleMessage("Lịch sử nhận lãnh"),
        "vip_commission_receive":
            MessageLookupByLibrary.simpleMessage("Nhận bằng một nhấn"),
        "vip_degree_of_progress":
            MessageLookupByLibrary.simpleMessage("Quá trình tiến độ"),
        "vip_get_recharge_bonus":
            MessageLookupByLibrary.simpleMessage("Nhận tiền thưởng nạp tiền"),
        "vip_level": MessageLookupByLibrary.simpleMessage("Chưa có cấp độ"),
        "vip_level_copper": MessageLookupByLibrary.simpleMessage("Đồng"),
        "vip_next_collection_is_at": m22,
        "vip_next_level": m23,
        "vip_recharge_bonus":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng nạp tiền"),
        "vip_recharge_bonus_is_valid_until": m24,
        "vip_rule_content": MessageLookupByLibrary.simpleMessage(
            "Tiêu chí khuyến mãi: Nếu bạn đáp ứng đủ yêu cầu khuyến mãi VIP (tức là bạn đáp ứng đủ điều kiện cho tất cả các mã), bạn có thể được thăng cấp VIP tương ứng và nhận được tiền thưởng khuyến mãi tương ứng, nếu bạn thăng lên nhiều cấp liên tiếp , bạn có thể nhận được tất cả tiền thưởng khuyến mãi;\n\n2. Bảng thưởng theo ngày: Nếu bạn đáp ứng yêu cầu về mức thưởng hàng ngày tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng hàng ngày tương ứng, được đặt lại vào 00:00 hàng ngày; \n \n3. Bảng thưởng theo tuần: Nếu bạn đáp ứng yêu cầu về mức thưởng hàng tuần tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng hàng tuần tương ứng, vào lúc 00:00 thứ Hai hàng tuần;\n\n4. Bảng thưởng hàng tháng: Nếu việc nạp tiền và mã hóa hàng tháng đáp ứng yêu cầu mưcd thưởng hàng tháng tương ứng với cấp VIP hiện tại, bạn có thể nhận được tiền thưởng hàng tháng tương ứng, được đặt lại vào lúc 00:00 ngày 1 hàng tháng;\n\n5. Duy trì cấp độ Lưu ý: Sau khi thành viên đạt đến một cấp VIP nhất định, nếu việc nạp tiền và mã hóa trong tháng trước không đáp ứng yêu cầu duy trì cấp độ, thành viên sẽ tự động bị hạ một cấp \n\n6. Hướng dẫn kiểm tra: Tiền thưởng do VIP đưa ra yêu cầu gấp 1 lần doanh thu (tức là kiểm toán, Rút tiền mặt chỉ có thể được thực hiện bằng mã hóa hoặc cá cược hợp lệ) và mã hóa không giới hạn ở các nền tảng trò chơi;\n\n7. Tuyên bố hoạt động: Chức năng này được giới hạn cho chủ tài khoản đối với cá cược trò chơi thông thường. Tài khoản cho thuê, cá cược không rủi ro (cá cược chống lại, gian lận, trả thấp) đều bị cấm. Sau khi được xác minh, nền tảng này có quyền chấm dứt đăng nhập của thành viên, đình chỉ việc sử dụng trang web của thành viên và tịch thu tiền thưởng và Quyền kiếm lợi nhuận không chính đáng mà không cần thông báo đặc biệt; \n\n8.Giải thích: Khi thành viên nhận được phần thưởng VIP, nền tảng sẽ cho rằng thành viên đó đồng ý và tuân thủ các điều kiện tương ứng và các quy định liên quan khác. Để tránh sự mơ hồ trong cách hiểu văn bản, nền tảng giữ nguyên cách giải thích cuối cùng về sự kiện này ngay"),
        "vip_rule_title": MessageLookupByLibrary.simpleMessage("Quy tắc VIP"),
        "vip_tab_bouns":
            MessageLookupByLibrary.simpleMessage("Tiền thưởng thăng cấp"),
        "vip_tab_bouns_day":
            MessageLookupByLibrary.simpleMessage("Bảng phần thưởng theo ngày"),
        "vip_tab_bouns_month":
            MessageLookupByLibrary.simpleMessage("Bảng phần thưởng theo tháng"),
        "vip_tab_bouns_week":
            MessageLookupByLibrary.simpleMessage("Bảng phần thưởng theo tuần"),
        "vip_tab_exp":
            MessageLookupByLibrary.simpleMessage("Trải nghiệm ưu đãi"),
        "vip_tab_level": MessageLookupByLibrary.simpleMessage(" Cấp bậc"),
        "vip_tab_turnover": MessageLookupByLibrary.simpleMessage("Tình trạng"),
        "vip_welfare": MessageLookupByLibrary.simpleMessage("Lợi ích"),
        "vip_your_progress":
            MessageLookupByLibrary.simpleMessage("Tiến Độ VIP Của Bạn"),
        "viprule_content1": MessageLookupByLibrary.simpleMessage(
            " 1. Tiêu chí thăng cấp: Nếu bạn đáp ứng các yêu cầu để thăng cấp VIP (nghĩa là đáp ứng tất cả các yêu cầu về mã hóa), bạn có thể được thăng cấp lên cấp VIP tương ứng và nhận phần thưởng khuyến mãi tương ứng, nếu bạn thăng lên nhiều cấp liên tiếp, bạn có thể nhận được tất cả tiền thưởng khuyến mãi cấp độ."),
        "viprule_content2": MessageLookupByLibrary.simpleMessage(
            "2. Bảng thưởng theo ngày: Nếu bạn đáp ứng yêu cầu về mức thưởng hàng ngày tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng hàng ngày tương ứng, được đặt lại vào 00:00 hàng ngày"),
        "viprule_content3": MessageLookupByLibrary.simpleMessage(
            "3. Bảng thưởng theo tuần: Nếu bạn đáp ứng yêu cầu về mức thưởng hàng tuần tương ứng với cấp VIP, bạn có thể nhận được tiền thưởng hàng tuần tương ứng, được đặt lại vào lúc 00:00 Thứ Hai hàng tuần."),
        "viprule_content4": MessageLookupByLibrary.simpleMessage(
            "4. Bảng thưởng theo tháng: Nếu việc nạp tiền và mã hóa hàng tháng đáp ứng yêu cầu về mức thưởng hàng tháng tương ứng với cấp VIP hiện tại, bạn có thể nhận được tiền thưởng hàng tháng tương ứng, tiền thưởng này sẽ được đặt lại vào lúc 00:00 ngày đầu tiên hàng tháng."),
        "viprule_content5": MessageLookupByLibrary.simpleMessage(
            "5. Hướng dẫn duy trì cấp độ: Sau khi thành viên đạt đến cấp VIP nhất định, nếu việc nạp tiền và mã hóa trong tháng trước không đáp ứng yêu cầu duy trì, thành viên sẽ tự động bị hạ một cấp."),
        "viprule_content6": MessageLookupByLibrary.simpleMessage(
            "6. Hướng dẫn kiểm tra: Phần thưởng do VIP đưa ra yêu cầu doanh thu gấp 1 lần (tức là kiểm toán, mã hóa hoặc đặt cược hợp lệ) trước khi có thể rút và mã hóa không giới hạn ở các nền tảng trò chơi."),
        "viprule_content7": MessageLookupByLibrary.simpleMessage(
            "7. Nêu rõ hoạt động: Chức năng này được chủ tài khoản giới hạn cho cá cược trò chơi thông thường. Cấm cho thuê tài khoản, cá cược không mang tính rủi ro (đánh đối trang, đánh đối đơn cược, đơn cược tỷ lệ thấp), chênh lệch giá độc hại, sử dụng plug-in, robot, khai thác giao thức, sơ hở , giao diện, Nếu có liên quan đến việc kiểm soát nhóm hoặc các phương tiện kỹ thuật khác và sau khi được xác minh là đúng, nền tảng có quyền chấm dứt hoạt động đăng nhập của thành viên, đình chỉ việc sử dụng trang web của thành viên và tịch thu tiền thưởng và lợi nhuận không chính đáng mà không cần thông báo đặc biệt."),
        "viprule_content8": MessageLookupByLibrary.simpleMessage(
            "Giải thích: Khi một thành viên nhận được phần thưởng VIP, trang bet sẽ cho rằng thành viên đó đồng ý và tuân thủ các điều kiện tương ứng và các quy định liên quan khác. Để tránh sự mơ hồ trong cách hiểu văn bản, trang bet có quyền bảo lưu sự giải thích về hoạt động này"),
        "viprule_content_copy1": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn đáp ứng các yêu cầu để thăng cấp VIP (nghĩa là bạn đáp ứng các yêu cầu cho tất cả các mã), bạn có thể được thăng cấp lên cấp VIP tương ứng và nhận được tiền thưởng khuyến mãi tương ứng, nếu bạn thăng lên nhiều cấp liên tiếp, bạn có thể nhận được."),
        "wallet": MessageLookupByLibrary.simpleMessage("Ví"),
        "wallet_accountOpeningOutlets":
            MessageLookupByLibrary.simpleMessage("Trang mở tài khoản"),
        "wallet_amountCannotBe": m25,
        "wallet_bankSelection":
            MessageLookupByLibrary.simpleMessage("Lựa chọn ngân hàng"),
        "wallet_cancel": MessageLookupByLibrary.simpleMessage("Hủy bỏ"),
        "wallet_confirmDelete":
            MessageLookupByLibrary.simpleMessage("Xác nhận xoá"),
        "wallet_currency": MessageLookupByLibrary.simpleMessage("Tiền"),
        "wallet_deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("Xóa bỏ xác nhận"),
        "wallet_deposit": MessageLookupByLibrary.simpleMessage("Nạp tiền "),
        "wallet_deposit_copy":
            MessageLookupByLibrary.simpleMessage("Chi tiết "),
        "wallet_email_hint_auth": MessageLookupByLibrary.simpleMessage(
            "Bạn phải xác minh địa chỉ email của mình với rút tiền kho."),
        "wallet_email_open": MessageLookupByLibrary.simpleMessage("Mở Gmail "),
        "wallet_enterFundPassword":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu quỹ"),
        "wallet_fundPassword":
            MessageLookupByLibrary.simpleMessage("Mật khẩu quỹ"),
        "wallet_fundPasswordcopy2":
            MessageLookupByLibrary.simpleMessage(" Mật khẩu quỹ"),
        "wallet_goToSettings":
            MessageLookupByLibrary.simpleMessage("Đi tới cài đặt"),
        "wallet_hideChangeBalance":
            MessageLookupByLibrary.simpleMessage("Ẩn số dư bằng không"),
        "wallet_maximumAmountIs":
            MessageLookupByLibrary.simpleMessage("Số tiền tối đa là "),
        "wallet_minimumAmountIs":
            MessageLookupByLibrary.simpleMessage("Số tiền tối thiểu là "),
        "wallet_paymentBankCard":
            MessageLookupByLibrary.simpleMessage("Thẻ ngân hàng rút tiền"),
        "wallet_pixAccount":
            MessageLookupByLibrary.simpleMessage("Tài khoản PIX"),
        "wallet_pleaseBindWithdrawalMethodBeforeMakingWithdrawal":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng liên kết phương thức rút tiền trước khi rút"),
        "wallet_pleaseEnterAmount":
            MessageLookupByLibrary.simpleMessage("10.00-100000.00"),
        "wallet_pleaseEnterFundPassword":
            MessageLookupByLibrary.simpleMessage("Độ dài ký tự tối thiểu là 6"),
        "wallet_pleaseEnterNameDepositor": MessageLookupByLibrary.simpleMessage(
            "Vui lòng điền họ tên người nạp tiền"),
        "wallet_pleaseSelectAmount":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn số tiền"),
        "wallet_pleaseSelectPIXAccount": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn một tài khoản PIX"),
        "wallet_search": MessageLookupByLibrary.simpleMessage("Tìm"),
        "wallet_setFundPassword": MessageLookupByLibrary.simpleMessage(
            "Để đảm bảo an toàn cho tiền của bạn, trước tiên vui lòng đặt mật khẩu quỹ"),
        "wallet_successfulApplicationForPayment":
            MessageLookupByLibrary.simpleMessage("Lệnh rút tiền thành công"),
        "wallet_transferAmount":
            MessageLookupByLibrary.simpleMessage("Số tiền chuyển khoản"),
        "wallet_withdraw_money":
            MessageLookupByLibrary.simpleMessage("Rút tiền"),
        "wallet_yourFundPasswordContainsDigit": m26,
        "wallet_yourZeroBalanceWillNotBeDisplayedInWallet":
            MessageLookupByLibrary.simpleMessage(
                "Số dư bằng 0 của bạn sẽ không xuất hiện trong ví của bạn"),
        "welcome_body_text": m27,
        "welcome_title_text": MessageLookupByLibrary.simpleMessage("Chào mừng"),
        "withdraw_money_type":
            MessageLookupByLibrary.simpleMessage("Cách thức rút tiền"),
        "you_have_not_bound_your_email": MessageLookupByLibrary.simpleMessage(
            "Bạn chưa liên kết địa chỉ email của mình"),
        "yulecheng_casino":
            MessageLookupByLibrary.simpleMessage("sòng bạc trực tiếp"),
        "yulecheng_hot_recoment":
            MessageLookupByLibrary.simpleMessage("Đề xuất"),
        "yulecheng_nextpage": MessageLookupByLibrary.simpleMessage("Tiếp"),
        "yulecheng_prepage": MessageLookupByLibrary.simpleMessage("Trước"),
        "yulecheng_savegame_tofavorite":
            MessageLookupByLibrary.simpleMessage("để thêm trò chơi yêu thích"),
        "yulecheng_selectShowBalance":
            MessageLookupByLibrary.simpleMessage("Lựa chọn hiển thị số dư"),
        "yulecheng_slot": MessageLookupByLibrary.simpleMessage("Máy đánh bạc"),
        "yulecheng_special_slot":
            MessageLookupByLibrary.simpleMessage("Máy đánh bạc con hổ"),
        "yulecheng_trygame": MessageLookupByLibrary.simpleMessage("Chơi vui"),
        "yulecheng_zanwushoucang": MessageLookupByLibrary.simpleMessage(
            "Chưa có mục yêu thích, sử dụng")
      };
}
