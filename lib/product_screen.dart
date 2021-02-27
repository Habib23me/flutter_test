import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/product/bloc/products_bloc.dart';
import 'package:flutter_exam/product/product_model.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (_, state) {
          if (state is ProductsInitialState) {
            BlocProvider.of<ProductsBloc>(context).add(LoadProducts());
          }
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductError) {
            return Center(
                child: FlatButton(
              onPressed: () =>
                  BlocProvider.of<ProductsBloc>(context).add(LoadProducts()),
              child: Text("${state.error}"),
            ));
          }
          if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) => ProductTile(
                product: state.products[index],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        height: 100,
        width: 100,
      ),
      title: Text("${product.title}"),
      subtitle: Text("${product.price}"),
    );
  }
}
