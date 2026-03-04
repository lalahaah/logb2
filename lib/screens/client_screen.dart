import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'log:B',
              style: TextStyle(
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
              icon: const Icon(Icons.add, color: Color(0xFF135BEC), size: 20),
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B), // slate-800
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF334155)), // slate-700
              ),
              child: const TextField(
                style: TextStyle(color: Color(0xFFF1F5F9)),
                decoration: InputDecoration(
                  hintText: 'Search clients',
                  hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF94A3B8)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('All', isSelected: true),
                const SizedBox(width: 8),
                _buildFilterChip('Ready to Close'),
                const SizedBox(width: 8),
                _buildFilterChip('Follow-up'),
                const SizedBox(width: 8),
                _buildFilterChip('Nurture'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // List of Clients
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildClientCard(
                  name: 'John Doe',
                  company: 'Acme Corp',
                  initials: 'JD',
                  badgeLabel: 'Ready to Close',
                  badgeColor: const Color(0xFF4ADE80), // green-400
                  badgeBgColor: const Color(0xFF14532D).withOpacity(0.3),
                ),
                const SizedBox(height: 12),
                _buildClientCard(
                  name: 'Sarah Jenkins',
                  company: 'TechNova Inc.',
                  initials: 'SJ',
                  badgeLabel: 'Follow-up',
                  badgeColor: const Color(0xFFFDBA74), // orange-400
                  badgeBgColor: const Color(0xFF7C2D12).withOpacity(0.3),
                ),
                const SizedBox(height: 12),
                _buildClientCard(
                  name: 'Michael Ross',
                  company: 'Pearson Hardman',
                  initials: 'MR',
                  badgeLabel: 'Nurture',
                  badgeColor: const Color(0xFF94A3B8), // slate-400
                  badgeBgColor: const Color(0xFF1E293B).withOpacity(0.5),
                ),
                const SizedBox(height: 12),
                _buildClientCard(
                  name: 'Emma Lewis',
                  company: 'Global Logistics',
                  initials: 'EL',
                  badgeLabel: 'Ready to Close',
                  badgeColor: const Color(0xFF4ADE80),
                  badgeBgColor: const Color(0xFF14532D).withOpacity(0.3),
                ),
                const SizedBox(height: 80), // padding for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF135BEC) : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF135BEC) : const Color(0xFF334155),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFFCBD5E1),
        ),
      ),
    );
  }

  Widget _buildClientCard({
    required String name,
    required String company,
    required String initials,
    required String badgeLabel,
    required Color badgeColor,
    required Color badgeBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)), // border-slate-800
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: badgeBgColor,
            child: Text(
              initials,
              style: TextStyle(color: badgeColor, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFFF1F5F9),
                  ),
                ),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              const SizedBox(height: 8),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF475569),
              ), // slate-600
            ],
          ),
        ],
      ),
    );
  }
}
