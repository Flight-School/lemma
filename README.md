# lemma

`lemma` is a command-line utility that
provides the lemmatized forms (stems) of words in natural language text.

```terminal
$ echo "Don't be amazed if you see my eyes always wandering." | lemma
do	Do
not	n't
be	be
amaze	amazed
if	if
you	you
see	see
I	my
eye	eyes
always	always
wander	wandering
```

---

For more information about natural language processing,
check out Chapter 7 of the
[Flight School Guide to Swift Strings](https://flight.school/books/strings).

---

## Requirements

- macOS 10.12+

## Installation

Install `lemma` with [Homebrew](https://brew.sh) using the following command:

```terminal
$ brew install flight-school/formulae/lemma
```

## Usage

Text can be read from either standard input or file arguments.
Tagged words are written to standard output on separate lines.

### Reading from Piped Standard Input

```terminal
$ echo "walking" | lemma
walk	walking

$ echo "gesagt" | lemma
sagen	gesagt
```

### Reading from Standard Input Interactively

```terminal
$ lemma
This text is being typed into standard input.
this	This
text	text
be	is
be	being
type	typed
into	into
standard	standard
input	input
```

### Reading from a File

```terminal
$ cat calvino.txt
One reads alone, even in another's presence.

$ lemma calvino.txt
one	One
read	reads
alone	alone
even	even
in	in
another	another
presence	presence
```

## Advanced Usage

`lemma` can be chained with
[Unix text processing commands](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/Text_Processing),
like `cut`, `sort`, `uniq`, `comm`, `grep` `sed`, and `awk`.

### Filtering Original Text

```terminal
$ lemma calvino.txt | cut -f1
one
read
alone
even
in
another
presence
```

### Filtering Repeated Lemmas

```terminal
$ echo "She has to have had a reason" | lemma | awk '!a[$1]++'
she	She
have	has
to	to
a	a
reason	reason
```

## Additional Details

Lemmatized words are written to standard output on separate lines.
Each line consists of
the lemma
followed by a tab (`\t`),
followed by the original word.

`lemma` uses
[`NLTagger`](https://developer.apple.com/documentation/naturallanguage/nltagger)
when available,
falling back on
[`NSLinguisticTagger`](https://developer.apple.com/documentation/foundation/nslinguistictagger)
for older versions of macOS.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
