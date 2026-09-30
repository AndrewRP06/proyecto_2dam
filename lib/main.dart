import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFFEE725B);

    return MaterialApp(
      title: 'Proyecto 2 DAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    _NavigationContent(title: 'Principal'),
    _NavigationContent(title: 'Chat'),
    _NavigationContent(title: 'Búsqueda'),
    _NavigationContent(title: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFFEE725B);
    const unselectedColor = Color(0xFF716F68);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFF),
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFBFF),
            border: Border(top: BorderSide(color: Color(0xFFE6E0DC))),
          ),
          child: NavigationBar(
            height: 112,
            backgroundColor: Colors.transparent,
            elevation: 0,
            indicatorColor: const Color(0xFFF9D9D1),
            selectedIndex: _selectedIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              final color = states.contains(WidgetState.selected)
                  ? selectedColor
                  : unselectedColor;
              return TextStyle(color: color, fontSize: 14, height: 1.4);
            }),
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: unselectedColor),
                selectedIcon: Icon(Icons.home_outlined, color: selectedColor),
                label: 'Inicio',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline, color: unselectedColor),
                selectedIcon:
                    Icon(Icons.chat_bubble_outline, color: selectedColor),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.search, color: unselectedColor),
                selectedIcon: Icon(Icons.search, color: selectedColor),
                label: 'Búsqueda',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: unselectedColor),
                selectedIcon:
                    Icon(Icons.person_outline, color: selectedColor),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationContent extends StatelessWidget {
  const _NavigationContent({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Pantalla $title',
      child: const SizedBox.expand(),
    );
  }
}
