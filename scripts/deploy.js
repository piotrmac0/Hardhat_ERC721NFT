// Contract deployed to address: 0x7aAb82ea0f3D43ad69098bb0cc5357294170272E

async function main() {
  //Grab the factory contract
  const MyNFT =  await ethers.getContractFactory("MyERC721NFT");
  // Start deployment, returning a promise that resolves to a contract 
  const myNFT = await MyNFT.deploy(); //instance of contract
  console.log("Contract deployed to address:", myNFT.address);

}



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
