#!/bin/bash

set -euo pipefail

echo "--- Uploading sarif results"
sarif=$(gzip -c sarif.txt | base64)

echo "Authenticating user using personal access token"

echo "Uploading SARIF to Github"
curl -X POST \
    -v -H "Authorization: token ${token}" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/ROKT/dotnet-spider/code-scanning/sarifs" \
    -d '{"commit_sha":"commit_sha","ref":"refs/heads/feature/scs-sarif","sarif":"H4sICFEY52AAA3NhcmlmLnR4dADtmt9v2zYQx9/zVxDaHmvJduOg7dsWb0iwBOtmpHsY+kCTJ4kNRQok5dQt+r/vKP+SLP9Q1xhzMSVIIJHH45H3/Yg6J58vCAl+tCyFjAZvSJA6l9s3UbRosU4bCOmnwsATTK1wYEMFbtUbfbBaRZYaEfeG4SDs94zLwlHom4MX3vMMjBV4g55Lg0WrKZTFpr/xmpDP5W/fCraQbtNR7VwYFBJuufc1uZ70+/3L0lu9W3H4iBb9Wo+EGUg/7okaJVRSH5eBtTQB7K/Ohh0OPjo/6hqME7Fg1AF5R6Xg1OGaSEotmQIowoWlUwk8DCrjv9Qj0KwcVF/d9gpL0zydW5xL3i2HNOIqragPiTJ30ArtCiP8EmIhAbMaPVhMSERt+iSUEoYqR0001qzIQDkb/akfXTQBhqPcvPeLSoQCMNFboz8Aw/6xdpj+SS44tlrD6g23KjYoGVMwh4KJxhBTTOgNKup+scU3VHEJ5udCSLQPmQ0aIde2bZVYSA6s0OIS3B0GigajUXP4yuRayyLzXnbbgOKHnaDB2sWg329GfnHovnr3viaN3OjcCwxsU4FLvd4t9Tuo6mt9Xdmyg7hc7cdl8Jy4/AX00cOR4lASF4p5fXZs1Ni4H49ucKafZKLRXZpNwMwEgxMgMRi0QGK422jDxB4vVSZevvz+kBjtR2L47EigorjOiCqyKRiSgAJD8XztyKiR8fvUD7rlp0DhVQsULo+isNtLFYXRqw6FDoVzRmH4ug0Lg2OvSvvcVGEYXnUwdDCcNwyv28BweRSG3W5qMIy+Pxi6MvuswejK7D13XZn9v2ejK7PPAonudersyOjK7A6F7cA7FLoym3QwbGbtYKh/dWX2v4HhYstt4LSWNWcBN2IGZmuCQNEMSliWuSXXmgOZMKrq+q/8kX0UDvG7X+/n2jngfxSU/4qKenfE2kKGChNs265uJalKigV0uPO9h0kT5RbYiL0fMyxCSbVxY7DMiHw/Vd/0+UGZocbEcSFl63nHS7+EVQKYbQLI6JxIoJw4Td7ipmKTUMSlQO4Fx0KdUOcoe2wRVgoyf1g8G9b/p7HinqE2eha1ESZY6RTTUOjoh707e0DVZb9fA9ZM86r8GvHVCXrRPtVX35rq47Xv7g38qrxi8UiEJUoTqVWCZwbDo8A/MzHVqClK8KmJHes46KrKPF0md2zcf5vJ0bNkss3RvHsfvyqht87nM9fWCuTV45hjLgVzJYwKrZYhWKJjzG9uoeB6Fd0mLIIHMnYzM8+dTgzNU3/0y/lKEGtLEuPPKq94gfJx+KAneWEwCrCnE8qOvJxAKNVDs3HerdcSsPJY/k2oUjiFiwdX/iR7UMItXzL8mPcXX/4BF4OK8I0mAAA="}'
