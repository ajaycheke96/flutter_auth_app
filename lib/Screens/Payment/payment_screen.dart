import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_1DP5mmOlF5G5ag",
      "amount": num.parse(_amountController.text) * 100,
      "name": "Sample App",
      "description": "sample description for payment",
      "prefill": {
        "contact": "2323232323",
        "email": "sample@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success");
    print(
        "${response.orderId} \n${response.paymentId} \n${response.signature} ");
        // Toast.show( "SUCCESS: " + response.paymentId!, context);
  }

  void handlerPaymentFailure(PaymentFailureResponse response) {
    print("Payment Failure");
    print("${response.code} \n${response.message}");
    // Toast.show( "Error: " "${response.code} \n${response.message}", context);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    print("External wallet");
    print("${response.walletName}");
    // Toast.show( "Error: " "${response.walletName}", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay Tutorial"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              hintText: "Enter the Amount",
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                print("Pressed");
                print(_amountController.text);
                openCheckout();
              },
              child: Text("Pay Now"))
        ],
      ),
    );
  }
}
