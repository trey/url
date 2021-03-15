# URL

Do things with the title of a URL.

Similar to [Make a pretty Markdown link!](https://copy-url-title.glitch.me), but a _lot_ faster.

1. Just get the title by itself.
2. Make a Markdown link.
3. Make an HTML link.
4. Get the title and URL formatted for a Git commit message.

## Setup

1. `python3 -m venv .venv`
1. `source .venv/bin/activate`
1. `pip install -r requirements.txt`
1. `deactivate`
1. `chmod +x url.py` (probably redundant)
1. Add a symbolic link somewhere on your path.
    - `ln -s ~/Code/url/url.py ~/bin/url`
1. Adjust the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) as needed.

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

To get the title and URL formatted for a Git commit message:

```shell
$ url -g http://example.com
```
