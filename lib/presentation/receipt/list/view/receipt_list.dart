import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/presentation/receipt/list/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReceiptList extends ConsumerWidget {
  const ReceiptList({super.key});

  static const _gap = SizedBox(height: 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final receiptList = ref.watch(receiptListProvider);

    return RefreshIndicator(
      onRefresh: () => ref.refresh(receiptListProvider.future),
      child: receiptList.when(
        error: (err, stack) => Center(child: Text('Error $err')),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (receipts) {
          return _buildListReceipt(receipts, theme);
        },
      ),
    );
  }

  Widget _buildListReceipt(List<Receipt> receipts, ThemeData theme) {
    return SafeArea(
      bottom: false,
      child: ListView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: receipts.length,
          itemBuilder: (context, index) {
            final Receipt receipt = receipts[index];

            return _buildReceiptCard(receipt, theme, context);
          }),
    );
  }

  Card _buildReceiptCard(
      Receipt receipt, ThemeData theme, BuildContext context) {
    final labelLarge = theme.textTheme.labelLarge;

    return Card(
      child: ListTile(
        onTap: () {
          context.go("/detail/${receipt.id}", extra: receipt);
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (receipt.thumb != null)
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedImage(
                    url: receipt.thumb!,
                  ),
                ),
              ),
            _gap,
            Text(receipt.name ?? ''),
          ],
        ),
        titleTextStyle: theme.textTheme.headlineSmall,
        subtitleTextStyle: labelLarge,
        subtitle: Text(
          "${receipt.headline}",
          style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
      fit: BoxFit.cover,
    );
  }
}
