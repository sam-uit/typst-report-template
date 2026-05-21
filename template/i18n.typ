// /template/i18n.typ
// Backward-compatibility shim — re-exports from langs/i18n.typ
// Author: Sam Dinh
// Version: 0.3.0
// License: MIT
//
// The actual label definitions now live in template/langs/<code>.typ.
// This file is kept so that external users importing "i18n.typ" directly
// continue to work without changes.

#import "langs/i18n.typ": i18n-labels, i18n-supported-languages
