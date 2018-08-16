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

The Jena documentation for OWL inference seems pretty incomplete, but I found
a blog with some info
[here](https://christinemdraper.wordpress.com/2017/04/09/getting-started-with-rdf-sparql-jena-fuseki/). I borrowed the `config.ttl` file from there and then start the server as so:

```
fuseki-server --port=3030 --config=config.ttl --update
```

But I'm not sure the inference is working.
