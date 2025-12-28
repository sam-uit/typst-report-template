// /report.typ
// A Report Main Content File

// Import template and metadata
#import "template/lib.typ": *
#import "config/metadata.typ": data

// Show document with report type
#show: document.with(..data, type: "report")

// Content goes here
#include "content/quiz1.typ"
#include "content/quiz2.typ"
#include "content/quiz3.typ"
#include "content/quiz4.typ"

// Show appendix
#show: appendix
#include "content/appendixA.typ"

// Show bibliography
#show: bibliography
#include "content/bibliography.typ"
