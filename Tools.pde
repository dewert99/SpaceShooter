boolean rectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  } 
  else {            // if not, return false
    return false;
  }
}
