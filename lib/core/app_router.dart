import 'package:go_router/go_router.dart';
import 'package:good_phone/features/presentation/home_page/pages/home.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const MainPage();
    },
  ),
]);
