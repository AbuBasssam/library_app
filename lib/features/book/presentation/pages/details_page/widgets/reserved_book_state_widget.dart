import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserved_ready_status_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserved_waiting_status_card.dart';

class ReservedBookStateWidget extends StatelessWidget {
  final ReservedBookStatus stateData;
  final VoidCallback onCancelReservation;
  final VoidCallback onWishlistPressed;

  const ReservedBookStateWidget({
    super.key,
    required this.stateData,
    required this.onCancelReservation,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return stateData.isReady
        ? ReservedReadyStatusCard(
            stateData: stateData,
            onCancelReservation: onCancelReservation,
            onWishlistPressed: onWishlistPressed,
          )
        : ReservedWaitingStatusCard(
            stateData: stateData,
            onCancelReservation: onCancelReservation,
            onWishlistPressed: onWishlistPressed,
          );
  }
}
