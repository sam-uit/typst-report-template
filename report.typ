#import "template/lib.typ": *
#import "config/metadata.typ": data

#show: document.with(..data, type: "report")

// Author
#include "author/author.typ"

// Content goes here
#include "content/quiz1.typ"
#include "content/quiz2.typ"
#include "content/quiz3.typ"
#include "content/quiz4.typ"

#show: appendix
#include "content/appendixA.typ"

#show: bibliography
// Bibliography
#include "content/bibliography.typ"
