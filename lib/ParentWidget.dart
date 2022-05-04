import 'package:cineverse/Dashboard/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/UserProvider.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Inside parent widget");
    addData();
  }

  addData() async {
    setState(() {
      isLoading = true;
    });
    UserProvider userProvider = Provider.of(context, listen: false);
    print("userprovider instance created");
    await userProvider.refershUser();
    print("After userProvider refreshed user");
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      return isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 2,
              ),
            )
          : const HomePage();
    });
  }
}
