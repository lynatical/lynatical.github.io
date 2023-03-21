import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/ui/views/winner/get_winner_views/find_winner.dart';
import 'package:rta_map_services/ui/views/winner/get_winner_views/loading_winner.dart';
import '../../../providers/giveaway_controller.dart';

class GetWinnerView extends StatelessWidget {
  const GetWinnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giveawayController = Provider.of<GiveawayController>(context);

    return giveawayController.startSearch == false
        ? const FindWinnerView()
        : const LoadWinnerView();
  }
}
