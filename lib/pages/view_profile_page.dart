import 'package:flutter/material.dart';
import 'package:scorer_uchenna/widgets/text_field.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';
import 'package:scorer_uchenna/pages/update_profile_page.dart';
import 'package:scorer_uchenna/utils/router.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';

class ViewProfilePage extends StatefulWidget {
  String token;
  ViewProfilePage({Key? key, required this.token}) : super(key: key);

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();


  
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthDisplayViewModel>(context);

    firstNameController.text = vm.detailsViewModel!.firstname;
    lastNameController.text = vm.detailsViewModel!.lastname;
    emailController.text = vm.detailsViewModel!.email;
    userNameController.text = vm.detailsViewModel!.username;
    
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
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('asset/soccerbg.jpg'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          const Color(0xE5002929).withOpacity(0.7),
                          BlendMode.darken))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 90, right: 8),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text('View Profile', style: TextStyle(fontSize: 22, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text('Your profile is shown here', style: TextStyle(fontSize: 10, color: Colors.white),)
                  ],
                ),
              ),
            )
          ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
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
              textField(label: 'First Name', controller: firstNameController, noEdit: true),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Last Name', controller: lastNameController, noEdit: true),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Username', controller: userNameController, noEdit: true),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Email', controller: emailController, noEdit: true),
              const SizedBox(
                height: 5,
              ),
              customButton(
                  text: 'Update Profile',
                  textColor: Colors.black,
                  onTap: () {
                    nextPage(UpdateProfilePage(firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text, username:  userNameController.text, token: widget.token,), context);
                  },
                  bgColor: const Color(0xFF51FFFF),
                  alignT: true)
            ],
          ),
        ),
      ),
    );
  }
}