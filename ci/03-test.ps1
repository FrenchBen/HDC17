Write-Output '*** E2E tests'

docker image build `
 -t frenchben/signup-e2e-tests `
 -f docker\e2e-tests\Dockerfile .

docker container run `
 --env-file .\app\db-credentials.env `
 frenchben/signup-e2e-tests

docker-compose `
 -f .\app\docker-compose.yml `
 -f .\app\docker-compose.local.yml `
 down