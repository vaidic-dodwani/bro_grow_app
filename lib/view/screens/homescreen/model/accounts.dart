class Accounts {
  final List<Account>? accounts;

  Accounts({
    this.accounts,
  });

  Accounts copyWith({
    List<Account>? accounts,
  }) =>
      Accounts(
        accounts: accounts ?? this.accounts,
      );

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"]!.map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
      };
}

class Account {
  final Profile? profile;
  final Summary? summary;
  final List<Transaction>? transactions;

  Account({
    this.profile,
    this.summary,
    this.transactions,
  });

  Account copyWith({
    Profile? profile,
    Summary? summary,
    List<Transaction>? transactions,
  }) =>
      Account(
        profile: profile ?? this.profile,
        summary: summary ?? this.summary,
        transactions: transactions ?? this.transactions,
      );

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        summary:
            json["summary"] == null ? null : Summary.fromJson(json["summary"]),
        transactions: json["transactions"] == null
            ? []
            : List<Transaction>.from(
                json["transactions"]!.map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "summary": summary?.toJson(),
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Profile {
  final AccountClass? account;
  final Holders? holders;

  Profile({
    this.account,
    this.holders,
  });

  Profile copyWith({
    AccountClass? account,
    Holders? holders,
  }) =>
      Profile(
        account: account ?? this.account,
        holders: holders ?? this.holders,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        account: json["Account"] == null
            ? null
            : AccountClass.fromJson(json["Account"]),
        holders:
            json["Holders"] == null ? null : Holders.fromJson(json["Holders"]),
      );

  Map<String, dynamic> toJson() => {
        "Account": account?.toJson(),
        "Holders": holders?.toJson(),
      };
}

class AccountClass {
  final String? number;
  final String? acctype;
  final String? fitype;

  AccountClass({
    this.number,
    this.acctype,
    this.fitype,
  });

  AccountClass copyWith({
    String? number,
    String? acctype,
    String? fitype,
  }) =>
      AccountClass(
        number: number ?? this.number,
        acctype: acctype ?? this.acctype,
        fitype: fitype ?? this.fitype,
      );

  factory AccountClass.fromJson(Map<String, dynamic> json) => AccountClass(
        number: json["number"],
        acctype: json["acctype"],
        fitype: json["fitype"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "acctype": acctype,
        "fitype": fitype,
      };
}

class Holders {
  final List<Holder>? holder;
  final String? type;

  Holders({
    this.holder,
    this.type,
  });

  Holders copyWith({
    List<Holder>? holder,
    String? type,
  }) =>
      Holders(
        holder: holder ?? this.holder,
        type: type ?? this.type,
      );

  factory Holders.fromJson(Map<String, dynamic> json) => Holders(
        holder: json["Holder"] == null
            ? []
            : List<Holder>.from(json["Holder"]!.map((x) => Holder.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "Holder": holder == null
            ? []
            : List<dynamic>.from(holder!.map((x) => x.toJson())),
        "type": type,
      };
}

class Holder {
  final String? name;
  final String? dob;
  final String? mobile;
  final String? nominee;
  final String? landline;
  final String? address;
  final String? email;
  final String? pan;
  final String? ckycCompliance;

  Holder({
    this.name,
    this.dob,
    this.mobile,
    this.nominee,
    this.landline,
    this.address,
    this.email,
    this.pan,
    this.ckycCompliance,
  });

  Holder copyWith({
    String? name,
    String? dob,
    String? mobile,
    String? nominee,
    String? landline,
    String? address,
    String? email,
    String? pan,
    String? ckycCompliance,
  }) =>
      Holder(
        name: name ?? this.name,
        dob: dob ?? this.dob,
        mobile: mobile ?? this.mobile,
        nominee: nominee ?? this.nominee,
        landline: landline ?? this.landline,
        address: address ?? this.address,
        email: email ?? this.email,
        pan: pan ?? this.pan,
        ckycCompliance: ckycCompliance ?? this.ckycCompliance,
      );

  factory Holder.fromJson(Map<String, dynamic> json) => Holder(
        name: json["name"],
        dob: json["Dob"],
        mobile: json["mobile"],
        nominee: json["Nominee"],
        landline: json["landline"],
        address: json["address"],
        email: json["email"],
        pan: json["PAN"],
        ckycCompliance: json["ckycCompliance"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Dob": dob,
        "mobile": mobile,
        "Nominee": nominee,
        "landline": landline,
        "address": address,
        "email": email,
        "PAN": pan,
        "ckycCompliance": ckycCompliance,
      };
}

class Summary {
  final String? currentBalance;
  final String? currency;
  final String? exchangeRate;
  final DateTime? balanceDateTime;
  final String? type;
  final String? branch;
  final String? facility;
  final String? ifsc;
  final String? micrCode;
  final DateTime? openingDate;
  final String? currentOdLimit;
  final String? drawingLimt;
  final String? status;
  final Pending? pending;
  final String? accountType;
  final String? maturityAmount;
  final DateTime? maturityDate;
  final String? description;
  final String? interestPayout;
  final String? interestRate;
  final String? principalAmount;
  final String? tenureDays;
  final String? tenureMonths;
  final String? tenureYears;
  final String? interestComputation;
  final String? compoundingFrequency;
  final String? interestPeriodicPayoutAmount;
  final String? interestOnMaturity;
  final String? currentValue;
  final String? recurringAmount;
  final String? recurringDepositDay;

  Summary({
    this.currentBalance,
    this.currency,
    this.exchangeRate,
    this.balanceDateTime,
    this.type,
    this.branch,
    this.facility,
    this.ifsc,
    this.micrCode,
    this.openingDate,
    this.currentOdLimit,
    this.drawingLimt,
    this.status,
    this.pending,
    this.accountType,
    this.maturityAmount,
    this.maturityDate,
    this.description,
    this.interestPayout,
    this.interestRate,
    this.principalAmount,
    this.tenureDays,
    this.tenureMonths,
    this.tenureYears,
    this.interestComputation,
    this.compoundingFrequency,
    this.interestPeriodicPayoutAmount,
    this.interestOnMaturity,
    this.currentValue,
    this.recurringAmount,
    this.recurringDepositDay,
  });

  Summary copyWith({
    String? currentBalance,
    String? currency,
    String? exchangeRate,
    DateTime? balanceDateTime,
    String? type,
    String? branch,
    String? facility,
    String? ifsc,
    String? micrCode,
    DateTime? openingDate,
    String? currentOdLimit,
    String? drawingLimt,
    String? status,
    Pending? pending,
    String? accountType,
    String? maturityAmount,
    DateTime? maturityDate,
    String? description,
    String? interestPayout,
    String? interestRate,
    String? principalAmount,
    String? tenureDays,
    String? tenureMonths,
    String? tenureYears,
    String? interestComputation,
    String? compoundingFrequency,
    String? interestPeriodicPayoutAmount,
    String? interestOnMaturity,
    String? currentValue,
    String? recurringAmount,
    String? recurringDepositDay,
  }) =>
      Summary(
        currentBalance: currentBalance ?? this.currentBalance,
        currency: currency ?? this.currency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        balanceDateTime: balanceDateTime ?? this.balanceDateTime,
        type: type ?? this.type,
        branch: branch ?? this.branch,
        facility: facility ?? this.facility,
        ifsc: ifsc ?? this.ifsc,
        micrCode: micrCode ?? this.micrCode,
        openingDate: openingDate ?? this.openingDate,
        currentOdLimit: currentOdLimit ?? this.currentOdLimit,
        drawingLimt: drawingLimt ?? this.drawingLimt,
        status: status ?? this.status,
        pending: pending ?? this.pending,
        accountType: accountType ?? this.accountType,
        maturityAmount: maturityAmount ?? this.maturityAmount,
        maturityDate: maturityDate ?? this.maturityDate,
        description: description ?? this.description,
        interestPayout: interestPayout ?? this.interestPayout,
        interestRate: interestRate ?? this.interestRate,
        principalAmount: principalAmount ?? this.principalAmount,
        tenureDays: tenureDays ?? this.tenureDays,
        tenureMonths: tenureMonths ?? this.tenureMonths,
        tenureYears: tenureYears ?? this.tenureYears,
        interestComputation: interestComputation ?? this.interestComputation,
        compoundingFrequency: compoundingFrequency ?? this.compoundingFrequency,
        interestPeriodicPayoutAmount:
            interestPeriodicPayoutAmount ?? this.interestPeriodicPayoutAmount,
        interestOnMaturity: interestOnMaturity ?? this.interestOnMaturity,
        currentValue: currentValue ?? this.currentValue,
        recurringAmount: recurringAmount ?? this.recurringAmount,
        recurringDepositDay: recurringDepositDay ?? this.recurringDepositDay,
      );

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        currentBalance: json["CurrentBalance"],
        currency: json["Currency"],
        exchangeRate: json["ExchangeRate"],
        balanceDateTime: json["balanceDateTime"] == null
            ? null
            : DateTime.parse(json["balanceDateTime"]),
        type: json["Type"],
        branch: json["branch"],
        facility: json["Facility"],
        ifsc: json["ifsc"],
        micrCode: json["micrCode"],
        openingDate: json["openingDate"] == null
            ? null
            : DateTime.parse(json["openingDate"]),
        currentOdLimit: json["CurrentODLimit"],
        drawingLimt: json["DrawingLimt"],
        status: json["Status"],
        pending:
            json["Pending"] == null ? null : Pending.fromJson(json["Pending"]),
        accountType: json["AccountType"],
        maturityAmount: json["maturityAmount"],
        maturityDate: json["maturityDate"] == null
            ? null
            : DateTime.parse(json["maturityDate"]),
        description: json["description"],
        interestPayout: json["interestPayout"],
        interestRate: json["interestRate"],
        principalAmount: json["principalAmount"],
        tenureDays: json["tenureDays"],
        tenureMonths: json["tenureMonths"],
        tenureYears: json["tenureYears"],
        interestComputation: json["interestComputation"],
        compoundingFrequency: json["compoundingFrequency"],
        interestPeriodicPayoutAmount: json["interestPeriodicPayoutAmount"],
        interestOnMaturity: json["interestOnMaturity"],
        currentValue: json["currentValue"],
        recurringAmount: json["recurringAmount"],
        recurringDepositDay: json["recurringDepositDay"],
      );

  Map<String, dynamic> toJson() => {
        "CurrentBalance": currentBalance,
        "Currency": currency,
        "ExchangeRate": exchangeRate,
        "balanceDateTime": balanceDateTime?.toIso8601String(),
        "Type": type,
        "branch": branch,
        "Facility": facility,
        "ifsc": ifsc,
        "micrCode": micrCode,
        "openingDate":
            "${openingDate!.year.toString().padLeft(4, '0')}-${openingDate!.month.toString().padLeft(2, '0')}-${openingDate!.day.toString().padLeft(2, '0')}",
        "CurrentODLimit": currentOdLimit,
        "DrawingLimt": drawingLimt,
        "Status": status,
        "Pending": pending?.toJson(),
        "AccountType": accountType,
        "maturityAmount": maturityAmount,
        "maturityDate":
            "${maturityDate!.year.toString().padLeft(4, '0')}-${maturityDate!.month.toString().padLeft(2, '0')}-${maturityDate!.day.toString().padLeft(2, '0')}",
        "description": description,
        "interestPayout": interestPayout,
        "interestRate": interestRate,
        "principalAmount": principalAmount,
        "tenureDays": tenureDays,
        "tenureMonths": tenureMonths,
        "tenureYears": tenureYears,
        "interestComputation": interestComputation,
        "compoundingFrequency": compoundingFrequency,
        "interestPeriodicPayoutAmount": interestPeriodicPayoutAmount,
        "interestOnMaturity": interestOnMaturity,
        "currentValue": currentValue,
        "recurringAmount": recurringAmount,
        "recurringDepositDay": recurringDepositDay,
      };
}

class Pending {
  final String? transactionType;
  final String? amount;

  Pending({
    this.transactionType,
    this.amount,
  });

  Pending copyWith({
    String? transactionType,
    String? amount,
  }) =>
      Pending(
        transactionType: transactionType ?? this.transactionType,
        amount: amount ?? this.amount,
      );

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
        transactionType: json["TransactionType"],
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "TransactionType": transactionType,
        "Amount": amount,
      };
}

class Transaction {
  final String? type;
  final String? mode;
  final String? amount;
  final String? currentBalance;
  final DateTime? transactionTimestamp;
  final dynamic valueDate;
  final String? txnid;
  final String? narration;
  final String? reference;
  final String? balance;
  final DateTime? transactiontimestamp;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? transactionDatetime;
  final DateTime? transactionsStartDate;
  final DateTime? transactionsEndDate;

  Transaction({
    this.type,
    this.mode,
    this.amount,
    this.currentBalance,
    this.transactionTimestamp,
    this.valueDate,
    this.txnid,
    this.narration,
    this.reference,
    this.balance,
    this.transactiontimestamp,
    this.startDate,
    this.endDate,
    this.transactionDatetime,
    this.transactionsStartDate,
    this.transactionsEndDate,
  });

  Transaction copyWith({
    String? type,
    String? mode,
    String? amount,
    String? currentBalance,
    DateTime? transactionTimestamp,
    dynamic valueDate,
    String? txnid,
    String? narration,
    String? reference,
    String? balance,
    DateTime? transactiontimestamp,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? transactionDatetime,
    DateTime? transactionsStartDate,
    DateTime? transactionsEndDate,
  }) =>
      Transaction(
        type: type ?? this.type,
        mode: mode ?? this.mode,
        amount: amount ?? this.amount,
        currentBalance: currentBalance ?? this.currentBalance,
        transactionTimestamp: transactionTimestamp ?? this.transactionTimestamp,
        valueDate: valueDate ?? this.valueDate,
        txnid: txnid ?? this.txnid,
        narration: narration ?? this.narration,
        reference: reference ?? this.reference,
        balance: balance ?? this.balance,
        transactiontimestamp: transactiontimestamp ?? this.transactiontimestamp,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        transactionDatetime: transactionDatetime ?? this.transactionDatetime,
        transactionsStartDate:
            transactionsStartDate ?? this.transactionsStartDate,
        transactionsEndDate: transactionsEndDate ?? this.transactionsEndDate,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        type: json["Type"],
        mode: json["Mode"]!,
        amount: json["Amount"],
        currentBalance: json["CurrentBalance"],
        transactionTimestamp: json["TransactionTimestamp"] == null
            ? null
            : DateTime.parse(json["TransactionTimestamp"]),
        valueDate: json["valueDate"],
        txnid: json["Txnid"],
        narration: json["Narration"],
        reference: json["Reference"],
        balance: json["Balance"],
        transactiontimestamp: json["Transactiontimestamp"] == null
            ? null
            : DateTime.parse(json["Transactiontimestamp"]),
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        transactionDatetime: json["TransactionDatetime"] == null
            ? null
            : DateTime.parse(json["TransactionDatetime"]),
        transactionsStartDate: json["TransactionsStartDate"] == null
            ? null
            : DateTime.parse(json["TransactionsStartDate"]),
        transactionsEndDate: json["TransactionsEndDate"] == null
            ? null
            : DateTime.parse(json["TransactionsEndDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Mode": mode,
        "Amount": amount,
        "CurrentBalance": currentBalance,
        "TransactionTimestamp": transactionTimestamp?.toIso8601String(),
        "valueDate": valueDate,
        "Txnid": txnid,
        "Narration": narration,
        "Reference": reference,
        "Balance": balance,
        "Transactiontimestamp": transactiontimestamp?.toIso8601String(),
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "TransactionDatetime": transactionDatetime?.toIso8601String(),
        "TransactionsStartDate":
            "${transactionsStartDate!.year.toString().padLeft(4, '0')}-${transactionsStartDate!.month.toString().padLeft(2, '0')}-${transactionsStartDate!.day.toString().padLeft(2, '0')}",
        "TransactionsEndDate":
            "${transactionsEndDate!.year.toString().padLeft(4, '0')}-${transactionsEndDate!.month.toString().padLeft(2, '0')}-${transactionsEndDate!.day.toString().padLeft(2, '0')}",
      };
}
