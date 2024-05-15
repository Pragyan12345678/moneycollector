import 'package:flutter/material.dart';
import 'package:moneycollection/constant/colors.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isContentVisible = false;

  void toggleContentVisibility() {
    setState(() {
      isContentVisible = !isContentVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: AppColors.greyColor,
                child: Column(
                  children: [
                    DashboardAppBAr(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        color: AppColors.greyColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Collected Balance",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        isContentVisible
                                            ? FirstContent()
                                            : SecondContent(),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(isContentVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: toggleContentVisibility,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Dashboardbalance(
                                  iconData: Icons.abc,
                                  text: "Deposit",
                                ),
                                Dashboardbalance(
                                  iconData: Icons.send,
                                  text: "Send",
                                ),
                                Dashboardbalance(
                                  iconData: Icons.history,
                                  text: "History",
                                ),
                                Dashboardbalance(
                                  iconData: Icons.history,
                                  text: "more",
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Recent Transactions",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Recent Transactions",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "NPR. 70000",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Expanded(flex: 1, child: Icon(Icons.more)),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboardbalance extends StatelessWidget {
  final IconData iconData;
  final String text;
  const Dashboardbalance({
    required this.iconData,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  iconData,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              )),
          SizedBox(
            height: 2,
          ),
          Text(
            '${text}',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.primaryColor,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class DashboardAppBAr extends StatelessWidget {
  const DashboardAppBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.blue)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Welcome,",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Pragyan Maharjan",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(Icons.person, size: 30, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class FirstContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: Text(
        "Rs.10,000",
        style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}

class SecondContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: Text(
        "Rs.xxxxx",
        style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
