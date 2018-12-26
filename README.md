# Colored Page
A Golang application that starts a webserver displaying a colored page.

It was inspired by Blankpage projetc (https://github.com/dndungu/blankpage) of David Ndungu.

## Usage

Start the container like this:

```
docker run -d -p 80:8080 -e "HTTP_PORT=8080" -e "COLOR=#000000" -t aasaidane/colored-page
```

