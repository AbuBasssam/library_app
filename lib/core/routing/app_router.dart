import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/di/dependency_injection.dart';
import 'package:library_app/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:library_app/features/home/presentation/blocs/home_data_cubit/home_data_cubit.dart';
import 'package:library_app/features/home/presentation/widgets/home_screen.dart';
import 'package:library_app/test_screen.dart';

class AppRouter {
  // region Authentication routes
  static const String kLoginPage = '/LoginPage';
  static const String kSignUpPage = '/SignUpPage';
  static const String kResetPasswordVerificationPage =
      '/RsetPasswordVerificationPage';
  static const String kResetPasswordConfirmationPage =
      '/RsetPasswordConfirmationPage';
  static const String kNewPasswordPage = '/NewPasswordPage';
  static const String kEmailConfirmationPage = '/EmailConfirmation';

  // region Main app pages
  static const String kStartPage = '/StartUpPage';

  // endregion

  static final router = GoRouter(
    routes: [
      // Test page
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) {
              return HomeDataCubit(getIt<GetHomeDataUseCase>());
            },
            child: const HomeScreen(),
          );
        },
      ),
      //test Start up page
      /*
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              // Home Page data cubit
              BlocProvider<HomePageCubit>(
                create: (context) => HomePageCubit(getIt<IHomeRepository>()),
              ),
              // Navigation bloc for managing page navigation
              BlocProvider<HomeNavigationBloc>(
                create: (context) => HomeNavigationBloc(
                  homeRepository: getIt<IHomeRepository>(),
                ),
              ),
            ],
            child: const HomePage(pageMode: PageMode.remote),
          );
        },
      ),
      */

      //Start up page

      GoRoute(
        path: '/',
        builder: (context, state) => const TestScreen(),
      ),

      //Sign up page
      /* GoRoute(
        path: kSignUpPage,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(getIt<SignUpUseCase>()),
          child: const SignUpPage(),
        ),
      ),*/

      //Login page
      /*GoRoute(
        path: kLoginPage,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(getIt<SignInUseCase>()),
            ),
            BlocProvider(
                create: (context) =>
                    GoogleSignInCubit(getIt<GoogleSignInUseCase>())),
          ],
          child: const LoginPage(),
        ),
      ),*/

      //Reset password verification page
      /*GoRoute(
        path: kResetPasswordVerificationPage,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordVerificationCubit(
            getIt<ResetPasswordVerificationUseCase>(),
          ),
          child: const RsetPasswordVerificationPage(),
        ),
      ),*/

      //Email confirmation page
      /*GoRoute(
        path: kEmailConfirmationPage,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => VerifyEmailCubit(
                getIt<GetEmailConfirmationCodeUseCase>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  EmailConfirmationCubit(getIt<EmailConfirmationUseCase>()),
            ),
          ],
          child: const EmailConfirmationPage(),
        ),
      ),*/

      // New password page
      /*GoRoute(
        path: kNewPasswordPage,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt<ResetPasswordUseCase>()),
          child: const NewPasswordPage(),
        ),
      ),*/

      //Phone number page
      /*GoRoute(
        path: kPhoneNumberPage,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AddPhoneNumberCubit(getIt<AddPhoneNumberUseCase>()),
          child: const AddPhoneNumberPage(),
        ),
      ),*/

      //Reset password confirmation page
      /*GoRoute(
        path: kResetPasswordConfirmationPage,
        builder: (context, state) {
          final String email = state.extra as String;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ResetPasswordVerificationCubit(
                  getIt<ResetPasswordVerificationUseCase>(),
                ),
              ),
              BlocProvider(
                create: (context) => ResetPasswordConfirmationCubit(
                  getIt<ResetPasswordConfirmationUseCase>(),
                ),
              ),
            ],
            child: ResetPaswordConfirmationPage(email: email),
          );
        },
      ),*/

      //HomePage
      /*GoRoute(
        path: kHomePage,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomePageCubit(getIt<IHomeRepository>()),
              ),
              BlocProvider(
                create: (context) => HomeNavigationBloc(
                  homeRepository: getIt<IHomeRepository>(),
                ),
              ),
            ],
            child: HomePage(
              pageMode: args['pageMode'] as PageMode,
            ),
          );
        },
      ),*/
    ],
  );
}
