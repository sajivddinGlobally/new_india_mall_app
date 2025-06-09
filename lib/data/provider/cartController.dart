import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/cartModel.dart';
import 'package:riverpod/riverpod.dart';

final cartProvider = FutureProvider<CartModel>((ref) async {
  final cart = ApiStateNetwork(await createDio());
  return cart.cart();
});
