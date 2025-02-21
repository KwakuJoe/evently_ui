import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:ticket_app_ui/core/auth_middleware.dart';
// import 'package:ticket_app_ui/core/auth_service.dart';
import 'package:ticket_app_ui/core/base_dependency_injection.dart';
import 'package:ticket_app_ui/presentation/pages/auth/reset_password.dart';
import 'package:ticket_app_ui/presentation/pages/auth/forgot_password.dart';
import 'package:ticket_app_ui/presentation/pages/auth/login.dart';
import 'package:ticket_app_ui/presentation/pages/auth/signup.dart';
import 'package:ticket_app_ui/presentation/pages/booking/select_session.dart';
import 'package:ticket_app_ui/presentation/pages/booking/widgets/checkout.dart';
import 'package:ticket_app_ui/presentation/pages/booking/widgets/success_cehckout.dart';
import 'package:ticket_app_ui/presentation/pages/event_detail/event_details_screen.dart';
import 'package:ticket_app_ui/presentation/pages/explore/explore.dart';
import 'package:ticket_app_ui/presentation/pages/home/home.dart';
import 'package:ticket_app_ui/presentation/pages/home_view.dart';
import 'package:ticket_app_ui/presentation/pages/onboarding_screen.dart';
import 'package:ticket_app_ui/presentation/pages/personalize_screen.dart';
import 'package:ticket_app_ui/presentation/pages/profile/change_password.dart';
import 'package:ticket_app_ui/presentation/pages/profile/profile.dart';
import 'package:ticket_app_ui/presentation/pages/profile/update_profile.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/ticket_cancellation.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/ticket.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/utils/theme.dart';

void main() async {
  // initializing base dependency injection to register all dependencies
  BaseDependencyInjection.init();

  await GetStorage.init(); // Initialize GetStorage if used

  // Initialize AuthService
  // final authService = AuthService();

  // Determine the initial route based on authentication state
  // final initialRoute = authService.isAuthenticated() ? '/home-view' : '/login';

  runApp(const MyApp(
    initialRoute: '/login',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    //  instance of theme store
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: 'Flutter Demo',
          theme: themeController.isDarkMode.value
              ? AppThemes.darkTheme
              : AppThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
          initialRoute: initialRoute,
          getPages: [
            GetPage(name: '/home', page: () => const Home()),
            GetPage(
              name: '/onboarding',
              page: () => const OnboardingScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/login',
              page: () => const LoginScreen(),
              transition: Transition.cupertino,
            ),
            GetPage(
              name: '/signup',
              page: () => const SignupScreen(),
              transition: Transition.cupertino,
            ),
            GetPage(
              name: '/personalize',
              page: () => const PersonalizeScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/home-view',
              page: () => const HomeView(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/explore',
              page: () => const ExploreScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/event-detail',
              page: () => const EventDetailsScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/select-session',
              page: () => const SelectSession(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/event-checkout',
              page: () => EventCheckout(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/checkout-successful',
              page: () => CheckoutSuccessFull(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/ticket',
              page: () => TicketScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/ticket-cancellation',
              page: () => const TicketCancellationScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/profile',
              page: () => ProfileScreen(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/update-profile',
              page: () => const UpdateUserProfile(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/change-password',
              page: () => const ChangePassword(),
              transition: Transition.cupertino,
              // middlewares: [AuthMiddleware()],
            ),
            GetPage(
              name: '/forget-password',
              page: () =>  ForgotPasswordScreen(),
              transition: Transition.cupertino,
            ),
            GetPage(
              name: '/reset-password',
              page: () => const ResetPassword(),
              transition: Transition.cupertino,
            ),
          ],
        ));
  }
}

//
