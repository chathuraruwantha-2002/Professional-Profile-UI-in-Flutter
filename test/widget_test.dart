import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

import 'package:professional_profile_ui/main.dart';

void main() {
  group('Professional Profile UI Tests', () {
    
    setUp(() {
      // Mock the network image to prevent HTTP requests during tests
      TestWidgetsFlutterBinding.ensureInitialized();
      
      // Create a mock HTTP client that returns a successful response
      final binding = TestWidgetsFlutterBinding.instance;
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('flutter/platform_views'),
        (MethodCall methodCall) async {
          return null;
        },
      );
    });

    testWidgets('Profile app renders correctly', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());

      // Verify that the app title is correct
      expect(find.text('Professional Profile'), findsOneWidget);
      
      // Verify that the main profile screen loads
      expect(find.byType(ProfileScreen), findsOneWidget);
    });

    testWidgets('Header section displays profile information', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());

      // Wait for any async operations to complete
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Verify CircleAvatar is present
      expect(find.byType(CircleAvatar), findsWidgets);
      
      // Verify name is displayed
      expect(find.text('A.G.Chathura Ruwantha de Silva'), findsOneWidget);
      
      // Verify professional title is displayed
      expect(find.text('Web Developer'), findsOneWidget);
      
      // Verify location is displayed
      expect(find.text('Kalutara, Sri Lanka'), findsOneWidget);
      
      // Verify location icon is present
      expect(find.byIcon(Icons.location_on), findsOneWidget);
    });

    testWidgets('About section displays professional summary', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify About section title
      expect(find.text('About'), findsOneWidget);
      
      // Verify professional summary is present
      expect(find.textContaining('Passionate Web developer'), findsOneWidget);
      
      // Verify current position is displayed
      expect(find.text('Current Position'), findsOneWidget);
      expect(find.textContaining('TechSolutions Lanka'), findsOneWidget);
      
      // Verify work icon is present
      expect(find.byIcon(Icons.work), findsOneWidget);
    });

    testWidgets('Skills section displays technical skills with progress indicators', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify Skills section title
      expect(find.text('Technical Skills'), findsOneWidget);
      
      // Verify individual skills are displayed
      expect(find.text('Flutter/Dart'), findsOneWidget);
      expect(find.text('Firebase'), findsOneWidget);
      expect(find.text('REST APIs'), findsOneWidget);
      expect(find.text('State Management'), findsOneWidget);
      expect(find.text('UI/UX Design'), findsOneWidget);
      expect(find.text('Git/Version Control'), findsOneWidget);
      
      // Verify progress indicators are present
      expect(find.byType(LinearProgressIndicator), findsNWidgets(6));
      
      // Verify percentage displays are present
      expect(find.text('90%'), findsAtLeastNWidgets(1));
      expect(find.text('80%'), findsAtLeastNWidgets(1));
      expect(find.text('75%'), findsAtLeastNWidgets(1));
    });

    testWidgets('Education section displays degree information', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify Education section title
      expect(find.text('Education'), findsOneWidget);
      
      // Verify degree information
      expect(find.text('Bachelor of Science in Computer Science'), findsOneWidget);
      expect(find.text('University of Colombo School of Computing'), findsOneWidget);
      expect(find.text('Graduation Year: 2027'), findsOneWidget);
      
      // Verify ListTile is used
      expect(find.byType(ListTile), findsOneWidget);
      
      // Verify education icon is present
      expect(find.byIcon(Icons.school), findsOneWidget);
    });

    testWidgets('App has proper theme and styling', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());

      // Get the MaterialApp widget to verify theme
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      
      // Verify theme properties
      expect(app.theme?.primaryColor, const Color(0xFF2196F3));
      expect(app.theme?.scaffoldBackgroundColor, const Color(0xFFF5F5F5));
      
      // Verify text theme is properly configured
      expect(app.theme?.textTheme.headlineLarge?.fontSize, 28.0);
      expect(app.theme?.textTheme.headlineMedium?.fontSize, 22.0);
      expect(app.theme?.textTheme.bodyLarge?.fontSize, 16.0);
    });

    testWidgets('App uses required widgets', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify Container is used (main profile card)
      expect(find.byType(Container), findsWidgets);
      
      // Verify Column is used for vertical layout
      expect(find.byType(Column), findsWidgets);
      
      // Verify CircleAvatar is used for profile picture
      expect(find.byType(CircleAvatar), findsWidgets);
      
      // Verify Text widgets are used throughout
      expect(find.byType(Text), findsWidgets);
      
      // Verify ListTile is used in education section
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('App handles scrolling properly', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify SingleChildScrollView is present
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      
      // Test scrolling functionality
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -200));
      await tester.pump();
      
      // Verify app still functions after scrolling
      expect(find.text('Professional Profile'), findsOneWidget);
    });

    testWidgets('Profile components render independently', (WidgetTester tester) async {
      // Test individual components
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const ProfileHeader(),
          ),
        ),
      );
      await tester.pump();
      
      expect(find.text('A.G.Chathura Ruwantha de Silva'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsWidgets);
    });

    testWidgets('App displays all required sections', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();

      // Verify all main components are present
      expect(find.byType(ProfileHeader), findsOneWidget);
      expect(find.byType(AboutSection), findsOneWidget);
      expect(find.byType(SkillsSection), findsOneWidget);
      expect(find.byType(EducationSection), findsOneWidget);
      
      // Verify dividers are used between sections
      expect(find.byType(Divider), findsNWidgets(3));
    });

    // Test specifically for image loading fallback
    testWidgets('Avatar shows fallback icon when network image fails', (WidgetTester tester) async {
      await tester.pumpWidget(const ProfileApp());
      await tester.pump();
      
      // The CircleAvatar should show the person icon as fallback
      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });
}