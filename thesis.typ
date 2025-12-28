// /thesis.typ
// A Thesis Main Content File

// Import template and metadata
#import "template/lib.typ": *
#import "config/metadata.typ": data

// Show document with thesis type
#show: document.with(..data, type: "thesis")

// Content goes here
#include "content/chapter01.typ"
#include "content/chapter02.typ"
#include "content/chapter03.typ"
#include "content/chapter04.typ"

// Show appendix
#show: appendix
#include "content/appendixA.typ"

// Show bibliography
#show: bibliography
#include "content/bibliography.typ"
