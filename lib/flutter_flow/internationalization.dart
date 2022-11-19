import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'ta', 'ur'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? taText = '',
    String? urText = '',
  }) =>
      [enText, hiText, taText, urText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'c8er7fvc': {
      'en': 'Materialist',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'awn1ttmh': {
      'en': 'Welcome, and access your account below.',
      'hi': 'स्वागत है, और नीचे अपने खाते तक पहुंचें।',
      'ta': 'வரவேற்கிறோம், கீழே உள்ள உங்கள் கணக்கை அணுகவும்.',
      'ur': 'خوش آمدید، اور نیچے اپنے اکاؤنٹ تک رسائی حاصل کریں۔',
    },
    '7coe115q': {
      'en': 'Sign In',
      'hi': 'साइन इन करें',
      'ta': 'உள்நுழையவும்',
      'ur': 'سائن ان',
    },
    'e9pnyzm9': {
      'en': 'Email Address',
      'hi': 'ईमेल पता',
      'ta': 'மின்னஞ்சல் முகவரி',
      'ur': 'ای میل اڈریس',
    },
    'z0v8ougp': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
      'ur': 'پاس ورڈ',
    },
    'd7zjcwes': {
      'en': 'Sign In',
      'hi': 'साइन इन करें',
      'ta': 'உள்நுழையவும்',
      'ur': 'سائن ان',
    },
    'hhgceptf': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
      'ur': 'پاسورڈ بھول گے؟',
    },
    'mnrqbvlk': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'ta': 'பதிவு செய்யவும்',
      'ur': 'سائن اپ',
    },
    'ye7jjwdc': {
      'en': 'Email Address',
      'hi': 'ईमेल पता',
      'ta': 'மின்னஞ்சல் முகவரி',
      'ur': 'ای میل اڈریس',
    },
    'y4q7638d': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
      'ur': 'پاس ورڈ',
    },
    'ffc8ingn': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
      'ur': 'اکاؤنٹ بنائیں',
    },
    'tazfclws': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '64wzffab': {
      'en': 'Email address should be minimum 5 characters',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'anmgh4rt': {
      'en': 'email address is too long',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'niw2rp7x': {
      'en': 'Email seems to be invalid. Please check',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0erhnun6': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'mw32hvo4': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rklj8lg5': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // forgotPassword
  {
    's20e49ou': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    'xl8nladc': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா',
      'ur': 'پاسورڈ بھول گے',
    },
    'fjhybvst': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
      'ta':
          'உங்கள் கடவுச்சொல்லை மீட்டமைக்க இணைப்புடன் கூடிய மின்னஞ்சலை உங்களுக்கு அனுப்புவோம், உங்கள் கணக்குடன் தொடர்புடைய மின்னஞ்சலை கீழே உள்ளிடவும்.',
      'ur':
          'ہم آپ کو اپنا پاس ورڈ دوبارہ ترتیب دینے کے لیے ایک لنک کے ساتھ ایک ای میل بھیجیں گے، براہ کرم نیچے اپنے اکاؤنٹ سے وابستہ ای میل درج کریں۔',
    },
    'ujc5xipx': {
      'en': 'Your email address...',
      'hi': 'आपका ईमेल पता...',
      'ta': 'உங்கள் மின்னஞ்சல் முகவரி...',
      'ur': 'آپ کا ای میل پتہ...',
    },
    'gegzfze4': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
      'ta': 'மின்னஞ்சலை பதிவுசெய்...',
      'ur': 'اپنا ای میل درج کریں...',
    },
    '1njh17kf': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'ta': 'இணைப்பை அனுப்பவும்',
      'ur': 'لنک بھیجیں۔',
    },
    '9a4bm91z': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProfile
  {
    'vyqdl7s3': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
      'ta': 'சுயவிவரத்தை உருவாக்கவும்',
      'ur': 'پروفائل بنائیں',
    },
    'cnc5fmbk': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    'cjyo6ik7': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    'h398jj2j': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    '7ve36dhv': {
      'en': 'Create & Invite User',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    'nyguqlya': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '8opg51gj': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ht71rkhg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'bxrlgb5p': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // Main_tracker
  {
    '12tkp77z': {
      'en': 'Good morning',
      'hi': 'सुबह बख़ैर',
      'ta': 'காலை வணக்கம்',
      'ur': 'صبح بخیر',
    },
    'qivbgraj': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    'uwyvo6wk': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'xeqma55c': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'jflxt2qx': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'zi7hfryq': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '8sjmfjjx': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'uiqmsymo': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'iofpx15n': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '832adtr2': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    '1460lgka': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'wm00imuu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'c8gv1fmj': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'd4gw9qw0': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'zdrf3ikg': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '6p1meot0': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '86lis2jg': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'rd23line': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'lqbva4ak': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'hkcnmvtg': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'htuk5fl0': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'xe34smbh': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    '1rnio8vt': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'oopnhfx6': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'i2oud4oy': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '6z27sxtu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'kvvayf1a': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'y2umcbi9': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'ut18klg9': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'rktf6kep': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '6mtnsns9': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'mpiabjfr': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    'i1j0llq5': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '89oepmke': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'hpgqf77b': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'b8974iek': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'vpfyakh9': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '2jc6nxa6': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'z98yqioc': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '6c511ygf': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'z9zv51n7': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '310ik08p': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    '5knyrkme': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    '6mv3j0ec': {
      'en': 'Tracker',
      'hi': 'ट्रैकर',
      'ta': 'டிராக்கர்',
      'ur': 'ٹریکر',
    },
  },
  // createTask_1_SelectProject
  {
    '1evyvanx': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '5p3w7kqb': {
      'en': 'Don\'t see your project? Add one here.',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'atun5agk': {
      'en': 'Add Project',
      'hi': 'प्रोजेक्ट जोड़ें',
      'ta': 'திட்டத்தைச் சேர்க்கவும்',
      'ur': 'پروجیکٹ شامل کریں۔',
    },
    'nb0qs3fd': {
      'en': 'Last edited:',
      'hi': 'पिछली बार संपादित:',
      'ta': 'கடைசியாக திருத்தப்பட்டது:',
      'ur': 'آخری ترمیم:',
    },
    'h0y2vck1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ry8gdxku': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'xtzbonrg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'd3cize38': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // taskDetails
  {
    'hb364kq4': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'q4ikqgkd': {
      'en': 'Team Members',
      'hi': 'टीम के सदस्य',
      'ta': 'குழு உறுப்பினர்கள்',
      'ur': 'ٹیم کے افراد',
    },
    'qrkfqya2': {
      'en': 'Notes',
      'hi': 'टिप्पणियाँ',
      'ta': 'குறிப்புகள்',
      'ur': 'نوٹس',
    },
    '46h6mjof': {
      'en': 'Mark as Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'ta': 'முழுமையானதாகக் குறிக்கவும்',
      'ur': 'مکمل کے بطور نشان زد کریں۔',
    },
    'xvvip759': {
      'en': 'Begin Task',
      'hi': 'कार्य शुरू करें',
      'ta': 'பணியைத் தொடங்குங்கள்',
      'ur': 'کام شروع کریں۔',
    },
    'q5i02gt3': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createTask
  {
    '5maeu8hf': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '1eztr6a4': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    'p0c23doi': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    're4r1lkn': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'ptyt1h7n': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'gcvdijqn': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '9a99unmx': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    '0pml5dft': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    's4765ks4': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'yswwcsf1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'u5986y4m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '4rnlmmb6': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // myProfile
  {
    'qnq7kisw': {
      'en': 'Remove',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5n51xmhd': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड में स्विच करें',
      'ta': 'டார்க் பயன்முறைக்கு மாறவும்',
      'ur': 'ڈارک موڈ پر سوئچ کریں۔',
    },
    'w3vpe9rl': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड में स्विच करें',
      'ta': 'லைட் பயன்முறைக்கு மாறவும்',
      'ur': 'لائٹ موڈ پر سوئچ کریں۔',
    },
    '05v307ij': {
      'en': 'Account Settings',
      'hi': 'अकाउंट सेटिंग',
      'ta': 'கணக்கு அமைப்புகள்',
      'ur': 'اکاؤنٹ کی ترتیبات',
    },
    'o1pcrlaz': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'ta': 'கடவுச்சொல்லை மாற்று',
      'ur': 'پاس ورڈ تبدیل کریں',
    },
    'alhgf413': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'w4vsr6hu': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
    '3e1n01mf': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // addTeamMembers
  {
    'dzbojo7r': {
      'en': 'Invite User',
      'hi': 'उपयोगकर्ता को आमंत्रित करें',
      'ta': 'பயனரை அழைக்கவும்',
      'ur': 'صارف کو مدعو کریں۔',
    },
    '5ilq7vbh': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    '733r7kk8': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
      'ur': 'ای میل',
    },
    '64z5ta3b': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    '39qfddvg': {
      'en': 'Team 1',
      'hi': 'टीम 1',
      'ta': 'அணி 1',
      'ur': 'ٹیم 1',
    },
    '0rrub9lg': {
      'en': 'Team 2',
      'hi': 'टीम 2',
      'ta': 'அணி 2',
      'ur': 'ٹیم 2',
    },
    '23fglgb8': {
      'en': 'Team 3',
      'hi': 'टीम 3',
      'ta': 'அணி 3',
      'ur': 'ٹیم 3',
    },
    'd6ul4ero': {
      'en': 'Select Team',
      'hi': 'टीम का चयन',
      'ta': 'குழுவைத் தேர்ந்தெடுக்கவும்',
      'ur': 'ٹیم منتخب کریں۔',
    },
    'oehnkpb9': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'c38hkcs1': {
      'en': 'Create & Invite User',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    '41umybiv': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'i5wagnfq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'h5euxn0m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ag9dglwf': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // teamMemberDetails
  {
    'ukmpqe9t': {
      'en': 'Team Name',
      'hi': 'टीम का नाम',
      'ta': 'குழு பெயர்',
      'ur': 'گروہ کا نام',
    },
    'rq31lxfx': {
      'en': ' - ',
      'hi': '-',
      'ta': '-',
      'ur': '-',
    },
    '8lhfh12w': {
      'en': '12 Tasks',
      'hi': '12 कार्य',
      'ta': '12 பணிகள்',
      'ur': '12 کام',
    },
    'j2ieipip': {
      'en': 'Team Bio',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    '9s048496': {
      'en': 'Tasks',
      'hi': 'कार्य',
      'ta': 'பணிகள்',
      'ur': 'کام',
    },
    '3rwjcoju': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'znm2flgb': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Main_teamPage
  {
    'vf4ee69k': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    'cqt7v5sb': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    'mop2evm0': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    '63wkxdr4': {
      'en': 'Find Members',
      'hi': 'सदस्य खोजें',
      'ta': 'உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'h2tjjlou': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
  },
  // Main_projects
  {
    '3drc3684': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Main_projectsWeb
  {
    'qcd4z131': {
      'en': 'Projects',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0e5jbrkh': {
      'en': 'A list of your projects below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hmxr55qt': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProject
  {
    'zhq7wtzw': {
      'en': 'Create Project',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    '9duf9kbf': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'j3scp78v': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'gql7sgl9': {
      'en': 'Create Project',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'abj4bb18': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'yyhmrk0i': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'yepouzyh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'qckve3hq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // projectDetailsPage
  {
    '03c7gtcz': {
      'en': 'View All',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
      'ur': 'سب دیکھیں',
    },
    '8i8307mb': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'mfp5v5yt': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'x63goi6j': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '3ihf4pre': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'frnfsszo': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'sg458n0n': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '6hgcr887': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '1870f5uq': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'xo4dmszc': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '24rs6kdw': {
      'en': 'Completed on',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    'y1upl145': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    '5kom1132': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // teamMembers
  {
    'cr7ls6ar': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'gxfshi24': {
      'en': 'Members in Project',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'prexm7ph': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'gjanmvum': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '8dw4hlie': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'eq219wh6': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    'cjsbj4wg': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    '78fdfkdh': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'rzrf0zsp': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'aygq6hhd': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '70d3gp3g': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'i5shsgmr': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    '5uym93b4': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '8ohfceuq': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'cf2slli6': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'dcpf109l': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ntjxiluh': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '70m6fdii': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'vlair7ur': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '76xe81xi': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // searchMembers
  {
    'i5eebch9': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'p2un3aei': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'ux02ixql': {
      'en': 'Search Members',
      'hi': 'सदस्यों को खोजें',
      'ta': 'உறுப்பினர்களைத் தேடுங்கள்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'kmiq19hs': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'wrsqjwcl': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ln463m6b': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '2b6e11zk': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'vs5fr034': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'lf0kbst6': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'evhul6oz': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    '89efdrtq': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'f9p9d1vi': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'h7whf2ev': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '52yshqc7': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'ag17xw1c': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // drawerNav
  {
    'j81no67g': {
      'en': 'View',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1281zly2': {
      'en': '345',
      'hi': '345',
      'ta': '345',
      'ur': '345',
    },
    'ikdzucnf': {
      'en': 'Following',
      'hi': 'निम्नलिखित',
      'ta': 'தொடர்ந்து',
      'ur': 'درج ذیل',
    },
    '0mvvm3zs': {
      'en': '345',
      'hi': '345',
      'ta': '345',
      'ur': '345',
    },
    'ka33pk44': {
      'en': 'Followers',
      'hi': 'समर्थक',
      'ta': 'பின்பற்றுபவர்கள்',
      'ur': 'پیروکار',
    },
    'xnmol3vm': {
      'en': 'Tracker',
      'hi': 'मेरी प्रोफाइल',
      'ta': 'என் சுயவிவரம்',
      'ur': 'میری پروفائل',
    },
    'tgp9100p': {
      'en': 'Projects',
      'hi': 'मेरी प्रोफाइल',
      'ta': 'என் சுயவிவரம்',
      'ur': 'میری پروفائل',
    },
    'gvsvhzns': {
      'en': 'Team',
      'hi': 'मेरी टीम',
      'ta': 'எனது அணிகள்',
      'ur': 'میری ٹیمیں',
    },
    'r33amlko': {
      'en': 'About',
      'hi': 'के बारे में',
      'ta': 'பற்றி',
      'ur': 'کے بارے میں',
    },
    'hfpu6vi1': {
      'en': 'Rate App',
      'hi': 'एप्प का मूल्यांकन',
      'ta': 'பயன்பாட்டை மதிப்பிடவும்',
      'ur': 'ایپ کی درجہ بندی کریں۔',
    },
    'of8ozb94': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
  },
  // addTeam
  {
    'uap9xd08': {
      'en': 'Assign Member',
      'hi': 'सदस्य असाइन करें',
      'ta': 'உறுப்பினரை நியமிக்கவும்',
      'ur': 'ممبر تفویض کریں۔',
    },
    'v3df17c1': {
      'en': 'Find members by searching below',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    '4gubn0rd': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'k3vvd9ha': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'gts4h2ob': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '5fcmvseb': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'ipj4b3o2': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'hwbisz08': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '3t1qpdde': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'hpq0skds': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'zf4p0iqk': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'gvttx09d': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'jy6ian12': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'm88gl572': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // createNote
  {
    'i9im6f7s': {
      'en': 'Create Note',
      'hi': 'नोट बनाएं',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
    'y8jieyz4': {
      'en': 'Find members by searching below',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    'sq20csss': {
      'en': 'Enter your note here...',
      'hi': 'अपना नोट यहां दर्ज करें...',
      'ta': 'உங்கள் குறிப்பை இங்கே உள்ளிடவும்...',
      'ur': 'اپنا نوٹ یہاں درج کریں...',
    },
    'clj48a46': {
      'en': 'Create Note',
      'hi': 'नोट बनाएं',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
  },
  // TaskComponent
  {
    'uuuaezib': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
  },
  // WebNav
  {
    'nf1dqsbp': {
      'en': '3',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // Miscellaneous
  {
    'fi5o91qd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'skzc79wn': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0rnqst8h': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nh43oztv': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'i4m03gv7': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9h5b120r': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2xxt8j1o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't7udujpl': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zbbv93d3': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cql4rcil': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't9vh67yu': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ac2c7a8c': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '43t0g3v5': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hxsgfsan': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zuih46g4': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8oo00kio': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f4h7j5e1': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'dka0mr3o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'a9x09f52': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b9gx9zp0': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3ogdlxsd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'uxmsgxy2': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
].reduce((a, b) => a..addAll(b));
