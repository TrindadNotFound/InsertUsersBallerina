import ballerina/http;

type User record 
{|
    readonly int id;
    string name;
|};

table<User> key(id) users = table
[
    {id:1, name:"User1"},
    {id:2, name:"User2"}
];

service / on new http:Listener(8080) 
{
    resource function get getallusers() returns string
    {
        return users.toJsonString();
    }    
}
