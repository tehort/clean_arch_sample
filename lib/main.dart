import 'configuration/app_configuration.dart';
import 'configuration/injection_container.dart';
import 'configuration/router_configuration.dart';

void main() async {
  configureInjection();
  configureRoutes();
  configureApp();
}
