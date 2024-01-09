
# http/ https

## authorisation
[link](https://www.loginradius.com/blog/engineering/everything-you-want-to-know-about-authorization-headers/)

### basic
Send <username:password> inside the header in base64 encoding.
```
Authorization: Basic AXVubzpwQDU1dzByYM==
```
Only use with https since otherwise it's like sending the credentials in cleartext.

## bearer token
a.k.a. token authenfication. *cryptic string instead of username:password*
```
Authorization: Bearer <token>
```
Only use with https. See also  ...

### JSON Web Token (JWT)
A normed access token consisting of 3 parts: *header*, *payload* and *signature*. In a nutshell, the header contains info about the token, the payload info about the user (name, permissions, state, expiration date, ..) and the signature is a hash of the aforementioned two parts.

## API key
This key is specific for an endpoint and can be given in the header or query string.
```
X-API-Key: abcdefgh123456789
```

## Digest Auth
Using this kind of authentification requires a special flow. 
1. client asks server for access
1. server provides *nonce* and *realm* (a hash)
1. client hashes username and password with given realm and sends that together with the nonce back
1. server checks the hash and either returns an error message or the respective content
```
Authorization: Digest username=”admin” Realm=”abcxyz” nonce=”474754847743646”, uri=”/uri” response=”7cffhfr54685gnnfgerg8”
```

## OAuth2.0
Using this kind of authentification requires a special flow. 
1. client asks server for access (specific endpoint for that, also provide client ID, scopes, callback URI, ...)
1. server ask authServer to take over (redirect URL)
1. authServer asks client for username and password.
1. authServer asks client to grant access for server.
(if both steps were successful)
1. authServer provides access token (**NOT** the refresh token!) to client (access token is kind of a 1-time-pw, sometimes also called "challenge" or "auth-code")
1. client asks server for new token pair (access, refresh) using the obtained access token
1. client asks server for respective content (using the access token)
(client can refresh the token if necessary)

```
Authorization: Bearer hY_9.B5f-4.1BfE
```