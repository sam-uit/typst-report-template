// MARK: Wrapper function for rounded tables
#let rounded-table(..args) = {
  block(
    radius: 8pt, // Adjust this for more/less roundness
    stroke: 1pt + luma(220), // The outer border color
    clip: true, // This cuts off the square corners
    width: 100%, // Ensures it fits the page
    inset: 0pt, // No gap between border and table

    // The inner table
    table(
      ..args,
      stroke: none, // We turn off the default grid to avoid double borders
      // We add horizontal lines between rows for a clean look
      align: (x, y) => if y == 0 { center } else { left },
    ),
  )
}

// MARK: Rounded border table with lines

#let rounded-table-lined(..args) = block(
  // Góc bo tròn
  radius: 8pt,
  // Đường viền ngoài
  stroke: 1pt + blue.lighten(90%),
  clip: true,
  width: 100%,
  inset: 0pt,
  table(
    ..args,
    // Only draw bottom lines, and NOT on the last row
    stroke: (x, y) => (
      top: none,
      bottom: 1pt + blue.lighten(90%),
      left: 1pt + blue.lighten(90%),
      right: none,
    )
  ),
)
