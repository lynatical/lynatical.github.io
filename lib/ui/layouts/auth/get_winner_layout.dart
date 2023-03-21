import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/ui/views/winner/get_winner_view.dart';
import 'package:rta_map_services/ui/views/winner/widgets/participants_list.dart';

import '../../../data/constants.dart';
import '../../../providers/giveaway_controller.dart';

class WinnerLayout extends StatelessWidget {
  const WinnerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GiveawayController>(
        create: (_) => GiveawayController(),
        lazy: false,
        child: Consumer<GiveawayController>(builder: (_, controller, __) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      colors: <Color>[
                    Color.fromARGB(255, 220, 235, 255),
                    Color.fromARGB(255, 238, 244, 255),
                  ],
                      center: Alignment.center,
                      tileMode: TileMode.repeated,
                      radius: 0.15)),
              child: SingleChildScrollView(
                child: Center(
                    child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FractionallySizedBox(
                        widthFactor: mobile(context) ? 1 : 0.4,
                        child: ParticipantsList(
                            participants: controller.participants)),
                    FractionallySizedBox(
                        widthFactor: mobile(context) ? 1 : 0.4,
                        child: const GetWinnerView())
                  ],
                )),
              ),
            ),
          );
        }));
  }

  BoxDecoration buildBoxDecoration(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
