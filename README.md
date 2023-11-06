# REST API for calculating index statistic and updating NFT meta with image

This project combined a framework for interactive with smart-contracts and a server that receives requests for NFT metadata updating. Main goal - build INDEX NFT with automate updating


## App requirement

List of things you need for the app to work:

1. NFT with method ```setTokenURI``` that you can call and set
2. wrapped NFT with your original NFT from step 1 with, and some collateral assets in it (mean assets that you put in wNFT when wrapping). Check https://envelop.is/ for more information

## Installation

To set up the project, follow these steps:

1. Clone this repository.
   ```bash
   git clone https://github.com/DynamicNFTHub/FastBrownieAPI
   ```
2. Setup all ENV's from .env file and export it:

   ```bash
   source .env
   ```
3. Build and deploy docker image.
   ```bash
   bash build-and-deploy.sh
   ```
4. Send GET request to http://127.0.0.1:8000/.

    If everything okey you will see next response json:

   ```json
   {"message":"Welcome to FastAPI with Brownie Integration!"}
   ```
5. Send POST request to http://127.0.0.1:8000/update_meta

   This request send command to brownie framework do all magic 💫
   ```python
   brownie run scripts/dindex_update --network polygon-main
   ```

6. All generated images from OpenAI and metada.json stored in 
```/server_app/src/``` directory

## App flow

Explanation what app do:

1. Pulling price for each token that you define as collateral assets config from Coinmarketcap
2. Calculate total sum of all collateral assets depends on current token price
3. Provided prompt for image used in OpenAPI, result stored localy
4. Index price calculated on second step used for overlaying it to image from OpenAI
5. Index image saved to IPFS
6. Building metadata.json with information about NFT and IPFS link to image
7. Store metadata.json to IPFS
8. call ```setTokenURI``` and store in it new version of metadata.json