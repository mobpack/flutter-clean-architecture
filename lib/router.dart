import 'package:flutter_clean_architecture/features/receipt/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/features/receipt/presentation/detail/receipt_detail.dart';
import 'package:flutter_clean_architecture/features/receipt/presentation/list/receipt_list_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ReceiptListPage(),
      routes: [
        GoRoute(
          path: 'detail/:id',
          redirect: (context, state) {
            if (state.extra is Receipt) {
              return null;
            } else {
              return '/';
            }
          },
          builder: (context, state) {
            final receipt = state.extra as Receipt;
            return ReceiptDetailPage(
              receipt: receipt,
            );
          },
        ),
      ],
    ),
  ],
);
