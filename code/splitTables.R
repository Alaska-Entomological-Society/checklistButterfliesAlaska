# Script to split AK butterfly checklist table into DwC tables
# by Matt Bowser
# November 19, 2026

# Load checklist data.
cl <- read.csv("../archive/checklist.csv", stringsAsFactors = FALSE)

# Select columns for each table.
colsd <- c("taxonID",
 "locationID",
 "countryCode",
 "locality",
 "occurrenceStatus",
 "establishmentMeans",
 "degreeOfEstablishment",
 "source",
 "occurrenceRemarks")
