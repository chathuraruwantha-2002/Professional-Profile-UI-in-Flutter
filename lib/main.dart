import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Profile',
      theme: ThemeData(
        // color palette
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196F3),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2196F3),
          secondary: Color(0xFF03DAC6),
          surface: Colors.white,
          background: Color(0xFFF5F5F5),
        ),
        // text styles
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          headlineMedium: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF424242),
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF616161),
            height: 1.4,
          ),
          titleMedium: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2196F3),
          ),
        ),
      ),
      home: const ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Profile'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // Main profile card
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              ProfileHeader(),

              Divider(height: 32.0, thickness: 1),

              // About Section
              AboutSection(),

              Divider(height: 32.0, thickness: 1),

              // Skills Section
              SkillsSection(),

              Divider(height: 32.0, thickness: 1),

              // Education Section
              EducationSection(),

              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Header Section Component
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // CircleAvatar
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color.fromARGB(98, 33, 243, 107),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Image.asset(
                  'assets/imgs/profile_pic.jpg',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 110,
                      height: 110,
                      color: const Color(0xFF2196F3),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          // Name
          Text(
            'A.G.Chathura Ruwantha de Silva',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8.0),

          // Professional Title
          Text(
            'Web Developer',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8.0),

          // Location Info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Color(0xFF616161), size: 18),
              const SizedBox(width: 4.0),
              Text(
                'Kalutara, Sri Lanka',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// About Section Component
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 12.0),

          // Professional Summary
          Text(
            'Passionate Web developer with 3+ years of experience creating beautiful, '
            'performant applications. Specialized in cross-platform development '
            'with expertise in Flutter, Firebase, Express.js, Angular and modern app architectures.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          const SizedBox(height: 12.0),

          // Current Role
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.work,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Position',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Web Developer at TechSolutions Lanka',
                        style: Theme.of(context).textTheme.bodyLarge,
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
}

// Skills Section Component
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // technical skills with proficiency levels
    final skills = [
      {'name': 'Flutter/Dart', 'level': 0.8},
      {'name': 'Firebase', 'level': 0.8},
      {'name': 'REST APIs', 'level': 0.9},
      {'name': 'State Management', 'level': 0.75},
      {'name': 'UI/UX Design', 'level': 0.9},
      {'name': 'Git/Version Control', 'level': 0.75},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const SizedBox(height: 16.0),

          // Skills List with Visual Indicators
          ...skills
              .map(
                (skill) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            skill['name'] as String,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${((skill['level'] as double) * 100).round()}%',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),

                      // Proficiency Level Visual Indicator
                      LinearProgressIndicator(
                        value: skill['level'] as double,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        minHeight: 6.0,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

// Education Section Component
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Education', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 16.0),

          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 24),
              ),
              title: Text(
                'Bachelor of Science in Computer Science',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4.0),
                  Text(
                    'University of Colombo School of Computing',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Graduation Year: 2027',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
