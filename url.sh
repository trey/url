#!/usr/bin/env python

import os
import urllib.request, urllib.error, urllib.parse
import argparse
from bs4 import BeautifulSoup

def is_valid_url(url):
    # This is how Django checks for a valid URL.
    # https://github.com/django/django/blob/master/django/core/validators.py#L47
    # Via: http://stackoverflow.com/a/7995979/96257
    import re
    regex = re.compile(
        r'^(?:http|ftp)s?://'  # http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|'  # domain...
        r'localhost|'  # localhost...
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}|'  # ...or ipv4
        r'\[?[A-F0-9]*:[A-F0-9:]+\]?)'  # ...or ipv6
        r'(?::\d+)?'  # optional port
        r'(?:/?|[/?]\S+)$', re.IGNORECASE)
    return url is not None and regex.search(url)

parser = argparse.ArgumentParser()
parser.add_argument('url', help='Enter a URL.')
parser.add_argument('-t', '--html',\
    help='Return an HTML link.', action='store_true')
parser.add_argument('-m', '--md',\
    help='Return a Markdown link.', action='store_true')
parser.add_argument('-a', '--alfred',\
    help='Print output instead of copying to clipboard.', action='store_true')
args = parser.parse_args()

if is_valid_url(args.url):
    try:
        urllib.request.urlopen(args.url)

        soup = BeautifulSoup(urllib.request.urlopen(args.url).read(), 'html.parser')

        if args.html:
            output = '<a href="%s">%s</a>' % (args.url, soup.title.string)
        elif args.md:
            output = '[%s](%s)' % (soup.title.string, args.url)
        else:
            output = soup.title.string

        if args.alfred:
            print(output.rstrip())
        else:
            command = 'echo "' \
                + output.rstrip() \
                + '" | tr -d "\n" | pbcopy'
            os.system(command)
            print("\n" + output + "\n\nCopied to the clipboard!\n")

    except urllib.error.HTTPError as e:
        print('1. Whoops: %s' % e.code)
    except urllib.error.URLError as e:
        print('2. Whoops: %s' % e.args)
else:
    print('Please enter a valid URL.')
