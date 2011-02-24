Example of a Roo-based Jersey app for Google App Engine.

### Build Commands

`mvn clean install -Dtodo-appid=<your-appid>` to build and test locally

`mvn gae:update` or `mvn gae:deploy` to deploy on App Engine

`mvn failsafe:integration-test -Dgae.host=<your-appid>.appspot.com -Dgae.port=80` to test deployed application

### Command Line Interaction

  curl -i -HAccept:application/json http://localhost:8080/todo

  curl -i -HAccept:application/json http://localhost:8080/todo/1

  curl -i -HAccept:application/json -HContent-Type:application/json \
    http://localhost:8080/todo -d '{"description":"walk the dog"}'

  curl -i -HAccept:application/json -HContent-Type:application/json \
    http://localhost:8080/todo \
    -d '{"description":"walk the dog","id":"1","status":"DONE","version":"1"}' \
    -X PUT

  curl -i http://localhost:8080/todo/1 -X DELETE

