import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/user_model.dart';

import '../../../../core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import '../insert_list_widget/insert_basic_data.dart';

class DataVaultUserData extends StatefulWidget {
  const DataVaultUserData({super.key});

  @override
  State<DataVaultUserData> createState() => _DataVaultUserDataState();
}

class _DataVaultUserDataState extends State<DataVaultUserData> {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SQFLiteUserRepository.getDocs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          if (snapshot.data!.isEmpty) {
            return BasicInsertData(
              userModel: UserModel(
                address: '',
                cpf: '',
                email: '',
                name: '',
                phone: '',
                pis: '',
                rg: '',
                socialName: '',
              ),
              onChange: () {
                setState(() {});
              },
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => BasicInsertData(
              userModel: snapshot.data![0],
              onChange: () {
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
