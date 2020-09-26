# deploy-react-app

## How to deploy react app

- first copy travis and deploy.sh file
- put both file into your root directory of your project in backend and as well as react app
- make the deploy.sh file executable by changing the permission
  - `chmod +x deploy.sh`
- now you need to setup some environment variable
- if your repositories are private, you need personal access token
  - create personal access token and set it into travis env variable as
    - `GITHUB_TOKEN`
  - the above thing will work both private and public repositories
- you have to setup your github username, server repo name, and react app repo name in env variable at travis
  - github username as
    - `USERNAME`
  - server repo name as
    - `SERVER`
  - react app repo as
    - `REACT_APP`
- now you need to put some variable related to heroku so that you can deploy this build on heroku

  - for the heroku, you need two things
    1. Heroku access token, so that travis will push the artifacts on heroku
    2. Heroku app name, so that travis will know where you want to push the artifacts
       if you are using pipeline, so that here you need to name your staging app, don't use your production app name
  - How to know heroku access token
    - make sure you login in heroku app
    - `Heroku login`
    - `Heroku auth:token`
  - now you need to set env variable on travis
    - `HEROKU_APP` here you have to put heroku app name
    - `HEROKU_TOKEN` here you need to put the auth token whatever you get from above command

- if you are using public repo, and you don't want to give any personal access token of github to travis
  - for this situation you have to change the cloning url of `deploy.sh` line no. 5 and 15.
