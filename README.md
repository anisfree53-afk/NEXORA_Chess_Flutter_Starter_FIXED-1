# NEXORA Chess — Flutter starter

## Included
- Home dashboard, demo sign-in, profile and settings screens.
- Dark/purple theme and reusable widgets.
- Interactive chessboard UI: tap a piece, then tap a square to move it.
- Flutter SDK only; no third-party runtime packages.

## Important limitations
The board is a UI prototype, **not a complete chess rules engine**. It allows a selected piece to move to any square and does not validate legal moves, check/checkmate, castling, en passant, promotion, draw rules, PGN/FEN, clocks or undo. Profile stats are sample data. Sign-in and Google button are placeholders; no Firebase or real authentication. Settings are not persisted.

## Run in Kleancode IDE
1. Create/open a Flutter project.
2. Copy this ZIP's files into the project, keeping folder paths. `pubspec.yaml` belongs in the root and Dart files under `lib/`.
3. Run `flutter pub get` if the IDE offers the action.
4. Open `lib/main.dart` and press Run.

Next step: integrate a chess rules package and add tests before treating any move as legal. Add Stockfish and real authentication as separate later steps.


## Build an APK on GitHub Actions
This starter includes `.github/workflows/build-apk.yml`. The workflow generates the missing Android platform scaffold, fetches Flutter dependencies, builds a release APK, and uploads it as a workflow artifact.

To use it, upload/commit the contents of this ZIP to the root of your GitHub repository (the `pubspec.yaml` file should be at the repository root). Open **Actions**, run **Build NEXORA Chess APK** if it does not start automatically, then open the successful run and download the `nexora-chess-release-apk` artifact.

Note: the workflow has been added to address a missing `android/app/build.gradle` scaffold. It has not been run against your GitHub repository from this environment, so if the build reports a new error, share the log and I can adjust it.
