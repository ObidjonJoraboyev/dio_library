import 'package:dio_library/blocs/user_bloc.dart';
import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/screens/helper_screens/user_create_screen.dart';
import 'package:dio_library/screens/helper_screens/user_update_screen.dart';
import 'package:dio_library/screens/single_user/single_user_info_screen.dart';
import 'package:dio_library/screens/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_state.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UserCreateScreen();
                }));
              },
              icon: const Icon(Icons.add))
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
            return ListView(
              children: [
                ...List.generate(
                  state.users.length,
                  (index) {
                    UserModel users = state.users[index];
                    return Column(
                      children: [
                        Dismissible(
                          key: Key(users.uuId!),
                          confirmDismiss: (DismissDirection dis) async {
                            bool result = false;
                            if (dis == DismissDirection.endToStart) {
                              result =
                                  await showSpecialDelete(context, users.uuId!);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UserUpdateScreen(
                                      userModel: users,
                                    );
                                  },
                                ),
                              );
                            }
                            return result;
                          },
                          secondaryBackground: Container(
                            decoration: const BoxDecoration(color: Colors.red),
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
                              tag: users.imageUrl,
                              child: SizedBox(
                                width: 55,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        users.imageUrl,
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
                                    return SingleInfoScreen(userModel: users);
                                  },
                                ),
                              );
                            },
                            trailing: Text(
                              users.activity,
                              style: const TextStyle(fontSize: 14),
                            ),
                            title: Text("${users.name} ${users.lastName}"),
                            subtitle: Text(
                              users.middleName,
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
