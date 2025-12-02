import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .(string name, http:Headers headers) returns Greeting {
        string[] headerNames = headers.getHeaderNames();
        foreach string headerName in headerNames {
            string[]|http:HeaderNotFoundError headerValues = headers.getHeaders(headerName);
            if headerValues is string[] {
                foreach string headerValue in headerValues {
                    log:printInfo(string `header-test-migration-virajg ${headerName}: ${headerValue}`);
                }
            }
        }
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
