import ballerina/http;

configurable int payloadLength = 50;
string payload = generatePayload(payloadLength);

service /hello/'1 on new http:Listener(8090) {
    resource function get greeting/'1 () returns string {
        return payload;
    }

    resource function get greeting/'5 () returns string {
        return payload;
    }

    resource function get greeting/'6 () returns string {
        return payload;
    }

    resource function get greeting/'7 () returns string {
        return payload;
    }

    resource function get greeting/'8 () returns string {
        return payload;
    }

    resource function get greeting/'9 () returns string {
        return payload;
    }

    resource function get greeting/'10 () returns string {
        return payload;
    }
}

function generatePayload(int length) returns string {

    string payload = "";
    foreach int i in 0 ..< length {
        payload = payload + "X";
    }
    return payload;
}
