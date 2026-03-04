import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';
import '../l10n/app_localizations.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

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
            const SizedBox(height: 8),
            _buildSentimentTrend(l10n),
            _buildTopPriorities(l10n),
            _buildClientHealth(l10n),
            _buildNotesTabs(context, l10n),
            const SizedBox(height: 100), // padding for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildSentimentTrend(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.translate('insight_sentiment_trend'),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF1F5F9),
            ), // slate-100
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A), // slate-900
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)), // slate-800
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.translate('insight_client_sentiment'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF94A3B8), // slate-400
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: const Color(0xFF475569), // slate-600
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      l10n.translate('insight_positive'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFFF1F5F9), // slate-100
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      margin: const EdgeInsets.only(bottom: 6),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF14532D,
                        ).withOpacity(0.3), // green bg
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            size: 14,
                            color: Color(0xFF4ADE80), // green-400
                          ),
                          SizedBox(width: 4),
                          Text(
                            '+15%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xFF4ADE80), // green-400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Mock Chart area
                SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      // Grid lines
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => Container(
                            height: 1,
                            color: const Color(0xFF1E293B),
                          ), // slate-800
                        ),
                      ),
                      // Line Chart representation
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: CustomPaint(painter: ChartPainter()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'W1',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64748B),
                      ),
                    ), // slate-500
                    Text(
                      'W2',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    Text(
                      'W3',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    Text(
                      'W4',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopPriorities(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.translate('insight_top_priorities'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFFF1F5F9),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF1E3A8A,
                  ).withOpacity(0.3), // blue-900/30
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 12,
                      color: Color(0xFF60A5FA), // blue-400
                    ),
                    SizedBox(width: 4),
                    Text(
                      'AI Generated',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Color(0xFF60A5FA), // blue-400
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildPriorityCard(
            title: 'Finalize Acme Corp Contract',
            description:
                'Mentioned in 3 recent meetings. Client is waiting for the revised SLA terms before Q3 close.',
            icon: Icons.priority_high,
            iconColor: const Color(0xFFF87171), // red-400
            iconBgColor: const Color(0xFF7F1D1D).withOpacity(0.3), // red-900/30
          ),
          const SizedBox(height: 12),
          _buildPriorityCard(
            title: 'Follow up with TechGlobal',
            description:
                'Expressed interest in the premium tier upgrade during Tuesday\'s check-in.',
            icon: Icons.schedule,
            iconColor: const Color(0xFFFDBA74), // orange-400
            iconBgColor: const Color(
              0xFF7C2D12,
            ).withOpacity(0.3), // orange-900/30
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityCard({
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
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
                    fontSize: 14,
                    color: Color(0xFFF1F5F9), // slate-100
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8), // slate-400
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientHealth(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.translate('insight_client_health'),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF1F5F9),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildHealthCard(
                  '85%',
                  l10n.translate('insight_stable'),
                  '42 Accounts',
                  const Color(0xFF4ADE80), // green-400
                  const Color(0xFF14532D).withOpacity(0.3), // green-900/30
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildHealthCard(
                  '12%',
                  'At Risk',
                  '6 Accounts',
                  const Color(0xFFFDBA74), // orange-400
                  const Color(0xFF7C2D12).withOpacity(0.3), // orange-900/30
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthCard(
    String percentage,
    String status,
    String accounts,
    Color color,
    Color bgColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: percentage == '85%' ? 0.85 : 0.12,
                      backgroundColor: bgColor,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      strokeWidth: 5,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    percentage,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFFF1F5F9), // slate-100
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            status,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFFF1F5F9),
            ), // slate-100
          ),
          const SizedBox(height: 4),
          Text(
            accounts,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF94A3B8), // slate-400
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesTabs(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              labelColor: const Color(0xFF135BEC),
              unselectedLabelColor: const Color(0xFF94A3B8),
              indicatorColor: const Color(0xFF135BEC),
              tabs: [
                Tab(text: l10n.translate('insight_prep_notes')),
                Tab(text: l10n.translate('insight_log_notes')),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: TabBarView(
                children: [_buildPrepNotesList(), _buildLogNotesList()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrepNotesList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildNoteCard('삼성전자 플랫폼 구축 관련 사전 조사', '2023.10.24', true),
        _buildNoteCard('주요 경쟁사 분석 자료 요약', '2023.10.20', false),
      ],
    );
  }

  Widget _buildLogNotesList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildNoteCard('1차 미팅 완료 및 피드백 정리', '2023.10.25', true),
        _buildNoteCard('요구사항 상세 리뷰 로그', '2023.10.18', false),
      ],
    );
  }

  Widget _buildNoteCard(String title, String date, bool hasAudio) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFF1F5F9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (hasAudio)
            const Icon(Icons.mic, color: Color(0xFF135BEC), size: 20)
          else
            const Icon(Icons.notes, color: Color(0xFF475569), size: 20),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color =
          const Color(0xFF3B82F6) // blue-500
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    var path = Path();
    path.moveTo(0, size.height * 0.8);
    path.cubicTo(
      size.width * 0.2,
      size.height * 0.7,
      size.width * 0.3,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.cubicTo(
      size.width * 0.7,
      size.height * 0.2,
      size.width * 0.8,
      size.height * 0.3,
      size.width,
      size.height * 0.1,
    );

    canvas.drawPath(path, paint);

    // Gradient fill
    var fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF3B82F6).withOpacity(0.3), // blue-500/30
          const Color(0xFF3B82F6).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    var fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
