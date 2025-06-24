import sys
from rich.console import Console
from rich.markdown import Markdown

console = Console()
file="/home/tensai/Notes/"+sys.argv[1]+".md"

with open(file) as f:
    markup=Markdown(f.read())
    console.print(markup)
