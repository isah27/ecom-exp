import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:svg_image/svg_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_exp/config/app_configs.dart';
import 'package:ecom_exp/features/product/data/repo/repo_impl.dart';
import 'package:ecom_exp/features/cart/data/repo/cart_repository.dart';
import 'package:ecom_exp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecom_exp/features/product/presentation/cubit/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SvgImageConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit(ProductRepoImpl())),
        BlocProvider(create: (_) => CartCubit(CartRepository())),
      ],
      child: MaterialApp.router(
        title: 'AlphaTwelve',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        routerConfig: RouteConfig.routerConfig,
        scrollBehavior: CustomScrollBehavior(),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => super.dragDevices.union({
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
  });
}
