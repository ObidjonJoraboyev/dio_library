import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc.dart';
import '../../blocs/user_event.dart';

showSpecialDelete(BuildContext context, String uuid, [bool isUp = false]) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            "Haqiqatdan ham ushbu fuqaroni o'chirbib tashlamoqchimisiz?",
            style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.5),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  context.read<UserBloc>().add(DeleteUserInfoEvent(uuId: uuid));
                  Navigator.pop(context, true);
                  isUp ? Navigator.pop(context, true) : null;
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                )),
          ],
        );
      });
}
