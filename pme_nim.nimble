# Package
version       = "0.1.0"
author        = "pianopia"
description   = "ProcessMemoryEditor with Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["pme_nim"]
backend       = "c"
skipDirs      = @["tests"]

# Dependencies
requires "nim >= 1.0.2"
requires "docopt"
requires "nimSHA2"
