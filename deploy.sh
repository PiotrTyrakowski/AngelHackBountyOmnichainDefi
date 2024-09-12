# Setup gcloud
echo "Listing projects"
gcloud projects list
echo "Specify the project ID for deployment"
project_id=""
read project_id
if [ -z "$project_id" ]
then
    echo "Project ID is empty"
    exit 1
fi

gcloud config set project $project_id

# Prepare market_place for deployment
echo "Preparing market_place for deployment"
cd ./frontend/defi_flutter/
flutter build web --release 
cp app.yaml build/web/
cd ../../

gcloud app deploy --project $project_id ./frontend/defi_flutter/build/web/app.yaml
