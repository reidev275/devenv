# Development Environment

### Getting Started

1. Install Docker
1. clone the repo
1. cd into the cloned repo
1. Build the image with `docker build -t devenv .`

### Using

1. cd into your code directory
1. `docker run -itv %cd%:/usr/src/app devenv bash`
1. `cd usr/src/app`
