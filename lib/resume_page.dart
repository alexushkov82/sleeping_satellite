import 'package:flutter/material.dart';
import 'utils/browser_title.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    BrowserTitle.set('Alex Ushkov - Flutter Developer');
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1a1a2e),
              const Color(0xFF16213e),
              const Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeroSection(),
                _buildAboutSection(),
                _buildSkillsSection(),
                _buildExperienceSection(),
                _buildEducationSection(),
                _buildContactSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          // Photo
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF00d4ff),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00d4ff).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/pictures/AlexUshkov.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Name
          const Text(
            'Alex Ushkov',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          // Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF00d4ff).withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFF00d4ff),
                width: 2,
              ),
            ),
            child: const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF00d4ff),
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Minsk, Belarus • 22 years old',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      title: 'About Me',
      icon: Icons.person_outline,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: const Text(
          "I'm a Flutter developer from Minsk. I've been working with Flutter for about three years, starting from university, where I developed my coursework and thesis projects. After graduation, I joined my current company as a Flutter developer, where I've been working for the past year. During this time, I have tackled a variety of tasks, such as adding new features, fixing bugs, and enhancing design. Additionally, I have been involved in application testing and improving UI/UX.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            height: 1.6,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return _buildSection(
      title: 'Skills',
      icon: Icons.code,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillCategory(
            'Hard Skills',
            [
              'Flutter & Dart',
              'SQLite & Hive',
              'BLoC Pattern',
              'Git',
              'Testing',
              'Mobile Design',
            ],
            const Color(0xFF00d4ff),
          ),
          const SizedBox(height: 24),
          _buildSkillCategory(
            'Soft Skills',
            [
              'Analytical thinking',
              'Teamwork',
              'Communication',
              'Quick learning',
              'Adaptability',
              'Time management',
              'Hardworking',
              'Responsibility',
              'Accuracy',
            ],
            const Color(0xFF7b2cbf),
          ),
          const SizedBox(height: 24),
          _buildSkillCategory(
            'Languages',
            [
              'English - Intermediate',
              'Norwegian - Beginner',
            ],
            const Color(0xFF06ffa5),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: color.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Text(
                skill,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return _buildSection(
      title: 'Work Experience',
      icon: Icons.work_outline,
      child: Column(
        children: [
          _buildExperienceItem(
            'Flutter Developer',
            'Imbue Systems',
            'February 2024 - Present',
            'Working as a Flutter developer, developing cross-platform applications, implementing new features, fixing bugs, and improving UI/UX design.',
            const Color(0xFF00d4ff),
          ),
          const SizedBox(height: 20),
          _buildExperienceItem(
            'Flutter Intern',
            'Innowise',
            'April - July 2022',
            'Internship position where I gained hands-on experience with Flutter development, learned best practices, and worked on real projects.',
            const Color(0xFF7b2cbf),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    String position,
    String company,
    String period,
    String description,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      period,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    return _buildSection(
      title: 'Education',
      icon: Icons.school_outlined,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF06ffa5).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF06ffa5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Belarusian State University, FAMCS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06ffa5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '2020 - 2024',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return _buildSection(
      title: 'Contact',
      icon: Icons.contact_mail_outlined,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            _buildContactItem(
              Icons.phone,
              'Phone',
              '+375 (29) 580-20-80',
              const Color(0xFF00d4ff),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.email,
              'Email',
              'alexushkov82@gmail.com',
              const Color(0xFF7b2cbf),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.link,
              'Social',
              'Telegram, GitHub, LinkedIn: /alexushkov82',
              const Color(0xFF06ffa5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF00d4ff).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF00d4ff),
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF00d4ff),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}

