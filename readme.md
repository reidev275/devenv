#Development Environment

###Getting Started

1. Install Docker
2. clone the repo
3. cd into the cloned repo
4. Build the image with `docker build -t devenv .`

###Using

1. cd into your code directory
2. `docker run -itv %cd%:/usr/src/app devenv bash`
3. `cd usr/src/app`
