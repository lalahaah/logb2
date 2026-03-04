import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: Container(
            color: const Color(0xFF1E293B), // border-slate-800
            height: 1.0,
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTodayAtAGlance(l10n),
            _buildQuickActions(l10n),
            _buildRecentActivity(l10n),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayAtAGlance(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.translate('home_today_glance'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1F5F9),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A), // bg-slate-900
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF1E293B),
              ), // border-slate-800
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned(
                  top: -16,
                  right: -16,
                  width: 96,
                  height: 96,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF135BEC).withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF135BEC).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFF135BEC),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Upcoming Next',
                              style: TextStyle(
                                color: Color(0xFF135BEC),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF475569),
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '삼성전자 미팅',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF1F5F9),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.schedule, '10:00 AM - 11:30 AM'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        '123 Business Pkwy, Suite 100',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.group_outlined,
                        'Jane Doe (CEO), John Smith (CTO)',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF135BEC),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.directions, size: 18),
                              label: Text(
                                l10n.translate('home_directions'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF1E293B,
                                ), // bg-slate-800
                                foregroundColor: const Color(
                                  0xFFE2E8F0,
                                ), // text-slate-200
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.notes, size: 18),
                              label: Text(
                                l10n.translate('home_prep_notes'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF94A3B8)), // text-slate-400
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFCBD5E1),
            ), // text-slate-300
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            l10n.translate('home_quick_actions'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1F5F9),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              _buildQuickActionCard(
                icon: Icons.mic,
                label: l10n.translate('action_record'),
                isPrimary: true,
                iconColor: const Color(0xFF60A5FA), // blue-400
                bgColor: const Color(
                  0xFF1E3A8A,
                ).withOpacity(0.3), // blue-900/30
              ),
              const SizedBox(width: 12),
              _buildQuickActionCard(
                icon: Icons.event,
                label: l10n.translate('action_meeting'),
                iconColor: const Color(0xFF4ADE80), // green-400
                bgColor: const Color(
                  0xFF14532D,
                ).withOpacity(0.3), // green-900/30
              ),
              const SizedBox(width: 12),
              _buildQuickActionCard(
                icon: Icons.person_add_outlined,
                label: l10n.translate('action_client'),
                iconColor: const Color(0xFFFDBA74), // orange-400
                bgColor: const Color(
                  0xFF7C2D12,
                ).withOpacity(0.3), // orange-900/30
              ),
              const SizedBox(width: 12),
              _buildQuickActionCard(
                icon: Icons.task_outlined,
                label: l10n.translate('action_task'),
                iconColor: const Color(0xFFC084FC), // purple-400
                bgColor: const Color(
                  0xFF581C87,
                ).withOpacity(0.3), // purple-900/30
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String label,
    bool isPrimary = false,
    Color? iconColor,
    Color? bgColor,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary
            ? const Color(0xFF135BEC).withOpacity(0.2)
            : const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPrimary
              ? const Color(0xFF135BEC).withOpacity(0.3)
              : const Color(0xFF1E293B),
        ),
        boxShadow: !isPrimary
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  bgColor ??
                  (isPrimary
                      ? const Color(0xFF135BEC)
                      : const Color(0xFF1E293B)), // bg-slate-800
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color:
                  iconColor ??
                  (isPrimary
                      ? Colors.white
                      : const Color(0xFFCBD5E1)), // text-slate-300
              size: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isPrimary
                  ? const Color(0xFF135BEC)
                  : const Color(0xFFF1F5F9), // text-slate-100
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l10n.translate('home_recent_activity'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF1F5F9),
                ),
              ),
              Text(
                l10n.translate('home_view_all'),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF135BEC),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildActivityCard(
            title: 'TechCorp Q3 Review',
            time: 'Yesterday, 2:00 PM',
            icon: Icons.handshake_outlined,
            iconColor: const Color(0xFF60A5FA), // text-blue-400
            iconBgColor: const Color(
              0xFF1E3A8A,
            ).withOpacity(0.3), // bg-blue-900/30
            summary:
                'Client expressed strong interest in the enterprise tier. Main concern is migration timeline. Follow up with case studies next week.',
          ),
          const SizedBox(height: 12),
          _buildActivityCard(
            title: 'Initial Call - Globex',
            time: 'Tuesday, 10:30 AM',
            icon: Icons.call_outlined,
            iconColor: const Color(0xFFC084FC), // text-purple-400
            iconBgColor: const Color(
              0xFF581C87,
            ).withOpacity(0.3), // bg-purple-900/30
            summary:
                'Qualified lead. Budget approved for Q4. Looking for automated workflow solutions. Scheduled demo for next Friday.',
          ),
          const SizedBox(height: 12),
          _buildActivityCard(
            title: 'Lunch w/ Initech CEO',
            time: 'Monday, 12:00 PM',
            icon: Icons.restaurant_outlined,
            iconColor: const Color(0xFF4ADE80), // text-green-400
            iconBgColor: const Color(
              0xFF14532D,
            ).withOpacity(0.3), // bg-green-900/30
            summary:
                'Relationship building. Discussed recent industry shifts. Open to re-evaluating our contract early next year. No immediate action required.',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String time,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String summary,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFFF1F5F9),
                      ),
                    ), // text-slate-100
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                      ),
                    ), // text-slate-400
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(
                0xFF1E293B,
              ).withOpacity(0.5), // bg-slate-800/50
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF1E293B),
              ), // border-slate-800
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFCBD5E1),
                  height: 1.5,
                ), // text-slate-300
                children: [
                  const TextSpan(
                    text: 'AI Summary: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE2E8F0),
                    ),
                  ), // text-slate-200
                  TextSpan(text: summary),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
