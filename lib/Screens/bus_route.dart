

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Presentation_Layer/color_manager.dart';
import '../Presentation_Layer/text_size_manager.dart';
import 'home_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final String url='https://www.google.com/maps/d/embed?mid=1J8QtXb3iMgXJTsECsIzdzu3mIgDio5Al';
     WebViewController? controller;
  double _progress=0;

  runWeb()async{

    controller!.loadUrl(url);
    controller!.clearCache();



  }
  @override
  void initState() {

   runWeb();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:Stack(
        children: <Widget>[

             WebView(
              gestureNavigationEnabled: true,
              navigationDelegate: (navigation) {
                if (!navigation.url.startsWith('https://flutter.dev')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
             initialUrl: this.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller){
               this.controller!=controller;
              },
              onProgress: (int number){
      setState(() {
        _progress=number/100;
      });
    },
              /*onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },*/
            ),

          _progress<1?Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 4,child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.blueAccent.withOpacity(0.2),
            ),),
          ):SizedBox(),

             /*Align(
               alignment: Alignment.bottomCenter,
               child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 // alignment: Alignment.bottomCenter,
                  height: 63,
                  width: screenSize.width/1.07,
                  decoration: BoxDecoration(
                    color: ColorManager.gray,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assete/images/home.png"),
                            const Gap(2),
                            Text("home",textScaleFactor: TextSize.textScaleFactor(context),)
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assete/images/calendar.png"),
                          const Gap(2),
                          Text("schedule",textScaleFactor: TextSize.textScaleFactor(context),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assete/images/user.png"),
                          const Gap(2),
                          Text("profile",textScaleFactor: TextSize.textScaleFactor(context),)
                        ],
                      )
                    ],
                  ),
                ),
            ),
             ),*/

        ],
      ),

      ),
    );
  }
}
