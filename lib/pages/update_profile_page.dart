import 'package:flutter/material.dart';
import 'package:scorer_uchenna/widgets/text_field.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';
import 'package:scorer_uchenna/widgets/show_sheet.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';

class UpdateProfilePage extends StatefulWidget {

  String firstName;
  String lastName;
  String email;
  String username;
  String token;
  UpdateProfilePage({Key? key,required this.token, required this.firstName, required this.lastName, required this.username, required this.email }) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    userNameController.text = widget.username;
    emailController.text = widget.email;

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
                    Text('Update Profile', style: TextStyle(fontSize: 22, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text('Modify your profile from here', style: TextStyle(fontSize: 10, color: Colors.white),)
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
              textField(label: 'First Name', controller: firstNameController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Last Name', controller: lastNameController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Username', controller: userNameController),
              const SizedBox(
                height: 5,
              ),
              textField(label: 'Email', controller: emailController),
              const SizedBox(
                height: 5,
              ),
              customButton(
                  text: 'Update Profile',
                  textColor: Colors.black,
                  onTap: () {
                    Provider.of<AuthDisplayViewModel>(context, listen: false).updateDetails(token: widget.token, firstname: firstNameController.text, lastname: lastNameController.text, email: emailController.text, username: userNameController.text).then((value) {
                      Navigator.pop(context);
                      myModalSheet(context);
                    });
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