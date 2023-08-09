import 'package:flutter/material.dart';
import 'package:scorer_uchenna/utils/router.dart';
import 'package:scorer_uchenna/widgets/text_field.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';
import 'package:scorer_uchenna/pages/soccer_home.dart';
import 'package:scorer_uchenna/utils/show_snackbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthDisplayViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          centerTitle: true,
          flexibleSpace: Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40)),
              child: Container(
                height: 225,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage('asset/soccerbg.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            const Color(0xE5002929).withOpacity(0.7),
                            BlendMode.darken))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 70, right: 170),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Account.',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            )
          ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
          title: Image.asset(
            'asset/3soccer.png',
            fit: BoxFit.contain,
            height: 88,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              textField(label: 'First name', controller: firstNameController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Last name', controller: lastNameController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Email Address', controller: emailController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'User name', controller: userNameController),
              const SizedBox(
                height: 5,
              ),
              textField(
                  label: 'Password',
                  controller: passwordController,
                  obscure: true),
              const SizedBox(
                height: 5,
              ),
              textField(
                  label: 'Repeat password',
                  controller: repeatPassController,
                  obscure: true),
              const SizedBox(
                height: 5,
              ),
              customButton(
                  text: 'Sign Up',
                  onTap: () {
                    vm
                        .signUp(
                        firstname: firstNameController.text,
                        lastname: lastNameController.text,
                        email: emailController.text,
                        username: userNameController.text,
                        password: passwordController.text,
                        repeatPassword: repeatPassController.text)
                        .then((value) {
                      nextPage(
                          SoccerHome(
                            token: vm.authViewModel?.token,
                          ),
                          context);
                      showSnackBar(context, 'Signed up successfully');
                    });
                  },
                  icon: Icons.login,
                  bgColor: const Color(0xFF008F8F),
                  alignT: true),
            ],
          ),
        ),
      ),
    );
  }
}