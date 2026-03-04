import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';
import '../l10n/app_localizations.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF101622),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101622).withOpacity(0.9),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: const Color(0xFF1E293B), height: 1.0),
        ),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigation(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              l10n.translate('app_title'),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFF1F5F9),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Color(0xFFCBD5E1), size: 20),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF1E293B),
                      title: Text(
                        l10n.translate('schedule_add'),
                        style: const TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        '일정 추가 기능 (준비중)',
                        style: TextStyle(color: Color(0xFFCBD5E1)),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('취소'),
                        ),
                      ],
                    );
                  },
                );
              },
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xFFCBD5E1),
                size: 20,
              ),
              onPressed: () {},
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: Color(0xFFCBD5E1),
                size: 20,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCalendarHeader(),
            const SizedBox(height: 16),
            _buildTimeline(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sync_outlined,
                  size: 14,
                  color: Color(0xFF94A3B8), // slate-400
                ),
                const SizedBox(width: 4),
                const Text(
                  'Synced with Google Calendar',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: const CalendarStyle(
          defaultTextStyle: TextStyle(
            color: Color(0xFFF1F5F9),
            fontWeight: FontWeight.bold,
          ),
          weekendTextStyle: TextStyle(
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.bold,
          ),
          outsideTextStyle: TextStyle(color: Color(0xFF475569)),
          selectedDecoration: BoxDecoration(
            color: Color(0xFF135BEC),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Color(0xFF1E293B),
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Color(0xFFF1F5F9),
            fontWeight: FontWeight.bold,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFF1F5F9),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFFF1F5F9)),
          rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFFF1F5F9)),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          weekendStyle: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Stack(
      children: [
        // Vertical Timeline Line
        Positioned(
          left: 48,
          top: 0,
          bottom: 0,
          child: Container(
            width: 1,
            color: const Color(0xFF334155),
          ), // slate-700
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildTimelineEvent(
                time: '09:00',
                title: '내부 스탠드업 회의',
                subtitle: '줌(Zoom)',
                icon: Icons.videocam_outlined,
                badgeLabel: '완료됨',
                badgeColor: const Color(0xFF4ADE80), // green-400
                badgeBgColor: const Color(0xFF14532D).withOpacity(0.3),
                primaryButtonLabel: '관련 정보 보기',
                isPrimaryButtonOutline: true,
              ),
              _buildTimelineEvent(
                time: '10:00',
                title: '삼성전자 미팅 (1차)',
                subtitle: '삼성전자 서초사옥',
                icon: Icons.location_on_outlined,
                badgeLabel: '지난 일정',
                badgeColor: const Color(0xFF94A3B8), // slate-400
                badgeBgColor: const Color(0xFF1E293B).withOpacity(0.5),
                primaryButtonLabel: '준비 노트',
                isPrimaryButtonOutline: true,
              ),

              // Current Time Line
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                      child: Text(
                        '11:45',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF60A5FA), // blue-400
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF60A5FA), // blue-400
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: const Color(0xFF60A5FA).withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),

              _buildTimelineEvent(
                time: '12:30',
                title: 'Lunch with Jane Doe',
                subtitle: '1 hr',
                icon: Icons.schedule,
                badgeLabel: 'Next',
                badgeColor: const Color(0xFF60A5FA), // blue-400
                badgeBgColor: const Color(0xFF1E3A8A).withOpacity(0.3),
                primaryButtonLabel: 'Prep AI',
                isHighlighted: true,
              ),
              _buildTimelineEvent(
                time: '14:00',
                title: 'Discovery Call',
                subtitle: 'Prospect: TechFlow',
                icon: Icons.person_outline,
                badgeLabel: null,
                primaryButtonLabel: 'Prep AI',
                isPrimaryButtonOutline: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineEvent({
    required String time,
    required String title,
    required String subtitle,
    required IconData icon,
    String? badgeLabel,
    Color? badgeColor,
    Color? badgeBgColor,
    required String primaryButtonLabel,
    bool isHighlighted = false,
    bool isPrimaryButtonOutline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              time,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF94A3B8), // slate-400
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isHighlighted
                    ? const Color(0xFF135BEC).withOpacity(0.1) // bg-primary/10
                    : const Color(0xFF0F172A), // slate-900
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isHighlighted
                      ? const Color(0xFF135BEC).withOpacity(
                          0.2,
                        ) // border-primary/20
                      : const Color(0xFF1E293B), // slate-800
                ),
                boxShadow: !isHighlighted
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? const Color(0xFF135BEC).withOpacity(0.2)
                              : const Color(0xFF1E293B), // slate-800
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isHighlighted ? Icons.restaurant : Icons.work_outline,
                          color: isHighlighted
                              ? const Color(0xFF60A5FA) // blue-400
                              : const Color(0xFFCBD5E1), // slate-300
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFFF1F5F9), // slate-100
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(
                                  icon,
                                  size: 12,
                                  color: const Color(0xFF94A3B8), // slate-400
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  subtitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF94A3B8), // slate-400
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (badgeLabel != null &&
                          badgeColor != null &&
                          badgeBgColor != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: badgeBgColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            badgeLabel,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: badgeColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isPrimaryButtonOutline
                              ? const Color(0xFF1E293B) // slate-800
                              : const Color(0xFF135BEC), // primary
                          foregroundColor: isPrimaryButtonOutline
                              ? const Color(0xFFE2E8F0) // slate-200
                              : Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 0,
                          ),
                          minimumSize: const Size(0, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          isPrimaryButtonOutline
                              ? Icons.note_alt_outlined
                              : Icons.auto_awesome,
                          size: 14,
                        ),
                        label: Text(
                          primaryButtonLabel,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
