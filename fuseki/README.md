# fuseki

Fuseki is a SPARQL server

Start the server with:

```
fuseki-server --update --loc=mywd $HOME/.fuseki
```

 * `--update` - allows updates to the server (by default it is read-only
 * `--loc=<path>` - sets the working directory
 * `$HOME/.fuseki` - where I want the data to be built (a subdirectory `run` will be made)

Now you can go to port 3030 to view (http://localhost:3030/).

In the browser, turtle files can be uploaded. Note that they must have the
extension `.ttl`. When I tried uploading one with the extension `.turtle`,
I received the unhelpful error, "Content is not allowed in Prolog".
