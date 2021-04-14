import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ProviderExample/ProviderHelper/ProviderState.dart';
import 'package:flutter_login_ui/ProviderExample/Screens/ProviderLogin.dart';
import 'package:provider/provider.dart';

class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${_providerState.getUD}"),
            Text("Email : ${_providerState.getEmail}"),
            RaisedButton(onPressed: (){
             _providerState.signOut();
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderLogin()));
            },child: Text("Sign Out "),),

          ],
        ),
      ),
    );
  }
}
