import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_navigation.dart';
import '../l10n/app_localizations.dart';
import '../providers/language_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true; // Default to true now

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

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
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(l10n.translate('settings_account')),
            _buildSectionGroup([
              _buildListTile(
                icon: Icons.person,
                title: l10n.translate('settings_profile'),
                subtitle: 'Sarah Jenkins',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF475569), // slate-600
                ),
              ),
              _buildDivider(),
              _buildListTile(
                icon: Icons.lock,
                title: l10n.translate('settings_security'),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF475569), // slate-600
                ),
              ),
            ]),

            _buildSectionHeader(l10n.translate('settings_integrations')),
            _buildSectionGroup([
              _buildListTile(
                icon: Icons.calendar_today,
                iconColor: const Color(0xFF4ADE80), // green-400
                iconBgColor: const Color(
                  0xFF14532D,
                ).withOpacity(0.3), // green-900/30
                title: l10n.translate('settings_google_cal'),
                subtitle: l10n.translate('settings_connected'),
                subtitleColor: const Color(0xFF4ADE80), // green-400
                trailing: _buildSmallButton(
                  l10n.translate('settings_manage'),
                  isPrimary: false,
                ),
              ),
              _buildDivider(),
              _buildListTile(
                icon: Icons.description,
                iconColor: const Color(0xFFFDBA74), // orange-400
                iconBgColor: const Color(
                  0xFF7C2D12,
                ).withOpacity(0.3), // orange-900/30
                title: l10n.translate('settings_salesforce'),
                subtitle: l10n.translate('settings_not_connected'),
                trailing: _buildSmallButton(
                  l10n.translate('settings_connect'),
                  isPrimary: true,
                ),
              ),
            ]),

            _buildSectionHeader(l10n.translate('settings_preferences')),
            _buildSectionGroup([
              _buildListTile(
                icon: Icons.dark_mode,
                title: l10n.translate('settings_dark_mode'),
                trailing: Switch(
                  value: _darkMode,
                  onChanged: (val) {
                    setState(() {
                      _darkMode = val;
                    });
                  },
                  activeColor: const Color(0xFF3B82F6), // blue-500
                ),
              ),
              _buildDivider(),
              _buildListTile(
                icon: Icons.language,
                title: l10n.translate('settings_language'),
                subtitle: languageProvider.isKorean
                    ? l10n.translate('settings_language_ko')
                    : l10n.translate('settings_language_en'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    languageProvider.changeLanguage(value);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'ko',
                      child: Text(l10n.translate('settings_language_ko')),
                    ),
                    PopupMenuItem(
                      value: 'en',
                      child: Text(l10n.translate('settings_language_en')),
                    ),
                  ],
                  child: const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF475569), // slate-600
                  ),
                ),
              ),
            ]),

            _buildSectionHeader(l10n.translate('settings_subscription')),
            _buildSubscriptionCard(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFF87171), // red-400
                    backgroundColor: const Color(0xFF0F172A), // slate-900
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0xFF334155),
                      ), // slate-700
                    ),
                  ),
                  child: Text(
                    l10n.translate('settings_logout'),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Color(0xFF94A3B8), // slate-400
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSectionGroup(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)), // slate-800
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    Color? iconColor,
    Color? iconBgColor,
    required String title,
    String? subtitle,
    Color? subtitleColor,
    required Widget trailing,
  }) {
    iconColor ??= const Color(0xFF60A5FA); // blue-400
    iconBgColor ??= const Color(0xFF1E3A8A).withOpacity(0.3); // blue-900/30
    subtitleColor ??= const Color(0xFF94A3B8); // slate-400

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Color(0xFFF1F5F9),
        ), // slate-100
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: subtitleColor, fontSize: 13))
          : null,
      trailing: trailing,
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      indent: 64,
      thickness: 1,
      color: Color(0xFF1E293B), // slate-800
    );
  }

  Widget _buildSmallButton(String label, {required bool isPrimary}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: isPrimary
            ? Colors.white
            : const Color(0xFFE2E8F0), // slate-200
        backgroundColor: isPrimary
            ? const Color(0xFF135BEC) // primary
            : const Color(0xFF1E293B), // slate-800
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        minimumSize: const Size(0, 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubscriptionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF135BEC).withOpacity(0.2), // primary/20
              const Color(0xFF9333EA).withOpacity(0.2), // purple/20
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF135BEC).withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFF60A5FA),
                  size: 20,
                ), // blue-400
                const SizedBox(width: 8),
                const Text(
                  'Premium Plan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFFF1F5F9),
                  ), // slate-100
                ),
                const Spacer(),
                Icon(
                  Icons.diamond,
                  color: const Color(0xFF60A5FA).withOpacity(0.2),
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Unlimited meetings & AI summaries.',
              style: TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 13,
              ), // slate-300
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Renews Oct 15, 2024',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8), // slate-400
                    fontSize: 13,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF135BEC),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    minimumSize: const Size(0, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Manage Plan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
