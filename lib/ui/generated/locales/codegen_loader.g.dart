// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "common": {
    "title": "Project"
  },
  "login": {
    "invalid_credentials": "Invalid username or password",
    "login_failed": "Login failed. Please try again.",
    "username": "User name",
    "password": "Password",
    "forgot_password": "Forgot password?",
    "login_button": "Login",
    "no_account": "Don't Have An Account?",
    "sign_up": "Sign Up"
  },
  "home": {
    "say_something": "Say something...",
    "listening": "Listening...",
    "hi": "Hi {fullName}",
    "speech_to_text": "Speech To Text"
  },
  "history": {
    "title": "History",
    "all": "All",
    "today": "Today",
    "this_week": "This week",
    "load_error": "Unable to load history data",
    "error_occurred": "An error occurred: {error}",
    "try_again": "Try again",
    "no_history": "No history yet",
    "today_time": "Today · {time}",
    "yesterday_time": "Yesterday · {time}",
    "days_ago": "{days} days ago"
  },
  "setting": {
    "title": "Setting",
    "language": "Language",
    "en": "English",
    "vn": "Vietnamese",
    "password": "Password",
    "information": "Information",
    "logout": "Logout"
  },
  "sign_up": {
    "title": "Sign up",
    "contact_admin": "Please contact the administrator to register an account."
  },
  "startup": {
    "microphone_permission": "Microphone Permission",
    "permission_message": "The app needs microphone access to function properly. Please open Settings and grant the permission.",
    "open_setting": "Open Setting"
  },
  "forgot_password": {
    "title": "Forgot Password",
    "enter_email": "Enter your email",
    "enter_otp": "Enter OTP",
    "enter_new_password": "Enter new password",
    "re_enter_password": "Re-enter new password",
    "continue": "Continue",
    "invalid_email": "Invalid email.",
    "invalid_otp": "Invalid OTP."
  },
  "change_password": {
    "title": "Change Password",
    "enter_old_password": "Enter old password",
    "enter_new_password": "Enter new password",
    "re_enter_password": "Re-enter new password",
    "continue": "Continue"
  },
  "dialog": {
    "success": "Success"
  },
  "suggestions": {
    "sing_song": "Sing me a song",
    "restaurants": "Restaurants nearby",
    "play_game": "Play a game",
    "sports_news": "Sports news",
    "random_fun": "Random fun",
    "weather": "Today's Weather"
  }
};
static const Map<String,dynamic> _vi = {
  "common": {
    "title": "Project"
  },
  "login": {
    "invalid_credentials": "Tên đăng nhập hoặc mật khẩu không hợp lệ",
    "login_failed": "Đăng nhập thất bại. Vui lòng thử lại.",
    "username": "Tên đăng nhập",
    "password": "Mật khẩu",
    "forgot_password": "Quên mật khẩu?",
    "login_button": "Đăng nhập",
    "no_account": "Chưa có tài khoản?",
    "sign_up": "Đăng ký"
  },
  "home": {
    "say_something": "Nói gì đó...",
    "listening": "Đang nghe...",
    "hi": "Xin chào {fullName}",
    "speech_to_text": "Speech To Text"
  },
  "history": {
    "title": "Lịch sử",
    "all": "Tất cả",
    "today": "Hôm nay",
    "this_week": "Tuần này",
    "load_error": "Không thể tải dữ liệu lịch sử",
    "error_occurred": "Đã xảy ra lỗi: {error}",
    "try_again": "Thử lại",
    "no_history": "Chưa có lịch sử nào",
    "today_time": "Hôm nay · {time}",
    "yesterday_time": "Hôm qua · {time}",
    "days_ago": "{days} ngày trước"
  },
  "setting": {
    "title": "Cài đặt",
    "language": "Ngôn ngữ",
    "en": "Tiếng Anh",
    "vn": "Tiếng Việt",
    "password": "Mật khẩu",
    "information": "Thông tin",
    "logout": "Đăng xuất"
  },
  "sign_up": {
    "title": "Đăng ký",
    "contact_admin": "Vui lòng liên hệ quản trị viên để đăng ký tài khoản."
  },
  "startup": {
    "microphone_permission": "Quyền truy cập microphone",
    "permission_message": "Ứng dụng cần quyền truy cập microphone để hoạt động. Vui lòng mở Cài đặt và cấp quyền.",
    "open_setting": "Mở Cài đặt"
  },
  "forgot_password": {
    "title": "Quên mật khẩu",
    "enter_email": "Nhập email của bạn",
    "enter_otp": "Nhập mã OTP",
    "enter_new_password": "Nhập mật khẩu mới",
    "re_enter_password": "Nhập lại mật khẩu mới",
    "continue": "Tiếp tục",
    "invalid_email": "Email không hợp lệ.",
    "invalid_otp": "Mã OTP không hợp lệ."
  },
  "change_password": {
    "title": "Đổi mật khẩu",
    "enter_old_password": "Nhập mật khẩu cũ",
    "enter_new_password": "Nhập mật khẩu mới",
    "re_enter_password": "Nhập lại mật khẩu mới",
    "continue": "Tiếp tục"
  },
  "dialog": {
    "success": "Thành công"
  },
  "suggestions": {
    "sing_song": "Hát cho tôi nghe",
    "restaurants": "Nhà hàng gần đây",
    "play_game": "Chơi game",
    "sports_news": "Tin thể thao",
    "random_fun": "Vui vẻ ngẫu nhiên",
    "weather": "Thời tiết hôm nay"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "vi": _vi};
}
