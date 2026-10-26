import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_catalog_lib/main.dart';

void main() {
  testWidgets('Full flow navigation and interaction test', (
    WidgetTester tester,
  ) async {
    // 1. Render MyApp
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify LoginPage is shown
    expect(find.text('Mini Catalog'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // 2. Tap Login button to navigate to ProductsPage
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify ProductsPage is shown
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Welcome, Guest'), findsOneWidget);
    expect(find.text('Favorites: 0'), findsOneWidget);
    expect(find.text('Laptop'), findsOneWidget);

    // 3. Test favorite button tap (IconButton on ProductTile)
    final favoriteButton = find
        .widgetWithIcon(IconButton, Icons.favorite)
        .first;
    await tester.tap(favoriteButton);
    await tester.pumpAndSettle();

    // Favorites counter should increment to 1
    expect(find.text('Favorites: 1'), findsOneWidget);

    // 4. Tap product tile 'Laptop' to navigate to DetailsPage
    await tester.tap(find.text('Laptop'));
    await tester.pumpAndSettle();

    // Verify DetailsPage is shown
    expect(find.text('Details'), findsOneWidget);
    expect(find.text('\$1200'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);

    // 5. Tap Add to Cart
    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    // Should return to ProductsPage and show cart banner
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Laptop added to cart'), findsOneWidget);
  });
}
