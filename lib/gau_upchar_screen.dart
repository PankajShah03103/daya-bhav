import 'package:daya_foundation/constants/colors.dart';
import 'package:daya_foundation/utils/app_bar.dart';
import 'package:daya_foundation/utils/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'constants/image_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GauUpcharScreen extends StatefulWidget {
  const GauUpcharScreen({
    super.key,
  });

  @override
  State<GauUpcharScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GauUpcharScreen> {
  late Razorpay _razorpay;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  showPaymentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Payment Amount'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Please enter the amount you wish to pay:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null || double.parse(value) <= 0) {
                      return 'Enter a valid amount';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Start the payment process
                  double amount = double.parse(_amountController.text);
                  Navigator.of(context).pop(); // Close the dialog
                  openCheckout(amount);
                }
              },
              child: Text('Pay Now'),
            ),
          ],
        );
      },
    );
  }

  void openCheckout(double amount) async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': (amount*100).toInt(),
      'name': 'Daya Foundation',
      'description': 'Fine T-Shirt',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

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
                  SizedBox(
                      width: dynamicWidth,
                      height: dynamicHeight>800?dynamicHeight*1.1:dynamicHeight*1.3,
                      child: Image.asset(
                        ImageConstants.guruJi,
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      )),
                  textWidgetBox(dynamicWidth, dynamicHeight),
                ],
              ),
              impactWidget(dynamicWidth, dynamicHeight),
              ourVisionWidget(dynamicWidth, dynamicHeight),
              projectInformationWidget(dynamicWidth, dynamicHeight),
              latestUpdateWidget(dynamicWidth, dynamicHeight),
              commonUIWidget(dynamicWidth, dynamicHeight),
            ],
          ),
        ));
  }

  Widget impactWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.25,
      color: Color.fromRGBO(34, 37, 31, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("OUR IMPACT TILL DATE",
                  style: TextStyle(
                      color: messageColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12)),
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

  Positioned textWidgetBox(dynamicWidth, dynamicHeight) {
    return Positioned(
      top: dynamicHeight * 0.05,
      left: dynamicWidth * 0.01,
      width: dynamicWidth > 800 ? 500 : dynamicWidth * 0.7,
      height: dynamicHeight>800?dynamicHeight*0.9:dynamicHeight*1.2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: dynamicHeight * 0.8,
          color: Color.fromRGBO(251, 244, 223, 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: dynamicHeight * 0.02),
                  child: SizedBox(
                    width: dynamicWidth>800?dynamicWidth * 0.3:dynamicWidth*0.4,
                    child: Text(
                      "Acharya Vidyasagar Gau Upchar Hospital",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: dynamicWidth > 800 ? 24 : 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:dynamicHeight * 0.02,left:dynamicWidth*0.01,right: dynamicWidth*0.01,bottom:dynamicHeight * 0.02  ),
                  child: Text(
                    "Serving the voiceless animals- Our goal is to construct free, modern, fully-equipped animal hospitals for injured, accidental, and stray animals within every 200 km range of intervals on all national highways of India.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: dynamicWidth > 800 ? 14 : 10),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color.fromRGBO(251, 244, 223, 1),
                        // Text color
                        side: BorderSide(color: Colors.black, width: 0.5),
                        // Border color
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.0),
                            bottomLeft: Radius.circular(3.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'GIVE ONCE',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: dynamicWidth > 800 ? 14 : 10),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: btnBackgroundColor,
                        side: const BorderSide(color: Colors.black, width: 0.5),
                        // Border color
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3.0),
                            bottomRight: Radius.circular(3.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'YEARLY',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: dynamicWidth > 800 ? 14 : 10),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: dynamicHeight * 0.02, left: dynamicWidth*0.01, right: dynamicWidth*0.01),
                  child: Container(
                    width: dynamicWidth>800?dynamicWidth * 0.23:dynamicWidth*0.35,
                    height: dynamicHeight>800?dynamicHeight * 0.38:dynamicHeight*0.51,
                    decoration: BoxDecoration(border: Border.all(width: 0.09)),
                    child: Column(
                      children: [
                        Container(
                          width: dynamicWidth>800?dynamicWidth * 0.25:dynamicWidth*0.35,
                          height: dynamicHeight>800?dynamicHeight * 0.06:dynamicHeight*0.09,
                          color: const Color.fromRGBO(244, 245, 240, 1),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: dynamicHeight * 0.012),
                            child: Text(
                              "Choose an amount to give per month",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: dynamicWidth > 800 ? 14 : 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: dynamicWidth>800?dynamicWidth * 0.25:dynamicWidth*0.35,
                          height: dynamicHeight>800?dynamicHeight * 0.23:dynamicHeight*0.3,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border(
                                top: BorderSide(
                                    width: 0.05, color: Colors.black),
                                bottom: BorderSide(
                                    width: 0.07, color: Colors.black),
                              )),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: dynamicHeight * 0.02,
                                    left: dynamicWidth * 0.01,
                                    right: dynamicWidth * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.06
                                          : dynamicWidth * 0.09,
                                      height: dynamicHeight > 800
                                          ? dynamicHeight * 0.04
                                          : dynamicHeight * 0.06,
                                      color: const Color.fromRGBO(
                                          233, 234, 227, 1),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dynamicHeight * 0.01),
                                        child: Text(
                                          "₹3,000/year",
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  dynamicWidth > 800 ? 12 : 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.06
                                          : dynamicWidth * 0.09,
                                      height: dynamicHeight > 800
                                          ? dynamicHeight * 0.04
                                          : dynamicHeight * 0.06,
                                      color: const Color.fromRGBO(
                                          233, 234, 227, 1),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dynamicHeight * 0.01),
                                        child: Text(
                                          "₹5,000/year",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  dynamicWidth > 800 ? 12 : 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.06
                                          : dynamicWidth * 0.09,
                                      height: dynamicHeight > 800
                                          ? dynamicHeight * 0.04
                                          : dynamicHeight * 0.06,
                                      color: btnBackgroundColor,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dynamicHeight * 0.01),
                                        child: Text(
                                          "₹10,000/year",
                                          style: TextStyle(
                                              color: lightBgColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  dynamicWidth > 800 ? 12 : 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: dynamicHeight * 0.02,
                                    left: dynamicWidth * 0.01,
                                    right: dynamicWidth * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.06
                                          : dynamicWidth * 0.09,
                                      height: dynamicHeight > 800
                                          ? dynamicHeight * 0.04
                                          : dynamicHeight * 0.06,
                                      color: const Color.fromRGBO(
                                          233, 234, 227, 1),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dynamicHeight * 0.01),
                                        child: Text(
                                          "₹20,000/year",
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  dynamicWidth > 800 ? 12 : 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: dynamicWidth > 800
                                          ? dynamicWidth * 0.12
                                          : dynamicWidth * 0.15,
                                      height: dynamicHeight > 800
                                          ? dynamicHeight * 0.04
                                          : dynamicHeight * 0.06,
                                      color: const Color.fromRGBO(
                                          233, 234, 227, 1),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dynamicHeight * 0.01),
                                        child: Text(
                                          "Other amount",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  dynamicWidth > 800 ? 12 : 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: dynamicHeight * 0.02),
                                child: SizedBox(
                                  width: dynamicWidth>800 ? dynamicWidth * 0.2:dynamicWidth * 0.3,
                                  height: dynamicHeight>800 ? dynamicHeight*0.05:dynamicHeight * 0.08,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: btnBackgroundColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(0)))),
                                      onPressed: () {

                                      },
                                      child: Text(
                                        "DONATE",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                dynamicWidth > 800 ? 12 : 8),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: dynamicWidth>800?dynamicWidth * 0.25:dynamicWidth*0.35,
                          height: dynamicHeight>800?dynamicHeight * 0.08:dynamicHeight*0.11,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          child: Padding(
                            padding: EdgeInsets.only(top: dynamicHeight * 0.01),
                            child: Text(
                              "Your ₹10,000 yearly donation can give 12 people good hospital facility every year. 100% funds hospital projects.",
                              style: TextStyle(
                                  color: impactBgColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: dynamicWidth > 800 ? 12 : 7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: dynamicWidth>800?dynamicWidth * 0.25:dynamicWidth*0.37,
                  height: dynamicHeight>800?dynamicHeight * 0.1:dynamicHeight*0.18,
                  child: Padding(
                    padding: EdgeInsets.only(top:dynamicHeight*0.01,left:dynamicWidth*0.02,right: dynamicWidth*0.02,bottom: dynamicHeight*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      const Icon(Icons.lock,size: 10,),
                      SizedBox(
                        width: dynamicWidth>800?dynamicWidth * 0.15:dynamicWidth*0.25,
                        child: Text(
                          "Secure Payment - This site is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply.",
                          style: TextStyle(
                              color: impactBgColor,
                              fontWeight: FontWeight.w400,
                              fontSize: dynamicWidth > 800 ? 10 : 8),
                              textAlign: TextAlign.center,
                        ),
                      ),
                    ],),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ourVisionWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.5,
      color: const Color.fromRGBO(248, 237, 211, 1),
      child: Padding(
        padding: EdgeInsets.only(
            left: dynamicWidth * 0.01,
            right: dynamicWidth * 0.1,
            bottom: dynamicHeight * 0.1,
            top: dynamicHeight * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageConstants.maharajSahebImage,
                alignment: Alignment.center,
                width: dynamicWidth > 800
                    ? dynamicWidth * 0.4
                    : dynamicWidth * 0.2),
            SizedBox(
              width: dynamicWidth * 0.4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Maharaj Vision",
                      style: TextStyle(
                          color: impactBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicWidth > 800 ? 20 : 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: dynamicHeight * 0.01),
                      child: Text(
                          "All of our operational expenses are funded by a private community of donors called The Well so you can trust that 100% of your donation goes directly to water solutions. But we don’t stop there.",
                          style: TextStyle(
                              color: impactBgColor,
                              fontWeight: FontWeight.w400,
                              fontSize: dynamicWidth > 800 ? 14 : 8),
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: dynamicHeight * 0.02,
                          bottom: dynamicHeight * 0.01),
                      child: Text(
                          "From our commitment to equipping local partners, to our tech, to the environmental sustainability of our water projects, “good enough” is never good enough for us. We’re setting new standards for transparency and innovation, and these companies and organizations agree.",
                          style: TextStyle(
                              color: impactBgColor,
                              fontWeight: FontWeight.w400,
                              fontSize: dynamicWidth > 800 ? 14 : 8),
                          textAlign: TextAlign.justify),
                    ),
                    SizedBox(
                      width: dynamicWidth > 800
                          ? dynamicWidth * 0.1
                          : dynamicWidth * 0.2,
                      height: dynamicHeight > 800
                          ? dynamicHeight * 0.04
                          : dynamicHeight * 0.08,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: btnBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)))),
                          // onPressed: (){},
                          onPressed: showPaymentDialog,
                          icon: Icon(Icons.favorite,
                              color: Colors.white,
                              size: dynamicWidth > 800 ? 12 : 8),
                          label: Text(
                            "DONATE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: dynamicWidth > 800 ? 12 : 8),
                          )),
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

  Widget projectInformationWidget(dynamicWidth, dynamicHeight) {
    return Container(
      width: dynamicWidth,
      height: dynamicHeight * 0.8,
      color: lightBgColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: dynamicWidth * 0.05,
            right: dynamicWidth * 0.05,
            top: dynamicHeight * 0.1),
        child: Column(
          children: [
            Container(
              width: dynamicWidth * 0.6,
              height: dynamicHeight * 0.1,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Full Project Information",
                      style: TextStyle(
                          color: impactBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicWidth > 800 ? 20 : 8),
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: btnBackgroundColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)))),
                        onPressed: () {},
                        icon: Icon(Icons.file_download_outlined,
                            color: Colors.white,
                            size: dynamicWidth > 800 ? 12 : 8),
                        label: Text(
                          "DOWNLOAD PDF",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: dynamicWidth > 800 ? 12 : 8),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: dynamicWidth * 0.6,
              height: dynamicHeight * 0.6,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, border: Border.all(width: 0.1)),
            ),
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
              color: Color.fromRGBO(1, 115, 98, 1),
            ),
            SizedBox(
                child: Image.asset(
              ImageConstants.mangrovesImage,
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
