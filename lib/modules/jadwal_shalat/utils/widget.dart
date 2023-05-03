import 'package:flutter/material.dart';
import 'package:quran_app/theme/theme.dart';

class JadwalShalatWidget extends StatelessWidget {
  const JadwalShalatWidget({
    Key? key,
    required this.jadwal,
    required this.jadwalShalatC,
  }) : super(key: key);

  final String jadwal;
  final String jadwalShalatC;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          jadwal,
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        Text(
          jadwalShalatC,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
