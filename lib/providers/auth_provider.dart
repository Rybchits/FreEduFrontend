import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedu_frontend/models/user_class.dart';

final authUserState = StateProvider<User?>((ref) => null);