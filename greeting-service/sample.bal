import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }

    resource function get temp (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
