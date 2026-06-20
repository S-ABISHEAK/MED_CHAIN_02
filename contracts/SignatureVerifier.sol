// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SignatureVerifier {
    event SignatureVerified(
        address indexed signer,
        bytes32 indexed messageHash,
        bool valid,
        uint256 timestamp
    );

    function verify(
        address signer,
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (bool) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";

        bytes32 prefixedHash =
            keccak256(abi.encodePacked(prefix, messageHash));

        address recovered =
            ecrecover(prefixedHash, v, r, s);

        bool valid = recovered == signer;

        emit SignatureVerified(
            signer,
            messageHash,
            valid,
            block.timestamp
        );

        return valid;
    }
}