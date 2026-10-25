import 'package:flutter/material.dart';
import '../services/routing_service.dart';
import '../theme/app_theme.dart';

class QuickRegistrationScreen extends StatelessWidget {
  final String? headline;
  final String? headlineAccent;
  final String? description;
  final String? ctaText;
  final String? footerText;
  final String registrationUrl;
  final String backgroundAsset;
  final Color primaryCtaColor;
  final Color accentTextColor;
  final VoidCallback? onClose;
  final VoidCallback? onCtaPressed;

  const QuickRegistrationScreen({
    super.key,
    this.headline = 'Быстрая',
    this.headlineAccent = 'регистрация',
    this.description =
        'Зарегистрируйтесь на сайте и откройте доступ к актуальному предложению. Регистрация займёт всего пару минут.',
    this.ctaText = 'Перейти к регистрации',
    this.footerText = 'После нажатия откроется сайт для регистрации.',
    this.registrationUrl = 'https://applinkgo.com/q9kPWwBq',
    this.backgroundAsset = 'assets/stadium_bg.jpg',
    this.primaryCtaColor = AppTheme.primaryColor,
    this.accentTextColor = AppTheme.secondaryColor,
    this.onClose,
    this.onCtaPressed,
  });

  void _handleCta(BuildContext context) {
    if (onCtaPressed != null) {
      onCtaPressed!();
    } else {
      RoutingService.openRegistrationUrl(registrationUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Full-bleed Themed Football Stadium Background
          Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFF0A121A),
            ),
          ),

          // 2. Cinematic Vignette Gradient Overlay
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.60),
                  Colors.black.withValues(alpha: 0.20),
                  Colors.black.withValues(alpha: 0.35),
                  Colors.black.withValues(alpha: 0.85),
                ],
                stops: const [0.0, 0.25, 0.60, 1.0],
              ),
            ),
          ),

          // 3. UI Layer with Scroll Protection against Overflows
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        child: Column(
                          children: [
                            // Top Right: Circular Close Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: onClose ?? () => Navigator.of(context).maybePop(),
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withValues(alpha: 0.40),
                                        border: Border.all(
                                          color: Colors.white.withValues(alpha: 0.28),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(flex: 2),

                            // Center Headline & Description
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  headline!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: -1.0,
                                    height: 1.04,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 24,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  headlineAccent!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.w900,
                                    color: accentTextColor,
                                    letterSpacing: -1.0,
                                    height: 1.04,
                                    shadows: [
                                      Shadow(
                                        color: accentTextColor.withValues(alpha: 0.5),
                                        blurRadius: 28,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  constraints: const BoxConstraints(maxWidth: 340),
                                  child: Text(
                                    description!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withValues(alpha: 0.90),
                                      height: 1.45,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 16,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(flex: 3),

                            // Bottom CTA Button & Footer
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 58,
                                    child: ElevatedButton(
                                      onPressed: () => _handleCta(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryCtaColor,
                                        foregroundColor: Colors.white,
                                        elevation: 8,
                                        shadowColor: primaryCtaColor.withValues(alpha: 0.6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Text(
                                        ctaText!,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    footerText!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withValues(alpha: 0.70),
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 8,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
