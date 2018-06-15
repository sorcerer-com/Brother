
enum state_type {
  undef,
  up,
  down,
  open,
  closed
};

const int upOptPin      = 2;
const int downOptPin    = 3;
const int sensorPin     = 4;
const int buttonPin     = 5;

const unsigned long openDuration = 5 * 1000; // 20 sec

state_type state = undef;
unsigned long closeTimer = 0;


void setup()
{
  Serial.begin(9600);
  pinMode(upOptPin, INPUT_PULLUP);
  pinMode(downOptPin, INPUT_PULLUP);
  pinMode(sensorPin, INPUT_PULLUP);
  pinMode(buttonPin, OUTPUT);

  state_type currState = getState();
  if (currState == undef) // if the door isn't moving
  {
    pressButton(); // start the door

    currState = getState();
    if (currState == up) // door was closed
      state = closed;
    else if (currState == down) // door was closed
      state = open;

    pressButton(); // stop the door
    pressButton(); // return the door in the previous state
  }
  else
    state = currState;
  printState();
}

void loop()
{
  state_type currState = getState();
  // update door's state
  if (currState == undef) // if the door isn't moving
  {
    if (state == up) // the door was moving up
    {
      state = open;
      closeTimer = millis();
      printState();
    }
    else if (state == down) // the door was moving down
    {
      state = closed;
      printState();
    }
  }
  else if (state != currState)
  {
    state = currState;
    printState();
  }

  bool movement = getMovement();
  if (movement)
    Serial.println("Movement");
  if (state == open) // if the door is open
  {
    if (movement)
      closeTimer = millis();
    else if (millis() - closeTimer > openDuration)
      pressButton(); // start closing
  }
  else if (state == down && movement) // if the door is moving down and there is a movement
  {
    pressButton(); // stop the door
    pressButton(); // start opening
  }
  // TODO: maybe some delay
  delay(100);
}


void pressButton()
{
  // TODO: maybe add close/open function which check after press for direction trough getState
  Serial.println("Press button");
  digitalWrite(buttonPin, HIGH);
  // TODO: may be some delay
  digitalWrite(buttonPin, LOW);
  // TODO: may be some delay
}

state_type getState()
{
  state_type currState = undef;
  if (digitalRead(upOptPin) == LOW)
    currState = up;
  else if (digitalRead(downOptPin) == LOW)
    currState = down;
  return currState;
}

bool getMovement()
{
  return digitalRead(sensorPin) == LOW;
}

void printState()
{
  Serial.print("The Door is in state: ");
  if (state == undef)
    Serial.print("undef");
  else if (state == up)
    Serial.print("up");
  else if (state == down)
    Serial.print("down");
  else if (state == open)
    Serial.print("open");
  else if (state == closed)
    Serial.print("closed");
  Serial.println();
}
