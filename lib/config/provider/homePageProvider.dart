import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapp/models/userProfile.dart';

class ApiService {}

final userProfile = Provider<UserProfile>((ref) => UserProfile());

final eventResult = FutureProvider<String>((ref) async {
  return ref.watch(userProfile).eventProfile();
});
final credit_sms = FutureProvider<String>((ref) async {
  return ref.watch(userProfile).credit_sms();
});
final quantiteCredit = FutureProvider<String>((ref) async {
  return ref.watch(userProfile).quantiteCredit();
});
