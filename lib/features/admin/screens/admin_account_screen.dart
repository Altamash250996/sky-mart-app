import 'package:amazon_clone/features/admin/widgets/admin_top_buttons.dart';
import 'package:flutter/material.dart';

class AdminAccountScreen extends StatefulWidget {
  const AdminAccountScreen({Key? key}) : super(key: key);

  @override
  State<AdminAccountScreen> createState() => _AdminAccountScreenState();
}

class _AdminAccountScreenState extends State<AdminAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(height: 10),
          AdminTopButtons(),
        ],
      ),
    );
  }
}
