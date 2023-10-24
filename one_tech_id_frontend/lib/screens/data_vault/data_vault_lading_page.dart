import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_nav_bars/bottom_navigation_data_vault.dart';
import '../../shared/widgets/data_vault/page/data_vault_address_data.dart';
import '../../shared/widgets/data_vault/page/data_vault_docs_data.dart';
import '../../shared/widgets/data_vault/data_vault_user_data.dart';

class DataVaultScreen extends StatefulWidget {
  const DataVaultScreen({super.key});

  @override
  State<DataVaultScreen> createState() => _DataVaultScreenState();
}

class _DataVaultScreenState extends State<DataVaultScreen> {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: const [
          DataVaultUserData(),
          DataVaultAddress(),
          DataVaultDocsData()
        ],
      ),
      bottomNavigationBar:
          NavBarDataVault(pageViewController: pageViewController),
    );
  }
}
