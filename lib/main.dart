import 'package:flutter/material.dart';
import 'package:book_flix/ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';
import './ui/screens/register/register_screen.dart';

void main() {
  // Cambia el color de la barra de navegacion
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFF9F9F9),
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  // Punto de entrada de la app
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => RootState();
}

class RootState extends State<Root> {
  final delegate = _RouterDelegate(pages: [
    MyPage((data) => const Welcome(), path: '/'),
    MyPage((data) => Register(), path: '/register')
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        // Usamos Navigator 2.0
        routerDelegate: delegate,
        routeInformationParser: _RouteInformationParser());
  }
}

class MyPage {
  final Widget Function(Map<String, String> data) builder;
  final String path;

  MyPage(this.builder, {required this.path});
}

// Maneja las rutas en la app
class _RouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<MyPage> pages;
  late List<Page> _navigatorPages;

  _RouterDelegate({required this.pages}) {
    final initialPage = pages.firstWhere((page) => page.path == '/');
    _navigatorPages = [MaterialPage(name: '/', child: initialPage.builder({}))];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        pages: _navigatorPages,
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            _navigatorPages
                .removeWhere((page) => page.name == route.settings.name);
            return true;
          }
          return false;
        });
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async {
    final path = configuration.path;
    final data = <String, String>{};

    final index = pages.indexWhere((e) {
      if (e.path == path) {
        return true;
      }

      if (e.path.contains('/:')) {
        final lastIndex = e.path.lastIndexOf('/:');
        final substring = e.path.substring(0, lastIndex);

        if (path.startsWith(substring)) {
          final key = e.path.substring(lastIndex + 1, e.path.length);
          final value = path.substring(lastIndex + 1, e.path.length);
          data[key] = value;
          return true;
        }
      }
      return false;
    });

    if (index != -1) {
      _navigatorPages = [
        ..._navigatorPages,
        MaterialPage(
          name: path,
          child: pages[index].builder({})
        ),
      ];
      notifyListeners();
    }
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

// Sirve para obtener la url y destructurarla para obtener datos entre pantallas
class _RouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    print('Route: ${routeInformation.location}');

    return Future.value(Uri.parse(routeInformation.location ?? ''));
  }
}
