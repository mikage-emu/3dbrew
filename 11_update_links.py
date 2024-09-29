import argparse
import functools
import re
import sys
from pathlib import Path
from typing import Optional, Dict, List

ROOT_DIR = Path(__file__).resolve().parent
CONTENT_DIR = ROOT_DIR / "content"
MDLINK_RE = re.compile(r']\(([^ ]+)(\s+"[^"]*")?\)')


parser = argparse.ArgumentParser()
parser.add_argument("-a", "--allow-ambiguous", action="store_true")
args = parser.parse_args()
fail_on_ambiguous = not args.allow_ambiguous


# Build page index
pages: Dict[str, Path] = {}
ambiguous: Dict[str, List[Path]] = {}
for page_path in CONTENT_DIR.rglob("*.md"):
    # _index are accessed through their directory name
    if page_path.name.startswith("_index"):
        path = page_path.parent
        if path == CONTENT_DIR:
            name = "/"
        else:
            name = page_path.parent.name
    else:
        name = page_path.stem
        path = page_path.with_suffix("")
    if name in pages:
        ambiguous[name] = [pages[name]]
        del pages[name]
    if name in ambiguous:
        ambiguous[name].append(path)
    else:
        pages[name] = path

print(f"{len(pages)} pages in index")

if ambiguous:
    print("Ambiguous names found:")
    for name, paths in ambiguous.items():
        print(f"- {name}")
        for path in paths:
            print(f"  at {path.relative_to(CONTENT_DIR)}")
    if fail_on_ambiguous:
        print(
            "Refusing to continue with ambiguous names (or rerun with --allow-ambiguous)"
        )
        sys.exit(1)

# Update links
total_pages = 0
updated_bookhref = 0
processed_mdlinks = 0
external_mdlinks = 0
untouched_mdlinks = 0
updated_mdlinks = 0
broken_mdlinks = 0
for page_path in CONTENT_DIR.rglob("*.md"):
    total_pages += 1
    content = page_path.read_text()

    # Update frontmatter redirections
    lines = content.splitlines()
    if content[0] == "+++":
        for i, line in enumerate(lines[1:], start=1):
            if line.startswith("BookHref = '../"):
                redir_target_name = line.strip()[len("BookHref = '../") : -1]
                redir_target = pages[redir_target_name]
                lines[i] = (
                    f"BookHref = '../{redir_target.relative_to(page_path.parent, walk_up=True)}'"
                )
                updated_bookhref += 1
                break
            if line == "+++":
                break
        content = "\n".join(lines)

    # Update markdown links
    def repl_mdlink(current_page_path: Path, match: re.Match):
        global processed_mdlinks
        processed_mdlinks += 1
        target: str = match.group(1)
        mdlink_suffix: str = match.group(2) or ""
        anchor: Optional[str] = None
        if "#" in target:
            target, anchor = target.split("#")
        # Same page anchor
        if len(target) == 0:
            return match.group(0)
        # External links
        if target.startswith("http:") or target.startswith("https:"):
            global external_mdlinks
            external_mdlinks += 1
            return match.group(0)
        try:
            target_page = pages[target.split("/")[-1]]
            new_link = (
                f"]({target_page.relative_to(current_page_path.parent, walk_up=True)}"
                f'{"#" + anchor if anchor else ""}{mdlink_suffix})'
            )
            if new_link == match.group(0):
                global untouched_mdlinks
                untouched_mdlinks += 1
            else:
                global updated_mdlinks
                updated_mdlinks += 1
            return new_link
        except KeyError:
            global broken_mdlinks
            broken_mdlinks += 1
            return match.group(0)

    content = MDLINK_RE.sub(functools.partial(repl_mdlink, page_path), content)
    page_path.write_text(content)

print(
    f"Processed {processed_mdlinks} Markdown links ({untouched_mdlinks} untouched + {updated_mdlinks} updated + "
    f"{broken_mdlinks} broken + {external_mdlinks} external), {updated_bookhref} BookHrefs in {total_pages} pages"
)
