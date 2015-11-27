class Game {
  private String player;
  private int health = 100, points = 10;
  private boolean dualGunsUpgrade = false;

  public Game(String player) {
    this.player = player;
  }
  
  public Game(String player, int health, int points) {
    this.player = player;
    this.health = health;
    this.points = points;
  }

  public String getPlayerName() {
    return this.player;
  }

  public int getShipHealth() {
    return this.health;
  }
  
  public int getPoints() {
    return this.points;
  }
  
  public int getOnlineRanking() {
    return 1;
  }
  
  public void save() {
    JSONObject json = new JSONObject();
    json.setString("player", player);
    json.setInt("health", health);
    json.setInt("points", points);
    saveJSONObject(json, SAVE_FILE);
  }
}