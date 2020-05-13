
# URL-Shortner

## How to test the code

  

### Open terminal and on the first terminalexecute following commands.
```bash
$ bundle exec rake db:create db:migrate db:setup
$ bundle exec rails server
```

### Open another terminal and on the second terminalexecute following commands.

On running rake taks `encode` it will print the short_url related to original_url.
```
rake app:encode URL=https://bigbinary.com/jobs
```
The above rake task will print following statement in the terminal.

```
The shortened url of https://bigbinary.com/jobs is https://short.is/TLU31jRT.

```
On running rake task `decode`, it will print the original_url respect to short_url
```
SHORTURL=https://short.is/TLU31jRT bundle exec rake app:decode 

```

The above task should print following statemetn in the terminal.

```
The original url of short url https://short.is/TLU31jRT is https://bigbinary.com/jobs

```

If the SHORTURL is not present in the database then error message will be shown like below.

```
No original url was found for the  short url https://short.is/poliwe71
```