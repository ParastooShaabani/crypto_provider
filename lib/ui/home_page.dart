import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:crypto_provider/ui/ui_helper/home_page_view.dart';
import 'package:crypto_provider/ui/ui_helper/theme_switcher.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);

  int defaultChoiceIndex = 0;

  final List<String> _choicesList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers',
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final Color primaryColor = Theme.of(context).primaryColor;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(loc.appName),
        centerTitle: true,
        titleTextStyle: textTheme.bodySmall,
        actions: const [ThemeSwitcher()],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // PageView
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      HomePageView(controller: _pageViewController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                            controller: _pageViewController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                            ),
                            onDotClicked:
                                (index) => _pageViewController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30,
                width: double.infinity,
                child: Marquee(
                  text: '🔊 this is place for news in application ',
                  style: textTheme.bodySmall,
                ),
              ),

              const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.green[700],
                        ),
                        child: Text("buy"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.red[700],
                        ),
                        child: Text("sell"),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 5.0, left: 5),
                child: Row(
                  children: [
                    // Consumer<CryptoDataProvider>(
                    //   builder: (context, cryptoDataProvider, child) {
                    //     return
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 5),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: List.generate(_choicesList.length, (index) {
                          return ChoiceChip(
                            label: Text(
                              _choicesList[index],
                              style: textTheme.bodySmall,
                            ),
                            selected: defaultChoiceIndex == index,
                            // cryptoDataProvider.defaultChoiceIndex ==
                            // index,
                            // selectedColor: Colors.blue,
                            onSelected: (value) {
                              setState(() {
                                defaultChoiceIndex =
                                    value ? index : defaultChoiceIndex;
                              });
                            },
                            // onSelected: (value) {
                            //   switch (index) {
                            //     case 0:
                            //       cryptoProvider.getTopMarketCapData();
                            //       break;
                            //     case 1:
                            //       cryptoProvider.getTopGainersData();
                            //       break;
                            //     case 2:
                            //       cryptoProvider.getTopLosersData();
                            //       break;
                            //   }
                            // },
                          );
                        }),
                      ),
                    ),
                    //     ;
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
