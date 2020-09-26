#! /bin/bash

rm -rf ${SERVER}
echo 'cloning'
git clone  https://${GITHUB_TOKEN}:x-oauth-basic@github.com/${USERNAME}/${SERVER}.git 2> /dev/null
cd ${SERVER}
echo 'installing'
npm install 2> /dev/null
npm test


cd ..
rm -rf ${REACT_APP}
echo 'cloning'
git clone https://${GITHUB_TOKEN}:x-oauth-basic@github.com/${USERNAME}/${REACT_APP}.git 2> /dev/null
cd ${REACT_APP}
echo 'installing'
npm install 2> /dev/null
npm test

echo 'creating build'
npm run build 2> /dev/null
mkdir -p ../public
mv build/* ../public/.
cd ../${SERVER}
rm .travis.yml
cd ..
rm -rf ${REACT_APP}
mv ${SERVER}/* ${SERVER}/.* .
rm -rf ${SERVER}
echo 'created build'  