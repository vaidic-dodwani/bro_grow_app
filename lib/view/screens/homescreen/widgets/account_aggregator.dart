import 'package:bro_grow_app/utils/routes/app_route_names.dart';
import 'package:bro_grow_app/view/screens/homescreen/model/accounts.dart';
import 'package:bro_grow_app/view/screens/homescreen/utils/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/app_typography.dart';

class AccountAggregator extends StatefulWidget {
  const AccountAggregator({super.key});

  @override
  State<AccountAggregator> createState() => _AccountAggregatorState();
}

class _AccountAggregatorState extends State<AccountAggregator> {
  late final Accounts _account;

  @override
  void initState() {
    _account = Accounts.fromJson(AccountsData.accountData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Accounts',
                style: AppTypography.f20w500,
              ),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: _account.accounts!.length,
                itemBuilder: (context, index) {
                  return AccountBox(account: _account.accounts![index]);
                },
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Add Account"),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Account Number",
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AccountBox extends StatelessWidget {
  const AccountBox({super.key, required this.account});
  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            "${account.profile!.account!.number} - ${account.profile!.account!.acctype}",
            style: AppTypography.f16w400,
          ),
          subtitle: Text(
            account.profile!.account!.fitype.toString(),
            style: AppTypography.f14w400,
          ),
          children: [
            if (account.summary!.currency != null &&
                account.summary!.currentBalance != null)
              ListTile(
                title: Text(
                  "Balance: ${"${account.summary!.currency} ${account.summary!.currentBalance}"}",
                  style: AppTypography.f16w400,
                ),
              ),
            ListTile(
              onTap: () {
                context.pushNamed(AppRouteNames.holderScreenRoute,
                    extra: {"holders": account.profile!.holders!.holder});
              },
              title: const Text(
                "View Holder and Details",
                style: AppTypography.f16w400,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            ListTile(
              onTap: () {
                context.pushNamed(AppRouteNames.transactionScreem,
                    extra: {"account": account});
              },
              title: const Text(
                "View Transactions",
                style: AppTypography.f16w400,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
