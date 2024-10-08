import 'package:finalproject1/onboarding.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
class PremiumPlan extends StatefulWidget {
  static const String routeName = "Premium-plan";

  @override
  State<PremiumPlan> createState() => _PremiumPlanState();
}

class _PremiumPlanState extends State<PremiumPlan> {
  @override
  Widget build(BuildContext context) {
    return PaywallScaffold(
      // appBarTitle for scaffold
      appBarTitle: "CareZone Premium",
      child: SimplePaywall(
        // set a custom header
          headerContainer: Container(
              margin: const EdgeInsets.all(16),
              height: 280,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      matchTextDirection: true,
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.center,
                      image: AssetImage('assets/images/plan.gif'))),
              child: Container()),
          // Title Bar
          title: "Go Premium",

          // SubTitle
          subTitle: "All features at a glance",
          // Add as many bullet points as you like
          bulletPoints: const [
            IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
            IconAndText(Icons.sort, "Access to All Premium Health Articles"),
            IconAndText(Icons.document_scanner, 'Upload all the medical documents')
          ],
          // Your subscriptions that you want to offer to the user
          subscriptionListData: [
            SubscriptionData(
                durationTitle: "Yearly",
                durationShort: "1 year",
                price: "30\$",
                dealPercentage: 69,
                productDetails: "Dynamic purchase data",
                index: 0),
            SubscriptionData(
                durationTitle: "Quarterly",
                durationShort: "3 Months",
                price: "7.5\$",
                dealPercentage: 42,
                productDetails: "Dynamic purchase data",
                index: 2),
            SubscriptionData(
                durationTitle: "Monthly",
                durationShort: "1 month",
                price: "1\$",
                dealPercentage: 0,
                productDetails: "Dynamic purchase data",
                index: 3)
          ],
          // Shown if isPurchaseSuccess == true
          successTitle: "Success!!",
          // Shown if isPurchaseSuccess == true
          successSubTitle: "Thanks for choosing Premium!",
          // Widget can be anything. Shown if isPurchaseSuccess == true
          successWidget: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  child: const Text("Let's go!"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OnBoarding()),
                    );                  },
                )
              ])),
          activePlanList: const [
            // links to the subscription overview on Android devices:
            GooglePlayGeneralActivePlan(),

            // links to the specific subscription on Android devices:
            GooglePlayActivePlan("yearly_pro", "com.tnx.packed"),

            // links to the subscription overview on iOS devices
            AppleAppStoreActivePlan(),
          ],
          // set true if subscriptions are loading
          isSubscriptionLoading: false,
          // if purchase is in progress, set to true. this will show a fullscreen progress indicator
          isPurchaseInProgress: false,
          // to show the success widget
          purchaseState: PurchaseState.NOT_PURCHASED,

          // callback Interface for restore and purchase tap events. Extend DefaultPurchaseHandler

          // provide your TOS
          tosData:
          const TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
          // provide your PP
          ppData:
          const TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
          // add a custom campaign widget
          campaignWidget: CampaignBanner(
            headline: "🥳 Summer Special Sale",
            subContent: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    child: CountdownTimer(
                      endTime: DateTime.now()
                          .add(const Duration(days: 2, hours: 7))
                          .millisecondsSinceEpoch,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(
                  child: const Text("Skip for now"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OnBoarding()),
                    );                  },
                )
              ],
            ),
          )),
    );
  }
}

class PurchaseHandler extends DefaultPurchaseHandler {

  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    print("purchase start");
    isPendingPurchase = true;
    await Future.delayed(const Duration(seconds: 1));
    print("purchase done");
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    isPendingPurchase = true;
    await Future.delayed(const Duration(seconds: 1));
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
