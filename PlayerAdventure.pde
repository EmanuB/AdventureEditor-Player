// PLAYER
int currentScene;
int currentFrame;
int tempo; //tempo serve para ver se pelo menos um hotspot está selecionado
JSONArray documento;
ArrayList<JSONObject> frames= new ArrayList<JSONObject>();
Hotspot[] frameHotspots;
boolean mudarFrame=false;

void setup() {
  size(1080, 1080);
  noStroke();
  frameRate(60);
  currentFrame=0;

  documento = loadJSONArray("adventure.json");
  for (int i = 0; i < documento.size(); i++) {
    JSONObject frame = documento.getJSONObject(i); 
    frames.add(frame);
  }
  mostrarFrame();
  mostrarHotspot();
}
void draw(){
}
void mouseReleased() {
  for (int j=0; j<frames.get(currentFrame).getJSONArray("hotspots").size(); j++) {
    if (frameHotspots[j].mouseChecar()) {
      currentFrame=frameHotspots[j].destino;
      mostrarFrame();
      mostrarHotspot();
    };
    println(j);
  }
}
void mostrarFrame() {
  PImage imagem=loadImage(frames.get(currentFrame).getString("frameImg"));
  imagem.resize(width, height);
  background(imagem);
}
void mostrarHotspot() {
  frameHotspots= new Hotspot[frames.get(currentFrame).getJSONArray("hotspots").size()];
  for (int i=0; i<frames.get(currentFrame).getJSONArray("hotspots").size(); i++) {
    frameHotspots[i]= new Hotspot(i);
    frameHotspots[i].fazerHotspot();
  }
}
