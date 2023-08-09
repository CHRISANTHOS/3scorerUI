import 'package:flutter/material.dart';
import 'package:scorer_uchenna/pages/soccer_home.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';
import 'package:scorer_uchenna/utils/router.dart';
import 'package:scorer_uchenna/pages/signup_page.dart';
import 'package:scorer_uchenna/pages/login_page.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/pages/view_profile_page.dart';
import 'package:scorer_uchenna/utils/show_snackbar.dart';

class SideMenuDrawer extends StatelessWidget {

  String? token;
  SideMenuDrawer({Key? key, this.token}) : super(key: key);

  Widget _loggedInButtons(BuildContext context){
    final vm = Provider.of<AuthDisplayViewModel>(context);
    return Column(
      children: [
        customButton(text: 'Update', onTap: (){
          Provider.of<AuthDisplayViewModel>(context, listen: false).getDetails(token: token!).then((value){
            nextPage(ViewProfilePage(token: token!), context);
          });
        }, icon: Icons.login, bgColor: const Color(0xFF008F8F),alignT: false),
        const SizedBox(height: 10,),
        customButton(text: 'Log out', onTap: (){
          vm.loggedIn = false;
          nextPage(SoccerHome(), context);
          showSnackBar(context, 'Logged Out Successfully');
        }, icon: Icons.login, bgColor: const Color(0xFF008F8F), alignT: false)
      ],
    );
  }

  Widget _notLoggedInButtons(BuildContext context){
    return Column(
      children: [
        customButton(text: 'Sign Up', onTap: (){
          nextPage(const SignUpPage(), context);
        }, icon: Icons.login, bgColor: const Color(0xFF008F8F),alignT: false),
        const SizedBox(height: 10,),
        customButton(text: 'Login', onTap: (){
          nextPage(const LoginPage(), context);
        }, icon: Icons.login, bgColor: const Color(0xFF008F8F), alignT: false)
      ],
    );
  }

  Widget showAuthButtons(BuildContext context){
    final vm = Provider.of<AuthDisplayViewModel>(context);
    switch(vm.loggedIn){
      case true:
        return _loggedInButtons(context);
      case false:
        return _notLoggedInButtons(context);
      default:
        return _notLoggedInButtons(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xFF008F8F),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 140,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('asset/3soccer.png'),
                        fit: BoxFit.fill,
                    )
                ),
              ),
              logoIcon(),
              const SizedBox(height: 9,),
              showAuthButtons(context)
            ],
          ),
        ),
      ),
    );
  }

  logoIcon() {
    return Container(
      height: 300,
      width: 270,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 8
          )
        ],
        border: Border.all(
          color: Colors.white,
          width: 0.5
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF008F8F)
      ),
      // child: ColoredBox(color: Colors.red),
    );
  }
}
