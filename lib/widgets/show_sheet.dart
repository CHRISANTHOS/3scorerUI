import 'package:flutter/material.dart';
import 'package:scorer_uchenna/widgets/custom_button.dart';

void myModalSheet(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(30)
          )
      ),
      context: context,
      builder: (context) {
        return Container(
          padding:
          const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset('asset/soccercheck.png'),
              ),
              const Text(
                'It\'s done!',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Your profile has been successfully updated.'),
              const SizedBox(
                height: 20,
              ),
              customButton(
                  text: 'Done',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  alignT: true,
                  bgColor: const Color(0xFF51FFFF),
                  textColor: Colors.black)
            ],
          ),
        );
      });
}
