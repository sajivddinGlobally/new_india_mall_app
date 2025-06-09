import 'package:new_india_mall_app/core/network/api.state.dart';
import 'package:new_india_mall_app/core/utils/pretty.dio.dart';
import 'package:new_india_mall_app/data/model/categoryModel.dart';
import 'package:riverpod/riverpod.dart';

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final category = ApiStateNetwork(await createDio());
  return category.getCategory();
});
