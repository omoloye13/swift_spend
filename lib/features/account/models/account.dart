

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

part 'account.freezed.dart';
@freezed
class Account with _$Account {
  const factory Account({
    required String accountNumber,
    required String name,
    required String piggyPoints,

  }) = _Account;
}