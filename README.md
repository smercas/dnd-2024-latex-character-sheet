# D&D 2024 Unofficial Character Sheet — LaTeX

A LaTeX re-creation of the *Dungeons & Dragons* 2024 character sheet.

---

## Quick start

```bash
./make.sh
```

That builds `character-sheet.pdf` from a blank sheet. Then open
`character.tex`, uncomment the lines you want, fill in the values, and run
`./make.sh` again.

To wipe the PDF and any build leftovers:

```bash
./make.sh clean
```

---

## Requirements

`pdflatex` from TeX Live (2020 or newer), plus the packages `cabin`, `cinzel`,
`microtype`, `etoolbox`, `geometry` and `pgf`/`tikz`. No images, no
`--shell-escape`, no BibTeX, no second pass.

| System | Install |
| --- | --- |
| Fedora | `sudo dnf install texlive-scheme-medium texlive-cabin texlive-cinzel` |
| Debian / Ubuntu | `sudo apt install texlive-latex-recommended texlive-fonts-extra texlive-pictures` |
| Any | a full TeX Live install always works |

---

## The files

| File | What it is |
| --- | --- |
| **`character.tex`** | **The only file you edit.** Your character's data. |
| `layout.tex` | Draws the sheet. Generated, ~490 KB, never needs editing. |
| `make.sh` | Runs `pdflatex` and cleans up after itself. |
| `LICENSE` | MIT, for the code. See Legal below for what it does and does not cover. |
| `character-sheet.pdf` | The result. |

**To start a new character**, empty or comment back out `character.tex`;
`layout.tex` is untouched either way.

---

## Filling in the sheet

Five commands, all used in `character.tex`. Every key is listed there with a
comment saying what it is, so you can work straight from that file.

---

## Key references

97 keys in total. `character.tex` lists every one with a description; this is
the summary.

**Identity** `name` `background` `class` `species` `subclass` `level` `xp`

**Combat** `ac` `hp` `hptemp` `hpmax` `hdspent` `hdmax` `deathsuccesses`
`deathfailures`

**Derived** `profbonus` `initiative` `speed` `size` `passiveperception`

**Abilities** `str` `dex` `con` `int` `wis` `cha`, each with a `…mod`
companion (`strmod`, `dexmod`, …)

**Saves** `strsave` `dexsave` `consave` `intsave` `wissave` `chasave`

**Skills** `athletics` `acrobatics` `sleightofhand` `stealth` `arcana`
`history` `investigation` `nature` `religion` `animalhandling` `insight`
`medicine` `perception` `survival` `deception` `intimidation` `performance`
`persuasion`

**Panels, page 1** `classfeatures` `classfeaturesii` `speciestraits` `feats`
`equipweapons` `equiptools`

**Spellcasting** `spellability` `spellmod` `spellsavedc` `spellattack`,
`slots1`…`slots9` and `slots1used`…`slots9used`

**Panels, page 2** `appearance` `backstory` `alignment` `languages`
`equipment` `attunement1` `attunement2` `attunement3`

**Coins** `cp` `sp` `ep` `gp` `pp`

---

## Legal

Two things live in this repository and they have different owners.

**The code is MIT-licensed** — see [`LICENSE`](LICENSE). That covers what was
written for this project: the macro layer and key API, `make.sh`, and this
README. Fork it, rewrite it, do as you like.

**The sheet's design is not mine to license.** The page geometry in
`layout.tex` derives from the character sheet published by Wizards of the Coast,
and the MIT grant does not extend to it.

**Your character is yours.** Nothing here claims any interest in what you write
into `character.tex`.

### Unofficial Fan Content

*Dungeons & Dragons* and the D&D logo are trademarks of Wizards of the Coast
LLC. This project is unofficial, is not affiliated with or endorsed by Wizards,
and is distributed free and non-commercially. No artwork or trademark from the
original PDF is reproduced here.
