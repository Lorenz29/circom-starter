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
    
    
}

component main { public [ a ] } = Example();

/* INPUT = {
    "a": "5",
    "b": "77"
} */