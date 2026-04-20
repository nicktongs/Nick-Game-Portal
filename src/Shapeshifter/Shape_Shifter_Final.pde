// SHAPE SHIFTER GAME
// By Nicholas Tong

int WIN_SCORE = 100;
int gameState = 0; // 0=Start, 1=Playing, 2=GameOver, 3=Win
int playerShape = 0;
color[] shapeColors = {color(70,130,255), color(255,180,60), 
color(80,220,100), color(200,50,150), color(150,150,150)};
String[] shapeNames = {"Circle", "Square", "Triangle", "Diamond", "Pentagon"};

int score = 0;
int[] playerHighScores = {0, 0, 0};
String[] playerNames = {"Player 1", "Player 2", "Player 3"};
int activePlayer = 0;
int difficulty = 1; // 0=easy(2), 1=medium(3), 2=hard(4), 3=impossible(5)

boolean playersScreenOpen = false;
String[] difficulties = {"Easy (2)", "Medium (3)", "Hard (4)", "Impossible (5)"};
int btnWidth = 170;//btn is button
int btnHeight = 44;

//FIXED COLUMN POSITIONS
final int colX = 80;
final int titleY = 140;
final int diffY = 230;
final int btnYStart = diffY + 30;

int barrierSpeed = 4;
int barrierInterval = 70;
int barrierTimer = 0;
int playerX, playerY, playerSize = 60;
int[] barrierY = new int[5];
int[] barrierShape = new int[5];
boolean[] barrierActive = new boolean[5];

//Name editing variables
int editingIndex = -1;//no editing taking place 
String nameInput = "";

void setup() {
  size(800, 800);
  playerX = width/2;
  playerY = height - 100;
  resetGame();
}

void draw() {
  if (gameState == 3) {
    drawWinGradientBackground();
    drawWinScreen();
  } else {
    background(30);
  }
  // Draw left-aligned difficulty and title for start and game over screens only
  if (gameState == 0 || gameState == 2) {drawLeftColumn();
}

  if (gameState == 0) {drawStartCenter();
  } else if (gameState == 1) {drawGame();
  } else if (gameState == 2) {drawGameOverWords();
  }
  // gameState == 3 is handled above

  drawPlayersButton();
  if (playersScreenOpen) {drawPlayersScreen();
  }
}

//WIN SCREEN GRADIENT BACKGROUND
void drawWinGradientBackground() {
  color c1 = color(70, 230, 255); // Top: blue-green
  color c2 = color(255, 240, 90); // Bottom: yellow
  for (int y = 0; y < height; y++) {
    float t = map(y, 0, height-1, 0, 1);
    stroke(lerpColor(c1, c2, t));
    line(0, y, width, y);
  }
}

//LEFT COLUMN BUTTONS (start and game over only)
void drawLeftColumn() {
  rectMode(CORNER); // Always reset to CORNER for UI
  //Title
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(44);
  text("Shape Shifter", colX, titleY);

  //Difficulty label
  textSize(22);
  fill(220);
  text("Difficulty:", colX, diffY);

  //Difficulty buttons
  for (int i = 0; i < difficulties.length; i++) {
    if (difficulty == i) fill(255, 200, 0);
    else fill(80);
    rect(colX, btnYStart + i * (btnHeight + 18), btnWidth, btnHeight, 10);
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text(difficulties[i], colX + 18, btnYStart + i * (btnHeight + 18) + btnHeight/2);
  }
}

//CENTERED MAIN CONTENT FOR START/GAME OVER/WIN
void drawStartCenter() {
  int centerX = width/2 + 60;
  int centerY = 230;
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Welcome!", centerX, centerY-60);
  textSize(18);
  fill(220);
  text("Rules:\nMatch your shape to the hole in the barrier!\n\nControls:\nLEFT/RIGHT arrows - Change shape\nSPACE - Start/Restart\n\nScore increases for each correct match.\nGame speeds up every 5 points.\nIf you miss a match, game over!\n\nClick a difficulty on the left.\nClick \"Players\" (top right) to manage players.", centerX, centerY+100);

  // Player info
  fill(255,200,0);
  textSize(20);
  text("Current Player: " + playerNames[activePlayer], centerX, centerY+320);
  fill(255);
  text("High Score: " + playerHighScores[activePlayer], centerX, centerY+350);
}

void drawGameOverWords() {
  int centerX = width/2 + 60;
  int centerY = 260;
  fill(255,80,80);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Game Over!", centerX, centerY);
  textSize(20);
  fill(255);
  text("Score: " + score, centerX, centerY+60);
  text("High Score: " + playerHighScores[activePlayer], centerX, centerY+100);
  fill(220);
  text("Press SPACE to restart", centerX, centerY+160);
  fill(255,200,0);
  text("Current Player: " + playerNames[activePlayer], centerX, centerY+220);
}

void drawWinScreen() {//Gamestate 3
  int centerX = width/2;
  int centerY = height/2;
  fill(30, 120, 50, 180);
  rectMode(CENTER);
  rect(centerX, centerY, 480, 340, 40);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(255);
  text("YOU WIN!", centerX, centerY - 60);
  textSize(32);
  fill(255, 255, 200);
  text("CONGRATULATIONS!", centerX, centerY);
  textSize(20);
  fill(30, 30, 30);
  text("Press SPACE to play again", centerX, centerY + 70);
  fill(255,200,0);
  text("Final Score: 100", centerX, centerY + 120);
  rectMode(CORNER);
}

//PLAYER MANAGEMENT SYSTEM
void drawPlayersButton() {
  rectMode(CORNER);
  int btnX = width - 140;
  int btnY = 20;
  fill(playersScreenOpen ? 255 : 100);
  rect(btnX, btnY, 120, 36, 7);
  fill(playersScreenOpen ? 0 : 255);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Players", btnX + 60, btnY + 18);
}

void drawPlayersScreen() {
  rectMode(CORNER);
  textAlign(LEFT, CENTER);
  textSize(18);

  int panelWidth = 480;
  int panelX = width/2 - panelWidth/2;
  int panelY = 60;
  int rowH = 48;
  int nameBoxW = 170;
  int nameBoxH = 28;
  int nameX = panelX + 50;
  int editBtnW = 32;
  int editBtnH = 32;
  int editBtnX = nameX + nameBoxW + 8;
  int hsX = editBtnX + editBtnW + 16; // high score text in player tab

  fill(50, 220);
  rect(panelX, panelY, panelWidth, height - 120, 12);

  fill(255);
  textSize(24);
  textAlign(CENTER, TOP);
  text("Player Selection", panelX + panelWidth/2, panelY + 18);

  textSize(18);
  textAlign(LEFT, CENTER);
  for (int i = 0; i < playerNames.length; i++) {
    int y = panelY + 60 + i * rowH;
    // Highlight active player
    if (i == activePlayer) fill(255, 200, 0);
    else fill(255);
    rect(panelX + 16, y - 18, panelWidth - 32, 36, 7);

    // Name or name input
    if (editingIndex == i) {
      // Draw input box
      fill(255);
      stroke(0, 180, 255);
      strokeWeight(2);
      rect(nameX, y - nameBoxH/2, nameBoxW, nameBoxH, 10);
      noStroke();
      fill(0);
      textAlign(LEFT, CENTER);
      text(nameInput, nameX + 6, y); // 6px padding for text
    } else {
      fill(i == activePlayer ? 0 : 40);
      textAlign(LEFT, CENTER);
      text(playerNames[i], nameX + 6, y);
    }

    //Edit button (weird arrow) -- always aligned with name box
    int editY = y - editBtnH/2;
    fill(200);
    rect(editBtnX, editY, editBtnW, editBtnH, 7);
    // Pencil icon
    stroke(60, 60, 60);
    strokeWeight(3);
    line(editBtnX + 8, y, editBtnX + 24, y + 8);
    line(editBtnX + 8, y, editBtnX + 20, y - 8);
    noStroke();

    //High score
    fill(i == activePlayer ? 0 : 40);
    textAlign(LEFT, CENTER);
    text("High Score: " + playerHighScores[i], hsX, y);
  }

  //Add player button
  int addBtnY = panelY + 60 + playerNames.length * rowH + 10;
  fill(100);
  rect(panelX + 16, addBtnY, panelWidth - 32, 38, 7);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Add New Player", panelX + panelWidth/2, addBtnY + 19);
}

//GAME LOGIC FUNCTIONS
void drawGame() {
  // Player
  drawShape(playerX, playerY, playerShape, playerSize);

  // Barriers
  for (int i=0; i<barrierY.length; i++) {
    if (barrierActive[i]) {
      barrierY[i] += barrierSpeed;
      drawBarrier(i);

      // Collision check
      if (barrierY[i] > playerY - playerSize/2 && barrierY[i] < playerY + playerSize/2) {
        if (barrierShape[i] == playerShape) {
          score++;
          barrierActive[i] = false;
          if (score >= WIN_SCORE) {
            gameState = 3;
            if (score > playerHighScores[activePlayer]) {
              playerHighScores[activePlayer] = score;
            }
            return;
          }
          if (score % 5 == 0) barrierSpeed = min(12, barrierSpeed+1);
        } else {
          gameState = 2;
          if (score > playerHighScores[activePlayer]) {
            playerHighScores[activePlayer] = score;
          }
        }
      }
      if (barrierY[i] > height + 50) barrierActive[i] = false;
    }
  }

  // New barriers
  barrierTimer++;
  if (barrierTimer > barrierInterval) {
    spawnBarrier();
    barrierTimer = 0;
  }

  // Score display
  fill(255);
  textSize(22);
  textAlign(LEFT, TOP);
  text("Score: " + score, 20, 20);
  text("Player: " + playerNames[activePlayer], 20, 50);
}

void drawShape(int x, int y, int shape, int size) {
  fill(shapeColors[shape]);
  noStroke();
  int numShapes = 2 + difficulty;
  shape = constrain(shape, 0, numShapes-1);

  switch(shape) {
    case 0: circle(x, y, size); break;
    case 1: rectMode(CENTER); rect(x, y, size, size); break;
    case 2: triangle(x, y-size/2, x-size/2, y+size/2, x+size/2, y+size/2); break;
    case 3: quad(x-size/2, y, x, y-size/2, x+size/2, y, x, y+size/2); break;
    case 4: drawPentagon(x, y, size/2); break;
  }
}

void drawPentagon(float x, float y, float radius) {
  beginShape();
  for (int i=0; i<5; i++) {
    float angle = radians(90 + i*72);
    vertex(x + cos(angle)*radius, y + sin(angle)*radius);
  }
  endShape(CLOSE);
}

void drawBarrier(int idx) {
  rectMode(CENTER); // For barrier
  int y = barrierY[idx];
  int shape = barrierShape[idx];
  fill(100);
  rect(width/2, y, width, 40, 20);
  fill(shapeColors[shape]);
  drawShape(width/2, y, shape, playerSize+10);
}

void spawnBarrier() {
  for (int i=0; i<barrierY.length; i++) {
    if (!barrierActive[i]) {
      barrierY[i] = -40;
      barrierShape[i] = (int)random(2 + difficulty);//random barrier
      barrierActive[i] = true;
      break;
    }
  }
}

void resetGame() {//game state 0
  score = 0;
  barrierSpeed = 4;
  barrierTimer = 0;
  playerShape = 0;
  for (int i=0; i<barrierY.length; i++) barrierActive[i] = false;
  // Do NOT set gameState here
}

//INPUT HANDLING
void keyPressed() {
  if (!playersScreenOpen && editingIndex == -1) {
    if (gameState == 0 || gameState == 2 || gameState == 3) {
      if (key == ' ') {
        resetGame();
        gameState = 1;
      }
    }
    else if (gameState == 1) {//playing
      int numShapes = 2 + difficulty;
      if (keyCode == RIGHT) playerShape = (playerShape + 1) % numShapes;
      if (keyCode == LEFT) playerShape = (playerShape - 1 + numShapes) % numShapes;
    }
  }
  // Name editing
  if (editingIndex != -1) {
    if ((key == DELETE || key == BACKSPACE) && nameInput.length() > 0) {
      nameInput = nameInput.substring(0, nameInput.length()-1);
    } else if (key == RETURN || key == ENTER) {
      // Save name
      if (nameInput.trim().length() > 0) playerNames[editingIndex] = nameInput.trim();
      editingIndex = -1;
    } else if (key != CODED && nameInput.length() < 16) {
      nameInput = nameInput + key;
    }
  }
}

void mousePressed() {
  // Difficulty buttons (only on start and game over screens)
  if ((gameState == 0 || gameState == 2) && !playersScreenOpen && editingIndex == -1) {
    rectMode(CORNER); // Ensure correct mode for hitboxes
    for (int i=0; i<difficulties.length; i++) {
      int btnY = btnYStart + i * (btnHeight + 18);
      if (mouseX > colX && mouseX < colX+btnWidth &&
          mouseY > btnY && mouseY < btnY+btnHeight) {
        difficulty = i;
        resetGame();
        gameState = 0; // Show start screen
      }
    }
  }

  // Players button
  if (mouseX > width-140 && mouseX < width-20 &&
      mouseY > 20 && mouseY < 56) {
    playersScreenOpen = !playersScreenOpen;
    editingIndex = -1;
    if (!playersScreenOpen) {
      resetGame();
      gameState = 0;
    }
  }

  // Player selection, edit, and add new player
  if (playersScreenOpen) {
    rectMode(CORNER);
    int panelWidth = 480;
    int panelX = width/2 - panelWidth/2;
    int panelY = 60;
    int rowH = 48;
    int nameBoxW = 170;
    int nameX = panelX + 50;
    int editBtnW = 32;
    int editBtnH = 32;
    int editBtnX = nameX + nameBoxW + 8;

    // Check edit buttons
    for (int i = 0; i < playerNames.length; i++) {
      int y = panelY + 60 + i * rowH;
      int editY = y - editBtnH/2;
      if (mouseX > editBtnX && mouseX < editBtnX+editBtnW &&
          mouseY > editY && mouseY < editY+editBtnH) {
        editingIndex = i;
        nameInput = playerNames[i];
        return;
      }
    }
    // Add new player button
    int addBtnY = panelY + 60 + playerNames.length * rowH + 10;
    if (mouseX > panelX+16 && mouseX < panelX+16+panelWidth-32 &&
        mouseY > addBtnY && mouseY < addBtnY+38) {
      playerNames = append(playerNames, "Player " + (playerNames.length+1));
      playerHighScores = append(playerHighScores, 0);
      return;
    }
    // Click on player row (not edit): select that player
    for (int i = 0; i < playerNames.length; i++) {
      int y = panelY + 60 + i * rowH;
      if (mouseX > panelX + 16 && mouseX < panelX + 16 + 240 &&
          mouseY > y - 18 && mouseY < y + 18) {
        activePlayer = i;
        playersScreenOpen = false;
        editingIndex = -1;
        resetGame();
        gameState = 0;
        return;
      }
    }
    // Click outside edit box: stop editing
    editingIndex = -1;
  } else {
    editingIndex = -1;
  }
}
