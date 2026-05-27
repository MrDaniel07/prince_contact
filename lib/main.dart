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
          seedColor: const Color(0xFF111827),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
            height: 1.08,
          ),
          headlineMedium: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
            height: 1.25,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: Color(0xFF374151),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.75,
            color: Color(0xFF4B5563),
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 980),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isNarrow = constraints.maxWidth < 760;

                          final image = Container(
                            width: isNarrow ? double.infinity : 260,
                            height: isNarrow ? 320 : 340,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'asset/images/prince-uche-nwakanma.jpg',
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          );

                          final header = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Prince Uche Nwakanma',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w800,
                                  height: 1.08,
                                  letterSpacing: -1.2,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Founder & CEO, Prince Goodwill Foundation\nLegal Expert | Strategic Entrepreneur | Global Philanthropist',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                width: 72,
                                height: 1,
                                color: const Color(0xFFE5E7EB),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Executive Overview',
                                style: theme.textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Prince Uche Nwakanma is a distinguished legal professional and entrepreneur who has transitioned a high-achieving career in the United States into a mission of transformational leadership. As the founder of the Prince Goodwill Foundation, he leverages decades of strategic experience to drive sustainable healthcare, education, and housing initiatives across Nigeria and the U.S.',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          );

                          if (isNarrow) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                image,
                                const SizedBox(height: 22),
                                header,
                              ],
                            );
                          }

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              image,
                              const SizedBox(width: 28),
                              Expanded(child: header),
                            ],
                          );
                        },
                      ),
                    ),
                    const _DividerLine(),
                    const _SectionBlock(
                      title: 'Professional Milestones',
                      child: _BulletList(
                        items: [
                          'Legal Distinction: A Juris Doctor (Thurgood Marshall School of Law, 2002), licensed by the Supreme Court of Kansas and the Federal Court for the Southern District of Texas. He has successfully represented over 6,000 clients in federal law.',
                          'National Recognition: Named among the Top 50 Black Lawyers in the United States, a testament to his diligence and ethical practice.',
                          'Civic Leadership: Appointed to the President’s Business Advisory Council (Texas) under President George W. Bush and invited to the White House under both the Bush and Obama administrations.',
                        ],
                      ),
                    ),
                    const _SectionBlock(
                      title:
                          'The Prince Goodwill Foundation: A Legacy of Impact',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Driven by a philosophy of empowerment over dependency, Prince Nwakanma established the Foundation to address systemic challenges through four strategic pillars.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 14),
                          _NumberedRow(
                            number: '01',
                            title: 'Healthcare',
                            text:
                                'Extensive medical missions providing essential services to vulnerable populations.',
                          ),
                          _NumberedRow(
                            number: '02',
                            title: 'Education',
                            text:
                                'Scholarships designed to unlock academic potential for underprivileged students.',
                          ),
                          _NumberedRow(
                            number: '03',
                            title: 'Shelter',
                            text:
                                'Housing assistance programs focused on restoring family stability and dignity.',
                          ),
                          _NumberedRow(
                            number: '04',
                            title: 'Faith & Community',
                            text:
                                'Values-based engagement to foster long-term social cohesion.',
                          ),
                          SizedBox(height: 18),
                          _QuoteBlock(
                            text:
                                'Sustainable change happens when we listen, collaborate, and support local solutions to local challenges.',
                          ),
                        ],
                      ),
                    ),
                    const _SectionBlock(
                      title: 'Academic & Personal Foundation',
                      child: _BulletList(
                        items: [
                          'Education: B.S. in Biology (University of Houston–Downtown); Juris Doctor (Texas Southern University).',
                          'Philosophy: A faith-driven leader who integrates transparent governance with compassionate action.',
                          'Personal: A devoted husband and father of three daughters, he views family and faith as the cornerstones of community stability.',
                        ],
                      ),
                    ),
                    const _SectionBlock(
                      title: 'Connect With the Mission',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prince Nwakanma remains dedicated to bridging professional excellence with humanitarian service, ensuring that every initiative produces measurable, generational transformation.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _TextLinkButton(
                                label: 'Explore Our Programs',
                                url:
                                    'https://princegoodwillfoundation.org/programs',
                              ),
                              _TextLinkButton(
                                label: 'Partner With Us',
                                url:
                                    'https://princegoodwillfoundation.org/contact',
                              ),
                              _TextLinkButton(
                                label: 'See Our Impact',
                                url:
                                    'https://princegoodwillfoundation.org/impact',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const _SectionBlock(
                      title: 'Featured On',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FeatureLink(
                            label:
                                '360naijahits: The Unprecedented Story of Attorney Prince Nwakanma',
                            url:
                                'https://360naijahits.com.ng/news/the-unprecedented-story-of-attorney-prince-nwakanma/',
                          ),
                          _FeatureLink(
                            label:
                                'JustMP3Loaded: The Unprecedented Story of Attorney Prince Nwakanma',
                            url:
                                'https://www.justmp3loaded.i.ng/2022/07/the-unprecedented-story-of-attorney_28.html?m=1',
                          ),
                          _FeatureLink(
                            label:
                                'WeFunder: From Law to Philanthropy - How Mission-Driven Leadership Builds Scalable Impact',
                            url:
                                'https://wefunder.com/feed/297492-from-law-to-philanthropy-how-mission-driven-leadership-builds-scalable-impact',
                          ),
                          _FeatureLink(
                            label: 'Prince Goodwill Foundation',
                            url: 'https://princegoodwillfoundation.org/',
                          ),
                        ],
                      ),
                    ),
                    const _SectionBlock(
                      title: 'Prince Goodwill Foundation',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FeatureLink(label: 'About', url: 'https://princegoodwillfoundation.org/about'),
                          _FeatureLink(label: 'Founder', url: 'https://princegoodwillfoundation.org/founder'),
                          _FeatureLink(label: 'Programs', url: 'https://princegoodwillfoundation.org/programs'),
                          _FeatureLink(label: 'Impact', url: 'https://princegoodwillfoundation.org/impact'),
                          _FeatureLink(label: 'News', url: 'https://princegoodwillfoundation.org/news'),
                          _FeatureLink(label: 'Contact', url: 'https://princegoodwillfoundation.org/contact'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(28, 4, 28, 28),
                      child: Text(
                        '© 2026 Prince Uche Nwakanma. All rights reserved.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.6,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB));
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xFF9CA3AF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.8,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _NumberedRow extends StatelessWidget {
  const _NumberedRow({
    required this.number,
    required this.title,
    required this.text,
  });

  final String number;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.08,
                color: Color(0xFF111827),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    color: Color(0xFF374151),
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

class _QuoteBlock extends StatelessWidget {
  const _QuoteBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Text(
        '“$text”',
        style: const TextStyle(
          fontSize: 16,
          height: 1.85,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}

class _TextLinkButton extends StatelessWidget {
  const _TextLinkButton({required this.label, required this.url});

  final String label;
  final String url;

  Future<void> _openLink() async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _openLink,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF111827),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 1,
        ),
      ),
    );
  }
}

class _FeatureLink extends StatelessWidget {
  const _FeatureLink({required this.label, required this.url});

  final String label;
  final String url;

  Future<void> _openLink() async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextButton(
        onPressed: _openLink,
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.zero,
          foregroundColor: const Color(0xFF111827),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            height: 1.6,
            decoration: TextDecoration.underline,
            decorationThickness: 1,
          ),
        ),
      ),
    );
  }
}
