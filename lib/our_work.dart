import 'package:daya_foundation/constants/colors.dart';
import 'package:daya_foundation/utils/app_bar.dart';
import 'package:daya_foundation/utils/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants/image_constants.dart';

class OurWorkScreen extends StatefulWidget {
  const OurWorkScreen({
    super.key,
  });

  @override
  State<OurWorkScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OurWorkScreen> {
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
              impactWidget(dynamicWidth, dynamicHeight),
              storiesWidget(dynamicWidth, dynamicHeight),
              nextStepWidget(dynamicWidth, dynamicHeight),
              latestUpdateWidget(dynamicWidth, dynamicHeight),
              commonUIWidget(dynamicWidth, dynamicHeight),
            ],
          ),
        ));
  }

  Widget impactWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.9,
      color: Color.fromRGBO(34, 37, 31, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: dynamicHeight * 0.1),
              child: const Text("Our Work",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            SizedBox(
              width: dynamicWidth * 0.5,
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "From our commitment to equipping local partners, to our tech, to the environmental sustainability of our water"
                  "projects, “good enough” is never good enough for us. We’re setting new standards for transparency and"
                  "innovation, and these companies and organizations agree.",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                height: dynamicHeight * 0.4,
                width: dynamicWidth * 0.42,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  impactWidgetTxt("100+", "DAYA BHAWNA HOSPITAL", dynamicWidth),
                  impactWidgetTxt("13+", "GAU UPCHAR HOSPITAL", dynamicWidth),
                  impactWidgetTxt("1,50,000+", "KHICHDI VITRAN", dynamicWidth),
                  impactWidgetTxt("50,000+", "MANAV SEWA", dynamicWidth),
                  impactWidgetTxt(
                      "50,000+", "PAKSHI UPCHAR HOSPITAL", dynamicWidth),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget impactWidgetTxt(String title, subTitle, dynamicWidth) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: dynamicWidth > 800 ? 14 : 10)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: dynamicWidth > 800 ? 12 : 8)),
        ),
      ],
    );
  }

  Widget storiesWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.7,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: dynamicWidth * 0.14,
                  top: dynamicHeight * 0.05,
                  bottom: dynamicHeight * 0.1),
              child: Row(
                children: [
                  Container(
                      width: dynamicWidth * 0.32,
                      child: Row(
                        children: [
                          Image.asset(ImageConstants.mechanicImage,
                              width: dynamicWidth > 800
                                  ? dynamicWidth * 0.05
                                  : dynamicWidth * 0.05),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: dynamicHeight * 0.03,
                                    left: dynamicWidth * 0.02),
                                child: Text("How we work",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicWidth > 800 ? 14 : 8)),
                              ),
                              SizedBox(
                                width: dynamicWidth * 0.20,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: dynamicHeight * 0.01,
                                      left: dynamicWidth * 0.02),
                                  child: Text(
                                    "We partner with experienced local organizations who"
                                    "build sustainable, community-owned water projects around"
                                    "the world.",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 6),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      width: dynamicWidth * 0.32,
                      child: Row(
                        children: [
                          Image.asset(ImageConstants.flagImage,
                              width: dynamicWidth > 800
                                  ? dynamicWidth * 0.05
                                  : dynamicWidth * 0.05),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: dynamicHeight * 0.03,
                                    left: dynamicWidth * 0.02),
                                child: Text("Proving Our Impact",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicWidth > 800 ? 14 : 8)),
                              ),
                              SizedBox(
                                width: dynamicWidth * 0.25,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: dynamicHeight * 0.01,
                                      left: dynamicWidth * 0.02),
                                  child: Text(
                                    "From the start, we’ve publicly shared photos and GPS coordinates for every single charity: water project. You can find all of our funded projects on the map above.",
                                    style: TextStyle(
                                        color: impactBgColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: dynamicWidth > 800 ? 12 : 6),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
            const Text("Stories From the Field",
                style: TextStyle(
                    color: impactBgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: dynamicWidth * 0.4,
                child: const Text(
                  "The communities we serve are filled with some of the most inspiring people you’d ever want to meet. Their stories of ingenuity and perseverance are examples for us all.",
                  style: TextStyle(
                      color: impactBgColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: dynamicWidth * 0.1),
              child: Row(
                children: [
                  cardDonateBox(
                      "Between Heaven and Earth", dynamicWidth, dynamicHeight),
                  cardDonateBox(
                      "Waiting for clean water in one of the harshest places on Earth",
                      dynamicWidth,
                      dynamicHeight),
                  cardDonateBox(
                      "What Helen Taught Us", dynamicWidth, dynamicHeight),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardDonateBox(String passTxt, dynamicWidth, dynamicHeight) {
    return Padding(
      padding: EdgeInsets.only(
          top: dynamicHeight * 0.1,
          left: dynamicWidth * 0.06,
          bottom: dynamicHeight * 0.1),
      child: Column(
        children: [
          Container(
            height:
                dynamicWidth > 800 ? dynamicHeight * 0.30 : dynamicHeight * 0.2,
            width: dynamicWidth * 0.18,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            width: dynamicWidth * 0.18,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: dynamicHeight * 0.02),
                child: Text(passTxt,
                    style: TextStyle(
                        color: impactBgColor,
                        fontWeight: FontWeight.w400,
                        fontSize: dynamicWidth > 800 ? 12 : 6)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: dynamicHeight * 0.02, bottom: dynamicHeight * 0.02),
            child: Text("READ MORE",
                style: TextStyle(
                    color: impactBgColor,
                    fontWeight: FontWeight.w400,
                    fontSize: dynamicWidth > 800 ? 12 : 6)),
          ),
          const Divider(
            color: Color.fromRGBO(246, 84, 39, 1),
            thickness: 2,
            height: 10,
          )
        ],
      ),
    );
  }

  Widget nextStepWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.5,
      color: const Color.fromRGBO(249, 248, 242, 1),
      child: Padding(
        padding: EdgeInsets.only(
            left: dynamicWidth * 0.1,
            right: dynamicWidth * 0.1,
            bottom: dynamicHeight * 0.1,
            top: dynamicHeight * 0.13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageConstants.maharajSahebImage,
                alignment: Alignment.center,
                width: dynamicWidth > 800
                    ? dynamicWidth * 0.4
                    : dynamicWidth * 0.2),
            SizedBox(
              width: dynamicWidth * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Next Step In Sustainability",
                      style: TextStyle(
                          color: impactBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicWidth > 800 ? 18 : 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: dynamicHeight * 0.03),
                      child: Text(
                        "Working with local leaders to keep water flowing is critical to our mission. In November 2015, charity: water started deploying cutting-edge sensors and cloud computing technology to equip local leaders with real-time data.",
                        style: TextStyle(
                            color: impactBgColor,
                            fontWeight: FontWeight.w400,
                            fontSize: dynamicWidth > 800 ? 14 : 8),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: dynamicHeight * 0.03),
                      child: SizedBox(
                        width: dynamicWidth > 800
                            ? dynamicWidth * 0.13
                            : dynamicWidth * 0.18,
                        height: dynamicHeight > 800
                            ? dynamicHeight * 0.05
                            : dynamicHeight * 0.07,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: btnBackgroundColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)))),
                            onPressed: () {},
                            icon: Icon(Icons.favorite,
                                color: Colors.white, size: dynamicWidth * 0.01),
                            label: Text(
                              "DONATE NOW",
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
            )
          ],
        ),
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
              color: Color.fromRGBO(37, 54, 41, 1),
            ),
            SizedBox(
                child: Image.asset(
              ImageConstants.forestImage,
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
