goenv for managing gopaths
==========================

Extremely simple GOPATH management using .gopath files as GOPATH roots.

# Installation

1. Download the `github.com/GeorgeMac/goenv/goenv.sh` shell script. For example into your home directory `~/goenv.sh`.
2. Make it executable `chmod +x ~/goenv.sh`.
3. In your `.bashrc`, `.bash_profile` or `.zshrc` enter the line `source ~/goenv.sh`.

# Usage

```bash
    goenv [global | local | init]
```

## Global

Sets your `$GOPATH` to `~/go`, purely because that is my goto gopath. You can adjust the source accordingly if this bothers you.

## Local

Sets your `$GOPATH` to your CURRENT directory or the FIRST PARENT directory containing a file named `.gopath`.

for example:

```
/home
    /george
        /go
            .gopath
            /bin
            /pkg
            /src
                /github.com
                    /GeorgeMac
    /work
        /source
            /gofiles
                .gopath
                /bin
                /pkg
                /src
                    /bitbucket.org
```

Using `goenv local` in any directory `/home/george/go` or below will set your `$GOPATH` to `/home/george/go`.
Where as using `goenv local` within any directory `/home/work/source/gofiles` or below, will set it to `/home/work/source/gofiles`.

## Init

Touches a `.gopath` file in the current directory.

```bash
cd /home/george/go
goenv init # creates /home/george/go/.gopath
```

# Recommendation

Set your `RPROMPT` up to display your `$GOPATH` environment variable.

