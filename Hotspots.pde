class Hotspot {
  int frameId;
  int x1;
  int y1;
  int x3;
  int y3;
  int destino;
  Hotspot(int hotspotId) {
    frameId=frames.get(currentFrame).getInt("id");
    x1 = frames.get(frameId).getJSONArray("hotspots").getJSONObject(hotspotId).getJSONArray("vertices").getJSONObject(0).getInt("x");
    y1 = frames.get(frameId).getJSONArray("hotspots").getJSONObject(hotspotId).getJSONArray("vertices").getJSONObject(0).getInt("y");
    x3 = frames.get(frameId).getJSONArray("hotspots").getJSONObject(hotspotId).getJSONArray("vertices").getJSONObject(2).getInt("x");
    y3 = frames.get(frameId).getJSONArray("hotspots").getJSONObject(hotspotId).getJSONArray("vertices").getJSONObject(2).getInt("y");
    destino=frames.get(frameId).getJSONArray("hotspots").getJSONObject(hotspotId).getInt("target");
    println(destino);
  }
  void fazerHotspot() {
    fill(200, 50, 200, 80);
    rect(x1, y1, (x3-x1), (y3-y1));
  }
  boolean mouseChecar() {
    if (mouseX>x1 && mouseX<x3 && mouseY>y1 &&mouseY<y3) {
      return true;
    } else
      return false;
  }
}
