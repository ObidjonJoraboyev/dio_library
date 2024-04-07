import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/screens/widgets/universal_text_button.dart';
import 'package:dio_library/screens/widgets/universal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc.dart';
import '../../blocs/user_event.dart';

class UserUpdateScreen extends StatefulWidget {
  const UserUpdateScreen(
      {super.key, required this.userModel, this.check = false});

  final UserModel userModel;
  final bool check;

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
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
  void initState() {
    nameCtrl.text = widget.userModel.name;
    lastNameCtrl.text = widget.userModel.lastName;
    ageCtrl.text = widget.userModel.age.toString();
    activityCtrl.text = widget.userModel.activity;
    activityAddressCtrl.text = widget.userModel.activityAddress;
    dreamCtrl.text = widget.userModel.dream;
    favouriteCtrl.text = widget.userModel.favourite;
    ieltsLevelCtrl.text = widget.userModel.ieltsLevel.toString();
    middleNameCtrl.text = widget.userModel.middleName;
    super.initState();
  }

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
              UniversalTextField(
                  label: "Ismi", textEditingController: nameCtrl),
              UniversalTextField(
                  label: "Familiyasi", textEditingController: lastNameCtrl),
              UniversalTextField(
                  label: "Otasining ismi",
                  textEditingController: middleNameCtrl),
              UniversalTextField(
                  label: "Yoshi", textEditingController: ageCtrl),
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
                      context.read<UserBloc>().add(UpdateUserInfoEvent(
                          userModel: userModel.copyWith(
                              uuid: widget.userModel.uuId,

                              name: nameCtrl.text,
                              lastName: lastNameCtrl.text,
                              age: int.parse(ageCtrl.text),
                              activity: activityCtrl.text,
                              middleName: middleNameCtrl.text,
                              activityAddress: activityAddressCtrl.text,
                              dream: dreamCtrl.text,
                              ieltsLevel: double.tryParse(ieltsLevelCtrl.text),
                              favourite: favouriteCtrl.text,
                              imageUrl: widget.userModel.imageUrl)));
                      Navigator.pop(context);
                      widget.check ? Navigator.pop(context) : null;
                    },
                    text: "Tugatish"),
              )
            ],
          ),
        ));
  }
}

//context.read<UserBloc>().add(UpdateUserInfoEvent(
//                 userModel: userModel.copyWith(name: "bdbkadkb")));
