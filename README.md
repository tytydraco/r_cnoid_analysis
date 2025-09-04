# r_cnoid_analysis

Analyze and processess cnoid data.

# Setup

Training data has already been provided, but analysis can be made more accurate with more accurate data. Within [data.r](data.r), update `all_strains` with data. Acquire `cnoid` data from [Flower Company](https://flowercompany.com/), as they lab test all of their strains. Acquire `effects` data from [Leafly](https://leafly.com/)'s internal API; [ll](https://github.com/tytydraco/ll/) is a graphical tool that accomplishes this. There also exists [leafly-strain-scraper](https://github.com/tytydraco/leafly-strain-scraper/), a command-line utility.

# Usage

## CLI

<pre>
Usage: ./cli.r [options]
Analyze and processess cnoid data.

Options:
-t TYPE, --type=TYPE
One of: [graph, anim]

        -m MODE, --mode=MODE
                One of: [cnoids, effects]

        -o PATH, --out=PATH
                Output file path [default: out.html]

        -f FRAMES, --frames=FRAMES
                Number of animation frames @ 60fps [default: 240]

        -v VALUES, --values=VALUES
                List of values, comma separated.

        -V VALUES2, --values2=VALUES2
                List of second values, comma separated.

        -h, --help
                Show this help message and exit

List of cnoids: D9, THCV, CBD, CBN, CBG, CBC
List of effects: Aroused, Hungry, Energetic, Happy, Creative, Giggly, Uplifted, Focused, Talkative, Relaxed, Tingly, Euphoric, Sleepy

Examples:
./cli.r -t graph -m cnoids -v 100,0,0,0,0,0,0,0,0,0,0,0,0
./cli.r -t anim -m cnoids -v 100,0,0,0,0,0,0,0,0,0,0,0,0 -V 0,100,0,0,0,0,0,0,0,0,0,0,0
./cli.r -t graph -m effects -v 100,0,0,0,0,0
./cli.r -t anim -m effects -v 100,0,0,0,0,0 -V 0,100,0,0,0,0
</pre>

## Package

`devtools::install()`

```R
library("rcnoidanalysis")
```

# Examples

See [examples.r](examples.r).
