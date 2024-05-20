// import 'package:flutter/material.dart';
// import 'package:moneycollection/Model/DepositAccounts.dart';

// class DepositAccountsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Deposit Accounts'),
//       ),
//       body: FutureBuilder<List<DepositAccounts>>(
//         future: Accounts().fetchAddresses(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             List<DepositAccounts> depositAccounts = snapshot.data!;
//             return ListView.builder(
//               itemCount: depositAccounts.length,
//               itemBuilder: (context, index) {
//                 DepositAccounts account = depositAccounts[index];
//                 return ListTile(
//                   title: Text(account.cUSTOMERNAME ?? 'N/A'),
//                   subtitle: Text('Account: ${account.aCCOUNT ?? 'N/A'}'),
//                   // Add more details to display if needed
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }