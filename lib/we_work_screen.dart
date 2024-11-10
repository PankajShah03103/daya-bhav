import 'package:daya_foundation/constants/colors.dart';
import 'package:daya_foundation/utils/app_bar.dart';
import 'package:daya_foundation/utils/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants/image_constants.dart';

class WeWorkScreen extends StatefulWidget {
  const WeWorkScreen({
    super.key,
  });

  @override
  State<WeWorkScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<WeWorkScreen> {
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
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: dynamicWidth,
                        height: dynamicHeight * 0.5,
                        color: Color.fromRGBO(249, 248, 242, 1),
                      ),
                      Container(
                        width: dynamicWidth,
                        height: dynamicHeight * 0.3,
                        color: Color.fromRGBO(248, 237, 211, 1),
                      ),
                    ],
                  ),
                  textWidgetBox(dynamicWidth, dynamicHeight),
                ],
              ),
              ourApproachWidget(dynamicWidth, dynamicHeight),
              solutionWidget(dynamicWidth, dynamicHeight),
              latestUpdateWidget(dynamicWidth, dynamicHeight),
              commonUIWidget(dynamicWidth, dynamicHeight),
            ],
          ),
        ));
  }

  Positioned textWidgetBox(dynamicWidth, dynamicHeight) {
    return Positioned(
      top: dynamicHeight * 0.05,
      left: dynamicWidth * 0.01,
      bottom: dynamicHeight * 0.03,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: dynamicHeight * 0.9,
          width: dynamicWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("How We Work",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: dynamicWidth > 800 ? 20 : 14)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: dynamicHeight * 0.02, bottom: dynamicHeight * 0.03),
                  child: SizedBox(
                    width: dynamicWidth * 0.5,
                    child: Text(
                      "From our commitment to equipping local partners, to our tech, to the environmental sustainability of our water projects, “good enough” is never good enough for us. We’re setting new standards for transparency and innovation, and these companies and organizations agree.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: dynamicWidth > 800 ? 12 : 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: dynamicHeight * 0.4,
                    width: dynamicWidth * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 1), width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ourApproachWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.7,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: dynamicHeight * 0.05),
              child: Text("Our approach",
                  style: TextStyle(
                      color: impactBgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: dynamicWidth > 800 ? 20 : 16)),
            ),
            Padding(
              padding: EdgeInsets.only(top: dynamicHeight * 0.04),
              child: Container(
                width: dynamicWidth * 0.4,
                child: Text(
                  "We work with local partners to fund water, sanitation, and hygiene (WASH) programs for rural communities around the world. But our work doesn’t stop when construction ends. We remain committed to monitoring, evaluation, and maintenance to ensure that these programs operate sustainably for years to come.",
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
                  top: dynamicHeight * 0.05, bottom: dynamicHeight * 0.01),
              child: Text("LEARN MORE",
                  style: TextStyle(
                      color: impactBgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: dynamicWidth > 800 ? 16 : 10)),
            ),
            SizedBox(
                width: dynamicWidth * 0.07,
                child: Divider(
                    thickness: 2, color: Color.fromRGBO(246, 84, 39, 1))),
            Padding(
              padding: EdgeInsets.only(
                  left: dynamicWidth * 0.05,
                  top: dynamicHeight * 0.05,
                  bottom: dynamicHeight * 0.1),
              child: Row(
                children: [
                  Container(
                      width: dynamicWidth * 0.3,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(246, 84, 39, 1),
                            minRadius: 8,
                            child: Text("1",
                                style: TextStyle(
                                    color: lightBgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dynamicWidth > 800 ? 12 : 6)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: dynamicHeight * 0.02),
                            child: Text("Planning",
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
                                "Our local partners select water point locations based on a variety of factors like geography, assessment of need, community participation, and long-term sustainability.",
                                style: TextStyle(
                                    color: impactBgColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: dynamicWidth > 800 ? 12 : 6),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: dynamicWidth * 0.3,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(246, 84, 39, 1),
                            minRadius: 8,
                            child: Text("2",
                                style: TextStyle(
                                    color: lightBgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dynamicWidth > 800 ? 12 : 6)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: dynamicHeight * 0.02),
                            child: Text("Implementation",
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
                                "In addition to the construction process, local partners spend months establishing community buy-in, promoting safe hygiene practices, and building water committee capacity to manage projects.",
                                style: TextStyle(
                                    color: impactBgColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: dynamicWidth > 800 ? 12 : 6),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: dynamicWidth * 0.3,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(246, 84, 39, 1),
                            minRadius: 8,
                            child: Text("3",
                                style: TextStyle(
                                    color: lightBgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dynamicWidth > 800 ? 12 : 6)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: dynamicHeight * 0.02),
                            child: Text("Post-Implementation",
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
                                "To ensure that water continues to flow for years to come, we empower local leaders, use strong operations and maintenance structures, collect data on specific WASH indicators, and implement innovative sensor technology.",
                                style: TextStyle(
                                    color: impactBgColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: dynamicWidth > 800 ? 12 : 6),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget solutionWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.5,
      color: const Color.fromRGBO(34, 37, 31, 1),
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
                      "We’re solution-agnostic",
                      style: TextStyle(
                          color: lightBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicWidth > 800 ? 18 : 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: dynamicHeight * 0.03),
                      child: Text(
                          "Our partners take existing water sources, terrain, and population into account when choosing a water solution. From household BioSand Filters to piped systems that stretch for miles, we work to make sure we’re funding the most appropriate solution for each community.",
                          style: TextStyle(
                              color: lightBgColor,
                              fontWeight: FontWeight.w400,
                              fontSize: dynamicWidth > 800 ? 14 : 8),
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: dynamicHeight * 0.02,
                          bottom: dynamicHeight * 0.01),
                      child: Text("LEARN MORE",
                          style: TextStyle(
                              color: lightBgColor,
                              fontWeight: FontWeight.w500,
                              fontSize: dynamicWidth > 800 ? 14 : 9)),
                    ),
                    SizedBox(
                        width: dynamicWidth * 0.06,
                        child: Divider(
                            thickness: 1,
                            color: Color.fromRGBO(246, 84, 39, 1))),
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
