/*
 * Stores the current game state.
 */
class Game {
  // Player's name and points
  String player;
  int points = 10;

  // Ship health
  int health = 100;

  // Upgrades purchased
  boolean dualGunsUpgrade = false;

  // Empire
  boolean[] planetsConquered;

  public Game(String player) {
    this.player = player;
    this.planetsConquered = new boolean[NUMBER_OF_PLANETS];
    Arrays.fill(this.planetsConquered, false);
  }

  public Game(String player, int health, int points, boolean dualGunsUpgrade, JSONArray planetsConquered) {
    this.player = player;
    this.health = health;
    this.points = points;
    this.dualGunsUpgrade = dualGunsUpgrade;
    this.planetsConquered = new boolean[NUMBER_OF_PLANETS];

    JSONObject o;
    for (int i =0; i<planetsConquered.size(); i++) {
      o = planetsConquered.getJSONObject(i);
      this.planetsConquered[i] = o.getBoolean("conquered");
    }
  }

  /*
   * Saves the game to a file.
   */
  public void save() {
    JSONObject json = new JSONObject();
    json.setString("player", player);
    json.setInt("health", health);
    json.setInt("points", points);
    json.setBoolean("dualGunsUpgrade", dualGunsUpgrade);

    JSONArray array = new JSONArray();
    JSONObject planet;
    for (int i =0; i<planetsConquered.length; i++) {
      planet = new JSONObject();
      planet.setBoolean("conquered", this.planetsConquered[i]);
      array.setJSONObject(i, planet);
    }
    json.setJSONArray("planets", array);

    saveJSONObject(json, SAVE_FILE);
  }
}