import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/screens/widgets/universal_text_button.dart';
import 'package:dio_library/screens/widgets/universal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc.dart';
import '../../blocs/user_event.dart';

class UserCreateScreen extends StatefulWidget {
  const UserCreateScreen({super.key, this.check = false});

  final bool check;

  @override
  State<UserCreateScreen> createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController activityCtrl = TextEditingController();
  TextEditingController activityAddressCtrl = TextEditingController();
  TextEditingController dreamCtrl = TextEditingController();
  TextEditingController favouriteCtrl = TextEditingController();
  TextEditingController ieltsLevelCtrl = TextEditingController();
  TextEditingController middleNameCtrl = TextEditingController();

  UserModel userModel = UserModel.initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangilash"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            UniversalTextField(label: "Ismi", textEditingController: nameCtrl),
            UniversalTextField(
                label: "Familiyasi", textEditingController: lastNameCtrl),
            UniversalTextField(
                label: "Otasining ismi", textEditingController: middleNameCtrl),
            UniversalTextField(label: "Yoshi", textEditingController: ageCtrl),
            UniversalTextField(
                label: "Faoliyati", textEditingController: activityCtrl),
            UniversalTextField(
                label: "Faoliyat Manzili",
                textEditingController: activityAddressCtrl),
            UniversalTextField(
                label: "Maqsadi", textEditingController: dreamCtrl),
            UniversalTextField(
                label: "IELTS", textEditingController: ieltsLevelCtrl),
            UniversalTextField(
                label: "Qiziqishi", textEditingController: favouriteCtrl),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: UniversalTextButton(
                  onPressed: () async {
                    context.read<UserBloc>().add(PostUserInfoEvent(
                            userModel: userModel.copyWith(
                          name: nameCtrl.text,
                          lastName: lastNameCtrl.text,
                          age: int.parse(ageCtrl.text),
                          imageUrl:
                              "https://e7.pngegg.com/pngimages/566/296/png-clipart-christiano-ronaldo-cristiano-ronaldo-real-madrid-c-f-portugal-national-football-team-uefa-champions-league-manchester-united-f-c-portugal-face-head.png",
                          activity: activityCtrl.text,
                          activityAddress: activityAddressCtrl.text,
                          dream: dreamCtrl.text,
                          ieltsLevel: double.tryParse(ieltsLevelCtrl.text),
                          favourite: favouriteCtrl.text,
                        )));
                    Navigator.pop(context);
                  },
                  text: "Qo'shish"),
            )
          ],
        ),
      ),
    );
  }
}
