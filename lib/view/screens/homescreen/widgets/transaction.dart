import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/accounts.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Transactions'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (account.summary!.currency != null &&
                  account.summary!.currentBalance != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Color(0xFF08ADFF),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Total Balance',
                            style: AppTypography.f18w500
                                .copyWith(color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            '${account.summary!.currency ?? ""} ${account.summary!.currentBalance ?? ""}',
                            style: AppTypography.f18w500
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Current Account: ${account.profile!.account!.number ?? ""}',
                        style:
                            AppTypography.f18w500.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 15),
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: account.transactions!.length,
                  itemBuilder: (context, index) {
                    return TransactionTile(
                      transaction: account.transactions![index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          transaction.narration.toString(),
          style: AppTypography.f14w400,
        ),
        subtitle: transaction.transactionTimestamp != null
            ? Text(
                DateFormat.MMMMd().format(transaction.transactionTimestamp!),
                style: AppTypography.f12w400,
              )
            : const SizedBox.shrink(),
        trailing: Text(
          "${transaction.type == "CREDIT" ? "+" : "-"} ${transaction.amount}",
          style: AppTypography.f14w500.copyWith(
              color: transaction.type == "CREDIT"
                  ? AppColors.successColor
                  : AppColors.errorColor),
        ),
      ),
    );
  }
}
