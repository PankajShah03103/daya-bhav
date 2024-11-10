import 'package:daya_foundation/constants/colors.dart';
import 'package:daya_foundation/utils/app_bar.dart';
import 'package:daya_foundation/utils/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants/image_constants.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({
    super.key,
  });

  @override
  State<ContactUsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    double dynamicWidth = getContextWidth(context);
    double dynamicHeight = getContextHeight(context);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80), child: MyAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ourTeamWidget(dynamicWidth, dynamicHeight),
              latestUpdateWidget(dynamicWidth, dynamicHeight),
              commonUIWidget(dynamicWidth, dynamicHeight),
            ],
          ),
        ));
  }

  Widget ourTeamWidget(dynamicWidth, dynamicHeight) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: dynamicHeight * 0.04),
          child: const Center(
            child: Text("Contact Us",
                style: TextStyle(
                    color: impactBgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: dynamicHeight * 0.02,
              left: dynamicWidth * 0.05,
              right: dynamicWidth * 0.05,
              bottom: dynamicHeight * 0.02),
          child: SizedBox(
            width: dynamicWidth * 0.5,
            child: Text(
              "It is important to us at Daya Bhawna Foundation to provide answers to your questions as timely as possible.  Write, call, or email us, and a member of our team will respond.",
              style: TextStyle(
                  color: impactBgColor,
                  fontWeight: FontWeight.w400,
                  fontSize: dynamicWidth > 800 ? 14 : 10),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: dynamicWidth * 0.2, right: dynamicWidth * 0.2),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardDonateBox(
                    "By Phone",
                    "+91 - 6390255255",
                    "+91 - 7565988988",
                    ImageConstants.phoneImage,
                    dynamicWidth,
                    dynamicHeight),
                cardDonateBox("By Mail", "Jhansi, Gwalior, Sonagir", "",
                    ImageConstants.mailImage, dynamicWidth, dynamicHeight),
                cardDonateBox("By E-mail", "dayabhawnafoundation@gmail.com", "",
                    ImageConstants.gmailImage, dynamicWidth, dynamicHeight),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget cardDonateBox(String platformText, String commonText1,
      String commonText2, String imageText, dynamicWidth, dynamicHeight) {
    return Padding(
      padding: EdgeInsets.only(
          top: dynamicHeight * 0.05,
          left: dynamicWidth * 0.01,
          right: dynamicWidth * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: dynamicWidth * 0.13,
            height: dynamicHeight * 0.22,
            color: Colors.grey[300],
            child: Image.asset(
              imageText,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              platformText,
              style: TextStyle(
                  color: impactBgColor,
                  fontWeight: FontWeight.bold,
                  fontSize: dynamicWidth > 800 ? 12 : 6),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              commonText1,
              style: TextStyle(
                  color: impactBgColor,
                  fontWeight: FontWeight.w400,
                  fontSize: dynamicWidth > 800 ? 12 : 6),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              commonText2,
              style: TextStyle(
                  color: impactBgColor,
                  fontWeight: FontWeight.w400,
                  fontSize: dynamicWidth > 800 ? 12 : 6),
            ),
          ),
        ],
      ),
    );
  }

  Widget latestUpdateWidget(dynamicWidth, dynamicHeight) {
    return Padding(
      padding: EdgeInsets.only(
          left: dynamicWidth * 0.25,
          right: dynamicWidth * 0.25,
          bottom: dynamicHeight * 0.05,
          top: dynamicHeight * 0.05),
      child: Stack(
        children: [
          Container(
            width: dynamicWidth * 0.7,
            height: dynamicHeight * 0.3,
            color: const Color.fromRGBO(248, 237, 211, 1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text("Sign up to receive the latest updates",
                          style: TextStyle(
                              color: impactBgColor,
                              fontWeight: FontWeight.bold,
                              fontSize: dynamicWidth > 800 ? 14 : 6)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, left: dynamicWidth * 0.03, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("FULL NAME*",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicWidth > 800 ? 12 : 6)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: dynamicWidth > 800
                                        ? dynamicWidth * 0.08
                                        : dynamicWidth * 0.05,
                                    height: dynamicHeight * 0.02,
                                    color: Colors.white,
                                    child: TextFormField(
                                      onTap: () {},
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16.0),
                                        focusColor: Colors.white,
                                        isDense: true,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("PHONE NUMBER*",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicWidth > 800 ? 12 : 6)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: dynamicWidth > 800
                                        ? dynamicWidth * 0.08
                                        : dynamicWidth * 0.05,
                                    height: dynamicHeight * 0.02,
                                    color: Colors.white,
                                    child: TextFormField(
                                      onTap: () {},
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16.0),
                                        focusColor: Colors.white,
                                        isDense: true,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CITY*",
                                  style: TextStyle(
                                      color: impactBgColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: dynamicWidth > 800 ? 12 : 6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: dynamicWidth > 800
                                        ? dynamicWidth * 0.08
                                        : dynamicWidth * 0.05,
                                    height: dynamicHeight * 0.02,
                                    color: Colors.white,
                                    child: TextFormField(
                                      onTap: () {},
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16.0),
                                        focusColor: Colors.white,
                                        isDense: true,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("EMAIL ADDRESS*",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicWidth > 800 ? 12 : 6)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: dynamicWidth > 800
                                        ? dynamicWidth * 0.08
                                        : dynamicWidth * 0.05,
                                    height: dynamicHeight * 0.02,
                                    color: Colors.white,
                                    child: TextFormField(
                                      onTap: () {},
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16.0),
                                        focusColor: Colors.white,
                                        isDense: true,
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: dynamicHeight > 800
                              ? dynamicHeight * 0.05
                              : dynamicHeight * 0.07,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: dynamicHeight * 0.015,
                                left: dynamicWidth * 0.01,
                                right: dynamicWidth * 0.01),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: btnBackgroundColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)))),
                                onPressed: () {},
                                child: Text(
                                  "SUBSCRIBE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: dynamicWidth > 800 ? 14 : 6),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: dynamicWidth > 800 ? -20 : -10,
            top: dynamicHeight > 800 ? -45 : -10,
            child: Image(
                image: const AssetImage(ImageConstants.macawImage),
                width: dynamicWidth * 0.09,
                height: getContextWidth(context) * 0.09),
          ),
        ],
      ),
    );
  }

  Widget commonUIWidget(dynamicWidth, dynamicHeight) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: dynamicWidth,
              height: dynamicHeight * 1.7,
              color: Color.fromRGBO(34, 27, 23, 1),
            ),
            SizedBox(
                child: Image.asset(
              ImageConstants.deforestationImage,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            )),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: dynamicHeight * 0.01),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "100% of your money goes to our \n   "
                      "      conservation efforts",
                      style: TextStyle(
                          color: Color.fromRGBO(80, 123, 91, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicWidth > 800 ? 32 : 16),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: dynamicHeight * 0.01, bottom: dynamicHeight * 0.07),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Our board members and other supporters "
                        "cover our operating costs, so you can "
                        "give \n        "
                        "                   knowing your whole "
                        "gift will protect rainforests.",
                        style: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: dynamicWidth > 800 ? 16 : 12)),
                  ),
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: btnBackgroundColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0)))),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "DONATE NOW",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: dynamicHeight * 0.5,
                      bottom: dynamicHeight * 0.07,
                      left: dynamicWidth * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: dynamicHeight * 0.12,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jhansi, Gwalior, Sonagir",
                                  style: TextStyle(
                                      color: Color.fromRGBO(241, 239, 236, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: dynamicWidth > 800 ? 12 : 8)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("+91 6390255255",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                241, 239, 236, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                dynamicWidth > 800 ? 12 : 8)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        "dayabhawnafoundation@gmail.com",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                241, 239, 236, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                dynamicWidth > 800 ? 12 : 8)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: dynamicWidth * 0.3,
                        height: dynamicHeight * 0.6,
                        color: const Color.fromRGBO(30, 39, 56, 1),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageConstants.logoImage,
                                      alignment: Alignment.center,
                                      width: dynamicWidth > 800 ? 40 : 18,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Text("दया भावना",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: dynamicWidth > 800
                                                      ? 16
                                                      : 12)),
                                          Text("फाउंडेशन",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: dynamicWidth > 800
                                                      ? 16
                                                      : 12))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0, left: 10, right: 10, bottom: 20),
                                child: Text(
                                    "Thanks to the generous support of our Trust members"
                                    " and other supporters who cover all of our operating "
                                    "expenses, Daya Bhawna Foundation is able to allocate "
                                    "100% of donations to supportive action. This means you "
                                    "can give knowing your whole gift will protect people and"
                                    " animals.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            dynamicWidth > 800 ? 14 : 10)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10, right: 10, bottom: 20),
                                child: Image.asset(
                                  ImageConstants.certificateImage,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: btnBackgroundColor,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0)))),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: dynamicWidth > 800 ? 12 : 8,
                                    ),
                                    label: Text(
                                      "DONATE NOW",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              dynamicWidth > 800 ? 12 : 8),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("EIN 13-3500609",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                dynamicWidth > 800 ? 12 : 6)),
                                    Text("CFC #11257",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                dynamicWidth > 800 ? 12 : 6)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: dynamicWidth * 0.2,
                        height: dynamicHeight * 0.2,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("About Us",
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 8)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Contact Us",
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 8)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Our Services",
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 8)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("How we Work",
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 8)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Meet the Inspiration",
                                    style: TextStyle(
                                        color: Color.fromRGBO(241, 239, 236, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 8)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: dynamicHeight * 0.03,
                        left: dynamicWidth * 0.08,
                        right: dynamicWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("© 2024 Copyright - Daya Bhawna Foundation",
                            style: TextStyle(
                                color: Color.fromRGBO(241, 239, 236, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: dynamicWidth > 800 ? 12 : 8)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: dynamicWidth * 0.08,
                              right: dynamicWidth * 0.15),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                      ImageConstants.facebookImage,
                                      alignment: Alignment.center,
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.04
                                          : dynamicWidth * 0.02),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                      ImageConstants.youtubeImage,
                                      alignment: Alignment.center,
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.04
                                          : dynamicWidth * 0.02),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                      ImageConstants.instagramImage,
                                      alignment: Alignment.center,
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.04
                                          : dynamicWidth * 0.02),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                      ImageConstants.whatsappImage,
                                      alignment: Alignment.center,
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.04
                                          : dynamicWidth * 0.02),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("Privacy Policy",
                            style: TextStyle(
                                color: Color.fromRGBO(241, 239, 236, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: dynamicWidth > 800 ? 12 : 8)),
                      ],
                    ))
              ],
            )
          ],
        ),
      ],
    );
  }
}
