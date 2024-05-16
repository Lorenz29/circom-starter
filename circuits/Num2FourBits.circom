pragma circom  2.0.3;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

// input is a field element from [0, 16]
// output four signlas b0b1b2b3 representing the binary representations repr of input
template Num2FourBits () {
    signal input x;
    
    signal output b0;
    signal output b1;
    signal output b2;
    signal output b3;
    
    // Witnesses
    b0 <-- x % 2;
    b1 <-- x \ 2 % 2;
    b2 <-- x \ 4 % 2;
    b3 <-- x \ 8 % 2;


    // Constraint
    b0 * (b0 -1) === 0;
    b1 * (b1 -1) === 0;
    b2 * (b2 -1) === 0;
    b3 * (b3 -1) === 0;

    1*b0 + 2*b1 + 4*b2 + 8*b3 === x;
}

component main { public [ x ] } = Num2FourBits();

/* INPUT = {
    "x": "0",
} */