import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/provider/controller/RecentTransaction_state.dart';
import 'package:provider/provider.dart';
 // Import your TransactionProvider file

class TransactionRecent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
 Consumer<TransactionProvider>(
        builder: (context, transactionProvider, _) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4 ,
            // transactionProvider.transactions.length,
            itemBuilder: (context, index) {
              Map<String, String> transaction = transactionProvider.transactions[index];
              return 
              
              Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                  ),
                                  
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0, left: 10,right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 12,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      0.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text( transaction['title'] ?? ''
                                                        ,
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: AppColors.primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        transaction['transfer'] ?? '',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                           color: AppColors.primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                       'May 17, 2024',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  transaction['amount'] ?? '',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(
                                                    AppImages.more,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Divider(
                                              color: Colors.grey, thickness: 1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Repeat similar structure for other items
                                ],
                              ),
                            );
              
              
              
              
              
            
            },
          );
        },
      );
    
  }
}
