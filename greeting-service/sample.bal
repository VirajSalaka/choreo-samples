import ballerina/lang.runtime;
import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

configurable decimal sleepTime = 10000;

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        runtime:sleep(sleepTime);
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
