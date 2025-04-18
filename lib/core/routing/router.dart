import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../presentation/main/add/add_screen.dart';
import '../../presentation/main/app_scaffold.dart';
import '../../presentation/main/bookmark/bookmark_screen.dart';
import '../../presentation/main/home/home_screen.dart';
import '../../presentation/main/notification/notification_screen.dart';
import '../../presentation/main/profile_screen/profile_screen.dart';
import '../../presentation/search_recipes/search_recipes_screen.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';
import '../../presentation/sign_in/sign_in_screen.dart';
import '../../presentation/sign_up/sign_up_screen.dart';
import '../../presentation/splash/splash_screen.dart';

enum NavigationItemType { home, bookmark, notifications, profile, add }

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: Routes.searchRecipes,
      builder: (context, state) => SearchRecipesScreen(viewModel: SearchRecipesViewModel(MockRecipeRepositoryImpl())),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScaffold(shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.bookmark,
              pageBuilder: (context, state) => const NoTransitionPage(child: BookmarkScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              pageBuilder: (context, state) => const NoTransitionPage(child: NotificationScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.add,
              pageBuilder: (context, state) => const NoTransitionPage(child: AddFabScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
);




