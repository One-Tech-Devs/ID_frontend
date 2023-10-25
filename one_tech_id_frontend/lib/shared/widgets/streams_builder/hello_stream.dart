import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import '../../../blocs/user_bloc.dart';
import '../text_widgets/hello_text_widget.dart';

class HelloStreamWidget extends StatelessWidget {
  const HelloStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder(
          stream: BlocProvider.of<UserBloc>(context).userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            if ((!snapshot.hasData) || (snapshot.data == null)) {
              return const Text(
                "Seja bem vindo!",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    color: IdColors.unselectedconColor),
              );
            }

            return HelloWidget(
              userModel: snapshot.data!,
            );
          },
        ),
      ],
    );
  }
}
