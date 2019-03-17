boolean[][] board;
int xpos;
int ypos;
int initx = 4;
int inity = 4;
ArrayList<PVector> move;

void setup() {
  size(600, 600);
  background(51);
  
  xpos = initx;
  ypos = inity;
  
  board = new boolean[8][8];
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      board[i][j] = false;
    }
  }
  board[ypos][xpos] = true;
  
  move = new ArrayList<PVector>();
  PVector v = new PVector(-2, -1);
  move.add(v);
  
  v.x = -1;
  v.y = -2;
  move.add(v);
  
  v.x = 1;
  v.y = -2;
  move.add(v);
  
  v.x = 2;
  v.y = -1;
  move.add(v);
  
  v.x = 2;
  v.y = 1;
  move.add(v);
  
  v.x = 1;
  v.y = 2;
  move.add(v);
  
  v.x = -1;
  v.y = 2;
  move.add(v);
  
  v.x = -2;
  v.y = 1;
  move.add(v);
}

void draw() {
  frameRate(1);
  drawBoard();
  updateBoard();
}

void drawBoard() {
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      if(board[i][j]) {
        fill(255);
        ellipse(50 + j*50 + 25, 50 + i*50 + 25, 25, 25);
      }
      noFill();
      stroke(255);
      strokeWeight(2);
      rect(50 + j*50, 50 + i*50, 50, 50);
    }
  }
}

void updateBoard() {
  PVector[] tempList = new PVector[8];
  int j = 0;
  for(int i = 0; i < 8; i++) {
    PVector v = move.get(i);
    int tempx = xpos + (int)v.x;
    int tempy = ypos + (int)v.y;
    if(isValid(tempx, tempy) && isEmpty(tempx, tempy)) {
      tempList[j] = v;
      j++;
    }
  }
  //if(tempList.size() != 0) {
    int index = (int)random(j);
    PVector temp = move.get(index);
    xpos += (int) temp.x;
    ypos += (int) temp.y;
    board[ypos][xpos] = true;
  //}
}

boolean isValid(int x, int y) {
  if(x >= 0 && x < 8) {
    if(y >= 0 && y < 8) {
      return true;
    }
  }
  return false;
}
    
boolean isEmpty(int x, int y) {
  if(board[y][x]) {
    return false;
  } else {
    return true;
  }
}
