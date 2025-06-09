import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/addressModel.dart';

final addressProvider = FutureProvider<AddressModel>((ref) async {
  final addresslist = ApiStateNetwork(await createDio());
  return addresslist.fetchAddress();
});
