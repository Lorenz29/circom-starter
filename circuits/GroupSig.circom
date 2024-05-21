pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/mimcsponge.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template SigVerify() {
    signal input sk;
    signal input pk;

    component pkGen = MiMCSponge(1, 220, 1);
    pkGen.ins[0] <== sk;

    pk <== pkGen.outs[0];

}

template GroupSig () {
    signal input sk;

    signal input pk1;
    signal input pk2;
    signal input pk3;

    signal input msgHash;

    signal output attestation;

    component pkGen = MiMCSponge(1, 220, 1); // has one input signal 'in', and one input signal 'out'
    pkGen.ins[0] <== sk;
    pkGen.k <== 0;

    signal pk;
    pk <== pkGen.outs[0];

    signal interm;
    interm <== (pk - pk1) * (pk - pk2);
    interm * (pk - pk3) === 0;

    component attestGen = MiMCSponge(2,220,1);
    attestGen.ins[0] <== sk;
    attestGen.ins[1] <== msgHash;
    attestGen.k <== 0;

    attestation <== attestGen.outs[0];
}

template RevealSigner () {
    signal input sk;
    signal input pk;
    signal input msghash;
    signal input attestation;

    // prove that PubKeyGen(sk) === pk
    // prove that Hash(sk, msg) === attestation
}

component main { public [ pk1, pk2, pk3, msgHash ] } = GroupSig();

/* INPUT = {
    "sk": "42",
    "pk1":"100",
    "pk2":"123",
    "pk3": "200",
    "msgHash": "20"
} */