Board field = new Board();

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  field.genBoard();
  fill(255, 100);
  ellipse(mouseX, mouseY, 50, 50);
}
