// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import "../src/NeutrosophyLib.sol";
import {Test, console} from "forge-std/Test.sol";

/*
For more detailed information consult:
We use the data from table 1 in:

Table 1 – A single-valued neutrosophic set representation with its SVNNs.
Voter	(T = For)	(I = Undecided)	(F = Against)
Helia	    0.90	       0.20	        0.00
Marco	    0.50	       0.70	        0.10
Joana	    0.30	       0.90	        0.10
*/

// Define a contract called TestNeutrosophyLib
contract TestNeutrosophyLib is Test {
    // Define a function to test if a SVNN is contained in another one
    function testIsContained() public {
        // Create two SVNN x and y
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory y = NeutrosophyLib.SVNN(
            0.3 * 1e4,
            0.9 * 1e4,
            0.11 * 1e4
        ); // Joana (0.3, 0.9, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(y);

        // Call the isContained function and store the result
        bool result = NeutrosophyLib.isContained(x, y);

        // Assert that the result is correct
        /* If (Tx =< Ty) AND (Ix >= Iy) AND (Fx >= Fy) then TRUE else FALSE */
        assertEq(result, false); // The result must be False
    }

    // Define a function to test if two SVNN are Equals
    function testIsEqual() public {
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        bool result = NeutrosophyLib.isEqual(x, w);

        // Assert that the result is correct
        assertEq(result, false); // The result must be False
    }

    /// Define a function to test the union function of the NeutrosophyLib
    function testUnion() public {
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.union(x, w);

        // Assert that the result is correct
        assertEq(result.T, 0.9 * 1e4); // T = max(0.9, 0.5) = 0.9
        assertEq(result.I, 0.7 * 1e4); // I = max(0.2, 0.7) = 0.7
        assertEq(result.F, 0.0 * 1e4); // F = min(0.0, 0.1) = 0.0
    }

    // Define a function to test the intersection function of the NeutrosophyLib
    function testIntersection() public {
        // Create two SVNNs to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.intersection(x, w);

        // Assert that the result is correct
        assertEq(result.T, 0.5 * 1e4); // T = min(0.9, 0.5) = 0.5
        assertEq(result.I, 0.2 * 1e4); // I = min(0.2, 0.7) = 0.2
        assertEq(result.F, 0.1 * 1e4); // F = max(0.0, 0.1) = 0.1
    }

    // Define a function to test the complement function of the Neutrosoph contract
    function testComplement() public {
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);

        // Call the Complement nion function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.complement(x);

        // Assert that the result is correct
        assertEq(result.T, 0.0 * 1e4); // T = F = 0
        assertEq(result.I, 0.8 * 1e4); // I = (1- I) = 0.80
        assertEq(result.F, 0.9 * 1e4); // F = T = 0.9
    }

    // // Define a function to test the difference function of the NeutrosophyLib contract
    function testDifference() public {
        // Create two SVNNs to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.difference(x, w);

        // Assert that the result is correct
        assertEq(result.T, 0.1 * 1e4); // T = min(x.T, w.F) = min(0.9, 0.1) = 0.1
        assertEq(result.I, 0.2 * 1e4); // I = min(x.I, 1-b.I) = min(0.2, 0.9) = 0.2
        assertEq(result.F, 0.5 * 1e4); // F = max(x.F, w.T)= max(0.0, 0.5) = 0.5
    }

    // Define a function to test the difference function of the NeutrosophyLib
    function testAddSVNN() public {
        // Create two SVNNs to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.addSVNN(x, w);

        // Assert that the result is correct
        assertEq(result.T, 0.95 * 1e4); // T = (Tx + Ty - Tx * Ty) =((1.4 – 0.45), (0.2*0.7), (0.0 * 0.5)) = 0.955
        assertEq(result.I, 0.14 * 1e4); // I = Ix * Iy = 0.14
        assertEq(result.F, 0.0 * 1e4); // F = Fx * Fy = 0.0
    }

    // Define a function to test the Multiply 2 SVNN function of the NeutrosophyLib
    function testMultiplySVNN() public {
        // Create two SVNNs to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)
        NeutrosophyLib.SVNN memory w = NeutrosophyLib.SVNN(
            0.5 * 1e4,
            0.7 * 1e4,
            0.1 * 1e4
        ); // Marcio (0.5, 0.7, 0.1)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);
        NeutrosophyLib.checkSVNN(w);

        // Call the union function and store the result
        NeutrosophyLib.SVNN memory result = NeutrosophyLib.multiplySVNN(x, w);

        // Assert that the result is correct
        assertEq(result.T, 0.45 * 1e4); // T = (Tx * Ty) =(0.9 * 0.5) = 0.45
        assertEq(result.I, 0.76 * 1e4); // I = Ix+Iy - Ix*Iy = 0.2+0.7 – 0.2*0.7 = 0.76
        assertEq(result.F, 0.10 * 1e4); // F = Fx+Fy - Fx * Fy = 0.0+0.1 – 0.0*0.1 = 0.1
    }

    // Define a function to test the complement function of the NeutrosophyLib
    function testScoreSVNN() public {
        // Create two SVNNs to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)

        // Call the union function and store the result
        uint256 result = NeutrosophyLib.ScoreSVNN(x);

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);

        // Assert that the result is correct
        // Scr(a) = (2 + a.T - a.I - a.F) / 3
        assertEq(result, 0.9 * 1e4); // result = 0.9
    }

    // Define a function to test the complement function of the NeutrosophyLib
    function testAccuracySVNN() public {
        // Create an SVNN to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)

        // Call the union function and store the result
        uint256 result = NeutrosophyLib.AccuracySVNN(x);

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);

        // Assert that the result is correct
        // Accur(x) = ( x.T - x.I )
        assertEq(result, 0.7 * 1e4); // Accur = x.T - x.I = 0.9 - 0.2 = 0.7
    }

    function testDeneutrosophySVNN() public {
        // Create an SVNN to test with
        NeutrosophyLib.SVNN memory x = NeutrosophyLib.SVNN(
            0.9 * 1e4,
            0.2 * 1e4,
            0.0 * 1e4
        ); // Helia (0.9, 0.2, 0.0)

        // Check SVNN
        NeutrosophyLib.checkSVNN(x);

        // Call the union function and store the result
        uint256 result = NeutrosophyLib.DeneutrosophySVNN(x);

        // Assert that the result is correct
        // dNeutr = (1e4 - sqrt((1*e4 - a.T)^2 + a.I^2 + a.F^2)/(3*1e4)
        assertEq(result, 0.8712 * 1e4);
    }

    // this function will be in another folder /utils
    function testAbs() public pure {
        NeutrosophyLib.SVNN memory a = NeutrosophyLib.SVNN(
            0.8 * 1e4,
            0.1 * 1e4,
            0.1 * 1e4
        );
        NeutrosophyLib.checkSVNN(a);
        assert(NeutrosophyLib.abs(1e4 - a.T) == 2000);
    }
}
