float x;
float y;
int i;
int [] helyx =  new int[4];
int [] helyy =  new int[4];


int cross(int w, int u, int v) {
  // w -> u es w -> v vektorok egymashoz kepest
  // jobbra vagy balra vannak, ettol fuggoen a 
  // visszateresi ertek negativ vagy pozitiv

  int ux = helyx[u] - helyx[w];
  int uy = helyy[u] - helyy[w];

  int vx = helyx[v] - helyx[w];
  int vy = helyy[v] - helyy[w];
  return ux*vy - vx*uy; 
}

int sgn(int x) {
  return x < 0 ? -1 : (x > 0 ? 1 : 0);
}


boolean isIntersecting() {
  int u0 = cross(0, 1, 2);
  int u1 = cross(0, 1, 3);

  int v0 = cross(2, 3, 0);
  int v1 = cross(2, 3, 1);
  
  // azt szeretnenk eldonteni, hogy a ket valtozobol (u0, u1) illetve (v0, v1)
  // az egyik negativ es a masik pozitiv-e
  println(u0, u1);
  println(v0, v1);

  // ha tul nagyok a szamok, akkor a szorzatuk tulcsordul, ezert az elojellel szamolunk
  boolean um = (sgn(u0) * sgn(u1) < 0);
  boolean vm = (sgn(v0) * sgn(v1) < 0);
  println(um, vm);
  return um && vm;
}


void setup(){
  size(500,500);
  background(0,0,25);
  x=0;
  y=0;
  i=0;
  
  while(i<4){
    x=random(0,500);
    y=random(0,500);
    helyx[i]=int(x);
    helyy[i]=int(y);
    csillag(x,y,i); 
    i=i+1;
  }

  stroke(#aaaaaa);
  if (isIntersecting()) {
    stroke(#92ca30);
    println("metszi");
  }

  line(helyx[0], helyy[0], helyx[1], helyy[1]);
  line(helyx[2], helyy[2], helyx[3], helyy[3]);

}

void csillag(float x, float y, int i){
  noStroke();
  fill(250,i*60,30);
  triangle(x-5,y-2.5,x+5,y-2.5,x,y+5);
  triangle(x,y-5,x-5,y+2.5,x+5,y+2.5);
}