import 'package:flutter/material.dart';
import 'package:photo_call/provider/helper_provider.dart';
import 'package:photo_call/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = const NothingButton();
    final db = Provider.of<HelperProvider>(context);
    while (db.contactos.isEmpty) {
      return widget;
    }
    widget = const DataCarrousel();
    setState(() {});
    //return context.watch<ContactsProvider>().cantContacts > 0
    //return lista.isNotEmpty ? const DataCarrousel() : const NothingButton();
    return widget;
  }
}
