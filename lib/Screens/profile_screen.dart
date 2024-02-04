import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/auth_controller.dart';
import '../CustomWidget/profile_menu.dart';
import '../CustomWidget/profile_pic.dart';
import '../Session/session.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(AuthController());
  String ? name;
  String ? email;
  String ? mobile_number;
  getUserName() async {
    await MyPrefs.getName().then((value) {
      setState(() {
        name = value;
      });
    }); print("name____________________:${name}");
  }
  getEmail() async {
    await MyPrefs.getEmail().then((value) {
      setState(() {
        email = value;
      });
    }); print("name____________________:${email}");
  }
  getMobile_number() async {
    await MyPrefs.getMobile().then((value) {
      setState(() {
        mobile_number = value;
      });
    }); print("name____________________:${mobile_number}");
  }
@override
  void initState() {
  getUserName();
  getEmail();
  getMobile_number();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        //var data= controller.routeList.value.data;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
          ),
          body:
          name!.isEmpty && email!.isEmpty && mobile_number!.isEmpty?Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const ProfilePic(),
                const SizedBox(height: 20),
                ProfileMenu(
                  text: name!,
                  icon: "assete/images/User.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: email!,
                  icon: "assete/images/email.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: mobile_number!,
                  icon: "assete/images/Phone.svg",
                  press: () {},
                ),

                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {
                    controller.removeValues();
                  },
                ),

              ],
            ),
          ),

        );
      },
    );

  }
}
