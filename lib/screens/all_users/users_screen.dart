import 'package:dio_library/blocs/user_bloc.dart';
import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/screens/helper_screens/user_create_screen.dart';
import 'package:dio_library/screens/helper_screens/user_update_screen.dart';
import 'package:dio_library/screens/single_user/single_user_info_screen.dart';
import 'package:dio_library/screens/widgets/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_state.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  FocusNode focus = FocusNode();
  String text = "";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Hero(
            tag: "icon1",
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UserCreateScreen();
                  }));
                },
                icon: const Icon(Icons.add)),
          )
        ],
        elevation: 3,
        title: const Text("Fuqarolar"),
        centerTitle: true,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (BuildContext context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is UserErrorState) {
            return Text(state.errorText);
          }
          if (state is UserSuccessState) {
            List<UserModel> users = state.users
                .where((element) =>
                    element.name.toLowerCase().contains(text.toLowerCase()))
                .toList();

            return ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 14,
                            left: 12,
                            bottom: 8,
                            right: focus.hasFocus ? 0 : 12),
                        child: CupertinoTextField(
                          controller: controller,
                          onChanged: (v) {
                            text = v;
                            setState(() {});
                          },
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black.withOpacity(.4),
                            ),
                          ),
                          onTap: () {
                            focus.requestFocus();
                            setState(() {});
                          },
                          cursorColor: Colors.blue,
                          focusNode: focus,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          placeholder: " Search",
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(.35)),
                        ),
                      ),
                    ),
                    focus.hasFocus
                        ? CupertinoTextSelectionToolbarButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              text = "";
                              controller.text = "";
                              setState(() {});
                              focus.unfocus();
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
                if (users.isNotEmpty)
                  ...List.generate(
                    users.length,
                    (index) {
                      return Column(
                        children: [
                          Dismissible(
                            key: Key(users[index].uuId!),
                            confirmDismiss: (DismissDirection dis) async {
                              bool result = false;
                              if (dis == DismissDirection.endToStart) {
                                result = await showSpecialDelete(
                                    context, users[index].uuId!);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return UserUpdateScreen(
                                        userModel: users[index],
                                      );
                                    },
                                  ),
                                );
                              }
                              return result;
                            },
                            secondaryBackground: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.red),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "O'chirish",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            background: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.green),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text("Yangilash",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                            child: ListTile(
                              leading: Hero(
                                tag: users[index].imageUrl,
                                child: SizedBox(
                                  width: 55,
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          users[index].imageUrl,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SingleInfoScreen(
                                          userModel: users[index]);
                                    },
                                  ),
                                );
                              },
                              trailing: Text(
                                users[index].activity,
                                style: const TextStyle(fontSize: 14),
                              ),
                              title: Text(
                                  "${users[index].name} ${users[index].lastName}"),
                              subtitle: Text(
                                users[index].middleName,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.4,
                            color: Colors.black.withOpacity(.5),
                          )
                        ],
                      );
                    },
                  )
                else if (users.isEmpty)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3 - 30,
                        ),
                        Icon(
                          Icons.search,
                          size: 62,
                          color: Colors.black.withOpacity(.6),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            "No result for \"$text\"",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          "Check the spelling on try a new speech.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black.withOpacity(.35)),
                        ),
                      ],
                    ),
                  )
              ],
            );
          }

          return const Center(
            child: Text("Initial state"),
          );
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}
