# Overview

**Title:** Eminem Brown (Eminem)   
**Category:** Web  
**Flag:** `libctf{3113ebd2-21e0-4ace-ace6-174a69c44904}`  
**Difficulty:** Hard

# Usage

The following will pull the latest 'elttam/ctf-eminem-brown' image from DockerHub, run a new container named 'libctfso-eminem-brown', and publish the vulnerable service on port 80:

```sh
docker run --rm \
  --publish 80:80 \
  --name libctfso-eminem-brown \
  elttam/ctf-eminem-brown:latest
```

# Build (Optional)

If you prefer to build the 'elttam/ctf-eminem-brown' image yourself you can do so first with:

```sh
docker build ${PWD} \
  --tag elttam/ctf-eminem-brown:latest
```