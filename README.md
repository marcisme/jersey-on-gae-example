Example of a Roo-based Jersey app for Google App Engine.

`mvn clean install -Dtodo-appid=<your-appid>` to build and test locally

`mvn gae:update` or `mvn gae:deploy` to deploy on App Engine

`mvn failsafe:integration-test -Dgae.host=<your-appid>.appspot.com -Dgae.port=80` to test deployed application

