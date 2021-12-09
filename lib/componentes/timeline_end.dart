import 'package:flutter/widgets.dart';

class TimelineEnd extends StatelessWidget {
  const TimelineEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Isso é tudo!",
          style: TextStyle(
            color: Color(0xFF1B569C),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Esses são seus eventos principais, para ver mais acesse o seu calendário na barra inferior",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1B569C),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
