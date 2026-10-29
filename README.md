# Rick Provider

[Español](README.es.md)

An unfinished Flutter exercise in separating data and presentation with Provider. The project lives in [`rick_provider/`](rick_provider/).

## Implementation status

The entry point displays a `Placeholder`. Provider behavior, HTTP access and routing still have implementation TODOs. Declared dependencies describe the intended direction rather than completed integrations.

## Continue the exercise

- [`main.dart`](rick_provider/lib/main.dart): application composition.
- [`characters_provider.dart`](rick_provider/lib/presentation/providers/characters/characters_provider.dart): `ChangeNotifier` state exercise.
- [`characters_datasource_impl.dart`](rick_provider/lib/infraestructure/datasources/characters_datasource_impl.dart): pending HTTP call.
- [`app_router.dart`](rick_provider/lib/config/router/app_router.dart): pending navigation setup.

For a runnable Flutter example with persistence and failure recovery, see [Bitácora](https://github.com/navalcode/bitacora-flutter).
