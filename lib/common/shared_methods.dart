import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasar_sayur/common/app_colors.dart';

NumberFormat currencyFormatter = NumberFormat.currency(
  locale: 'id',
  symbol: 'Rp ',
  decimalDigits: 0,
);

String timeFormatter(DateTime dateTime) {
  final now = DateTime.now();

  if (DateFormat('dd/M/yyyy').format(dateTime) ==
      DateFormat('dd/M/yyyy').format(now)) {
    return DateFormat('HH:mm').format(dateTime);
  }

  if (dateTime.day == now.day - 1) {
    return 'Yesterday';
  }

  return DateFormat('dd/M/yyyy').format(dateTime);
}

Row buildRating(int rate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 1; i <= 5; i++)
        Container(
          margin: i < 5
              ? const EdgeInsets.only(
                  right: 2,
                )
              : null,
          child: Image.asset(
            'assets/ic_star_filled.png',
            width: 12,
            height: 12,
            color: i <= rate ? AppColor.yellowAccent : AppColor.gray60,
          ),
        ),
    ],
  );
}
