import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/getOrderByIdModel.dart';
import 'package:riverpod/riverpod.dart';

final getOrderByIdProvider = FutureProvider.family<GetOrderById, String>((
  ref,
  id,
) async {
  final getOrderbyid = ApiStateNetwork(await createDio());
  return getOrderbyid.orderById(id);
});
