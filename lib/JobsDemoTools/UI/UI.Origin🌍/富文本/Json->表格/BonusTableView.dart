import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/%E5%AF%8C%E6%96%87%E6%9C%AC/Json-%3E%E8%A1%A8%E6%A0%BC/BonusReward.dart';

class BonusTableView extends StatelessWidget {
  final BonusTable data;

  const BonusTableView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(data.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        const SizedBox(height: 8),
        Text(data.condition, style: const TextStyle(color: Colors.black87)),
        const SizedBox(height: 12),
        Table(
          border: TableBorder.all(color: Colors.black54),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.5),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text("活动要求",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text("总有效投注",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text("赠送彩金",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            ...data.rewards.map((r) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(data.condition, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(r.bets, textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(r.bonus, textAlign: TextAlign.center),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(height: 8),
        Text("示例：${data.example}",
            style: const TextStyle(color: Colors.black54)),
        Text("申请时间：${data.applyTime}",
            style: const TextStyle(color: Colors.black54)),
        const Divider(height: 32),
      ],
    );
  }
}
