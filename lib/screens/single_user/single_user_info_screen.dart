import 'dart:ui';
import 'package:dio_library/blocs/user_bloc.dart';
import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/screens/helper_screens/user_update_screen.dart';
import 'package:dio_library/screens/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_state.dart';
import '../widgets/universal_text_button.dart';

class SingleInfoScreen extends StatelessWidget {
  const SingleInfoScreen({super.key, required this.userModel});

  final UserModel userModel;
  final bool check = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: BlocConsumer<UserBloc, UserState>(
          builder: (BuildContext context, state) {
            return Stack(
              children: [
                Image.network(
                  userModel.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 3 + 10,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.66),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3 + 10,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Row(
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor:
                                          Colors.white.withOpacity(.1)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back_ios,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        userModel.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              const Spacer(),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return UserUpdateScreen(
                                        userModel: userModel,
                                        check: true,
                                      );
                                    }));
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              blurRadius: 5,
                                              color: Colors.black)
                                        ],
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: userModel.imageUrl,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(userModel.imageUrl,
                                width: 100, height: 100, fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${userModel.name} ${userModel.lastName}",
                        style: const TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userModel.activity,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 30,
                                  color: Colors.black.withOpacity(.2))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              "Ismi",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              userModel.name,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 30,
                                  color: Colors.black.withOpacity(.2))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Familiyasi",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Otasining ismi",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Yoshi",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Faoliyat turi",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Qiziqishi",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Faoliyat manzili",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      userModel.lastName,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userModel.middleName,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userModel.age.toString(),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userModel.activity,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userModel.favourite,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      userModel.activityAddress,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Hero(
                        tag: "ism",
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 32, left: 16, right: 16),
                          child: UniversalTextButton(
                              color: Colors.red,
                              onPressed: () {
                                showSpecialDelete(
                                    context, userModel.uuId!, true);
                              },
                              text: "Delete Contact"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
          listener: (BuildContext context, state) {},
        ),
      ),
    );
  }
}
