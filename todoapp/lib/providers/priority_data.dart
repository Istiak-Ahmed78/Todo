import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/models/priority.dart';
import 'dart:collection';

import 'package:todoapp/components/models/task.dart';

class PriorityData extends ChangeNotifier {
  var _selectedPriority;

  List<Priority> _priorities = [
    Priority(name: "Low", color: Colors.orange, icon: Icons.priority_high),
    Priority(
        name: "Medium", color: Colors.deepOrange, icon: Icons.priority_high),
    Priority(name: "High", color: Colors.red, icon: Icons.priority_high),
    Priority(name: "None", color: Colors.black12, icon: Icons.priority_high)
  ];

  UnmodifiableListView<Priority> get priorities =>
      UnmodifiableListView(_priorities);

  selectedPriority(String priority) {
    if (priority == "Low") {
      _selectedPriority = _priorities[0];

      //notifyListeners();
    } else if (priority == "Medium") {
      _selectedPriority = _priorities[1];
      //notifyListeners();
    } else if (priority == "High") {
      _selectedPriority = _priorities[2];
      //notifyListeners();
    }
  }

  get getSelectedPriority => _selectedPriority ?? _priorities[3];
}
