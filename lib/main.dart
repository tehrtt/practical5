import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'cart_provider.dart';
import 'item.dart';

// TODO: STEP 5
final List<Item> catalog = [
  Item(1, 'Shoes'),
  Item(2, 'Hats'),
  Item(3, 'Shirts'),
  Item(4, 'Tie'),
  Item(5, 'Pants'),
  Item(6, 'Jeans'),
  Item(7, 'Shorts'),
  Item(8, 'Underwear'),
  Item(9, 'Jumpers'),
  Item(10, 'Trousers'),
  Item(11, 'Sleepwear'),
  Item(12, 'Accessories'),
  Item(13, 'Item 13'),
  Item(14, 'Item 14'),
  Item(15, 'Item 15'),
  Item(16, 'Item 16'),
  Item(17, 'Item 17'),
  Item(18, 'Item 18'),
  Item(19, 'Item 19'),
  Item(20, 'Item 20'),
];

void main() {
  runApp(
    // TODO: (A) ChangeNotifierProvider
    ChangeNotifierProvider(create: (context) => CartProvider(),
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'State Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: STEP 10
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          // TODO: (D) IconButton
          IconButton(
            onPressed: (){
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      // TODO: STEP 8
      body: Center(
        // TODO: (C) ListView.separated
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return CartItem(index: index);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: catalog.length,
        ),
      ),
    );
  }
}

// TODO: STEP 7
class CartItem extends StatelessWidget {
  final int index;

  const CartItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var item = catalog[index];
    return Row(
      children: [
        //TODO - Insert widgets for each row
        Text('$item'),
        const Expanded(child: SizedBox()),
        Consumer<CartProvider>(builder: (context, cart, child) {
          return TextButton(
              onPressed: () {
                cart.add(item);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item added to cart.'),
                  ),
                );
              },
              child: const Text('Add'));
        }),
      ],
    );
  }
}