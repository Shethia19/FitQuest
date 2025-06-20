import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:fitness/common/colo_extension.dart';
import '../common/common.dart'; // Ensure this contains getStringDateToOtherFormate()

class TodaySleepScheduleRow extends StatefulWidget {
  final Map sObj;

  const TodaySleepScheduleRow({super.key, required this.sObj});

  @override
  State<TodaySleepScheduleRow> createState() => _TodaySleepScheduleRowState();
}

class _TodaySleepScheduleRowState extends State<TodaySleepScheduleRow> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    final imagePath = widget.sObj["image"]?.toString() ?? "";
    final name = widget.sObj["name"]?.toString() ?? "Unknown";
    final time = widget.sObj["time"]?.toString() ?? "";
    final duration = widget.sObj["duration"]?.toString() ?? "-";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: TColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath.isNotEmpty ? imagePath : "assets/img/default.png",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name, ${getStringDateToOtherFormate(time) ?? ''}",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  duration,
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Image.asset("assets/img/More_V.png", width: 20, height: 20),
                onPressed: () {
                  // Handle more action
                },
              ),
              Transform.scale(
                scale: 0.7,
                child: GestureDetector(
                  onTap: () => setState(() => positive = !positive),
                  child: CustomAnimatedToggleSwitch<bool>(
                    current: positive,
                    values: [false, true],
                    indicatorSize: const Size.square(30.0),
                    animationDuration: const Duration(milliseconds: 200),
                    animationCurve: Curves.linear,
                    onChanged: (b) => setState(() => positive = b),
                    iconBuilder: (context, local, global) => const SizedBox(),
                    iconsTappable: false,
                    wrapperBuilder: (context, global, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 10.0,
                            right: 10.0,
                            height: 30.0,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: TColor.secondaryG),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          child ?? const SizedBox(),
                        ],
                      );
                    },
                    foregroundIndicatorBuilder: (context, global) {
                      return SizedBox.fromSize(
                        size: const Size(10, 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0.05,
                                blurRadius: 1.1,
                                offset: Offset(0.0, 0.8),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

