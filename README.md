# com.github.damianoneill.json

This repository hosts a DITA-OT plugin designed for representing DITA content in JSON format.

## Installation

### Prerequisites

Ensure you have DITA-OT version 4.1.2 installed on your system before proceeding.

### Install the Plugin

Use the [dita command](https://www.dita-ot.org/dev/parameters/dita-command-arguments.html) to install the plugin by executing the following:

```bash
dita --install https://github.com/damianoneill/com.github.damianoneill.json/archive/main.zip
```

This command will fetch the plugin from the specified URL and integrate it into your DITA-OT environment.

After installing the plugin, a new transformation type called `json` will be available for use.

```bash
dita --input=path/to/input.ditamap --format=json
```
