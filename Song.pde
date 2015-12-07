/*
 * A track to be played in planet-attack mode
 */
class Song {
  String name;
  AudioPlayer track;

  public Song(String name, AudioPlayer track) {
    this.name = name;
    this.track = track;
  }
}