import { network } from "hardhat";

const { ethers } = await network.connect("sepolia");

const verifier = await ethers.deployContract("SignatureVerifier");

await verifier.waitForDeployment();

console.log(
  "Contract deployed to:",
  await verifier.getAddress()
);