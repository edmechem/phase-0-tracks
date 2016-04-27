2. What are some common HTTP status codes?

According to https://en.wikipedia.org/wiki/List_of_HTTP_status_codes:

2xx Success
- 200 OK
- 202 Accepted
- 204 No Content

3xx Redirection
- 301 Moved Permanently
- 304 Not Modified

4xx Client Error
- 400 Bad Request
- 401 Unauthorized
- 403 Forbidden
- 404 Not Found

5xx Server Error
- 500 Internal Server Error (generic server error message)
- 503 Service Unavailable
- 504 Gateway Timeout


3. What is the difference between a GET request and a POST request?

According to http://www.w3schools.com/tags/ref_httpmethods.asp:

GET includes any parameters in the URL (up to 2048 characters). Thus a bookmark of a URL that includes a GET request will perform the same request. It's less secure, because the data is part of the URL & thus saved in the browser history. But this could be a feature, if you want the user to be able to easily re-access the same request in the future (when they access the URL again from their history or a bookmark).

POST includes parameters in the HTTP message body of the request. A bookmark won't work next time you call it up (unless you fill out the form's fields in the exact same way, for example). Hitting back in the browser will usually provoke a warning "This will re-submit the last form. Are you sure?", because, it will. POST should be used for passwords.

According to:
http://stackoverflow.com/questions/504947/when-should-i-use-get-or-post-method-whats-the-difference-between-them
GET is used for viewing something (without changing it), whereas POST is used for changing something.

And also:
GET is used, broadly, to retrieve data
POST when you want to send data (i.e. update your password, upload a file).


4. Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

According to: https://en.wikipedia.org/wiki/HTTP_cookie
A cookie is a small chunk of text that's persistent - i.e., the browser will save a cookie associated with a specific website, and send it to that website everytime the user visits the site. It's a mechanism to remember stateful information - i.e. items added to a shopping cart, or, the fact that the user has already logged in within some recent timeframe (i.e. an authentication cookie). Advertising networks use tracking cookies to serve targeted ads.

RFC 6265, published in 2011, is a definitive spec for how cookies are used:
https://tools.ietf.org/html/rfc6265
A section with a humorous-on-first glance title, "Ambient Authority" https://tools.ietf.org/html/rfc6265#section-8.2, describes a potential vulnerability with storing all login authority in the cookie itself - vs. entangling some of that authority into the URL. Section 8.3, "Clear Text" https://tools.ietf.org/html/rfc6265#section-8.3 further describes a scenario illustrating the need for the server to set the Secure attribute for every cookie, even if the overall connection is secure.
















