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

## Usage

After installing the plugin, a new transformation type called `json` will be available for use.

```bash
dita --input=path/to/input.ditamap --format=json
```

This command will transform the input DITA map to JSON format.

This will produce a JSON file with the following object structure:

```json
{
  "type": "concept",
  "oid": "verification406",
  "title": "Verification",
  "text": "<p><p>Verifying Destination NAT Rule ...",
}
```

## Troubleshooting

If you have dita files that contain the `<?workdir?>` processing instruction, and the links are not resolvable, you will need to remove these before transforming to JSON. You can do this using the following command:

```bash
find ./ -name "*.ditamap" -o -name "*.dita" | xargs sed -i '' 's/<?workdir[^>]*>//g'
```
