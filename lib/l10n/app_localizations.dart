import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'ko': {
      'app_title': 'log:B',
      'nav_home': '홈',
      'nav_clients': '거래처',
      'nav_calendar': '캘린더',
      'nav_insights': '인사이트',
      'settings_title': '설정',
      'settings_dark_mode': '다크 모드',
      'settings_language': '언어 설정',
      'settings_language_ko': '한국어',
      'settings_language_en': 'English',
      'settings_notification': '알림 설정',
      'settings_account': '계정 관리',
      'settings_version': '버전 정보',
      'settings_logout': '로그아웃',
      'home_today_glance': '오늘의 개요',
      'home_upcoming': '다음 일정',
      'home_quick_actions': '빠른 작업',
      'home_recent_activity': '최근 활동',
      'home_view_all': '전체 보기',
      'home_directions': '길찾기',
      'home_prep_notes': '준비 노트',
      'action_record': '음성 기록',
      'action_meeting': '일정 추가',
      'action_client': '거래처 추가',
      'action_task': '할 일 추가',
      'client_title': '거래처 목록',
      'client_filter_all': '전체',
      'client_filter_recent': '최근순',
      'client_filter_name': '이름순',
      'client_filter_key': '핵심고객',
      'client_add': '거래처 추가',
      'client_details': '거래처 정보',
      'schedule_title': '스케줄',
      'schedule_add': '일정 추가',
      'insight_title': '분석 인사이트',
      'insight_sentiment_trend': '감정 분석 추이',
      'insight_top_priorities': '주요 과제',
      'insight_client_health': '고객 건전성',
      'insight_client_sentiment': '고객 만족도',
      'insight_positive': '긍정적',
      'insight_health_score': '건전성 점수',
      'insight_stable': '안정적',
      'insight_prep_notes': '미팅 전 노트',
      'insight_log_notes': '미팅 후 노트(로그)',
      'voice_title': '음성 기록',
      'settings_profile': '프로필 정보',
      'settings_security': '비밀번호 및 보안',
      'settings_integrations': '연동',
      'settings_google_cal': '구글 캘린더',
      'settings_salesforce': '세일즈포스 CRM',
      'settings_connected': '연동됨',
      'settings_not_connected': '연동 안됨',
      'settings_manage': '관리',
      'settings_connect': '연동하기',
      'settings_preferences': '환경 설정',
      'settings_subscription': '구독',
      'settings_premium_plan': '프리미엄 요금제',
      'settings_premium_desc': '무제한 미팅 및 AI 요약 지원',
      'settings_renews_on': '다음 결제일: 2024년 10월 15일',
      'settings_manage_plan': '요금제 관리',
    },
    'en': {
      'app_title': 'log:B',
      'nav_home': 'Home',
      'nav_clients': 'Clients',
      'nav_calendar': 'Calendar',
      'nav_insights': 'Insights',
      'settings_title': 'Settings',
      'settings_dark_mode': 'Dark Mode',
      'settings_language': 'Language',
      'settings_language_ko': 'Korean',
      'settings_language_en': 'English',
      'settings_notification': 'Notifications',
      'settings_account': 'Account',
      'settings_version': 'Version',
      'settings_logout': 'Logout',
      'home_today_glance': 'Today at a Glance',
      'home_upcoming': 'Upcoming Next',
      'home_quick_actions': 'Quick Actions',
      'home_recent_activity': 'Recent Activity',
      'home_view_all': 'View All',
      'home_directions': 'Directions',
      'home_prep_notes': 'Prep Notes',
      'action_record': 'Record Note',
      'action_meeting': 'Add Meeting',
      'action_client': 'New Client',
      'action_task': 'Add Task',
      'client_title': 'Client List',
      'client_filter_all': 'All',
      'client_filter_recent': 'Recent',
      'client_filter_name': 'Name',
      'client_filter_key': 'Key Clients',
      'client_add': 'Add Client',
      'client_details': 'Client Details',
      'schedule_title': 'Schedule',
      'schedule_add': 'Add Schedule',
      'insight_title': 'Insight Analysis',
      'insight_sentiment_trend': 'Sentiment Trend',
      'insight_top_priorities': 'Top Priorities',
      'insight_client_health': 'Client Health',
      'insight_client_sentiment': 'Client Sentiment',
      'insight_positive': 'Positive',
      'insight_health_score': 'Health Score',
      'insight_stable': 'Stable',
      'insight_prep_notes': 'Meeting Prep Notes',
      'insight_log_notes': 'Meeting Logs',
      'voice_title': 'Voice Record',
      'settings_profile': 'Profile Information',
      'settings_security': 'Password & Security',
      'settings_integrations': 'Integrations',
      'settings_google_cal': 'Google Calendar',
      'settings_salesforce': 'Salesforce CRM',
      'settings_connected': 'Connected',
      'settings_not_connected': 'Not connected',
      'settings_manage': 'Manage',
      'settings_connect': 'Connect',
      'settings_preferences': 'Preferences',
      'settings_subscription': 'Subscription',
      'settings_premium_plan': 'Premium Plan',
      'settings_premium_desc': 'Unlimited meetings & AI summaries.',
      'settings_renews_on': 'Renews Oct 15, 2024',
      'settings_manage_plan': 'Manage Plan',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ko', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
