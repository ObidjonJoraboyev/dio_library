import 'package:dio_library/blocs/user_bloc.dart';
import 'package:dio_library/blocs/user_event.dart';
import 'package:dio_library/data/network/api_provider/api_provider.dart';
import 'package:dio_library/data/network/user_repo/users_repo.dart';
import 'package:dio_library/screens/all_users/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => UserRepository(
                  apiProvider: apiProvider,
                ))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  UserBloc(currenciesRepo: context.read<UserRepository>())
                    ..add(GetUserInfoEvent()))
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersScreen(),
    );
  }
}
