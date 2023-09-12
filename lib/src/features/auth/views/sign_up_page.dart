import 'package:flutter/material.dart';
import 'package:kada_bot_web/src/features/auth/views/sign_up_page_mobile.dart';
import 'package:kada_bot_web/src/features/auth/views/sign_up_page_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String routeName = 'signUpPage';
  //static const String routeName = '/accountlinkage/:botNumber/:botId/WhatsApp/:schoolId/:classId/:botToken';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: const ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: (_) => const SignUpPageMobile(),
      tablet: (_) => const SignUpPageTablet(),
      desktop: (_) => const SignUpPageTablet(),
    );
  }
}
