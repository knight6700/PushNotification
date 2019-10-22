Register a device for Apple Push Notifications service and retrieve the registration token. 
The SDK should then make an external request to store the token through PushBots API.
curl -X POST \
http://api.pushbots.com/2/subscriptions \
-H 'Content-Type: application/json' \
-H 'x-pushbots-appid: 5d258e58b7941208c73fcfb7' \
-d '{"platform":0, "token":"TOKEN_HERE"}'
Include listeners for recieved and opened events for notifications, the listeners should only print log. 
The SDK should support iOS 8+. 
The SDK should be compiled to be used as a dynamic framework, with cocoapds and as react native plugin.
