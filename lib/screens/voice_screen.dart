import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'main_navigation.dart';
import '../l10n/app_localizations.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF101622),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                color: Color(0xFF94A3B8),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              // Timer
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F1D1D).withOpacity(0.3), // red-900/30
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF87171), // red-400
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFF87171).withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '14:28',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF87171), // red-400
                      ),
                    ),
                  ],
                ),
              ),

              // Sound Wave Animation Placeholder
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(13, (index) {
                      final heights = [
                        16.0,
                        32.0,
                        64.0,
                        40.0,
                        96.0,
                        56.0,
                        80.0,
                        48.0,
                        112.0,
                        64.0,
                        32.0,
                        48.0,
                        24.0,
                      ];
                      final opacities = [
                        0.4,
                        0.6,
                        0.8,
                        0.6,
                        1.0,
                        0.8,
                        1.0,
                        0.6,
                        1.0,
                        0.8,
                        0.6,
                        0.6,
                        0.4,
                      ];
                      return Container(
                        width: 6,
                        height: heights[index],
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF3B82F6, // blue-500
                          ).withOpacity(opacities[index]),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: opacities[index] == 1.0
                              ? [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF3B82F6,
                                    ).withOpacity(0.6),
                                    blurRadius: 12,
                                  ),
                                ]
                              : null,
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // Transcript section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.closed_caption_outlined,
                        size: 16,
                        color: Color(0xFF94A3B8), // slate-400
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Live Transcript',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF94A3B8), // slate-400
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A), // slate-900
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF1E293B),
                      ), // slate-800
                    ),
                    child: const Text(
                      "We need to focus on the Q3 deliverables. The main priority right now is ensuring the new dashboard is ready for the beta users by next Tuesday. Also, let's schedule a follow-up with the marketing team to align on the launch strategy...",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFCBD5E1), // slate-300
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Stop button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF135BEC),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.stop_circle_outlined, size: 24),
                  label: const Text(
                    'Stop & Analyze',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
