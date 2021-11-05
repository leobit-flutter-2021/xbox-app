import 'actions.dart';
import 'states.dart';

StatusState statusReducer(StatusState previousState, dynamic action) {
  if (action is OnlineAction) {
    return StatusState(!action.status);
  } else if (action is OfflineAction) {
    return StatusState(action.status);
  } else {
    return previousState;
  }
}
