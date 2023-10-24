import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import '../../../blocs/user_bloc.dart';
import '../text_widgets/hello_text_widget.dart';

class HelloStreamWidget extends StatelessWidget {
  const HelloStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);
    return Row(
      children: [
        StreamBuilder(
          stream: BlocProvider.of<UserBloc>(context).userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            if ((!snapshot.hasData) || (snapshot.data == null)) {
              return const Text(
                "Seja bem vindo!",
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    color: iconSelectedColor),
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