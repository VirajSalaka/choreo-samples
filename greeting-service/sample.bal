import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

// The host of the database server. The default value is `localhost`.
configurable string myconf = "localhost";

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : name + myconf, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
