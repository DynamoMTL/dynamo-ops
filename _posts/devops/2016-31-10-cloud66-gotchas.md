---
layout: post
published: true
category: cloud66-gotchas
intro: true
---


# Configuring NGINX

When pushing NGINX configurations to cloud66 we need to set that configuration
flag in order for NGINX to propagate those changes.

`cx settings set -s my_stack reconfigure.nginx true`

If this is not done, we have to manually go to cloud66 and force the restart of
NGINX.
