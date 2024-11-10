import 'package:daya_foundation/constants/image_constants.dart';
import 'package:daya_foundation/contact_us_screen.dart';
import 'package:daya_foundation/gau_upchar_screen.dart';
import 'package:daya_foundation/inspiration_screen.dart';
import 'package:daya_foundation/our_team_screen.dart';
import 'package:daya_foundation/our_trust_members_screen.dart';
import 'package:daya_foundation/our_work.dart';
import 'package:daya_foundation/we_work_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'common_methods.dart';

class MyAppBar extends StatefulWidget {
  MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    double dynamicWidth = getContextWidth(context);
    double dynamicHeight = getContextHeight(context);
    String selectedValue = '';
    void navigateToSelectedPage(String selectedItem) {
      if (selectedItem == 'Our Work') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OurWorkScreen()));
      } else if (selectedItem == 'Our Team') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OurTeamScreen()));
      } else if (selectedItem == 'Trust Members') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OurTrustMembersScreen()));
      } else if (selectedItem == 'How we work') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WeWorkScreen()));
      } else if (selectedItem == 'Meet the Inspiration') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InspirationScreen()));
      }else if (selectedItem == 'Acharya Vidyasagar Gau Upchar Hospital') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GauUpcharScreen()));
      }
    }

    List<String> ourServicesItems = [
      'Acharya Vidyasagar Gau Upchar Hospital',
      'Bhagwan Shree Ram Pakshi Upchar Hospital',
      'Saawaliya Parasnath Khichdi Vitran',
      'Manav Sewa',
      'Daya Bhawna Foundation Hospital'
    ];
    List<String> aboutUsItems = [
      'Our Work',
      'Our Team',
      'Trust Members',
      'How we work',
      'Meet the Inspiration'
    ];
    // void showDropdownDialog(BuildContext context) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context)
    //       {
    //         return AlertDialog(
    //           content: SizedBox(
    //             width: 300,
    //             height: 200,
    //             child: ListView.builder(
    //               itemCount: ourServicesItems.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return ListTile(
    //                   title: Text(ourServicesItems[index]),
    //                   onTap: () {
    //                     setState(() {
    //                       selectedValue = ourServicesItems[index];
    //                     });
    //                     Navigator.of(context)
    //                         .pop(); // Close the dialog after selecting an item
    //                   },
    //                 );
    //               },
    //             ),
    //           ),
    //         );
    //       });}
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundAppBarColor,
      title: Padding(
        padding: EdgeInsets.only(
            top: dynamicHeight * 0.01, left: dynamicWidth * 0.02),
        child: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(
                  width: dynamicWidth > 800
                      ? dynamicWidth * 0.07
                      : dynamicWidth * 0.05,
                  child: Image.asset(
                    ImageConstants.logoImage,
                    alignment: Alignment.center,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text("दया भावना",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: dynamicWidth > 800 ? 16 : 8)),
                    Text("फाउंडेशन",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: dynamicWidth > 800 ? 16 : 8))
                  ],
                ),
              ),
              SizedBox(
                width: dynamicWidth * 0.07,
              ),
              Row(
                children: [
                  Text("OUR SERVICES",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: dynamicWidth > 800 ? 14 : 6)),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue == '' ? null : selectedValue,isDense: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          navigateToSelectedPage(selectedValue);
                        });
                      },
                      items: ourServicesItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(width: dynamicWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ABOUT US",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: dynamicWidth > 800 ? 14 : 6)),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue == '' ? null : selectedValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          navigateToSelectedPage(selectedValue);
                        });
                      },
                      items: aboutUsItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(width: dynamicWidth * 0.01),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                ),
                child: Text("CONTACT US",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicWidth > 800 ? 14 : 6)),
              )
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(ImageConstants.facebookHeader),
            width: dynamicWidth > 800 ? 16 : 12,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(ImageConstants.whatsappHeader),
            width: dynamicWidth > 800 ? 16 : 12,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(ImageConstants.instagramHeader),
            width: dynamicWidth > 800 ? 16 : 12,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(ImageConstants.youtubeHeader),
            width: dynamicWidth > 800 ? 16 : 12,
          ),
        ),
        SizedBox(
          width: dynamicWidth > 800 ? dynamicWidth * 0.09 : dynamicWidth * 0.15,
          height:
              dynamicHeight > 800 ? dynamicHeight * 0.03 : dynamicHeight * 0.04,
          child: Padding(
            padding: EdgeInsets.only(
                left: dynamicWidth * 0.01, right: dynamicWidth * 0.01),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: btnBackgroundColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
                onPressed: () {},
                child: Text("JOIN US",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicWidth > 800 ? 12 : 6))),
          ),
        )
      ],
    );
  }
}
