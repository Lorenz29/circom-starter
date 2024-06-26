pragma circom 2.0.3;

template Main() {
  signal input x;
  signal x_squared;
  signal x_cubed;
  signal output out;

// Witnesses
  x_squared <-- x * x;
  x_cubed <-- x_squared * x;
  out <-- x_cubed - x + 3;

// Constraints
  x_squared === x * x;
  x_cubed === x_squared * x;
  out === x_cubed - x + 3;
}

component main = Main();
