from flask import Flask, jsonify
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
import os

app = Flask(__name__)

# Azure Storage Account settings from environment variables
storage_account_name = os.environ.get('AZURE_STORAGE_ACCOUNT_NAME')
storage_account_key = os.environ.get('AZURE_STORAGE_ACCOUNT_KEY')
container_name = os.environ.get('AZURE_CONTAINER_NAME')

# Create the BlobServiceClient object which will be used to create a container client
connection_string = f"DefaultEndpointsProtocol=https;AccountName={storage_account_name};AccountKey={storage_account_key};EndpointSuffix=core.windows.net"
blob_service_client = BlobServiceClient.from_connection_string(connection_string)
container_client = blob_service_client.get_container_client(container_name)

@app.route('/', methods=['GET'])
def home():
    return "Welcome to Helm Chart Lists. Go to the /list-charts endpoint!"

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'healthy'}), 200

@app.route('/list-charts', methods=['GET'])
def list_blobs():
    try:
        blob_list = [blob.name for blob in container_client.list_blobs()]
        return jsonify(blob_list)
    except Exception as e:
        return jsonify({"error": str(e)}), 500
        
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8002, debug=False)