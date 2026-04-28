import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prince Uche Nwakanma',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF76B8E8),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4FAFF),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0B1B2B),
            height: 1.08,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0B1B2B),
            height: 1.2,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0B1B2B),
          ),
          bodyLarge: TextStyle(
            fontSize: 17,
            height: 1.7,
            color: Color(0xFF132233),
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            height: 1.7,
            color: Color(0xFF25384B),
          ),
        ),
      ),
      home: const ArticlePage(),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEAF5FF), Color(0xFFFDFEFF)],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xFFD7E8F7)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A2E5E86),
                          blurRadius: 30,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isNarrow = constraints.maxWidth < 760;

                          final hero = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: const [
                                  _Tag(label: 'Founder & CEO'),
                                  _Tag(label: 'Legal Expert'),
                                  _Tag(label: 'Strategic Entrepreneur'),
                                  _Tag(label: 'Global Philanthropist'),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Prince Uche Nwakanma',
                                style: theme.textTheme.displayLarge,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Founder & CEO, Prince Goodwill Foundation\nLegal Expert | Strategic Entrepreneur | Global Philanthropist',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  color: const Color(0xFF1C3750),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Executive Overview',
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Prince Uche Nwakanma is a distinguished legal professional and entrepreneur who has transitioned a high-achieving career in the United States into a mission of transformational leadership. As the founder of the Prince Goodwill Foundation, he leverages decades of strategic experience to drive sustainable healthcare, education, and housing initiatives across Nigeria and the U.S.',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          );

                          final image = Container(
                            width: isNarrow ? double.infinity : 280,
                            height: isNarrow ? 300 : 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xFFEAF2FB),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x141E3A52),
                                  blurRadius: 18,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'asset/images/Prince.jpg',
                              fit: BoxFit.cover,
                              alignment: Alignment.topLeft,
                            ),
                          );

                          final articleSections = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 36),
                              _SectionTitle(title: 'Professional Milestones'),
                              SizedBox(height: 14),
                              _Bullet(
                                text:
                                    'Legal Distinction: A Juris Doctor (Thurgood Marshall School of Law, 2002), licensed by the Supreme Court of Kansas and the Federal Court for the Southern District of Texas. He has successfully represented over 6,000 clients in federal law.',
                              ),
                              _Bullet(
                                text:
                                    'National Recognition: Named among the Top 50 Black Lawyers in the United States, a testament to his diligence and ethical practice.',
                              ),
                              _Bullet(
                                text:
                                    'Civic Leadership: Appointed to the President’s Business Advisory Council (Texas) under President George W. Bush and invited to the White House under both the Bush and Obama administrations.',
                              ),
                              SizedBox(height: 28),
                              _SectionTitle(
                                title:
                                    'The Prince Goodwill Foundation: A Legacy of Impact',
                              ),
                              SizedBox(height: 14),
                              Text(
                                'Driven by a philosophy of empowerment over dependency, Prince Nwakanma established the Foundation to address systemic challenges through four strategic pillars:',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.7,
                                  color: Color(0xFF132233),
                                ),
                              ),
                              SizedBox(height: 12),
                              _NumberedItem(
                                number: '01',
                                title: 'Healthcare',
                                text:
                                    'Extensive medical missions providing essential services to vulnerable populations.',
                              ),
                              _NumberedItem(
                                number: '02',
                                title: 'Education',
                                text:
                                    'Scholarships designed to unlock academic potential for underprivileged students.',
                              ),
                              _NumberedItem(
                                number: '03',
                                title: 'Shelter',
                                text:
                                    'Housing assistance programs focused on restoring family stability and dignity.',
                              ),
                              _NumberedItem(
                                number: '04',
                                title: 'Faith & Community',
                                text:
                                    'Values-based engagement to foster long-term social cohesion.',
                              ),
                              SizedBox(height: 18),
                              _Quote(
                                text:
                                    'Sustainable change happens when we listen, collaborate, and support local solutions to local challenges.',
                              ),
                              SizedBox(height: 28),
                              _SectionTitle(
                                title: 'Academic & Personal Foundation',
                              ),
                              SizedBox(height: 14),
                              _Bullet(
                                text:
                                    'Education: B.S. in Biology (University of Houston–Downtown); Juris Doctor (Texas Southern University).',
                              ),
                              _Bullet(
                                text:
                                    'Philosophy: A faith-driven leader who integrates transparent governance with compassionate action.',
                              ),
                              _Bullet(
                                text:
                                    'Personal: A devoted husband and father of three daughters, he views family and faith as the cornerstones of community stability.',
                              ),
                              SizedBox(height: 28),
                              _SectionTitle(title: 'Connect With the Mission'),
                              SizedBox(height: 14),
                              Text(
                                'Prince Nwakanma remains dedicated to bridging professional excellence with humanitarian service, ensuring that every initiative produces measurable, generational transformation.',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.7,
                                  color: Color(0xFF132233),
                                ),
                              ),
                              SizedBox(height: 18),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  _ActionButton(
                                    label: 'Explore Our Programs',
                                    url:
                                        'https://princegoodwillfoundation.org/programs',
                                  ),
                                  _ActionButton(
                                    label: 'Partner With Us',
                                    url:
                                        'https://princegoodwillfoundation.org/contact',
                                  ),
                                  _ActionButton(
                                    label: 'See Our Impact',
                                    url:
                                        'https://princegoodwillfoundation.org/impact',
                                  ),
                                ],
                              ),
                            ],
                          );

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isNarrow) ...[
                                image,
                                const SizedBox(height: 22),
                                hero,
                              ] else ...[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    image,
                                    const SizedBox(width: 28),
                                    Expanded(child: hero),
                                  ],
                                ),
                              ],
                              articleSections,
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFB9D9F2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF16324A),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineMedium);
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 11),
            decoration: const BoxDecoration(
              color: Color(0xFF76B8E8),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                height: 1.7,
                color: Color(0xFF132233),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberedItem extends StatelessWidget {
  const _NumberedItem({
    required this.number,
    required this.title,
    required this.text,
  });

  final String number;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FAFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8EAF8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Color(0xFF76B8E8),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0B1B2B),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    color: Color(0xFF132233),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Quote extends StatelessWidget {
  const _Quote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5FF),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFB9D9F2)),
      ),
      child: Text(
        '“$text”',
        style: const TextStyle(
          fontSize: 17,
          height: 1.7,
          color: Color(0xFF0B1B2B),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.url});

  final String label;
  final String url;

  Future<void> _openLink() async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _openLink,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF16324A),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(label),
    );
  }
}
