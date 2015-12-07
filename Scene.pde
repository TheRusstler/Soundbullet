/*
 * Scene is a drawable, clickable element in the visual tree.
 */
abstract class Scene {
  abstract void paint();
  abstract void onClick();

  void onKeyPressed() {
  }
  void onKeyReleased() {
  }
}