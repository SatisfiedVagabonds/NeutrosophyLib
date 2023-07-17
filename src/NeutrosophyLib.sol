// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

// Define a library called NeutrosophyLib to represent Single-Valued Neutrosophic Number (SVNN)
/* 
    A SVNN is a number composed by three membership functions, True(T), Indeterminacy(I) and False(F).
    Being x a SVNN it is represented by SVNN(x) = < Tx, Ix, Fx >
    Each membership function has values in the range greater or equal to zero 
    until less or equal to one. Their sum is greater or equal to zero, and, less or equal to 3.
    One or more than one SVNN compose a Single Value Neutrosophic Set (SVNS)
    For more information, read: 
*/
library NeutrosophyLib {
    // A struct to represent a single-valued neutrosophic number (SVNN)
    /*
        A SVNN has three components (T, I, F)
        Each component has real values ∈ [0, 1]
    */
    struct SVNN {
        uint256 T; // truth-membership
        uint256 I; // indeterminacy-membership
        uint256 F; // falsity-membership
    }

    /*
    This function check if each SVNN component has valid values,
    i.e., 0 =< SVNN <= 1
    */
    function checkSVNN(SVNN memory mySVNN) public pure {
        require(
            mySVNN.T >= 0 && mySVNN.T <= 1e4, // mySVNN.T >= 0 && mySVNN.T <= 1,
            "T must be equal or greater than 0 and equal or less than 1"
        );
        require(
            mySVNN.I >= 0 && mySVNN.I <= 1e4, // mySVNN.I >= 0 && mySVNN.I <= 1,
            "T must be equal or greater than 0 and equal or less than 1"
        );
        require(
            mySVNN.F >= 0 && mySVNN.F <= 1e4, // mySVNN.F >= 0 && mySVNN.F <= 1,
            "T must be equal or greater than 0 and equal or less than 1"
        );
    }

    // A function to check if a SVNN is contained in another SVNN.
    // Given two SVNN, x, and, y. x is contained in y, if it attends the conditions:
    /*
        Tx =< Ty,
        Ix >= Iy,
        Fx >= Fy
     */
    function isContained(
        SVNN memory a,
        SVNN memory b
    ) public pure returns (bool) {
        if (a.T <= b.T && a.I >= b.I && a.F >= b.F) {
            return true;
        } else {
            return false;
        }
    }

    // A function to check if two SVNN are equal
    function isEqual(SVNN memory a, SVNN memory b) public pure returns (bool) {
        if (isContained(a, b) && isContained(b, a)) {
            return true;
        } else {
            return false;
        }
    }

    // A function to compute the union of two SVNNs
    // Given two SVNNs, x, and, y. Its union result another SVNN, z, which elements are:
    /*
        Tz = max (Tx, Ty)
        Iz = max (Ix, Iy)
        Fz = min (Fx, Fy)
    */
    function union(
        SVNN memory a,
        SVNN memory b
    ) public pure returns (SVNN memory result) {
        // Use Math.max to compute the maximum of each membership function
        // Use Math.min to compute the minimum of each membership function
        result.T = Math.max(a.T, b.T);
        result.I = Math.max(a.I, b.I);
        result.F = Math.min(a.F, b.F);
    }

    // A function to compute the intersection of two SVNNs
    function intersection(
        SVNN memory a,
        SVNN memory b
    ) public pure returns (SVNN memory result) {
        // Use Math.max to compute the maximum of each membership function
        // Use Math.min to compute the minimum of each membership function
        result.T = Math.min(a.T, b.T);
        result.I = Math.min(a.I, b.I);
        result.F = Math.max(a.F, b.F);
    }

    // A function to compute the complement of a SVNN
    function complement(
        SVNN memory a
    ) public pure returns (SVNN memory result) {
        result.T = a.F;
        result.I = 1 * 1e4 - a.I; // complement of I(x) = 1 - I(x)
        result.F = a.T;
    }

    // A function to compute the difference of two SVNNs
    function difference(
        SVNN memory a,
        SVNN memory b
    ) public pure returns (SVNN memory result) {
        // result = ( min(a.T, b.F), min(a.I, 1 * 1e4 - b.I), max(a.F, b.T) )

        result.T = Math.min(a.T, b.F);
        result.I = Math.min(a.I, 1 * 1e4 - b.I); // min(Ia, 1 - Ib)
        result.F = Math.max(a.F, b.T);
    }

    // A function to add two SVNNs
    function addSVNN(
        SVNN memory a,
        SVNN memory b
    ) public pure returns (SVNN memory result) {
        // result = (a.T + b.T - a.T * b.T, a.I * b.I, a.F * b.F);
        result.T = (a.T + b.T) - ((a.T * b.T) / 1e4);
        result.I = (a.I * b.I) / 1e4;
        result.F = (a.F * b.F) / 1e4;
    }

    // A function to multiply two SVNNs
    function multiplySVNN(
        // a * b = (a.T * b.T)/1e4 , a.I + b.I - (a.I * b.I)/1e4 , a.F + b.F - (a.F * b.F)/1e4
        SVNN memory a,
        SVNN memory b
    ) public pure returns (SVNN memory result) {
        result.T = (a.T * b.T) / 1e4;
        result.I = (a.I + b.I) - (a.I * b.I) / 1e4; //
        result.F = (a.F + b.F) - (a.F * b.F) / 1e4;
    }

    // A function to calculate the Score of a SVNN
    function ScoreSVNN(SVNN memory a) public pure returns (uint256) {
        uint256 Scr = (1e4 * ((2 * 1e4) + a.T - a.I - a.F)) / (3 * 1e4);
        return Scr;
    }

    // A function to calculate the Accuracy of a SVNN
    function AccuracySVNN(SVNN memory a) public pure returns (uint256) {
        uint256 Accur = (a.T - a.I);
        return Accur;
    }

    // A function to Deneutrosofy a SVNN, i.e., transform it into a crisp number.
    // dNeutr = (1e4 - sqrt((1*e4 - a.T)^2 + a.I^2 + a.F^2)/(3*1e4)
    function DeneutrosophySVNN(SVNN memory a) public pure returns (uint256) {
        uint256 dneutr = ((1 * 1e4) -
            (
                Math.sqrt(
                    (1e4 *
                        (((1e4 - a.T) ** 2 + a.I ** 2 + a.F ** 2) / (3 * 1e4)))
                )
            ));
        return dneutr;
    }

    // this function will be in another folder /utils
    // it returns the absolute value of a real number
    function abs(uint256 x) public pure returns (uint256) {
        return x;
    }
}
