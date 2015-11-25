class Game {
  private String player;
  private int health = 100;

  public Game(String player) {
    this.player = player;
  }
  
  public Game(String player, int health) {
    this.player = player;
    this.health = health;
  }

  public String getPlayerName() {
    return this.player;
  }

  public int getShipHealth() {
    return this.health;
  }
  
  public void save() {
    JSONObject json = new JSONObject();
    json.setString("player", player);
    json.setInt("health", health);
    saveJSONObject(json, SAVE_FILE);
  }
}