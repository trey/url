# URL

Do things with the title of a URL.

Similar to [Make a pretty Markdown link!](https://copy-url-title.glitch.me), but a _lot_ faster.

1. Make a Markdown link.
2. Make an HTML link.
3. Just get the title by itself.

## Setup

1. `mkvirtualenv url`
2. `pip install -r requirements.txt`
3. `chmod +x url`
4. Add a symbolic link to the `url` file somewhere on your path.
5. Adjust the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) as needed.

## Usage

To get the title of the URL by itself:

```shell
$ url http://example.com
```

To get a Markdown link:

```shell
$ url -m http://example.com
```

To get an HTML link:

```shell
$ url -t http://example.com
```
