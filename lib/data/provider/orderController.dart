import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/orderModel.dart';
import 'package:riverpod/riverpod.dart';

final orderProvider = FutureProvider<OrderModel>((ref) async {
  final order = ApiStateNetwork(await createDio());
  return order.order();
});
