# Rick Provider

Ejercicio de aprendizaje de Flutter para practicar separación entre datos y presentación y gestión de estado con Provider. El proyecto está en [`rick_provider/`](rick_provider/).

## Estado del ejercicio

La implementación está incompleta. El arranque muestra un `Placeholder` y quedan tareas indicadas mediante `TODO` para el Provider, las llamadas a la API y el router. Las dependencias declaradas no significan que todas esas integraciones estén implementadas.

## Por dónde continuar

- [`main.dart`](rick_provider/lib/main.dart): composición de la aplicación pendiente.
- [`characters_provider.dart`](rick_provider/lib/presentation/providers/characters/characters_provider.dart): ejercicio de estado con `ChangeNotifier`.
- [`characters_datasource_impl.dart`](rick_provider/lib/infraestructure/datasources/characters_datasource_impl.dart): llamada HTTP pendiente.
- [`app_router.dart`](rick_provider/lib/config/router/app_router.dart): configuración de navegación pendiente.

Este repositorio conserva el contexto de un ejercicio sin terminar. No se presenta como aplicación funcional ni como prueba de una integración completa de Provider, Dio o GoRouter.
