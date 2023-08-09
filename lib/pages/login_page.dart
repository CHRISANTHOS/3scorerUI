import 'package:flutter/material.dart';
import 'package:scorer_uchenna/widgets/text_field.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';
import 'package:scorer_uchenna/pages/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';
import 'package:scorer_uchenna/pages/soccer_home.dart';
import '../utils/router.dart';
import 'package:scorer_uchenna/utils/show_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      resizeToAvoidBottomInset: false,
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
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 100, right: 150),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: const [
                    Text('Welcome Back!', style: TextStyle(fontSize: 30, color: Colors.white),),
                    Text('Continue enjoying the predictions.', style: TextStyle(fontSize: 10, color: Colors.white),)
                  ],
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
      body: Column(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  textField(label: 'Email Address', controller: emailController),
                  const SizedBox(
                    height: 5,
                  ),
                  textField(label: 'Password', controller: passwordController, obscure: true),
                  const SizedBox(
                    height: 5,
                  ),
                  customButton(
                      text: 'Login',
                      textColor: Colors.black,
                      onTap: () {
                        vm.login(email: emailController.text, password: passwordController.text).then((value) {
                          nextPageReplace(SoccerHome(token: vm.authViewModel!.token,), context);
                          showSnackBar(context, 'Logged in Successfully');
                        });
                      },
                      bgColor: const Color(0xFF51FFFF),
                      alignT: true)
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(onPressed: (){
                nextPage(const SignUpPage(), context);
              }, child: const Text('Sign Up'))
            ],
          )
        ],
      ),
    );
  }
}
