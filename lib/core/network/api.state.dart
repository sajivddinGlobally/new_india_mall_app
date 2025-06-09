import 'package:dio/dio.dart';
import 'package:new_india_mall_app/data/model/addressModel.dart';
import 'package:new_india_mall_app/data/model/cartModel.dart';
import 'package:new_india_mall_app/data/model/categoryModel.dart';
import 'package:new_india_mall_app/data/model/getAllproductsModel.dart';
import 'package:new_india_mall_app/data/model/getOrderByIdModel.dart';
import 'package:new_india_mall_app/data/model/orderModel.dart';
import 'package:new_india_mall_app/data/model/particularProductModel.dart';
import 'package:new_india_mall_app/data/model/productByCategoryModel.dart';
import 'package:retrofit/retrofit.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class ApiStateNetwork {
  factory ApiStateNetwork(Dio dio, {String baseUrl}) = _ApiStateNetwork;

  @GET('/indiamall/v1/products')
  Future<List<GetAllProductsModel>> allProducts();

  @GET('/indiamall/v1/products/{id}')
  Future<ParticularProductModel> particularProduct(@Path() String id);

  @GET('/indiamall/v1/categories')
  Future<List<CategoryModel>> getCategory();

  @GET('/custom-api/v1/products-by-category/?category_id={id}')
  Future<List<ProductsByCategory>> fetchProductByCateg(@Path() String id);

  @GET(
    '/indiamall/v1/cart?cart_key=guest_cart_36f06e463515da1cf0361a70e66c28e3',
  )
  Future<CartModel> cart();

  @GET('/indiamall/v1/orders')
  Future<OrderModel> order();

  @GET('/indiamall/v1/address')
  Future<AddressModel> fetchAddress();

  @GET('/indiamall/v1/orders/?order_id={id}')
  Future<GetOrderById> orderById(@Path() String id);
}
