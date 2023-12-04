
import 'package:diu_transit/Screens/transport_schedule.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import '../Presentation_Layer/color_manager.dart';
import '../Presentation_Layer/text_size_manager.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return SafeArea(child: Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //Weather card view design
             Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 77.0),
                child: Container(
                  height: screenSize.height/4.5,
                  width: screenSize.width/1.07,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: ColorManager.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Mirpur",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white
                        ),
                        textScaleFactor: TextSize.textScaleFactor(context),
                      ),
                      SizedBox(
                        height:screenSize.height/4,
                        width: screenSize.width/4,
                        child: Lottie.asset('assete/lottie_image/snow_sunny.json'),
                      ),
                      Text("17°",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white
                        ),
                        textScaleFactor: TextSize.textScaleFactor(context),
                      ),
                    ],
                  )
                 ),
              ),
             ),
             
             const Gap(50),
             Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Text("Select your area",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                color: ColorManager.select_area
              ),
              textScaleFactor: TextSize.textScaleFactor(context),
            ),
          ),
             const Gap(18),
        
        //Select area list item
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                height: screenSize.height/6.5,
                width: screenSize.width/2.5,
                decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorManager.primary,
                ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),
                     textScaleFactor: TextSize.textScaleFactor(context),
                   ),
                   Text("Total bus :7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),
                   Text("Active 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),

                 ],
               ),
             ),
                  const Gap(20),
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  )
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  )


                ],
              ),
            ],

          ),
        ),
           
           //  Custom Bottom Navigation Bar
           Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                  alignment: Alignment.bottomCenter,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assete/images/home.png"),
                          const Gap(2),
                           Text("home",textScaleFactor: TextSize.textScaleFactor(context),)
                        ],
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TransportSchedule()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assete/images/calendar.png"),
                            const Gap(2),
                             Text("schedule",textScaleFactor: TextSize.textScaleFactor(context),)
                          ],
                        ),
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
           ),

        ],
      ),
    ));
  }
}
