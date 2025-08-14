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

    resource function get temp2 (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp2", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }

    resource function get temp3 (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp3", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }

    resource function get temp4 (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp4", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }

    resource function get temp5 (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp4", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }

    resource function get temp6 (string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo temp6", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
