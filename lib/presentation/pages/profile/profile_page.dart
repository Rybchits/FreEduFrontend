import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedu_frontend/models/user_class.dart';
import 'package:freedu_frontend/presentation/widgets/action_button.dart';
import 'package:freedu_frontend/presentation/widgets/sidebar.dart';
import 'package:freedu_frontend/providers/auth_provider.dart';
import 'package:freedu_frontend/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(image: Style.mainBackgroundImage),
            child: Row(
              children: [
                const Expanded(child: Sidebar(), flex: 1),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Column(children: [
                        _fakeAppBar(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Container(height: 250, width: 250,
                                child: _userAvatar(),
                                margin: const EdgeInsets.only(right: 40)),
                            Expanded(child: _userInfo(context: context,
                                user: ref.watch(authUserState) ?? User(name: "Не авторизован")))
                          ]),
                        ),
                      ]),
                    ), flex: 5)
              ],
            ),
        ),
    );
  }
}

Widget _fakeAppBar(BuildContext context) {
  final Color primaryColor = Theme.of(context).primaryColor;

  final loginButton =
      ActionButton(label: "Выйти", color: primaryColor, onClick: () => AutoRouter.of(context).pushNamed("/login"));

  return SizedBox(
    height: 110,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("Профиль", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 36, color: primaryColor)),
      SizedBox(child: loginButton, width: 120, height: 40),
    ]),
  );
}

Widget _userAvatar([String? url]) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/default-user-image.jpg",
        image: url ?? "",
        imageErrorBuilder: (context, error, stackTrace) => Image.asset("assets/images/default-user-image.jpg"),
      ),
    ),
  );
}

Widget _userInfo({required BuildContext context, required User user}) {
  final Color primaryColor = Theme.of(context).primaryColor;

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(user.name, style: GoogleFonts.montserrat(fontSize: 36, fontWeight: FontWeight.w600, color: primaryColor)),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: RichText(
          text: TextSpan(
              style: GoogleFonts.montserrat(fontSize: 28, color: primaryColor, fontWeight: FontWeight.w400),
              text: "почта: ",
              children: [TextSpan(text: user.email, style: GoogleFonts.montserrat(color: Colors.black))])),
    ),
    RichText(
        text: TextSpan(
            style: GoogleFonts.montserrat(fontSize: 28, color: primaryColor, fontWeight: FontWeight.w400),
            text: "telegram: ",
            children: [
          TextSpan(text: user.telegram ?? "не указан", style: GoogleFonts.montserrat(color: Colors.black))
        ]))
  ]);
}
