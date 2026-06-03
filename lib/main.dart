import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({required this.asset, required this.alt});

  final String asset;
  final String alt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Semantics(
              label: alt,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  asset,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            alt,
            style: const TextStyle(fontSize: 13, color: Color(0xFF111111)),
          ),
        ],
      ),
    );
  }
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
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111111),
            height: 1.05,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111111),
            height: 1.18,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111111),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 19,
            height: 1.8,
            color: Color(0xFF111111),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 16,
            height: 1.75,
            color: Color(0xFF111111),
          ),
        ),
      ),
      home: const ArticlePage(),
    );
  }
}

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _topKey = GlobalKey();
  final GlobalKey _milestonesKey = GlobalKey();
  final GlobalKey _academicKey = GlobalKey();
  final GlobalKey _connectKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment: 0.07,
    );
  }

  void _openNavMenu() {
    showModalBottomSheet<void>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Top'),
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_topKey);
              },
            ),
            ListTile(
              title: const Text('Professional Milestones'),
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_milestonesKey);
              },
            ),
            ListTile(
              title: const Text('Academic & Personal Foundation'),
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_academicKey);
              },
            ),
            ListTile(
              title: const Text('Connect With the Mission'),
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_connectKey);
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_galleryKey);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionWithKey({required GlobalKey key, required Widget child}) {
    return Container(key: key, child: child);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111111),
        elevation: 0,
        centerTitle: false,
        title: GestureDetector(
          onTap: () => _scrollTo(_topKey),
          child: Image.asset(
            'asset/images/image.png',
            height: 34,
            fit: BoxFit.contain,
            semanticLabel: 'Site logo',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _openNavMenu,
            tooltip: 'Open navigation',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 920),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(key: _topKey),
                    const Text(
                      'About Prince Uche Nwakanma',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        height: 1.05,
                        letterSpacing: -0.9,
                        color: Color(0xFF111111),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Founder & CEO, Prince Goodwill Foundation\nLegal Expert | Strategic Entrepreneur | Global Philanthropist',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 18,
                        height: 1.8,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF111111),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 90,
                      height: 1,
                      color: const Color(0xFFE5E7EB),
                    ),
                    const SizedBox(height: 24),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 460,
                        child: Image.asset(
                          'asset/images/prince-uche-nwakanma.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildSectionWithKey(
                      key: _milestonesKey,
                      child: _SectionBlock(
                        title: 'Legal Career & Leadership',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prince Uche Nwakanma has spent decades building a respected legal and professional career in the United States.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.8,
                                color: Color(0xFF111111),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Over the years, he has:',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.8,
                                color: Color(0xFF111111),
                              ),
                            ),
                            SizedBox(height: 12),
                            _BulletList(
                              items: [
                                'Represented thousands of clients across federal courts',
                                'Built and managed successful business ventures',
                                'Worked with high-level executives and community leaders',
                                'Served on the President’s Business Advisory Council for Texas',
                                'Received invitations to the White House under both the Bush and Obama administrations',
                              ],
                              bulletColor: const Color(0xFF255FF3),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'His leadership approach focuses on integrity, responsibility, and creating opportunities that improve lives across generations.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.8,
                                color: Color(0xFF111111),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildSectionWithKey(
                      key: _academicKey,
                      child: const _SectionBlock(
                        title: 'Academic & Personal Foundation',
                        child: _BulletList(
                          items: [
                            'Education: B.S. in Biology (University of Houston–Downtown); Juris Doctor (Texas Southern University).',
                            'Philosophy: A faith-driven leader who integrates transparent governance with compassionate action.',
                            'Personal: A devoted husband and father of three daughters, he views family and faith as the cornerstones of community stability.',
                          ],
                          bulletColor: Color(0xFF255FF3),
                        ),
                      ),
                    ),
                    _buildSectionWithKey(
                      key: _connectKey,
                      child: const _SectionBlock(
                        title: 'Connect With the Mission',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prince Nwakanma remains dedicated to bridging professional excellence with humanitarian service, ensuring that every initiative produces measurable, generational transformation.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.8,
                                color: Color(0xFF111111),
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
                    ),
                    const _SectionBlock(
                      title: 'Founder of Prince Goodwill Foundation',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Driven by a passion for humanitarian service, Prince Uche Nwakanma established the Prince Goodwill Foundation to support underserved communities through practical and sustainable programs.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Color(0xFF111111),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'The Foundation focuses on four key areas:',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Color(0xFF111111),
                            ),
                          ),
                          SizedBox(height: 12),
                          _BulletList(
                            items: [
                              'Healthcare Support: Medical missions and healthcare outreach programs provide treatment and essential medical support for vulnerable communities.',
                              'Education & Scholarships: Scholarship programs help students gain access to quality education and future career opportunities.',
                              'Shelter Assistance: Housing support initiatives help families regain stability, dignity, and safe living conditions.',
                              'Faith & Community Outreach: Community and faith-based programs encourage hope, leadership, and long-term social development.',
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Through these programs, Prince Uche Nwakanma continues to promote meaningful community transformation across Nigeria and the United States.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.8,
                              color: Color(0xFF111111),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildSectionWithKey(
                      key: _galleryKey,
                      child: _SectionBlock(
                        title: 'Gallery',
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: const [
                            _GalleryImage(
                              asset:
                                  'asset/images/prince-at-usa-presidents-dinner.jpeg',
                              alt: 'Prince at USA Presidents Dinner',
                            ),
                            _GalleryImage(
                              asset:
                                  'asset/images/prince-at-white-house-with-barrack-obama.jpeg',
                              alt: 'Prince at White House with Barrack Obama',
                            ),
                            _GalleryImage(
                              asset:
                                  'asset/images/prince-philanthropic-award-from-tsu.jpeg',
                              alt: 'Prince philanthropic award from TSU',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 28),
                      child: Text(
                        '© 2026 Prince Uche Nwakanma. All rights reserved.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.6,
                          color: Color(0xFF111111),
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

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items, this.bulletColor});

  final List<String> items;
  final Color? bulletColor;

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
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: bulletColor ?? const Color(0xFF9CA3AF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 17,
                        height: 1.85,
                        color: Color(0xFF111111),
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
        foregroundColor: const Color(0xFF111111),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Georgia',
          decoration: TextDecoration.underline,
          decorationThickness: 1,
          color: Color(0xFF111111),
        ),
      ),
    );
  }
}
