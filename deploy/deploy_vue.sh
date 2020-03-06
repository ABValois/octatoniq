
# Build our Site
cd ../site
npm install
npm run build

# Upload content to site S3 bucket
cd dist
aws s3 cp img s3://octatoniq-frontend-720421352211/img --recursive
aws s3 cp css s3://octatoniq-frontend-720421352211/css --recursive
aws s3 cp js s3://octatoniq-frontend-720421352211/js --recursive
aws s3 cp index.html s3://octatoniq-frontend-720421352211/index.html
aws s3 cp favicon.ico s3://octatoniq-frontend-720421352211/favicon.ico
