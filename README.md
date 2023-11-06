# REST API for calculating index statistic and updating NFT meta with image

This project combined a framework for interactive with smart-contracts and a server that receives requests for NFT metadata updating. Main goal - build INDEX NFT with automate updating


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