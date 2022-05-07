import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freedu_frontend/presentation/widgets/action_button.dart';
import 'package:freedu_frontend/presentation/widgets/grid_courses_cards.dart';
import 'package:freedu_frontend/presentation/widgets/search_field.dart';
import 'package:freedu_frontend/utils/style.dart';

class CatalogCoursesPage extends StatefulWidget {
  const CatalogCoursesPage({Key? key}) : super(key: key);

  @override
  State<CatalogCoursesPage> createState() => _CatalogCoursesPageState();
}

class _CatalogCoursesPageState extends State<CatalogCoursesPage> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onFocusNodeEvent);
    _searchFocusNode.addListener(_onFocusNodeEvent);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  _onFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: Style.mainBackgroundImage),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox( height: 130 ),
              SearchField(controller: _searchController, focus: _searchFocusNode),
              const Expanded(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: GridCoursesCards(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  final Color primaryColor = Theme.of(context).primaryColor;

  final loginButton = ActionButton( label: "Войти", color: primaryColor,
      onClick: () => AutoRouter.of(context).pushNamed("/login"));

  return AppBar(
    elevation: 0.0,
    toolbarHeight: 120,
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white.withOpacity(0.0),
    title: Image.asset("assets/images/main_logo.jpg", height: 100),
    actions: [
      Padding(
        child: SizedBox(child: loginButton, width: 120),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      ),
    ],
  );
}
