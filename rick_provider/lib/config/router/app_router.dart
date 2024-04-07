import 'package:go_router/go_router.dart';
import 'package:rick_provider/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: "character",
          name: CharacterScreen.name,
          builder: (context, state) => const CharacterScreen(),
        ),
        ]),
]);
