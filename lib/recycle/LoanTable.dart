import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moneycollection/modules/Deposit/DepositForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class LoanTable extends StatefulWidget {
  @override
  _LoanTableState createState() => _LoanTableState();
}

class _LoanTableState extends State<LoanTable> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
      builder: (context, provider, _) {
        var depositAccounts = provider.depositAccounts;
      return Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                 border: TableBorder.lerp(
      TableBorder.all( color: Colors.black,width: 3), // First border
      TableBorder.all(color: Colors.grey, width: 0.1), // Second border
      1, // Interpolation value
        ),
      
                children: [
                  TableRow(
                    children: [
                      TitleCell(
                        label: 'Account no.',
                      ),
                      TitleCell(
                        label: 'Account Type',
                      ),
                      TitleCell(
                        label: 'Client ID',
                      ),
                      TitleCell(
                        label: 'Full Name',
                      ),
                      TitleCell(
                        label: 'Mobile no.',
                      ),
                      
                    ],
                  ),
                  ..._filteredRows.map((row) => _buildDataRow(row, provider)).toList(),
                ],
              ),
            ),
          ),
        ],
      );
    
  }
    

    );
  }

  List<Map<String, String>> _data = [
    {
      'Account no.': 'KTM002-001-11-0000031',
      'Account Type': 'SHARE DEPOSIT (CURRENT DEPOSIT)',
      'Client ID': 'KTM002-0000013',
      'Full Name': 'Pragya Maharjan',
      'Mobile no.': '1234564',
    },
    {
      'Account no.': 'KTM002-001-11-0000035',
      'Account Type': 'SHARE DEPOSIT (CURRENT DEPOSIT)',
      'Client ID': 'KTM002-0000013',
      'Full Name': 'terry Maharjan',
      'Mobile no.': '1234564',
    },
    {
      'Account no.': 'KTM002-001-11-0000036',
      'Account Type': 'SHARE DEPOSIT (CURRENT DEPOSIT)',
      'Client ID': 'KTM002-0000013',
      'Full Name': 'nick Maharjan',
      'Mobile no.': '1234564',
    },
    {
      'Account no.': 'KTM002-001-11-0000034',
      'Account Type': 'SHARE DEPOSIT (CURRENT DEPOSIT)',
      'Client ID': 'KTM002-0000013',
      'Full Name': 'nickss Maharjan',
      'Mobile no.': '1234564',
    },
    // Add more data...
  ];

  List<Map<String, String>> get _filteredRows {
    if (_searchQuery.isEmpty) {
      return _data;
    } else {
      return _data.where((row) {
        return row.values
            .any((value) => value.toLowerCase().contains(_searchQuery));
      }).toList();
    }
  }
TableRow _buildDataRow(Map<String, String> row, DepositAccountsProvider provider) {
  return TableRow(
    children: [
      TableCell(
        child: GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DepositForm(datas: row),
            //   ),
            // );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("${provider.depositAccountsFilteredByDeposit.isNotEmpty ? provider.depositAccounts.first.aCCOUNT ?? "" : ""}",

            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("${provider.depositAccountsFilteredByDeposit.isNotEmpty ? provider.depositAccounts.first.dEPOSITTYPE ?? "" : ""}",
        
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: 
          Text("${provider.depositAccountsFilteredByDeposit.isNotEmpty ? provider.depositAccounts.first.cUSTID ?? "" : ""}",
     
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: 
          
          Text("${provider.depositAccountsFilteredByDeposit.isNotEmpty ? provider.depositAccounts.first.cUSTOMERNAME ?? "" : ""}",
       
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: 
          Text("${provider.depositAccountsFilteredByDeposit.isNotEmpty ? provider.depositAccounts.first.mOBILE ?? "" : ""}",
          
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
),
        ),
      ),
    ],
  );
}

}

class TitleCell extends StatelessWidget {
  final String label;
  const TitleCell({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}