import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double projectStatus(
  int? numToDoTasks,
  int? numDoneTasks,
) {
  // Get the number of completed tasks and divide by the number of total tasks and divide by 100
  if (numToDoTasks == 0) {
    return 100.0;
  }
  if (numToDoTasks == numDoneTasks) {
    return 100.0;
  }
  var ratio = (numDoneTasks! / numToDoTasks! * 100.0);
  return ratio;
}

double projectStatusalt(
  int? numToDoTasks,
  int? numDoneTasks,
) {
  double projectStatus = numDoneTasks! / (numToDoTasks! + numDoneTasks);
  return projectStatus;
}
