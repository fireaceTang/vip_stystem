import 'package:event_bus/event_bus.dart';
import '../model/request_model.dart';

EventBus eventBus = new EventBus();

class RequestEvent {
  ResponseModel responseModel;

  RequestEvent(this.responseModel);
}

class UpdateInfoEvent {
  UpdateInfoEvent();
}