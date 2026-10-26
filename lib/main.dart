import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/*
STATEFULWIDGET LIFECYCLE

When a page opens for the first time?
initState() بتشتغل وبعدها didChangeDependencies() وبعدها build() وممكن build() تشتغل تاني بعد كده

What happens after pressing the heart button?
setState() بتخلي build() تشتغل تاني لكن initState() و dispose() مش بيشتغلوا لمجرد إن العداد اتغير

What happens when a page is removed from the widget tree?
deactivate() بتشتغل وبعدها dispose() لما الـ State تتشال خالص لكن الصفحة القديمة ممكن تفضل موجودة تحت الصفحة الجديدة ومش بتتشال خالص إلا لما تتشال نهائيًا

What happens when you resize the browser window and why?
تغيير حجم المتصفح بيغيّر MediaQuery و didChangeDependencies() بتشتغل تاني وبعدها الصفحة بتعمل rebuild عشان تحدّث العرض والتصميم حسب الحجم الجديد

PART 2 NAVIGATOR VERSION

The equivalent Navigator code is preserved below as comments
كود Navigator القديم موجود كـ comments والنسخة الحالية بتستخدم go_router

go_router

Login -> Products
بنستخدم context.goNamed('products', ...)

Products -> Details
بنستخدم context.pushNamed('details', ...)

Details -> Products
بنستخدم context.pop() عشان نرجع للصفحة السابقة ومعانا نتيجة Add to Cart

SHORT ANSWERS

What is the difference between context.go and context.push?
go بتغيّر الوجهة الحالية أما push بتفتح صفحة جديدة فوق الصفحة الحالية

Why did we use go for Login -> Products and push for Products -> Details?
استخدمنا go للانتقال من Login إلى Products و push لفتح Details مع إمكانية الرجوع إلى Products

What is the difference between a path parameter and a query parameter?
Path Parameter بيكون جزء من مسار الـ URL زي /details/Laptop/1200

Query Parameter بييجي بعد علامة الاستفهام زي /products?user=Guest
*/
import 'details_page.dart';
import 'login_page.dart';
import 'products_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/products',
      builder: (context, state) {
        final username = (state.extra as String?) ?? "Guest";
        return ProductsPage(username: username);
      },
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        final name = (extra['name'] as String?) ?? 'Product';
        final price = (extra['price'] as int?) ?? 0;
        return DetailsPage(name: name, price: price);
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
//
// void main() {
//   runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//       '/': (context) => const LoginPage(),
//       '/products': (context) {
//         final username =
//             ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';
//         return ProductsPage(username: username);
//       },
//     },
//     onGenerateRoute: (settings) {
//       if (settings.name == '/details') {
//         final args = settings.arguments as Map<String, dynamic>;
//         return MaterialPageRoute(
//           builder: (_) => DetailsPage(
//             name: args['name'] as String,
//             price: (args['price'] as num).toDouble(),
//           ),
//         );
//       }
//       return null;
//     },
//   ));
// }
//
// LOGIN BUTTON (Navigator version):
// Navigator.pushNamed(context, '/products', arguments: 'Guest');
//
// PRODUCT TAP (Navigator version):
// final result = await Navigator.push<String>(
//   context,
//   MaterialPageRoute(
//     builder: (_) => DetailsPage(
//       name: product['name'] as String,
//       price: (product['price'] as num).toDouble(),
//     ),
//   ),
// );
// if (!mounted) return;
// if (result != null) setState(() => _cartMessage = result);
//
// DETAILS ADD TO CART (Navigator version):
// Navigator.pop(context, '$name added to cart');
//

