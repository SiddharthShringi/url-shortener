
  

# URL-Shortner

  

URL Shortner API build on ruby on rails. We can run rake tasks to check API behaviour.

  
  
  

## How to test the code

  

After cloning the repo follow below instructions:

  

### Open terminal and on the first terminalexecute following commands.

```bash

$ rails db:create db:migrate db:setup

$ rails server

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

  

The above rake task will print following statement in the terminal.

  

```

The original url of short url https://short.is/TLU31jRT is https://bigbinary.com/jobs

  

```

  

If the SHORTURL is not present in the database then error message will be shown like below.

  

```

No original url was found for the short url https://short.is/poliwe71

```

## List of Links View

- Each link object has `pinned` boolean field which is false by default. All the Links are ordered according to two model field `pinned` and `created_at`.
- We can pin or unpin the particular link.
- All the pinned links will be moved to top on the list.
- App is live [here](https://url-shortner-siddharth-shringi.herokuapp.com)

API
- Get the original url
  - GET - /api/v1/links/:short_url/decode
- Get the short_url
  - POST - /api/v1/links/encode
- Get the list of links
  - GET - /api/v1/links
- Update a particualr link(for pin functionality)
  - PUT - /api/v1/links/:short_url